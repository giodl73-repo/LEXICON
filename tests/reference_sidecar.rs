use lexicon::{
    reference::ReferenceCorpus,
    reference_sidecar::{AssuranceManifest, RelationKind, RelationManifest},
};
use std::{fs, path::Path};

fn committed_manifests() -> (ReferenceCorpus, RelationManifest, AssuranceManifest) {
    let corpus = ReferenceCorpus::parse(
        &fs::read_to_string("reference/lexicon-reference-v4.lexicon").unwrap(),
    )
    .unwrap();
    let relations = RelationManifest::parse(
        &fs::read_to_string("reference/lexicon-relations-v2.lexicon").unwrap(),
    )
    .unwrap();
    let assurance = AssuranceManifest::parse(
        &fs::read_to_string("reference/lexicon-assurance-v4.lexicon").unwrap(),
    )
    .unwrap();
    (corpus, relations, assurance)
}

#[test]
fn committed_sidecars_round_trip_and_validate() {
    let (corpus, relations, assurance) = committed_manifests();
    assert_eq!(
        relations.canonical_text(),
        fs::read_to_string("reference/lexicon-relations-v2.lexicon").unwrap()
    );
    assert_eq!(
        assurance.canonical_text(),
        fs::read_to_string("reference/lexicon-assurance-v4.lexicon").unwrap()
    );
    relations
        .validate_workspace(&corpus, Path::new("."))
        .unwrap();
    assurance
        .validate_workspace(
            &corpus,
            &relations,
            "reference/lexicon-relations-v2.lexicon",
            Path::new("."),
        )
        .unwrap();
    assert_eq!(relations.relations().len(), 11);
    assert_eq!(assurance.bindings().len(), 244);
}

#[test]
fn v0_sidecars_remain_valid_after_v1_projection_migration() {
    let corpus = ReferenceCorpus::parse(
        &fs::read_to_string("reference/factorium-reference-v0.factorium").unwrap(),
    )
    .unwrap();
    let relations = RelationManifest::parse(
        &fs::read_to_string("reference/factorium-relations-v0.factorium").unwrap(),
    )
    .unwrap();
    let assurance = AssuranceManifest::parse(
        &fs::read_to_string("reference/factorium-assurance-v0.factorium").unwrap(),
    )
    .unwrap();
    corpus.validate_workspace(Path::new(".")).unwrap();
    relations
        .validate_workspace(&corpus, Path::new("."))
        .unwrap();
    assurance
        .validate_workspace(
            &corpus,
            &relations,
            "reference/factorium-relations-v0.factorium",
            Path::new("."),
        )
        .unwrap();
    assert_eq!(corpus.entries().len(), 53);
    assert_eq!(corpus.views().len(), 95);
    assert_eq!(assurance.bindings().len(), 159);
}

#[test]
fn representative_directional_queries_preserve_scope() {
    let (_, relations, _) = committed_manifests();
    let dependencies = relations.incoming(
        RelationKind::DependsOn,
        "factor:system-composition-dependency/interfaces-and-interaction-contracts",
    );
    assert_eq!(dependencies.len(), 1);
    assert_eq!(
        dependencies[0].scope(),
        "view:constraint-system-composition-integrity"
    );

    let obligation_traces = relations.outgoing(
        RelationKind::SatisfiesObligation,
        "factor:governance-obligation-compliance/evidence-monitoring-and-assessment-criteria",
    );
    assert_eq!(obligation_traces.len(), 1);
    assert_eq!(
        obligation_traces[0]
            .qualifiers()
            .get("obligation-version")
            .map(String::as_str),
        Some("effective-version")
    );
}

#[test]
fn assurance_detects_a_stale_source_digest() {
    let (corpus, relations, _) = committed_manifests();
    let text = fs::read_to_string("reference/lexicon-assurance-v4.lexicon")
        .unwrap()
        .replacen(
            "07646556467096218227ebb6d6a6c40a78659d8aeffe8a877842345811c7ed1e",
            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            1,
        );
    let stale = AssuranceManifest::parse(&text).unwrap();
    assert!(stale
        .validate_workspace(
            &corpus,
            &relations,
            "reference/lexicon-relations-v2.lexicon",
            Path::new("."),
        )
        .unwrap_err()
        .contains("stale review"));
}

#[test]
fn relation_validation_rejects_an_unknown_canonical_endpoint() {
    let (corpus, _, _) = committed_manifests();
    let text = fs::read_to_string("reference/lexicon-relations-v2.lexicon")
        .unwrap()
        .replacen(
            "factor:system-composition-dependency/interfaces-and-interaction-contracts",
            "factor:system-composition-dependency/not-a-factor",
            1,
        );
    let invalid = RelationManifest::parse(&text).unwrap();
    assert!(invalid
        .validate_workspace(&corpus, Path::new("."))
        .unwrap_err()
        .contains("unknown canonical artifact"));
}

#[test]
fn assurance_names_an_exact_missing_corpus_binding() {
    let (corpus, relations, _) = committed_manifests();
    let input = fs::read_to_string("reference/factorium-assurance-v0.factorium").unwrap();
    let mut incomplete = input
        .lines()
        .filter(|line| !line.starts_with("review entry:thermal-quantity |"))
        .collect::<Vec<_>>()
        .join("\n");
    incomplete.push('\n');
    let assurance = AssuranceManifest::parse(&incomplete).unwrap();
    assert!(assurance
        .validate_workspace(
            &corpus,
            &relations,
            "reference/factorium-relations-v0.factorium",
            Path::new("."),
        )
        .unwrap_err()
        .contains("entry:thermal-quantity"));
}

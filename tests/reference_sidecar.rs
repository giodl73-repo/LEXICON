use formarium::{
    reference::ReferenceCorpus,
    reference_sidecar::{AssuranceManifest, RelationKind, RelationManifest},
};
use std::{fs, path::Path};

fn committed_manifests() -> (ReferenceCorpus, RelationManifest, AssuranceManifest) {
    let corpus = ReferenceCorpus::parse(
        &fs::read_to_string("reference/formarium-reference-v3.formarium").unwrap(),
    )
    .unwrap();
    let relations = RelationManifest::parse(
        &fs::read_to_string("reference/formarium-relations-v1.formarium").unwrap(),
    )
    .unwrap();
    let assurance = AssuranceManifest::parse(
        &fs::read_to_string("reference/formarium-assurance-v3.formarium").unwrap(),
    )
    .unwrap();
    (corpus, relations, assurance)
}

#[test]
fn committed_sidecars_round_trip_and_validate() {
    let (corpus, relations, assurance) = committed_manifests();
    assert_eq!(
        relations.canonical_text(),
        fs::read_to_string("reference/formarium-relations-v1.formarium").unwrap()
    );
    assert_eq!(
        assurance.canonical_text(),
        fs::read_to_string("reference/formarium-assurance-v3.formarium").unwrap()
    );
    relations
        .validate_workspace(&corpus, Path::new("."))
        .unwrap();
    assurance
        .validate_workspace(
            &corpus,
            &relations,
            "reference/formarium-relations-v1.formarium",
            Path::new("."),
        )
        .unwrap();
    assert_eq!(relations.relations().len(), 11);
    assert_eq!(assurance.bindings().len(), 165);
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
    let text = fs::read_to_string("reference/formarium-assurance-v3.formarium")
        .unwrap()
        .replacen(
            "d81b73ec7a87b7ea98bf93e73efa13653e66d90b2718f20f5f41759e9bbf14ee",
            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            1,
        );
    let stale = AssuranceManifest::parse(&text).unwrap();
    assert!(stale
        .validate_workspace(
            &corpus,
            &relations,
            "reference/formarium-relations-v1.formarium",
            Path::new("."),
        )
        .unwrap_err()
        .contains("stale review"));
}

#[test]
fn relation_validation_rejects_an_unknown_canonical_endpoint() {
    let (corpus, _, _) = committed_manifests();
    let text = fs::read_to_string("reference/formarium-relations-v1.formarium")
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

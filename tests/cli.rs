use std::process::Command;

#[test]
fn check_command_reports_canonical_identity() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args(["check", "fixtures/schemas/navigation.factor"])
        .output()
        .unwrap();
    assert!(output.status.success());
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.contains("schema=navigation\n"));
    assert!(stdout.contains("logical_bits=6\n"));
    assert!(stdout.contains("schema_sha256="));
    assert!(stdout.contains("document_sha256="));
}

#[test]
fn check_command_rejects_invalid_fixture() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args(["check", "fixtures/invalid/unknown-value.factor"])
        .output()
        .unwrap();
    assert!(!output.status.success());
    assert!(String::from_utf8(output.stderr)
        .unwrap()
        .contains("has no value"));
}

#[test]
fn fixtures_command_reports_both_corpora_and_all_splits() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .arg("fixtures")
        .output()
        .unwrap();
    assert!(output.status.success());
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.contains("corpus navigation meanings 64 surfaces 64"));
    assert!(stdout.contains("corpus event meanings 256 surfaces 512"));
    assert_eq!(
        stdout
            .lines()
            .filter(|line| line.starts_with("split "))
            .count(),
        7
    );
}

#[test]
fn bakeoff_command_reports_separate_decision_classes() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .arg("bakeoff")
        .output()
        .unwrap();
    assert!(output.status.success());
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.starts_with("factor-bakeoff-v1\n"));
    assert!(stdout.contains("factorization_useful true"));
    assert!(stdout.contains("representation_specific false"));
    assert!(stdout.contains("strong_controls_tie true"));
    assert!(stdout.contains("classification semantic-only"));
    assert!(stdout.contains("bakeoff_sha256 "));
}

#[test]
fn packet_commands_export_and_validate_closed_world_artifacts() {
    let root = std::env::temp_dir().join(format!("factor-cli-packet-{}", std::process::id()));
    let export = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args(["packet", root.to_str().unwrap()])
        .output()
        .unwrap();
    assert!(export.status.success());
    let check = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args(["packet-check", root.to_str().unwrap()])
        .output()
        .unwrap();
    assert!(check.status.success());
    std::fs::remove_dir_all(root).unwrap();
}

#[test]
fn role_fixtures_command_reports_both_families_and_all_splits() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .arg("role-fixtures")
        .output()
        .unwrap();
    assert!(output.status.success());
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.starts_with("factor-role-fixture-summary-v1\n"));
    assert_eq!(
        stdout
            .lines()
            .filter(|line| line.starts_with("corpus "))
            .count(),
        2
    );
    assert_eq!(
        stdout
            .lines()
            .filter(|line| line.starts_with("split "))
            .count(),
        6
    );
}

#[test]
fn binding_controls_command_reports_all_owners() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .arg("binding-controls")
        .output()
        .unwrap();
    assert!(output.status.success());
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.starts_with("factor-binding-controls-v1\n"));
    assert_eq!(
        stdout
            .lines()
            .filter(|line| line.starts_with("record "))
            .count(),
        14
    );
    assert!(stdout.contains("record transfer sparse-tpr "));
    assert!(stdout.contains("record attachment hrr-256 "));
}

#[test]
fn role_bakeoff_command_reports_separate_decisions() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .arg("role-bakeoff")
        .output()
        .unwrap();
    assert!(output.status.success());
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.starts_with("factor-role-bakeoff-v1\n"));
    assert!(stdout.contains("role_factorization_useful true"));
    assert!(stdout.contains("ambiguity_composition_useful true"));
    assert!(stdout.contains("representation_specific false"));
    assert!(stdout.contains("classification semantic-only"));
}

#[test]
fn role_packet_commands_export_and_validate_closed_world_artifacts() {
    let root = std::env::temp_dir().join(format!("factor-cli-role-packet-{}", std::process::id()));
    let export = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args(["role-packet", root.to_str().unwrap()])
        .output()
        .unwrap();
    assert!(export.status.success());
    let check = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args(["role-packet-check", root.to_str().unwrap()])
        .output()
        .unwrap();
    assert!(check.status.success());
    std::fs::remove_dir_all(root).unwrap();
}

#[test]
fn reference_check_validates_canonical_corpus_and_projections() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args([
            "reference-check",
            "reference/lexicon-reference-v4.lexicon",
            ".",
        ])
        .output()
        .unwrap();
    assert!(output.status.success());
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.contains("entries=133\n"));
    assert!(stdout.contains("views=100\n"));
    assert!(stdout.contains("reference_sha256="));
}

#[test]
fn reference_sidecar_check_validates_relations_and_reviews() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args([
            "reference-sidecar-check",
            "reference/lexicon-reference-v4.lexicon",
            "reference/lexicon-relations-v2.lexicon",
            "reference/lexicon-assurance-v4.lexicon",
            ".",
        ])
        .output()
        .unwrap();
    assert!(output.status.success());
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.contains("relation_records=11\n"));
    assert!(stdout.contains("review_bindings=244\n"));
    assert!(stdout.contains("entry_review_bindings=133\n"));
    assert!(stdout.contains("view_review_bindings=100\n"));
    assert!(stdout.contains("relation_review_bindings=11\n"));
    assert!(stdout.contains("prototype_checks=7\n"));
}

#[test]
fn composition_query_check_validates_declared_closure() {
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .args([
            "composition-query-check",
            "fixtures/composition/system-dependency.lexicon-query",
            "reference/lexicon-reference-v4.lexicon",
            "reference/lexicon-relations-v2.lexicon",
        ])
        .output()
        .unwrap();
    assert!(
        output.status.success(),
        "{}",
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.contains("query=system-dependency-interface\n"));
    assert!(stdout.contains("state=complete\n"));
    assert!(stdout.contains("nodes=3\n"));
    assert!(stdout.contains("edges=1\n"));
    assert!(stdout.contains("query_sha256="));
}

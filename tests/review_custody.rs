//! Authored software fixtures; these records confer no real editorial approval.
use lexicon::{
    reference::ReferenceCorpus,
    reference_sidecar::{AssuranceManifest, RelationManifest},
};
use sha2::{Digest, Sha256};
use std::{
    fmt::Write,
    fs,
    path::PathBuf,
    process::Command,
    sync::atomic::{AtomicU64, Ordering},
};

static NEXT: AtomicU64 = AtomicU64::new(0);

struct Workspace(PathBuf);

impl Workspace {
    fn authored() -> Self {
        let root = std::env::temp_dir().join(format!(
            "lexicon-custody-{}-{}",
            std::process::id(),
            NEXT.fetch_add(1, Ordering::Relaxed)
        ));
        fs::create_dir(&root).unwrap();
        let workspace = Self(root);
        workspace.write(
            "tables/entries/sample.md",
            concat!(
                "# Custody Sample\n\nStatus: candidate anchor entry\n",
                "`example` sense, supplied input.\n",
            ),
        );
        workspace.write(
            "tables/sample.md",
            concat!(
                "# Custody View\n\nPrimary family: Factor Table\n",
                "Owner: entries/sample.md\n",
            ),
        );
        workspace.write(
            "review.md",
            concat!(
                "# Synthetic software fixture only\n\nStatus: fixed point\n",
                "This literal tests marker recognition, not actual editorial approval.\n",
            ),
        );
        workspace.write("reference.lexicon", concat!(
            "lexicon-reference-v4\n",
            "entry sample | Custody Sample | reference | candidate | tables/entries/sample.md | Authored test only.\n",
            "sense example | example sense\n",
            "factor input | supplied input\n",
            "end-entry\n",
            "view sample-view | sample | example | factor | Custody View | tables/sample.md | Authored test only.\n",
            "end-view\nend-reference\n",
        ));
        let mut relations = String::from("lexicon-relations-v2\n");
        for (id, kind, qualifiers) in [
            ("r1", "depends-on", "condition=test"),
            (
                "r2",
                "delegates-authority-to",
                "authority=test,retained-responsibility=test",
            ),
            ("r3", "derived-from", "method=test"),
            ("r4", "feeds", "condition=test"),
            ("r5", "provides-to", "target-system=test"),
            (
                "r6",
                "satisfies-obligation",
                "applicability=test,obligation-version=test",
            ),
        ] {
            writeln!(relations,
                "relation {id} | {kind} | entry:sample | factor:sample/input | view:sample-view | {qualifiers} | tables/sample.md"
            ).unwrap();
        }
        relations.push_str("end-relations\n");
        workspace.write("relations.lexicon", &relations);
        let mut assurance = String::from("lexicon-assurance-v4\n");
        for (artifact, source) in [
            ("entry:sample", "tables/entries/sample.md"),
            ("relation:r1", "relations.lexicon"),
            ("relation:r2", "relations.lexicon"),
            ("relation:r3", "relations.lexicon"),
            ("relation:r4", "relations.lexicon"),
            ("relation:r5", "relations.lexicon"),
            ("relation:r6", "relations.lexicon"),
            ("view:sample-view", "tables/sample.md"),
        ] {
            let digest = Sha256::digest(fs::read(workspace.0.join(source)).unwrap());
            writeln!(
                assurance,
                "review {artifact} | {digest:x} | review.md | fixed-point | 2026-11-01"
            )
            .unwrap();
        }
        assurance.push_str("end-assurance\n");
        workspace.write("assurance.lexicon", &assurance);
        workspace
    }

    fn write(&self, name: &str, text: &str) {
        let path = self.0.join(name);
        fs::create_dir_all(path.parent().unwrap()).unwrap();
        fs::write(path, text).unwrap();
    }

    fn validate(&self) -> Result<(), String> {
        let corpus =
            ReferenceCorpus::parse(&fs::read_to_string(self.0.join("reference.lexicon")).unwrap())?;
        let relations = RelationManifest::parse(
            &fs::read_to_string(self.0.join("relations.lexicon")).unwrap(),
        )?;
        let assurance = AssuranceManifest::parse(
            &fs::read_to_string(self.0.join("assurance.lexicon")).unwrap(),
        )?;
        corpus.validate_workspace(&self.0)?;
        relations.validate_workspace(&corpus, &self.0)?;
        assurance.validate_workspace(&corpus, &relations, "relations.lexicon", &self.0)
    }
}

impl Drop for Workspace {
    fn drop(&mut self) {
        fs::remove_dir_all(&self.0).unwrap();
    }
}

#[test]
fn authored_workspace_passes_native_library_and_cli_checks() {
    let workspace = Workspace::authored();
    workspace.validate().unwrap();
    let output = Command::new(env!("CARGO_BIN_EXE_lexicon"))
        .current_dir(&workspace.0)
        .args([
            "reference-sidecar-check",
            "reference.lexicon",
            "relations.lexicon",
            "assurance.lexicon",
            ".",
        ])
        .output()
        .unwrap();
    assert!(
        output.status.success(),
        "{}",
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8(output.stdout).unwrap();
    assert!(stdout.contains("relation_records=6\n"));
    assert!(stdout.contains("review_bindings=8\n"));
    assert!(stdout.contains("entry_review_bindings=1\n"));
    assert!(stdout.contains("view_review_bindings=1\n"));
    assert!(stdout.contains("relation_review_bindings=6\n"));
}

#[test]
fn changed_source_bytes_including_crlf_do_not_inherit_review() {
    for crlf in [false, true] {
        let workspace = Workspace::authored();
        workspace.validate().unwrap();
        let path = workspace.0.join("tables/entries/sample.md");
        let original = fs::read_to_string(&path).unwrap();
        let changed = if crlf {
            original.replace('\n', "\r\n")
        } else {
            original + "\nUnreviewed change.\n"
        };
        fs::write(path, changed).unwrap();
        assert!(workspace
            .validate()
            .unwrap_err()
            .contains("stale review for `entry:sample`"));
    }
}

#[test]
fn absent_or_nonfixed_review_cannot_pass_with_matching_source_hashes() {
    for missing in [false, true] {
        let workspace = Workspace::authored();
        workspace.validate().unwrap();
        if missing {
            fs::remove_file(workspace.0.join("review.md")).unwrap();
        } else {
            workspace.write("review.md", "# Synthetic fixture\nStatus: pending\n");
        }
        assert!(workspace.validate().is_err());
    }
}

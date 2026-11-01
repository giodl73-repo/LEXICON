//! Auxiliary inspection of supplied interchange. No workspace or editorial approval.
use lexicon::{
    composition_query::CompositionQuery, reference::ReferenceCorpus,
    reference_sidecar::RelationManifest,
};
use serde::Deserialize;
use serde_json::{json, Value};

/// Maximum UTF-8 request envelope, independent of per-document limits.
pub const MAX_REQUEST: usize = 2_097_152;

#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
struct Request {
    reference: String,
    #[serde(default)]
    relations: String,
    #[serde(default)]
    query: String,
}

fn evaluate(text: &str) -> Result<Value, String> {
    if text.len() > MAX_REQUEST {
        return Err("LEXICON-INPUT envelope exceeds 2 MiB UTF-8".into());
    }
    let req: Request = serde_json::from_str(text).map_err(|e| format!("LEXICON-JSON {e}"))?;
    if [&req.reference, &req.relations, &req.query]
        .iter()
        .any(|s| s.len() > 524_288)
    {
        return Err("LEXICON-INPUT each document must be at most 512 KiB UTF-8".into());
    }
    let corpus =
        ReferenceCorpus::parse(&req.reference).map_err(|e| format!("LEXICON-REFERENCE {e}"))?;
    let relation = if req.relations.is_empty() {
        None
    } else {
        Some(
            RelationManifest::parse(&req.relations)
                .map_err(|e| format!("LEXICON-RELATIONS {e}"))?,
        )
    };
    let query = if req.query.is_empty() {
        None
    } else {
        let relations = relation
            .as_ref()
            .ok_or("LEXICON-QUERY a relation document is required for query source checks")?;
        let parsed =
            CompositionQuery::parse(&req.query).map_err(|e| format!("LEXICON-QUERY {e}"))?;
        parsed
            .validate_sources(&corpus, relations)
            .map_err(|e| format!("LEXICON-QUERY-SOURCES {e}"))?;
        Some(parsed)
    };
    let entries:Vec<_> = corpus.entries().iter().map(|entry|json!({"id":entry.id(),"title":entry.title(),"domain":entry.domain(),"maturity":entry.maturity(),"source_path":entry.source_path(),"summary":entry.summary(),"aliases":entry.aliases(),"senses":entry.senses().iter().map(|s|json!({"id":s.id(),"label":s.label()})).collect::<Vec<_>>(),"factors":entry.factors().iter().map(|f|json!({"id":f.id(),"label":f.label()})).collect::<Vec<_>>()})).collect();
    let views:Vec<_> = corpus.views().iter().map(|v|json!({"id":v.id(),"entry_id":v.entry_id(),"sense_ids":v.sense_ids(),"family":v.family().id(),"title":v.title(),"source_path":v.source_path(),"summary":v.summary()})).collect();
    Ok(
        json!({"schema":"lexicon.interchange-inspection.v1","ok":true,"request_json":text,
        "reference":{"header":corpus.header(),"sha256":corpus.sha256(),"canonical_text":corpus.canonical_text(),"entry_count":entries.len(),"view_count":views.len(),"entries":entries,"views":views},
        "relations":relation.as_ref().map(|r|json!({"sha256":r.sha256(),"canonical_text":r.canonical_text(),"count":r.relations().len()})),
        "query":query.as_ref().map(|q|json!({"id":q.id(),"declared_state":q.state(),"sha256":q.sha256(),"canonical_text":q.canonical_text(),"node_count":q.node_count(),"edge_count":q.edge_count(),"source_checks":"passed"})),
        "checks":{"reference_grammar":"passed","relation_grammar":if relation.is_some(){"passed"}else{"not_requested"},"query_grammar_and_declared_sources":if query.is_some(){"passed"}else{"not_requested"},"workspace_files_markdown_and_review_assurance":"not_performed"},
        "boundary":"Supplied interchange structure and declared query source checks only. No filesystem lookup, Markdown source verification, assurance approval, automatic graph construction, semantic truth, reader-outcome evidence, or R4/R5/R6 readiness. Paths are inert text. Books and canonical Tables remain authoritative."}),
    )
}

/// Inspects supplied JSON using the same parser and source checks as native Rust.
#[cfg_attr(feature = "wasm", wasm_bindgen::prelude::wasm_bindgen)]
pub fn inspect(text: &str) -> String {
    match evaluate(text) {
        Ok(result) => result.to_string(),
        Err(message) => json!({"schema":"lexicon.interchange-inspection.v1","ok":false,"diagnostic":{"message":message}}).to_string(),
    }
}

/// Authored software examples; no new canonical Tables or research evidence.
pub fn examples() -> String {
    let reference="lexicon-reference-v4\nentry sample | Sample Entry | reference | candidate | tables/entries/sample.md | Authored inspector example only.\nsense example | example sense\nfactor input | supplied input\nend-entry\nview sample-factor | sample | example | factor | Sample Factors | tables/sample.md | Authored metadata view only.\nend-view\nend-reference\n";
    let relations = "lexicon-relations-v2\nend-relations\n";
    let corpus = ReferenceCorpus::parse(reference).expect("valid authored reference");
    let sidecar = RelationManifest::parse(relations).expect("valid authored relations");
    let query=format!("lexicon-composition-query-v2\nquery sample-query\nproblem Are these declared identities structurally consistent?\nsource {} | {}\ncontext sample | source=local\npolicy direction=forward,follow=evaluative-required,stop=stable-identity\nbudget depth=1,edges=1,nodes=2,work=9\nseed entry:sample\nnode entry:sample | required | 0 | seed | none\ncheck sample-check | completeness | entry:sample | pass\nprojection entry:sample | selected | omits-markdown-and-review\nstate complete\nend-query\n",corpus.sha256(),sidecar.sha256());
    json!({"reference-only":{"reference":reference},"declared-query":{"reference":reference,"relations":relations,"query":query}}).to_string()
}

#[cfg(test)]
mod tests {
    use super::*;
    fn request(name: &str) -> Value {
        serde_json::from_str::<Value>(&examples()).unwrap()[name].clone()
    }
    fn result(req: Value) -> Value {
        serde_json::from_str(&inspect(&req.to_string())).unwrap()
    }
    #[test]
    fn examples_use_existing_native_contracts() {
        for req in serde_json::from_str::<Value>(&examples())
            .unwrap()
            .as_object()
            .unwrap()
            .values()
        {
            let r = result(req.clone());
            assert_eq!(r["ok"], true, "{r}");
        }
    }
    #[test]
    fn exact_request_and_native_digests_retained() {
        let req = request("declared-query");
        let raw = serde_json::to_string_pretty(&req)
            .unwrap()
            .replace('\n', "\r\n");
        let r: Value = serde_json::from_str(&inspect(&raw)).unwrap();
        assert_eq!(r["request_json"], raw);
        let corpus = ReferenceCorpus::parse(req["reference"].as_str().unwrap()).unwrap();
        assert_eq!(r["reference"]["sha256"], corpus.sha256());
        assert_eq!(r["query"]["declared_state"], "complete");
        assert_eq!(r["reference"]["views"][0]["family"], "factor");
        assert_eq!(
            r["checks"]["workspace_files_markdown_and_review_assurance"],
            "not_performed"
        );
    }
    #[test]
    fn changed_source_fails_query_checks() {
        let mut req = request("declared-query");
        req["reference"] = json!(req["reference"].as_str().unwrap().replace(
            "Authored inspector example only.",
            "Changed supplied metadata."
        ));
        assert!(result(req)["diagnostic"]["message"]
            .as_str()
            .unwrap()
            .contains("reference source digest does not match"));
    }
    #[test]
    fn canonical_transport_is_not_silently_repaired() {
        let mut req = request("reference-only");
        req["reference"] = json!(req["reference"].as_str().unwrap().replace('\n', "\r\n"));
        assert_eq!(result(req)["ok"], false);
    }
    #[test]
    fn unknown_fields_and_byte_bounds_fail_closed() {
        let mut req = request("reference-only");
        req["extra"] = json!(true);
        assert_eq!(result(req)["ok"], false);
        assert!(inspect(&" ".repeat(MAX_REQUEST + 1)).contains("envelope exceeds"));
    }

    #[test]
    fn real_current_corpus_fits_the_inspection_boundary() {
        let text = include_str!("../../../reference/lexicon-reference-v4.lexicon");
        let r = result(json!({"reference": text}));
        assert_eq!(r["ok"], true);
        assert_eq!(r["reference"]["entry_count"], 133);
        assert_eq!(r["reference"]["view_count"], 100);
        assert_eq!(
            r["checks"]["workspace_files_markdown_and_review_assurance"],
            "not_performed"
        );
    }
}

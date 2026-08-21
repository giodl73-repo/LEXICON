# Lexicon Book Proof Repair Role Review

Status: fixed-point pass

## Findings

| Lens | Finding | Closure |
|---|---|---|
| Reference Architecture Editor | A mixed two-column print stream made canonical Tables collide and obscured the book hierarchy. | Print has a full-width canonical body followed by a separately introduced pointer index; the online mixed stream remains unchanged. |
| Reference Lexicographer | Pointers could be mistaken for additional lexical authority. | Part II explicitly describes all 250 records as navigation to 54 owning canonical Tables, not new semantic relations. |
| Evidence & Claims Editor | A polished PDF could overstate internal simulation as reader evidence. | Cover, colophon, manifest, and sidecar all say internal proof, internally validated projection, and not reader-outcome evidence. |
| Research Integrity & Provenance | The reviewed PDF was dirty and bound to a pre-renderer source commit. | The final proof and sidecar bind clean commit `fadc0ca1671efdd2ba3db87945cf55f8b7319a5c`; Table provenance remains printed. |
| Equation & Units Auditor | Wide tables and preformatted expressions must remain legible without truncation or collision. | Full-width fixed-layout Tables, wrapped preformatted blocks, PDF geometry checks, and representative visual inspection pass. No equation meaning was changed. |
| Schema Implementer | Active generated payload names retained historical namespaces. | Generated active contracts now use asserted `lexicon-*` identifiers; frozen historical inputs remain untouched. |
| Reference Practitioner | The proof lacked an entry model, page location, and offline custody cues. | How-to-use guidance, inventory, parts, running heads, page numbers, and colophon are present. External usefulness remains deferred to R4. |
| Product Owner | Repair could displace the reference work with a publication-software project. | The wave changes projection and validation only: canonical counts, content, relations, and claims are unchanged. |

No critical or major actionable findings remain. Sparse terminal whitespace in
the alphabetical pointer index is a minor print-composition characteristic,
not a release blocker for the controlled R4 proof.

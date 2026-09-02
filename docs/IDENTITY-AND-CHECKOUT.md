# Formarium / LEXICON Identity And Checkout Boundary

Status: active

Use this page before onboarding, quickstarts, simulations, customer previews,
or portfolio summaries.

## Active Names

| Surface | Active value | Rule |
|---|---|---|
| Public repository | `LEXICON` | Use for GitHub, portfolio, and cross-repo references. |
| Product and method | `Formarium` | Use for books, schemas, commands, current contracts, docs, and publication surfaces. |
| Local checkout path | `repos/knowledge-systems/factorium` | Historical path only; do not infer the active product name from the folder. |
| Historical import name | `Factorium` | Frozen `.factorium`, `.factorium-query`, and `factorium-*` artifacts remain readable custody records only. |

## Safe Edit Surface

New work uses Formarium names: `.formarium`, `.formarium-query`,
`formarium-*`, Formarium Tables, The Formarium Reader, and Formarium Workbench.

Do not create new active `.factorium`, `.factorium-query`, or `factorium-*`
contracts unless the change is explicitly preserving or validating frozen
historical imports.

Do not rename, move, or rewrite historical Factorium paths solely to make the
checkout name match the public repository. Those paths preserve reviewed
source custody, exact reproduction, and legacy import compatibility.

## Onboarding Rule

Any onboarding, simulation, preview, or portfolio handoff that mentions this
repo must state all four surfaces together: public repository `LEXICON`,
product `Formarium`, local checkout `repos/knowledge-systems/factorium`, and
frozen historical `Factorium` imports.

This boundary closes `FRM-PF-06`: a reader should not need to guess whether
LEXICON, Formarium, or Factorium is the active edit target.

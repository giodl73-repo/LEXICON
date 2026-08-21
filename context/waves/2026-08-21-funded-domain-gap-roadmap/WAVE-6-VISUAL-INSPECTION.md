# Wave 6 Roadmap Table Visual Inspection

Status: working sim-75 pass; clean-source recheck pending

## Method

The automated PDF gate inspected all 534 working-proof pages for collisions,
out-of-bounds content, embedded fonts, and searchable text. In addition, the
canonical opening page of every roadmap Table was located from its Orientation
text and visually inspected at rendered-page resolution. This is an internal
author inspection, not external reader evidence.

## Inspected pages

| Wave | Table | PDF page | Result |
|---:|---|---:|---|
| 1 | Person, Individual, Social Actor, Group, Community, and Society | 335 | pass |
| 1 | Norm, Convention, Custom, Practice, and Tradition | 295 | pass |
| 1 | Good, Benefit, Welfare, Harm, and Flourishing | 184 | pass |
| 1 | Equality, Equity, Fairness, Justice, and Desert | 146 | pass |
| 1 | Responsibility, Answerability, Blame, Liability, and Excuse | 397 | pass |
| 1 | Cooperation, Solidarity, Reciprocity, Conflict, and Reconciliation | 91 | pass |
| 2 | State, Government, Polity, Administration, and Public Authority | 422 | pass |
| 2 | Citizenship, Nationality, Residency, Membership, and Political Status | 59 | pass |
| 2 | Political Representation, Constituency, Mandate, Delegation, and Election | 354 | pass |
| 2 | Political Power, Authority, Legitimacy, Influence, and Coercion | 351 | pass |
| 2 | Law, Legal Rule, Precedent, Judgment, Remedy, and Enforcement | 237 | pass |
| 2 | Public Policy, Program, Service, Regulation, and Implementation | 382 | pass |
| 3 | Statement, Proposition, Premise, Conclusion, and Argument | 424 | pass |
| 3 | Inference, Deduction, Induction, Abduction, and Analogy | 212 | pass |
| 3 | Validity, Soundness, Proof, Demonstration, and Refutation | 462 | pass |
| 3 | Consistency, Contradiction, Satisfiability, and Completeness | 88 | pass |
| 3 | Number, Numeral, Quantity, Magnitude, and Measurement | 298 | pass |
| 3 | Mathematical Set, Collection, Membership, Relation, Function, and Structure | 259 | pass |
| 4 | Health, Disease, Disorder, Condition, and Well-Being | 192 | pass |
| 4 | Function, Impairment, Activity Limitation, Disability, and Participation | 171 | pass |
| 4 | Prevention, Intervention, Treatment, Therapy, and Rehabilitation | 370 | pass |
| 4 | Care, Health Service, Provider, Recipient, Pathway, and Continuity | 42 | pass |
| 4 | Clinical Outcome, Response, Recovery, Remission, and Quality of Life | 65 | pass |
| 5 | Phone, Phoneme, Grapheme, Orthography, and Pronunciation | 343 | pass |
| 5 | Lexeme, Word, Phrase, Clause, Sentence, and Utterance | 242 | pass |
| 5 | Syntax, Grammar, Acceptability, Grammaticality, and Usage | 431 | pass |
| 5 | Translation, Paraphrase, Equivalence, Adaptation, and Transcreation | 451 | pass |
| 5 | Culture, Subculture, Heritage, Tradition, and Cultural Practice | 108 | pass |
| 5 | Ritual, Ceremony, Observance, Sacred Practice, and Symbolic Action | 400 | pass |
| 5 | Artwork, Medium, Form, Composition, Style, and Genre | 21 | pass |
| 5 | Aesthetic Property, Experience, Judgment, Taste, and Value | 12 | pass |
| 5 | Creation, Authorship, Performance, Interpretation, and Reception | 105 | pass |

## Findings

- long titles wrap within the canonical column without clipping;
- all sense tables remain inside page bounds and retain readable column hierarchy;
- scoped reconciliation IDs remain legible and do not overflow cells;
- Orientation, Sense table, and Root factorization hierarchy is consistent;
- no visual defect requires a content or stylesheet change.

The clean-source sim-75 page numbers and results must be rechecked after the
implementation commit; any pagination change supersedes this working record.

# Lexicon Domain-Gap Reader Protocol

Protocol ID: `lexicon-domain-gap-reader-protocol-v1`

Status: frozen round-one protocol; recruitment and observations pending

## Purpose and boundary

Test whether readers can find and select plausible owners for known post-sim-69
gap questions. This protocol measures routing mechanics and reported
confidence. It does not establish domain correctness, comprehension outside
the tasks, market demand, or professional outcomes.

Round one runs while the funded batches are authored. It uses the frozen
sim-69 proof as its baseline. Round two uses a fresh cohort and the frozen
post-reconciliation proof.

## Participant eligibility

- target 8-12 adults who did not author or review the tested Tables;
- at least four participants who routinely use reference works in professional
  or research tasks;
- no requirement for Lexicon, Rust, ontology, or knowledge-graph experience;
- record relevant domain familiarity without excluding novices;
- exclude only participants who helped author the tested content or cannot
  access the proof in the declared format.

## Instructions

For each task, begin from the Lexicon home or printed A-Z index. Use ordinary
language; internal IDs are neither supplied nor required. Select the best
owning Table, state the intended sense, and name any unresolved ambiguity. Stop
after five minutes. Do not consult an author during a task.

## Frozen round-one tasks

1. Distinguish a person from a role, persona, organization, and social group.
2. Decide whether a repeated workplace behavior is a convention, norm, custom,
   practice, policy, or mere regularity.
3. Separate something good in itself from something that benefits a particular
   person and from a favorable cost/utility assessment.
4. Distinguish equal treatment, equitable treatment, fairness, justice, and
   desert in a resource-allocation dispute.
5. Separate causal responsibility, moral responsibility, organizational
   accountability, legal liability, blame, and excuse.
6. Distinguish cooperation, reciprocity, solidarity, conflict, and
   reconciliation after a failed joint project.
7. Distinguish state, government, administration, institution, and public
   authority.
8. Separate citizenship, nationality, residency, membership, and political
   status.
9. Distinguish an argument, inference, valid form, sound argument, proof, and
   empirical evidence.
10. Separate consistency, contradiction, satisfiability, and completeness.
11. Distinguish health, disease, impairment, disability, participation, and
   well-being without asking for medical advice.
12. Separate an intervention, treatment, therapy, rehabilitation, care service,
   and clinical outcome.
13. Distinguish a word, lexeme, phrase, clause, sentence, and utterance.
14. Separate grammar, syntax, acceptability, grammaticality, and usage.
15. Distinguish translation, paraphrase, equivalence, adaptation, and
   transcreation.
16. Separate culture, tradition, custom, practice, ritual, and ceremony.
17. Distinguish artwork, artifact, medium, form, composition, style, and genre.
18. Separate aesthetic property, experience, judgment, taste, and value.

## Measures

For every task record:

- first selected owner and final selected owner;
- intended sense or explicit unresolved state;
- time to first plausible owner and total task time;
- search query or index route;
- wrong-owner selections and backtracks;
- confidence from 1 (guessing) to 5 (clear distinction);
- missing or misleading terms in the participant's own words;
- task completion, abandonment, timeout, and protocol deviation.

## Frozen thresholds

Round one identifies a demonstrated routing gap when at least three eligible
participants, or at least 30% of the eligible cohort (whichever is larger),
independently fail to find a plausible current owner within five minutes or
select the same wrong owner for the same reason.

Round two passes a task mechanically when at least 80% select the intended
owner or a documented acceptable alternative within three minutes, median
confidence is at least 4, and no repeated safety/advice misreading occurs.
These thresholds do not establish general population performance.

## Analysis and exclusions

- analyze all eligible attempts, including abandoned and timed-out tasks;
- report each task separately before any aggregate;
- do not exclude a result because it is unfavorable or surprising;
- do not rewrite a prompt, acceptable-owner set, or threshold after observing
  results;
- record technical access failures separately without converting them to
  successes;
- preserve domain-expert and novice strata without using either to erase the
  other;
- publish null findings and cases where an existing Table already suffices.

## Round-two freeze

Before round two, bind the exact proof digest, acceptable owner/sense map, fresh
participant eligibility, task text, measures, thresholds, and analysis code.
Any revision creates a new protocol version and preserves this one.


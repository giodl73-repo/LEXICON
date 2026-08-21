# Lexeme, Word, Phrase, Clause, Sentence, and Utterance

Status: candidate anchor entry

## Orientation

A lexeme is an abstract lexical unit grouping forms under a lexical analysis. A word is a unit identified by declared phonological, morphological, syntactic, orthographic, or conventional criteria. A phrase is a syntactic constituent organized around one or more elements without necessarily containing a predication. A clause is a predicative syntactic unit under an analysis. A sentence is a grammatically or orthographically delimited textual unit. An utterance is a situated act or product of language use by a participant on an occasion.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `lexeme` | Which abstract lexical unit groups which forms and senses under which analysis? | lexical unit |
| `word` | Which unit boundary follows which criteria in which language, representation, and task? | word-level unit |
| `phrase` | Which elements form which constituent under which syntactic analysis? | nonclausal or intermediate constituent |
| `clause` | Which predication and dependents form a clause under which analysis? | predicative syntactic unit |
| `sentence` | Which grammatical or textual boundary identifies a sentence for which task? | sentence-level unit |
| `utterance` | Who produced which situated stretch or act of language, when, where, and to whom? | contextual use event/product |

## Root factorization

```text
linguistic-unit-use
  := language or variety, modality, representation, corpus, context, and task
   x lexical identity, forms, senses, lemma policy, and analysis
   x wordhood criteria, boundary evidence, tokenization, and exceptions
   x constituent structure, head/dependencies, phrase type, and analysis
   x predication, arguments, clause type, linkage, and embedding
   x sentence criteria, punctuation/prosody, segmentation profile, and document context
   x speaker/signer/writer, addressee, occasion, discourse context, and communicative action
   x annotation authority, version, ambiguity, alternatives, and provenance
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Lexeme vs. word form | forms realize lexemes | abstract lexical grouping vs. inflected or cited form |
| Word vs. token | tokens may instantiate words | analyzed unit type vs. occurrence in data |
| Phrase vs. clause | both are constituents | constituent organization vs. predicative structure |
| Clause vs. sentence | clauses can form sentences | syntactic predication vs. grammatical/textual delimitation |
| Sentence vs. utterance | utterances may realize sentences | decontextualized unit vs. situated communicative event/product |
| Orthographic word vs. syntactic word | often align | spacing convention vs. grammatical unit criterion |

## Dependencies and stopping boundary

Morpheme/Word Formation owns internal morphology; Syntax/Grammar owns system-level structure; Communication/Discourse owns multi-turn and discourse organization; Speech Acts owns illocution. This Table stops before choosing a universal segmentation, resolving contested parses without evidence, or treating written punctuation as sufficient for every language and modality.

## Selection procedure

1. Declare language/variety, modality, representation, dataset, context, and task.
2. Select lexical identity, word boundary, constituent, predication, sentence boundary, or situated-use question.
3. State criteria and analysis; preserve alternative segmentations or parses when material.
4. Separate type from token, abstract lexical unit from form, and textual unit from use event.
5. Route internal formation, discourse relation, meaning, and illocution to their owners.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| dictionary/lexicon | groups forms and senses under lexical entries | requires explicit lexeme and lemma policy |
| treebank | segments and annotates words, phrases, clauses, and sentences | requires guideline/version and language-specific extensions |
| transcript | records situated speech or signing | preserves participant, occasion, segmentation, and transcription decisions |

## Failure signs

- lexeme, lemma, word form, word token, and orthographic string are synonyms;
- spaces are treated as universal word boundaries;
- every clause is called a sentence or every sentence one clause;
- a sentence in a document is confused with an utterance event;
- the analysis level, language, modality, or annotation scheme is omitted;
- one disputed parse is presented as observation rather than analysis.

## Cross-references

- [Morpheme, Inflection, Derivation, Compounding, and Word Formation](morpheme-inflection-derivation-compounding-word-formation.md)
- [Communication, Conversation, Discourse, Narrative, and Dialogue](communication-conversation-discourse-narrative-dialogue.md)
- [Illocutionary Force and Speech Acts](illocutionary-force-speech-acts.md)
- [Type, Token, Instantiation, Realization, and Embodiment](type-token-instantiation-realization-embodiment.md)

## Sources and provenance

1. Universal Dependencies, Short Introduction: https://universaldependencies.org/introduction.html
2. Unicode Consortium, Unicode Standard Annex #29: https://www.unicode.org/reports/tr29/
3. W3C, Pronunciation Lexicon Specification 1.0: https://www.w3.org/TR/pronunciation-lexicon/

Unit boundaries are analysis- and task-relative and may require language-specific guidance.

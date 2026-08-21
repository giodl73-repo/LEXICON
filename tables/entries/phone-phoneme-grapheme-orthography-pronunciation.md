# Phone, Phoneme, Grapheme, Orthography, and Pronunciation

Status: candidate anchor entry

## Orientation

A phone is an observed or described speech sound event or type under a phonetic analysis. A phoneme is a contrastive sound unit posited for a language or variety under a phonological analysis. A grapheme is a contrastive or functional writing unit under a declared orthographic analysis. Orthography is a conventional system and practice for representing language in writing. Pronunciation is a realized or prescribed spoken form of an expression in a language, variety, register, and context.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `phone` | Which speech sound is observed or described by which phonetic dimensions and method? | phonetic sound event/type |
| `phoneme` | Which contrastive sound unit is posited for which language or variety under which analysis? | phonological contrast unit |
| `grapheme` | Which functional writing unit is identified in which script and orthographic analysis? | writing-system unit |
| `orthography` | Which conventions map language to written forms for which community, authority, and purpose? | conventional writing system |
| `pronunciation` | Which spoken realization of which expression occurs or is prescribed in which context? | spoken form |

## Root factorization

```text
sound-writing-use
  := language or variety, community, expression, context, time, and task
   x acoustic/articulatory event, transcription, dimensions, method, and uncertainty
   x contrast set, distribution, alternation, analysis, and phonological evidence
   x script, graphemic unit, code-point sequence, glyph realization, and segmentation profile
   x orthographic convention, authority, version, standardization, and variation
   x pronunciation form, speaker, register, prescription or observation, and evidence
   x cross-level mapping, exceptions, provenance, and uncertainty
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Phone vs. phoneme | both concern speech sound | observed/described realization vs. contrastive unit in an analysis |
| Phoneme vs. letter | writing may represent sound contrasts | phonological unit vs. orthographic symbol/unit |
| Grapheme vs. Unicode code point | both can segment written data | writing-system function vs. encoded scalar value |
| Grapheme vs. glyph | glyphs render graphemes | functional unit vs. visual realization |
| Orthography vs. script | scripts support orthographies | language/community conventions vs. general graphic repertoire |
| Pronunciation vs. phonetic transcription | transcription records pronunciation | spoken form vs. notation describing it |

## Dependencies and stopping boundary

Morpheme/Word Formation, Register/Variety, Information/Signal, and Type/Token retain their owners. This Table stops before acoustic measurement protocols, speech pathology, language-specific phonological adjudication, literacy policy, or declaring one community pronunciation inherently correct.

## Selection procedure

1. Declare language/variety, community, expression, task, context, and time.
2. Choose observed sound, contrastive unit, writing unit, orthographic system, or spoken-form question.
3. Record analysis, transcription or encoding, authority/version, evidence, and variation separately.
4. Do not infer phoneme identity from spelling or equate a grapheme with one code point or glyph.
5. Mark whether a pronunciation is observed, reconstructed, recommended, or institutionally prescribed.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| IPA analysis | represents phonetic categories and transcriptions | requires language-specific evidence before phonemic interpretation |
| Unicode segmentation | supplies default programmable grapheme clusters | distinguishes implementation cluster from linguistic grapheme |
| pronunciation lexicon | maps written lexical forms to pronunciations | requires language, variety, context, and prescription/observation status |

## Failure signs

- a phone, phoneme, letter, grapheme, code point, and glyph are treated as one unit;
- spelling is assumed to determine pronunciation one-to-one;
- a default Unicode boundary is called a linguistic universal;
- variation is labeled error without a declared authority and purpose;
- a transcription is confused with the sound event it represents;
- language, variety, speaker, context, or analysis is omitted.

## Cross-references

- [Morpheme, Inflection, Derivation, Compounding, and Word Formation](morpheme-inflection-derivation-compounding-word-formation.md)
- [Register, Style, Genre, Variety, and Idiolect](register-style-genre-variety-idiolect.md)
- [Information, Data, Signal, and Noise](information-data-signal-noise.md)
- [Type, Token, Instantiation, Realization, and Embodiment](type-token-instantiation-realization-embodiment.md)

## Sources and provenance

1. International Phonetic Association, IPA Chart and Handbook: https://www.internationalphoneticassociation.org/content/ipa-chart/handbook-ipa
2. Unicode Consortium, Unicode Standard Annex #29: https://www.unicode.org/reports/tr29/
3. W3C, Pronunciation Lexicon Specification 1.0: https://www.w3.org/TR/pronunciation-lexicon/

Language-specific phoneme, grapheme, orthography, and pronunciation claims require qualified evidence for that language and community.

# Privacy, Confidentiality, Secrecy, Anonymity, and Disclosure

Status: candidate anchor entry

Scope: not legal advice

## Orientation

Privacy concerns whether person-related collection, use, inference, linkage,
retention, disclosure, and transfer are appropriate in a stated context.
Confidentiality preserves authorized restrictions on access or disclosure.
Secrecy intentionally withholds information from a specified audience.
Anonymity concerns whether a person can avoid
identification within a relevant set; pseudonymity uses a substitute identifier
while retaining bounded continuity. Disclosure is the act of making information
available to a recipient or audience.

Privacy is not equivalent to nondisclosure. Appropriate and lawful flows exist,
and the same flow can be treated differently across contexts, cultures, and
jurisdictions.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `privacy` | Which person-related flows, uses, inferences, and disclosures are appropriate in this context? | person-information-flow condition |
| `confidentiality` | Which authorized restrictions limit access to or disclosure of information? | security property or duty |
| `secrecy` | What is intentionally withheld from which audience, by whom, and under which authority or obligation? | concealment condition |
| `anonymity` | Can the person avoid identification within the relevant anonymity set? | non-identification condition |
| `pseudonymity` | Does a substitute identifier preserve bounded continuity while masking another identity? | mediated identity condition |
| `identifiability` | By what reasonably likely means can information be attributed to a person? | attribution potential |
| `linkability` | Can records or interactions be related as concerning the same person? | association potential |
| `disclosure` | Who made what person-related information available to whom, by what authority, and with what downstream consequence? | sharing event |

## Root factorization

```text
privacy-disclosure-use
  := affected person or group
   x actor, role, authority, and relationship
   x information item, category, and sensitivity
   x identifiability, pseudonymity, anonymity set, and linkability
   x context, norms, expectation, jurisdiction, culture, and time
   x collection, use, inference, disclosure, retention, deletion, and transfer
   x purpose and applicable basis
   x recipient, audience, and onward-transfer chain
   x confidentiality restrictions and secrecy obligations
   x transparency, participation, safeguards, risk, remedy, and review
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Privacy vs. authorization | either can constrain processing | appropriateness of person-related flow and use vs. request-time allow or deny decision |
| Privacy vs. confidentiality | confidentiality can protect privacy | broader contextual use and flow question vs. access or disclosure restriction |
| Confidentiality vs. secrecy | either can limit an audience | authorized handling restriction vs. intentional withholding condition |
| Anonymity vs. pseudonymity | either can obscure civil identity | non-identification within a set vs. substitute identifier with continuity |
| Identifiability vs. linkability | either can expose patterns about a person | attribution to a person vs. association among records or interactions |
| Disclosure vs. onward transfer | both move information | one sharing event vs. downstream disclosure chain |
| Purpose vs. privacy | purpose affects appropriateness | reason for processing vs. judgment about the person-related flow |
| Retention vs. privacy | duration affects privacy risk | how long information persists vs. whether collection and continued use are appropriate |

## Dependencies and stopping boundary

- The affected person or group and the information relationship are explicit.
- Context, purpose, recipient, jurisdiction, culture, and time are not optional
  metadata.
- Pseudonymized information is not automatically anonymous.
- Disclosure is evaluated under applicable authority and safeguards; it is not
  automatically classified as a violation.
- Purpose, retention, and onward transfer remain factors rather than new senses.
- Request-time permission, generic data semantics, obligation identity, policy
  logic, and identifier semantics retain their existing owners.

This entry stops before trade secrecy, military secrecy, generic access-control
models, jurisdiction-specific legal advice, and catalogs of privacy-enhancing
technologies.

## Selection procedure

1. Identify the affected person or group, actor, information, and relationship.
2. State whether the question concerns privacy, confidentiality, secrecy,
   anonymity, pseudonymity, identifiability, linkability, or disclosure.
3. Record context, purpose, expectations, governing norms, jurisdiction,
   culture, and time.
4. Identify collection, use, inference, retention, disclosure, deletion, and
   transfer operations separately.
5. Record recipient, audience, downstream recipients, safeguards, and
   confidentiality or secrecy duties.
6. Test identifiability and linkability using means relevant to the stated
   context rather than assuming that removed names establish anonymity.
7. Preserve transparency, participation, risk, harm, remedy, appeal, and review.
8. Route permission, policy, compliance, data, and identity questions to their
   existing owners.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | distinguishes privacy, secrecy, confidentiality, anonymity, and disclosure | joins them without treating them as synonyms |
| Privacy law | defines rights, duties, scope, and lawful bases in one jurisdiction | retains jurisdiction and does not universalize doctrine |
| Privacy framework | structures organizational risk management | separates management controls from semantic ownership |
| Security standard | defines confidentiality and access safeguards | keeps confidentiality narrower than privacy |
| Privacy theory | explains personhood, control, harm, or appropriate flow | preserves competing theories and context |

## Failure signs

- privacy is represented as an ACL;
- confidentiality is treated as the whole of privacy;
- pseudonymized data is declared anonymous without a contextual test;
- linkability disappears because direct identification failed;
- any disclosure is classified as inherently improper;
- purpose, retention, recipient, or onward transfer is omitted;
- one jurisdiction's doctrine is presented as universal;
- the entry is used as legal advice or permission.

## Cross-references

- [Access, Permission, Authorization, and Entitlement](access-permission-authorization-entitlement.md)
- [Information, Data, Signal, and Noise](information-data-signal-noise.md)
- [Governance, Obligation, and Compliance](governance-obligation-compliance.md)
- [Policy, Rule, Constraint, Decision, and Exception](policy-rule-constraint-decision-exception.md)
- [Identity, Naming, Classification, and Versioning](identity-naming-classification-versioning.md)
- [Editorial record](../../signals/discover/literature/privacy-disclosure-candidate-brief-2026-08-19.md)

## Sources and provenance

1. NIST, *Privacy Framework*:
   https://www.nist.gov/privacy-framework
2. NISTIR 8062, *An Introduction to Privacy Engineering and Risk Management*:
   https://doi.org/10.6028/NIST.IR.8062
3. NIST SP 800-122, *Protecting the Confidentiality of PII*:
   https://doi.org/10.6028/NIST.SP.800-122
4. European Union, General Data Protection Regulation:
   https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng
5. Helen Nissenbaum, "Privacy as Contextual Integrity":
   https://digitalcommons.law.uw.edu/wlr/vol79/iss1/10/
6. IETF, RFC 6973, *Privacy Considerations for Internet Protocols*:
   https://www.rfc-editor.org/rfc/rfc6973.html
7. Georg Simmel, "The Sociology of Secrecy and of Secret Societies":
   https://doi.org/10.1086/211418

Legal and cultural authorities retain their scopes. This Table does not grant
permission, establish compliance, or provide legal advice.

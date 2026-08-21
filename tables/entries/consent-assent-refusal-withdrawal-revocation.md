# Consent, Assent, Refusal, Withdrawal, and Revocation

Status: candidate anchor entry

Scope: not legal or clinical advice

## Orientation

Consent is a normative act performed by the affected party over an act described
in a particular way: a capacitated, informed, voluntary agent agrees that
another party may do a specified thing, within a stated scope and time. When its
validity conditions hold and the applicable basis so provides, that act may make
the described act permissible. Consent is therefore not permission itself.
Permission is a held status owned by access and authorization; consent is one
act that can produce it, and a valid consent can still leave an act
impermissible when authority, policy, or another basis withholds it.

Assent is affirmative agreement by a person who cannot by themselves authorize
the act. Assent does not confer the permission on its own, and it may still be
legally or ethically required before the act may proceed. Mere failure to object
is not assent. Proxy consent is the conferring act performed by an authorized
representative on another's behalf; some regulations name this "permission,"
which is a jurisdiction-specific term for the conferring act and not the
canonical `permission` status.

Refusal and withdrawal are separated by their objects, not by a clock. Refusal
declines the described act, intervention, offer, or processing itself; it can be
expressed at any time the act is proposed, including partway through a
relationship. Withdrawal exits an ongoing participation or relationship.
Dissent is an objection expressed by a person unable to give effective consent.
Revocation cancels a standing consent, effective from a stated moment and
propagating to stated recipients.

Regulatory vocabulary crosses these senses and must be mapped explicitly. GDPR
Article 7(3) speaks of the right to "withdraw consent" at any time; that act is
this entry's `revocation`, because its object is the standing consent and its
effect is prospective cancellation without disturbing prior lawfulness. This
entry reserves `withdrawal` for exit from an ongoing participation, such as
leaving a study while some consents remain in force.

Three uses of `revocation` must be separated at the outset. Consent revocation
cancels a consent given by the affected party. Credential, certificate, and
token revocation cancels an issued technical grant and belongs to access and
authorization. Offer revocation withdraws an outstanding offer before acceptance
and belongs to agreement. This entry claims only the first.

Disclosure appears twice and means different things. Consent disclosure is what
was told to the consenting party so the agreement could be informed. Privacy
disclosure is person-related information made available to a recipient. The
first is a validity factor here; the second belongs to the privacy candidate.

Consent practice is culturally situated. In some settings family, community, or
collective involvement is expected alongside an individual's consent, and in
others it is not. This entry records those expectations as factors and states no
universal procedure.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `consent` | Which capacitated, informed, voluntary agent performs the normative act that may make which described act permissible, by whom, within what scope and time? | normative act that can render an act permissible |
| `assent` | Which affirmative agreement is given by a person who cannot by themselves authorize the act, where that agreement may still be required, and how is mere failure to object excluded? | required affirmative agreement without independent authorizing force |
| `proxy-consent` | Who is authorized to consent on another's behalf, under which standard and instrument? | delegated or surrogate conferring act |
| `refusal` | Which described act, intervention, offer, or processing is itself declined by a capacitated agent, on which disclosure, with what stated consequences? | informed declination of a described act |
| `dissent` | Which objection is expressed by a person unable to give effective consent, and does it bind? | expressed objection without conferral power |
| `withdrawal` | Who exits an ongoing participation or relationship, when, with what prospective effect on already-collected data or already-performed acts? | exit from ongoing participation |
| `revocation` | Which standing consent is cancelled, by which party, effective when, propagating where, with what non-retroactivity? | cancellation of a standing consent |

## Root factorization

```text
consent-withdrawal-use
  := consenting party, capacity, and representative
   x requesting or acting party and authority
   x act description, scope, granularity, and alternatives
   x disclosure to the consenting party, comprehension, deliberation, and
     language
   x voluntariness, pressure, dependence, inducement, and alternatives
   x basis, jurisdiction, domain norms, and effective time
   x culture, community, family, and collective decision expectations
   x expression, record, receipt, and evidence
   x refusal, dissent, non-response, and default treatment
   x withdrawal from participation, revocation of consent, effective moment,
     propagation, and non-retroactivity
   x consequences, remedy, re-consent, review, and supersession
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Consent vs. permission | either can appear where an act is allowable | normative act performed by the affected party vs. the resulting held status |
| Consent vs. authorization decision | either can precede an act | act by the affected party that may make conduct permissible vs. request-time allow-or-deny evaluation by a decision point |
| Consent vs. entitlement | either can license conduct | conferring act by the affected party vs. a governed grant issued from an authority source |
| Consent vs. lawful basis | either can make processing permissible | one party's conferring act vs. the applicable ground under which an act is permitted |
| Valid consent vs. resulting permission | both are recorded around the same act | the act and its validity conditions vs. whether permissibility actually followed |
| Consent vs. consent record | both appear in an audit trail | the normative act itself vs. evidence that it occurred |
| Valid consent vs. expressed consent | both are observable as an event | capacity, disclosure, comprehension, and voluntariness satisfied vs. a token collected |
| Consent disclosure vs. privacy disclosure | both are called disclosure | what was told to the consenting party as a validity factor vs. person-related information made available to a recipient |
| Consent vs. assent | both are affirmative agreements | act that can render conduct permissible vs. required agreement by a person who cannot authorize alone |
| Assent vs. mutual assent | both use the word assent | agreement by a person who cannot effectively consent vs. offer and acceptance forming an agreement |
| Assent vs. non-objection | both can be recorded as no complaint | affirmative agreement vs. silence, which is not assent |
| Proxy consent vs. parental permission | both name conferral by a representative | this entry's sense name vs. a jurisdiction-specific regulatory term for it |
| Proxy consent vs. delegation | both act for another | consenting on behalf of the affected person under a stated standard vs. transfer of a decision right within an organization |
| Refusal vs. withdrawal | both end an involvement | object is the described act vs. object is the ongoing participation |
| Refusal vs. dissent | both express unwillingness | binding declination by a capacitated agent vs. objection by a person unable to consent |
| Withdrawal vs. revocation | both are prospective | exiting a participation or relationship vs. cancelling a standing consent |
| Regulatory withdrawal of consent vs. this entry's withdrawal | both use the word withdrawal | cancellation of standing consent, recorded here as revocation vs. exit from participation |
| Consent revocation vs. credential revocation | both cancel something | cancellation of a consent given by the affected party vs. cancellation of an issued technical grant |
| Consent revocation vs. offer revocation | both withdraw an outstanding position | cancelling a standing consent vs. withdrawing an offer before acceptance |
| Withdrawal vs. waiver | both change what is required | exiting participation vs. releasing an obligation or a stated requirement |
| Consent vs. voluntariness | consent presupposes voluntariness | the conferring act vs. the condition under which pressure, dependence, or inducement can invalidate it |
| Individual consent vs. collective expectation | both bear on whether the act may proceed | the affected party's own act vs. family, community, or collective involvement expected in the setting |

## Dependencies and stopping boundary

- Every consent claim names the consenting party, the acting party, the act
  under a description, the scope, the basis, and the effective time.
- Consent is recorded as an act with validity conditions; whether permission
  followed is recorded separately and belongs to the permission owner.
- Capacity, disclosure, comprehension, voluntariness, granularity, language,
  record, receipt, expiry, and re-consent remain factors, not senses.
- Culture, community, family, and collective decision expectations are recorded
  factors; no single culturally specific procedure is assumed or prescribed.
- Disclosure to the consenting party is a validity factor here; person-related
  disclosure to a recipient stays with the privacy candidate.
- An inducement that removes meaningful alternatives is a voluntariness
  question; the design of inducements belongs to the incentive candidate.
- Silence, non-response, and continued use are not assent; they are recorded as
  non-response with a stated default treatment.
- Refusal is indexed to the described act; withdrawal is indexed to the ongoing
  participation. Neither is defined by position in a timeline.
- Withdrawal and revocation are prospective by default; the treatment of
  already-collected data and already-performed acts is stated, not assumed.
- Revocation states its authority, effective moment, and propagation targets.
- Permission, authorization decisions, entitlement, technical revocation,
  obligation, waiver, requirement statements, contract formation, custody
  records, participation and attrition, decision rights, and person-related flow
  appropriateness retain their existing owners.

This entry stops before jurisdiction-specific legal advice, capacity-assessment
instruments, ethics-committee and institutional review procedure catalogs,
consent-management platform and banner patterns, sexual-offence doctrine, and
certificate, token, or key revocation mechanics.

## Selection procedure

1. Identify the affected party, the acting party, and the act under the
   description actually presented.
2. State whether the question concerns consent, assent, proxy consent, refusal,
   dissent, withdrawal, or revocation.
3. Record capacity, representative, standard applied, and the instrument
   authorizing any proxy consent, together with the local term used for it.
4. Record what was disclosed to the consenting party, in what language, with
   what comprehension check, deliberation time, and available alternatives.
5. Record the cultural setting, including any family, community, or collective
   involvement expected alongside the individual's act, and whether that
   involvement is a condition, a courtesy, or absent; do not import one
   setting's expectation into another.
6. Assess voluntariness separately from expression, including dependence,
   pressure, inducement, and the consequences of declining.
7. Record scope, granularity, bundling, purpose, jurisdiction, applicable domain
   norms, basis, and effective time.
8. Keep the conferring act separate from its record, receipt, or token, and from
   whether permission actually resulted.
9. Treat non-response as non-response, and state the default that applies.
10. Classify a declination by its object: the described act gives refusal, the
    ongoing participation gives withdrawal, and a standing consent gives
    revocation. Map any regulatory phrase, such as withdrawing consent, onto
    that classification explicitly.
11. For withdrawal and revocation, record the effective moment, prospective
    scope, propagation targets, treatment of prior acts and prior data, and
    whether re-consent is required.
12. Preserve refused, withdrawn, revoked, invalid, and unrecorded cases rather
    than reducing the history to a current yes or no.
13. Route permission, authorization decisions, entitlement, technical
    revocation, obligation, waiver, requirement statements, contract formation,
    custody, and privacy questions to their existing owners.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Dictionary | distinguishes consent, assent, permission, and refusal | separates the conferring act from the resulting status and fixes scope and effective time |
| Philosophy of consent | analyzes consent as a normative power over rights | preserves competing validity conditions rather than selecting one |
| Bioethics text | supplies capacity, disclosure, understanding, and voluntariness | keeps these as validity factors rather than separate senses |
| Regulation or research rule | fixes assent, proxy permission, documentation, and waiver in one jurisdiction | retains jurisdiction, maps local terms onto these senses, and does not universalize doctrine |
| Standard or specification | structures notices, consent records, and withdrawal records | keeps the record separate from the act it evidences |
| Protocol specification | defines certificate and token revocation | prevents technical revocation from absorbing consent revocation |

## Failure signs

- consent is treated as identical to permission, or as a timeless yes or no
  field;
- a collected token is treated as valid consent without capacity, disclosure, or
  voluntariness;
- valid consent is assumed to settle permissibility on its own;
- silence, non-response, or continued use is recorded as assent;
- assent is treated as sufficient authorization, or is skipped because it cannot
  authorize alone;
- proxy consent is recorded as the canonical permission status because a
  regulation calls it permission;
- refusal is defined by timing rather than by the act declined;
- regulatory withdrawal of consent is recorded as participation exit, or
  participation exit is recorded as cancellation of consent;
- withdrawal is applied retroactively, or revocation is assumed to propagate
  instantly to every downstream recipient;
- consent revocation is modeled with credential-revocation mechanics;
- disclosure to the consenting party and disclosure to a recipient share one
  field;
- collective or family involvement is either assumed everywhere or ignored
  everywhere;
- an authorization decision is presented as evidence that the affected party
  consented;
- one jurisdiction's rule is presented as universal;
- the entry is used as legal, clinical, or compliance advice.

## Cross-references

- [Access, Permission, Authorization, and Entitlement](access-permission-authorization-entitlement.md)
- [Governance, Obligation, and Compliance](governance-obligation-compliance.md)
- [Requirement, Specification, Verification, and Validation](requirement-specification-verification-validation.md)
- [Agreement, Commitment, Obligation, Guarantee, and Contract Integrity](../constraints/agreement-commitment-integrity.md)
- [Source, Performance, and Research Custody](../evidence/source-performance-research-custody.md)
- [Population, Sample, Estimand, Estimate, and Generalization](sampling-generalization.md)
- [Organization, Position, Role, Competency, Responsibility, Authority, and Accountability](organization-role-authority.md)
- [Privacy, Confidentiality, Secrecy, Anonymity, and Disclosure](privacy-confidentiality-secrecy-anonymity-disclosure.md)
- [Incentive, Alignment, Externality, Moral Hazard, and Adverse Selection](incentive-alignment-externality-moral-hazard-adverse-selection.md)
- [Admission brief](../../signals/discover/literature/consent-withdrawal-candidate-brief-2026-08-20.md)

## Sources and provenance

1. Stanford Encyclopedia of Philosophy, "Informed Consent":
   https://plato.stanford.edu/entries/informed-consent/
2. Heidi M. Hurd, "The Moral Magic of Consent," *Legal Theory* 2(2):121-146:
   https://doi.org/10.1017/S1352325200000434
3. Ruth R. Faden and Tom L. Beauchamp, *A History and Theory of Informed
   Consent*, Oxford University Press, 1986, ISBN 978-0-19-503686-3.
4. Tom L. Beauchamp and James F. Childress, *Principles of Biomedical Ethics*,
   8th ed., Oxford University Press, 2019, ISBN 978-0-19-064087-3.
5. World Medical Association, *Declaration of Helsinki*:
   https://www.wma.net/policies-post/wma-declaration-of-helsinki/
6. National Commission, *The Belmont Report*:
   https://www.hhs.gov/ohrp/regulations-and-policy/belmont-report/index.html
7. United States, 45 CFR 46 (Common Rule), §§46.116, 46.117, 46.402, 46.408,
   including the jurisdiction-specific term "parental permission":
   https://www.ecfr.gov/current/title-45/subtitle-A/subchapter-A/part-46
8. European Union, General Data Protection Regulation, Art. 4(11), Art. 7,
   including the Art. 7(3) right to withdraw consent, mapped here to
   `revocation`: https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng
9. European Data Protection Board, *Guidelines 05/2020 on consent under
   Regulation 2016/679*:
   https://www.edpb.europa.eu/documents/guideline/guidelines-052020-on-consent-under-regulation-2016679_en
10. ISO/IEC 29184:2020, *Online privacy notices and consent*:
    https://www.iso.org/standard/70331.html
11. ISO/IEC TS 27560:2023, *Consent record information structure*:
    https://www.iso.org/standard/80392.html
12. IETF, RFC 5280 and RFC 7009, for the technical revocation homonym:
    https://www.rfc-editor.org/info/rfc5280 and
    https://www.rfc-editor.org/info/rfc7009
13. American Law Institute, *Restatement (Second) of Contracts* §§ 17-19,
    42-43, 1981, for the contract assent and offer-revocation homonyms.

Legal, clinical, regulatory, and cultural authorities retain their scopes. This
draft does not grant permission, establish the validity of any consent, create
or discharge an obligation, prescribe a culturally specific consent procedure,
or provide legal or clinical advice.

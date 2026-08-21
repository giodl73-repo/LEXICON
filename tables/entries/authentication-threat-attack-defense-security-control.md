# Authentication, Threat, Attack, Defense, and Security Control

Status: candidate anchor entry

## Orientation

Authentication verifies a claimed identity, origin, or control under a protocol.
A threat is a circumstance, actor, capability, or event with potential adverse
effect; an attack is an attempt or action intended to exploit or compromise;
defense is organized prevention, detection, response, recovery, or adaptation;
a security control is a selected safeguard or countermeasure under a framework.

## Sense table

| Sense | Governing question | Role |
|---|---|---|
| `authentication` | Which claimant, message, process, or device is verified by which verifier, protocol, evidence, and assurance level? | identity or origin verification process |
| `security-threat` | Which source, capability, circumstance, or event could adversely affect which asset or objective? | potential adverse condition |
| `security-attack` | Which actor or process attempts or performs which compromise through which vector and target? | adversarial attempt or action |
| `defense` | Which coordinated protective activities prevent, detect, respond to, recover from, or adapt to which threats? | protective activity system |
| `security-control` | Which selected safeguard addresses which requirement or risk under which framework, implementation, and assessment? | governed safeguard |

## Root factorization

```text
security-structure-use
  := subject, claimant, actor, verifier, defender, and authority
   x asset, objective, boundary, environment, and dependencies
   x identity claim, authenticator, protocol, evidence, and assurance level
   x threat source, capability, intent, opportunity, event, and consequence
   x target, vector, technique, attempt, action, and observed effect
   x prevention, protection, detection, response, recovery, and adaptation
   x control objective, safeguard, framework, implementation, and assessment
   x time, intelligence source, uncertainty, privacy, and disclosure limits
```

## Decisive distinctions

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Authentication vs. authorization | authentication can inform authorization | verified identity/origin/control vs. decision that an action may proceed |
| Threat vs. attack | attacks realize or express threats | potential adverse condition vs. attempted or performed compromise |
| Attack vs. incident | attacks can cause incidents | adversarial action vs. managed observed event or disruption |
| Defense vs. control | controls support defense | coordinated protective activity system vs. selected safeguard |
| Control vs. assurance | controls are assessed | implemented safeguard vs. evidence-based confidence or attestation |

## Dependencies and stopping boundary

Access/authorization, hazard/vulnerability, fault/incident, risk, assurance,
privacy, and system architecture retain their owners. All terms state framework,
version, system boundary, threat model, and evidence. The Table does not provide
operational defense instructions, attack procedures, compliance determinations,
or guarantees and does not enumerate controls or adversary techniques.

## Selection procedure

1. Name system boundary, assets, objectives, actors, authority, and framework.
2. Select verification, potential condition, adversarial action, protective system, or safeguard.
3. Separate identity proofing, authentication, authorization, and enforcement.
4. Record threat source, capability, vector, target, effect, evidence, and uncertainty.
5. Bind every control to purpose, implementation state, assessment, and residual risk.
6. Apply disclosure and safety limits before publishing details.

## Reference Delta

| Reference form | Typical contribution | Lexicon delta |
|---|---|---|
| Digital identity standard | specifies authentication protocols and assurance | separates proofing, authentication, authorization, and assertion |
| Risk framework | relates threats, vulnerabilities, likelihood, impact, and controls | preserves framework version and uncertainty |
| Control catalog | enumerates safeguards | keeps catalog membership outside the canonical senses |

## Failure signs

- successful authentication implies authorization;
- vulnerability, threat, attack, incident, and harm share one field;
- a named control is treated as guaranteed protection;
- absent detection is reported as absent attack;
- framework compliance is inferred without assessment;
- the Table supplies actionable attack or defense instructions.

## Cross-references

- [Access, Permission, Authorization, and Entitlement](access-permission-authorization-entitlement.md)
- [Hazard, Exposure, Harm, Vulnerability, and Safety](hazard-exposure-harm-safety.md)
- [Fault, Defect, Error, Failure, Incident, and Outage](fault-defect-error-failure-incident-outage.md)
- [Assurance, Assessment, Audit, Certification, and Accreditation](assurance-assessment-audit-certification.md)

## Sources and provenance

1. NIST SP 800-63-4, *Digital Identity Guidelines*:
   https://doi.org/10.6028/NIST.SP.800-63-4
2. NIST SP 800-30 Rev. 1, *Guide for Conducting Risk Assessments*:
   https://doi.org/10.6028/NIST.SP.800-30r1
3. NIST SP 800-53 Rev. 5, *Security and Privacy Controls*:
   https://doi.org/10.6028/NIST.SP.800-53r5
4. NIST Cybersecurity Framework 2.0:
   https://doi.org/10.6028/NIST.CSWP.29

NIST definitions retain their stated scopes. This Table is descriptive and is
not a security design, control selection, assessment, or operational playbook.

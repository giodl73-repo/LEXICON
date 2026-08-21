# Periodic and Wave Quantity

Status: candidate anchor entry

## Orientation

Frequency and period describe temporal repetition; wavelength and wave number
describe spatial repetition; phase identifies position within a cycle; wave
speed describes propagation of a pattern. Oscillation names repeated variation,
amplitude requires a declared reference and measure, and a spectrum represents
content against a spectral coordinate. Phase and group velocity separate when
the dispersion relation is not linear. None is interchangeable with material-
point velocity.

## Sense table

| Sense | Governing question | Quantity role | SI unit |
|---|---|---|---|
| `period` | How much time does one defined cycle take? | duration per cycle | second, `s` |
| `frequency` | How many defined cycles occur per unit time? | temporal recurrence rate | hertz, `Hz = s^-1` |
| `angular-frequency` | How quickly does temporal phase advance? | temporal phase rate | `rad s^-1` |
| `wavelength` | What spatial interval separates corresponding same-phase points? | spatial period | metre, `m` |
| `wave-number` | How quickly does phase advance with position? | spatial phase rate | `rad m^-1` |
| `cycle-phase` | Where within the declared cycle is this state relative to a reference? | dimension-one cyclic coordinate | radian, `rad` |
| `wave-speed` | How quickly does a wave feature or phase propagate? | pattern propagation rate | `m s^-1` |
| `oscillation` | What quantity varies repeatedly about a declared reference or trajectory? | repeated variation | quantity-dependent |
| `amplitude` | What declared measure of excursion or component strength is used? | magnitude descriptor | unit of represented quantity |
| `spectrum` | How is a quantity distributed or represented against frequency, wavelength, wave number, energy, or another spectral coordinate? | spectral representation | axis- and ordinate-dependent |
| `phase-velocity` | How quickly does a constant-phase feature of one component propagate? | component phase speed | `m s^-1` |
| `group-velocity` | How quickly does a narrowband envelope propagate under the declared dispersion model? | local envelope speed | `m s^-1` |

## Temporal-spatial-phase ladder

```text
one defined cycle
  -- duration --> period
  -- cycles per time --> frequency
  -- radians per time --> angular frequency

one spatial cycle
  -- length --> wavelength
  -- radians per length --> wave number

spatial cycle / temporal cycle
  -- in a periodic traveling wave --> wave speed

reference + excursion measure -> amplitude
waveform + observation/transform convention -> spectrum
dispersion relation omega(k) -> phase velocity and local group velocity
```

## Root factorization

```text
periodic-wave-use
  := phenomenon or field
   x cycle definition
   x waveform or mode
   x temporal reference
   x spatial axis and origin
   x propagation direction
   x medium and boundary conditions
   x periodic, pulse, or spectral regime
   x equilibrium, baseline, mean, envelope, or other amplitude reference
   x peak, peak-to-peak, root-mean-square, component, or other amplitude measure
   x sampling interval, observation window, transform, and normalization
   x spectral coordinate, ordinate, resolution, and bandwidth
   x dispersion relation and phase, envelope, energy, or information target
   x packet bandwidth, attenuation, distortion, and validity regime
   x requested temporal, spatial, phase, or speed quantity
   x unit and uncertainty
```

## Contrast table

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Period vs. frequency | same cycle | time per cycle vs. cycles per time |
| Frequency vs. angular frequency | same temporal recurrence | cycles per second vs. radians per second |
| Wavelength vs. wave number | same spatial repetition | length per cycle vs. radians per length |
| Phase vs. time | phase may evolve with time | cyclic coordinate relative to a reference vs. temporal position or duration |
| Wave speed vs. particle velocity | both may use `m s^-1` | pattern propagation vs. motion of material or field value |
| Wavelength vs. distance traveled | both use metres | spatial period vs. accumulated path length |
| Oscillation vs. wave | both can repeat | local or state variation vs. spatially propagating pattern |
| Amplitude vs. instantaneous value | both use the represented quantity's unit | declared excursion/component measure vs. value at one coordinate |
| Waveform vs. spectrum | both represent one phenomenon | variation over a direct coordinate vs. content over a spectral coordinate |
| Spectrum vs. named band | both organize spectral content | measured or transformed distribution vs. conventional interval label |
| Phase velocity vs. group velocity | both can use `m s^-1` | constant-phase component speed vs. local narrowband-envelope speed |
| Group velocity vs. signal or energy velocity | may coincide in limited regimes | derivative-defined envelope speed vs. separately justified transport claim |

## Diagnostic examples

- A `2 Hz` oscillation has a `0.5 s` period.
- Two points one wavelength apart are in the same phase for a simple periodic
  wave, though they occupy different positions.
- A transverse string wave can move horizontally while string elements move
  vertically.
- Doubling frequency in the same nondispersive medium halves wavelength when
  propagation speed remains fixed.
- A single pulse has a propagation speed but not necessarily one period,
  frequency, wavelength, or phase.
- Equal phase values are meaningful only under a shared waveform, origin,
  direction, and reference convention.
- Peak, peak-to-peak, root-mean-square, and Fourier-component amplitudes are
  different measures even when expressed in the same unit.
- A spectrum requires both its horizontal coordinate and ordinate; a list of
  familiar named bands is not a spectrum.
- In a dispersive medium, the phase of a component and a narrowband envelope
  can propagate at different rates.

## Formula view

The linked [Periodic and Wave Formula Table](../formulas/periodic-wave-quantities.md)
owns reciprocal, phase-rate, wavelength, traveling-wave, sinusoidal,
discrete-transform, and dispersion-velocity relations.

The linked [Oscillation, Spectrum, and Dispersion Failure Diagnostic](../diagnostics/oscillation-spectrum-dispersion-failures.md)
tests reference, amplitude, sampling, spectral, and propagation claims.

## Selection procedure

1. Identify the phenomenon, wave type, medium, and mode.
2. Decide whether the observation is periodic, pulsed, or spectral.
3. Define one complete temporal or spatial cycle.
4. Select cycles or radians as the reporting basis.
5. Declare spatial origin, temporal origin, propagation direction, and phase
   reference.
6. For amplitude, declare reference level, measure, component, interval, and unit.
7. For spectra, declare coordinate, ordinate, transform or measurement method,
   sampling, window, normalization, resolution, and bandwidth.
8. For propagation, state the dispersion relation and distinguish phase,
   narrowband-envelope, energy, information, and material-motion claims.
9. Apply `v = f lambda` only to the scoped periodic traveling-wave component.
10. Report attenuation, distortion, uncertainty, and regime limitations.

## Reference Delta

| Reference form | Typical contribution | Factorium delta |
|---|---|---|
| Dictionary | Defines frequency, period, wavelength, phase, and speed | Places temporal, spatial, phase, and propagation senses in one selection schema |
| Thesaurus | Links repetition, rhythm, cycle, interval, pitch, and wave | Prevents lexical proximity from collapsing different quantity roles |
| Encyclopedia or textbook | Explains wave models, media, derivations, and examples | Supplies a compact regime, reference, and motion distinction |
| Formula sheet | Lists `f = 1/T`, `k = 2 pi/lambda`, and `v = f lambda` | Adds cycle, waveform, medium, direction, phase, and periodicity contracts |
| SI reference | Owns second, hertz, metre, and radian conventions | Connects unit authority to cycle and phase semantics |

## Constraints and failure signs

- Frequency and period require a defined recurring cycle.
- Cycles per second and radians per second are not numerically identical.
- Wavelength requires a spatially periodic pattern and phase correspondence.
- Phase values use one origin, direction, waveform, and angular convention.
- Phase is compared modulo a complete cycle where appropriate.
- Wave speed is not automatically the velocity of medium particles.
- `v = f lambda` is used within its periodic traveling-wave scope.
- Medium, mode, and dispersion assumptions are not hidden.
- A pulse is not forced to have one frequency or wavelength.
- Amplitude is never reported without its reference and measure.
- A spectral peak is not automatically a physical mode or causal source.
- Sampling, window, transform, normalization, resolution, and bandwidth remain visible.
- Phase and group velocity are not equated without a scoped nondispersive model.
- Group velocity is not promoted to energy or information speed without separate evidence.

## Cross-references

- [Motion Measure](motion-measure.md)
- [Comparative Quantity](comparative-quantity.md)
- [Information, Data, Signal, and Noise](information-data-signal-noise.md)
- [Measurement Quality](measurement-quality.md)
- [Statistical Summary and Interval](statistical-summary-interval.md)
- [Time](../roots/time.md)
- [Transformation](../roots/transformation.md)
- [Context](../roots/context.md)

## Sources and provenance

1. OpenStax, *University Physics Volume 1*, sections 16.1 and 16.2:
   https://openstax.org/books/university-physics-volume-1/pages/16-1-traveling-waves
   https://openstax.org/books/university-physics-volume-1/pages/16-2-mathematics-of-waves
2. BIPM, *SI Brochure*:
   https://www.bipm.org/en/publications/si-brochure
3. NIST Digital Library of Mathematical Functions, Fourier transforms and DFT:
   https://dlmf.nist.gov/1.14
   https://dlmf.nist.gov/3.11
4. NIST, *Ionospheric Radio Propagation*, section 2.4.2:
   https://nvlpubs.nist.gov/nistpubs/Legacy/MONO/nbsmonograph80.pdf
5. IUPAC, spectrum and spectral bandwidth:
   https://goldbook.iupac.org/terms/view/08291
   https://goldbook.iupac.org/terms/view/08286
6. [Research note](../../docs/research/2026-08-15-oscillation-spectrum-dispersion.md)

Comparator access date: 2026-08-14. Introductory periodic-wave relations are
established within source scope; Factorium organization remains `candidate`.

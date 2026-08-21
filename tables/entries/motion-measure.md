# Motion Measure

Status: candidate anchor entry

## Orientation

Motion measures describe where a subject is, how its position changes, how
much path it traverses, how those quantities change with time, and how mass
and velocity combine as linear momentum. Momentum is a frame-dependent system
quantity, not another name for velocity, force, impulse, or kinetic energy.

## Sense table

| Sense | Governing question | Kind | Dimension | Defining evidence |
|---|---|---|---|---|
| `spatial-position` | Where is it in the chosen frame? | vector or coordinate | `L` | location relative to origin and axes |
| `distance-traveled` | How much path length accumulated? | scalar | `L` | complete path |
| `displacement` | How did final position differ from initial position? | vector | `L` | endpoints and frame |
| `speed` | How fast is path length accumulating? | scalar | `L T^-1` | distance and elapsed time |
| `velocity` | How fast and in what direction is position changing? | vector | `L T^-1` | displacement or position derivative |
| `acceleration` | How is velocity changing? | vector | `L T^-2` | velocity change or derivative |
| `linear-momentum` | What directed motion quantity does this selected mass carry in the chosen frame? | vector | `M L T^-1` | mass distribution and velocity in one frame |

## Root factorization

```text
motion-measure-use
  := subject
   x reference frame
   x coordinate and direction convention
   x path-or-endpoint evidence
   x scalar-or-vector kind
   x average-or-instantaneous view
   x time interval or instant
   x system boundary, membership, and mass distribution
   x momentum aggregation and reference frame
   x impulse interval and external-force aggregation
   x open-system transfer or fixed-membership scope
   x unit system
```

## Contrast table

| Pair | Shared feature | Decisive distinction |
|---|---|---|
| Distance vs. displacement | unit and dimension `L` | path length vs. endpoint change with direction |
| Speed vs. velocity | unit and dimension `L T^-1` | scalar path rate vs. vector position rate |
| Velocity vs. acceleration | both may be vectors | first vs. second time derivative of position |
| Average vs. instantaneous | describe the same quantity family | finite interval ratio vs. limiting derivative |
| Velocity vs. momentum | both are directed and frame-dependent | motion per time vs. mass-weighted motion quantity |
| Momentum vs. kinetic energy | both depend on mass and velocity | vector linear in velocity vs. scalar quadratic in speed |
| Momentum vs. force | force can change momentum | system motion quantity vs. interaction rate of change |
| Momentum change vs. impulse | equal under a scoped impulse-momentum relation | state difference vs. force accumulated over time |

## Diagnostic examples

- Returning to the starting point gives zero displacement but positive distance
  if a path was traveled.
- Equal speeds in opposite directions give different velocities.
- Turning at constant speed still produces acceleration because velocity
  direction changes.
- Negative acceleration can speed up an object moving in the negative
  direction.
- Two objects can have equal velocity and different momentum because their
  selected masses differ.
- Equal momentum magnitudes do not imply equal kinetic energies or directions.
- Momentum conservation requires the declared system and external impulse;
  it is not certified by a collision diagram alone.

## Formula view

The linked [Motion and Momentum Formula Table](../formulas/kinematics-motion-measures.md)
contains average, instantaneous, constant-acceleration, momentum, aggregation,
and impulse relations.

## Selection procedure

1. Select the moving subject, reference frame, origin, axes, and direction
   convention.
2. Decide whether the available evidence is a complete path, two endpoints,
   position over time, velocity over time, or another bounded record.
3. Select distance for accumulated path length and displacement for directed
   endpoint change.
4. Select speed for scalar path rate and velocity for directed position rate.
5. Select acceleration only for change of velocity, including direction
   change at constant speed.
6. State whether the requested quantity is average over an interval or
   instantaneous at a time.
7. Check unit and dimension consistency and preserve vector components where
   direction matters.
8. Use constant-acceleration formulas only after verifying that regime over
   the selected interval.
9. For momentum, select the system membership, mass distribution, velocity
   field or body velocity, and one reference frame.
10. For conservation or impulse, declare the time interval, external-force
    set, boundary transfers, and whether membership is fixed.

## Reference Delta

| Reference form | Typical contribution | Factorium delta |
|---|---|---|
| Dictionary | Defines motion terms and records ordinary usage | Separates technical senses by path, endpoints, vector kind, and derivative order |
| Thesaurus | Groups near words such as speed, pace, motion, movement, and acceleration | Prevents lexical proximity from creating technical equivalence |
| Encyclopedia or textbook | Explains kinematics with graphs, calculus, examples, and derivations | Provides a compact contrast table, selection schema, assumptions, and failure signs |
| Formula sheet | Lists rate and constant-acceleration equations | Adds reference frame, evidence type, vector status, and regime selection |
| NIST/SI reference | Owns metre and second unit definitions | Connects authoritative units to `L`, `L T^-1`, and `L T^-2` quantities |

## Constraints and failure signs

- All compared positions use one declared reference frame.
- Elapsed time is positive for average-rate division.
- Distance cannot be negative, while signed displacement components can be.
- Instantaneous speed is the magnitude of velocity, not generally the
  magnitude of average velocity.
- Acceleration can result from direction change with constant speed.
- Constant-acceleration formulas require constant acceleration over the
  interval.
- Momentum values combine only after transformation to one frame and one
  declared system boundary.
- `p = m v` is a particle or rigid-translation relation; distributed systems
  require mass-weighted aggregation.
- Momentum conservation requires zero net external impulse for the chosen
  closed or fixed-membership system over the interval.
- Impulse is an accumulated interaction, not a force value or momentum state.

## Cross-references

- [Force](force.md)
- [Matter and Load Measure](matter-load-measure.md)
- [Work, Energy, and Power](work-energy-power.md)
- [Comparative Quantity](comparative-quantity.md)
- [Periodic and Wave Quantity](periodic-wave-quantity.md)
- [Time](../roots/time.md)
- [Transformation](../roots/transformation.md)
- [Geometric Object, Point, Curve, Path, Length, Shape, Angle, Coordinate
  System, Reference Frame, and Unit Circle](geometric-reference-structure.md)
  — canonical owner of `path` and `reference-frame`

## Sources and provenance

1. OpenStax, *University Physics Volume 1*, sections 3.1 through 3.3:
   https://openstax.org/books/university-physics-volume-1/pages/3-1-position-displacement-and-average-velocity
   https://openstax.org/books/university-physics-volume-1/pages/3-2-instantaneous-velocity-and-speed
   https://openstax.org/books/university-physics-volume-1/pages/3-3-average-and-instantaneous-acceleration
2. NIST, "SI Units - Length" and "SI Units - Time":
   https://www.nist.gov/pml/owm/si-units-length
   https://www.nist.gov/pml/owm/si-units-time
3. NASA, "Momentum and Impulse":
   https://www.nasa.gov/wp-content/uploads/2024/05/momentum-and-impulse-classroom-connection-508.pdf
4. NASA Glenn Research Center, "Newton's Second Law of Motion":
   https://www.grc.nasa.gov/www/k-12/BGP/newton2.html

Comparator access date: 2026-08-15. Physics distinctions are established
within source scope; Factorium organization remains `candidate`.

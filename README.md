# Physics excercise 2 (in Zig)

This was a way for me to excercise both Zig and Physics. The comments are in Hungarian.

## Features

- Error handling

### Structures

- measured_unit
- Vector

### Helper functions

- mili()
- micro()
- nano()
- pico()
- printf(str)

### Functions

It offers a non-comptime as well as a comptime variant for each function:

- calc_thermal_expansion(l0: f32, alpha: f32, delta_T: f32)
- C_calc_thermal_expansion(comptime l0: f32, comptime alpha: f32, comptime delta_T: f32)
- calc_thermal_potency(lambda: f32, d: f32, A: f32, delta_T: f32)
- C_calc_thermal_potency(comptime lambda: f32, comptime d: f32, comptime A: f32, comptime delta_T: f32)
- calc_gravitational_force(m1: f32, m2: f32, r: f32)
- C_calc_gravitational_force(comptime m1: f32, comptime m2: f32, comptime r: f32)
- calc_e_gravitational_force(q1: f32, q2: f32, r: f32)
- C_calc_e_gravitational_force(comptime q1: f32, comptime q2: f32, comptime r: f32)
# High-Speed Double-Precision Floating-Point Vedic Multiplier

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![HDL](https://img.shields.io/badge/HDL-Verilog-orange)](#)
[![CI](https://img.shields.io/badge/CI-Icarus%20Verilog-black)](.github/workflows/icarus-ci.yml)

RTL implementation of a 64-bit floating-point multiplier using hierarchical Vedic multiplication for mantissa computation.

## Patent Disclosure

One part of this work is associated with a patented (or patent-pending) **Prime Bit Vedic Multiplier** concept.

- See [Patent Notice](docs/legal/PATENT_NOTICE.md) for IP and usage clarification.
- If you plan commercial adoption, review the patent details and obtain permission from the patent holder(s) where required.

## Project Scope

This design multiplies two IEEE-754 double-precision style operands by splitting the datapath into:

- Sign path: XOR of input signs.
- Exponent path: exponent addition with bias subtraction.
- Mantissa path: 53x53 Vedic multiplier hierarchy (including implicit leading 1s).
- Normalization path: select/shift mantissa and adjust exponent.

![Double-precision architecture](docs/images/double_precision_architecture.svg)

## Important Notes

- This RTL is focused on normalized finite operands.
- Special-case handling for NaN, Infinity, denormals/subnormals, and full IEEE rounding modes is not implemented in the current design.
- Verification vectors are therefore chosen from normalized values.

## Repository Layout

- `double_precision.v`: top-level floating-point multiplier.
- `exponent.v`, `normalizer.v`: exponent and normalization stages.
- `vedic_*.v`: hierarchical Vedic multiplier blocks.
- `adder*.v`, `mux*.v`, `*_gate.v`: arithmetic and logic primitives.
- `tb/tb_double_precision.v`: self-checking directed testbench.
- `rtl_sources.f`: ordered source list for simulation flows.
- `scripts/run_vivado.tcl`: Vivado batch simulation script.
- `run_icarus.*`, `run_vivado.*`: tool-specific runners.
- `docs/legal/PATENT_NOTICE.md`: patent/IP usage note for this repository.

## Run with Icarus Verilog

### Linux/macOS

```bash
make run
```

### Windows (CMD)

```bat
run_icarus.bat
```

### Windows (PowerShell)

```powershell
powershell -ExecutionPolicy Bypass -File .\run_icarus.ps1
```

Expected summary line:

```text
PASS: all directed floating-point vectors matched.
```

Waveform output: `wave.vcd`

## Run with Vivado (xsim)

### Windows (CMD)

```bat
run_vivado.bat
```

### Windows (PowerShell)

```powershell
powershell -ExecutionPolicy Bypass -File .\run_vivado.ps1
```

This executes:

1. `xvlog` compile using `rtl_sources.f`.
2. `xvlog` compile of `tb/tb_double_precision.v`.
3. `xelab` elaboration of `tb_double_precision`.
4. `xsim -runall` simulation.

## Verification

The testbench applies directed IEEE-754 vectors and compares DUT output against known-good expected hex values.

Vectors include:

- Positive normalized multiplication (`1.0 x 1.0`, `1.5 x 2.5`, `3.0 x 5.0`, etc.).
- Fractional values (`0.5 x 0.5`, `10.0 x 0.75`).
- Sign behavior checks (`-1.0 x 2.0`, `-3.5 x -2.0`, `-6.25 x 0.5`).

## CI

GitHub Actions workflow at `.github/workflows/icarus-ci.yml` runs the Icarus simulation on every push and pull request.

## Quality Improvements Included

- Replaced logical operators (`&&`, `||`) with bitwise operators in gate/adder primitives for hardware-accurate intent.
- Fixed undeclared intermediate net in `adder13bit.v`.
- Converted combinational assignments in `normalizer.v` to blocking assignments.
- Replaced legacy empty/stub files with valid compatibility wrappers where needed (`adder_3bit.v`, `adder_6bit.v`).

## License

Distributed under the [MIT License](LICENSE).

Patent-related rights are addressed separately in [Patent Notice](docs/legal/PATENT_NOTICE.md).

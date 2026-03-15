# Reproducibility Guide

## Objective

Provide deterministic steps for reproducing functional simulation results.

## Environment

- Icarus Verilog: latest stable release recommended
- Vivado: 2022.2 or later
- OS: Windows 10/11 or Linux

## Steps

1. Run Icarus flow (`make run` or `run_icarus.bat`).
2. Run Vivado flow (`run_vivado.bat` or `run_vivado.ps1`).
3. Confirm directed testbench summary reports all vectors passing.

## Artifacts

- `wave.vcd`
- Simulator console logs

## Notes

This RTL currently targets normalized finite IEEE-754 inputs and does not include complete special-case handling.

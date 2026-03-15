# Contributing Guide

Thanks for contributing.

## Development setup

1. Clone the repository.
2. Install at least one supported simulator:
- Icarus Verilog (`iverilog`, `vvp`)
- Vivado Simulator (`xvlog`, `xelab`, `xsim`)
3. Run verification before opening a pull request.

## Verification commands

- Icarus: `run_icarus.bat` (Windows) or `make run` (Linux/macOS)
- Vivado: `run_vivado.bat` (Windows) or `powershell -ExecutionPolicy Bypass -File .\run_vivado.ps1`

## Branch and commit style

- Use short feature branches.
- Keep each commit scoped to one change.
- Use clear commit messages in imperative style.

## Pull request checklist

- Add or update tests when behavior changes.
- Update README/docs for user-visible changes.
- Ensure no generated artifacts are committed.
- Confirm CI passes.

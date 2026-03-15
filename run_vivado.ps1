$ErrorActionPreference = "Stop"

if (-not (Get-Command vivado -ErrorAction SilentlyContinue)) {
  throw "vivado is not installed or not on PATH."
}

vivado -mode batch -source scripts/run_vivado.tcl -notrace
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

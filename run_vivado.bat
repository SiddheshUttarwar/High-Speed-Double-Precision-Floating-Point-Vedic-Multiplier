@echo off
setlocal

where vivado >nul 2>&1
if errorlevel 1 (
  echo ERROR: vivado is not installed or not on PATH.
  exit /b 1
)

vivado -mode batch -source scripts/run_vivado.tcl -notrace
exit /b %errorlevel%

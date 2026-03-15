@echo off
setlocal

where iverilog >nul 2>&1
if errorlevel 1 (
  echo ERROR: iverilog is not installed or not on PATH.
  exit /b 1
)

where vvp >nul 2>&1
if errorlevel 1 (
  echo ERROR: vvp is not installed or not on PATH.
  exit /b 1
)

if not exist build mkdir build

iverilog -g2012 -Wall -s tb_double_precision -o build/simv -c rtl_sources.f tb/tb_double_precision.v
if errorlevel 1 exit /b %errorlevel%

vvp build/simv
if errorlevel 1 exit /b %errorlevel%

echo Waveform generated at wave.vcd
exit /b 0

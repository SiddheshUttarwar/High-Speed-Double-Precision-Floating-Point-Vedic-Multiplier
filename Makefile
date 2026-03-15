IVERILOG ?= iverilog
VVP ?= vvp
TOP ?= tb_double_precision
BUILD_DIR ?= build
SIM_BIN := $(BUILD_DIR)/simv

.PHONY: all compile run wave vivado clean

all: run

compile:
	mkdir -p $(BUILD_DIR)
	$(IVERILOG) -g2012 -Wall -s $(TOP) -o $(SIM_BIN) -c rtl_sources.f tb/tb_double_precision.v

run: compile
	$(VVP) $(SIM_BIN)

wave: run
	@echo "Waveform generated at wave.vcd"

vivado:
	vivado -mode batch -source scripts/run_vivado.tcl -notrace

clean:
	rm -rf $(BUILD_DIR) wave.vcd

# Makefile for 4-bit counter simulation using Synopsys VCS

# Define the source files
SRC = counter_4bit.sv
TB = tb_counter_4bit.sv

# Define the VCS executable
VCS = vcs

# Define the simulation executable name
SIM = simv

# Compilation and simulation options
VCS_OPTS = -sverilog -kdb -full64 -debug_access+all
VCS_GUI_OPTS = ./simv -verdi

# Targets
all: compile simulate

compile:
	$(VCS) $(VCS_OPTS) $(SRC) $(TB) -o $(SIM)

sim: compile
	./$(SIM) $(VCS_GUI_OPTS)

# Clean the compiled files
clean:
	rm -rf csrc DVEfiles *.vpd *.log *.key $(SIM) *.daidir *.conf verdi_config_file *.rc verdiLog *.fsdb

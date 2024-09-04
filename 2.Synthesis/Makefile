# Define the source files
TCL = run.tcl


FC = fc_shell


# Targets
all: syn

syn:
	$(FC) -f $(TCL)

# Clean the compiled files
clean:
	rm -rf csrc DVEfiles *.vpd *.log *.key $(SIM) *.daidir *.conf verdi_config_file *.rc verdiLog *.fsdb *.lck FM_INFO FM_WORK *.txt *.rpt HDL_LIBRARIES legalizer_debug_plots design_lib CLIBs *.svf *.ems

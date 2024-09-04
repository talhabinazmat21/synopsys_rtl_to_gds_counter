####################################################################

# SETUP ############################################################
set_host_options -max_cores 20

source ./setup.tcl 
set link_library  $LINK_LIBRARY_FILES
set target_library $TARGET_LIBRARY_FILES
set synthetic_library {dw_foundation.sldb}

create_lib -technology $TECH_FILE ./design_lib -ref_libs $NDM_REFERENCE_LIB_DIRS

# SET DONT USE ##########################################################
#set_dont_use [get_lib_cells -quiet */SAEDRVT14_AO21_U_0P5] 

# READ RTL ##########################################################
analyze -format sverilog {./RTL/counter_4bit.sv}

##set_port_attributes -attribute related_supply_default_primary True  -elements .

elaborate counter_4bit
set_top_module counter_4bit

source -echo ./constraints.sdc

read_parasitic_tech -tlup $TLUPLUS_MAX_FILE -name earlycap
read_parasitic_tech -tlup $TLUPLUS_MIN_FILE -name latecap
set_parasitics_parameters -early_spec earlycap -late_spec latecap

set_operating_conditions ss0p72v125c
current_design $DESIGN_NAME
create_port -design $DESIGN_NAME -direction in -port_type scan SI
create_port -design $DESIGN_NAME -direction out -port_type scan  SO
##create_port -design $DESIGN_NAME -direction in -port_type clock sclk
create_port -design $DESIGN_NAME -direction in -port_type signal SE
##create_port -design $DESIGN_NAME -direction in -port_type reset  Srst
# LINK ###############################################################

link
##link

### pre compile before inserting scanchains
compile_fusion -to initial_opto
### SCAN CHAIN Definitions

set_scan_configuration -chain_count 1
set_dft_signal -view spec -port SI -type ScanDataIn
set_dft_signal -view spec -port SO -type ScanDataOut
set_dft_signal -view spec -type ScanClock -port clk -timing [list 45 55]
set_dft_signal -view spec -port SE -type ScanEnable -usage scan -connect_to clk
set_dft_signal -view spec -port rst_n -type Reset -active_state 0
create_test_protocol



dft_drc -test_mode Internal_scan

preview_dft

insert_dft

dft_drc -test_mode Internal_scan

report_dft_drc_violations -test_mode Internal_scan -rule all
write_scan_def -output scandeffile.scandef
write_test_model -output design.tcl
write_test_protocol -output design.scan.spf -test_mode Internal_scan





# CHECK MV ############################################################

# COMPILE #############################################################

#set_app_options -name place.coarse.continue_on_missing_scandef -value true
compile_fusion


report_ref_libs
report_design_mismatch -verbose
save_lib

report_timing -max_paths 5000 > timing.rpt
report_qor > qor.rpt
create_qor_snapshot -name final_timing
report_area -hierarchy > area.rpt
report_logic_levels > logic_levels.rpt


report_qor_snapshot -name final_timing
write_verilog -hierarchy all Netlist.v
exit

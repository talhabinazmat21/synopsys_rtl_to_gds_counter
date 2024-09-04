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
analyze -library WORK -format sverilog {./RTL/counter_4bit.sv}

##set_port_attributes -attribute related_supply_default_primary True  -elements .

elaborate counter_4bit
set_top_module counter_4bit

source -echo ./constraints.sdc

read_parasitic_tech -tlup $TLUPLUS_MAX_FILE -name earlycap
read_parasitic_tech -tlup $TLUPLUS_MIN_FILE -name latecap
set_parasitics_parameters -early_spec earlycap -late_spec latecap

set_operating_conditions ss0p72v125c


# LINK ###############################################################

link
##link


# OPTIONS ############################################################
##set compile_preserve_subdesign_interfaces true

# CHECK MV ############################################################

# COMPILE #############################################################

set_app_options -name place.coarse.continue_on_missing_scandef -value true
compile_fusion


report_ref_libs
report_design_mismatch -verbose
save_lib

report_timing -max_paths 5000 > timing.rpt
report_qor > qor.rpt
create_por_snapshot -name final_timing
report_area -hierarchy > area.rpt
report_logic_levels > logic_levels.rpt
query_qor_snapshot -name final_timing -output_file timing-filters "logic_level 20"

report_qor_snapshot -name final_timing

exit

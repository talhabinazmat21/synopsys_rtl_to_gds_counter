puts "RM-Info: Running script [info script]\n"

##########################################################################################
# Variables common to all RM scripts
# Script: common_setup.tcl
# Version: F-2011.09-SP4 (April 2, 2012)
# Copyright (C) 2007-2012 Synopsys, Inc. All rights reserved.
##########################################################################################

set DESIGN_NAME                   "counter_4bit"  ;#  The name of the top-level design

## Point to the new 14nm SAED libs
set DESIGN_REF_PATH "/home/icdesign/Desktop/centos_shared/SAED-14"
set DESIGN_REF_PATH1 "/home/icdesign/Desktop/centos_shared/SAED-14"

set DESIGN_REF_TECH_PATH          "/home/icdesign/Desktop/centos_shared/SAED-14/tech"

#set DESIGN_REF_DATA_PATH          ""  ;#  Absolute path prefix variable for library/design data.
                                       #  Use this variable to prefix the common absolute path to 
                                       #  the common variables defined below.
                                       #  Absolute paths are mandatory for hierarchical RM flow.
##########################################################################################
# Hierarchical Flow Design Variables
##########################################################################################

set HIERARCHICAL_DESIGNS           "" ;# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_CELLS             "" ;# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...

##########################################################################################
# Library Setup Variables
##########################################################################################

# For the following variables, use a blank space to separate multiple entries
# Example: set TARGET_LIBRARY_FILES "lib1.db lib2.db lib3.db"

set ADDITIONAL_SEARCH_PATH      " \
        ${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm \
	${DESIGN_REF_PATH}/SAED14nm_EDK_IO_v_06052019/SAED14nm_EDK_IO_v_06052019/SAED14_EDK/lib/io_std/db_nldm "



#multi_voltage
set LINK_LIBRARY_FILES    " \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p72v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p6v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_dlvl_ss0p72v125c_i0p72v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_dlvl_ss0p6v125c_i0p6v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ulvl_ss0p72v125c_i0p72v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ulvl_ss0p6v125c_i0p6v.db "


#multi_voltage
set TARGET_LIBRARY_FILES   "\
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p72v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p6v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_dlvl_ss0p72v125c_i0p72v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_dlvl_ss0p6v125c_i0p6v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ulvl_ss0p72v125c_i0p72v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ulvl_ss0p6v125c_i0p6v.db "



#multi_vt
set LINK_LIBRARY_FILES_MVT    " \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_tt0p8v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p6v125c.db "
  
                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                   
#multi_vt
set TARGET_LIBRARY_FILES_MVT  "\
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_tt0p8v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p6v125c.db "
       
#power_gating
set LINK_LIBRARY_FILES_PG    "* \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_dlvl_ss0p72v125c_i0p72v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_dlvl_ss0p6v125c_i0p6v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_pg_ss0p72v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p72v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ulvl_ss0p72v125c_i0p72v.db "



#power_gating
set TARGET_LIBRARY_FILES_PG    "\
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_dlvl_ss0p72v125c_i0p72v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_dlvl_ss0p6v125c_i0p6v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_pg_ss0p72v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p72v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ulvl_ss0p72v125c_i0p72v.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/sram/logic_synth/single/saed14sram_ss0p72v125c.db "

#clock_gating
set LINK_LIBRARY_FILES_CLG   "* \
${DESIGN_REF_PATH1}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ff0p7v125c.db \
${DESIGN_REF_PATH1}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ff0p88v125c.db \
${DESIGN_REF_PATH1}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p6v125c.db \
${DESIGN_REF_PATH1}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p72v125c.db "



#clock_gating
set TARGET_LIBRARY_FILES_CLG    "\
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ff0p7v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ff0p88v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p6v125c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/db_nldm/saed14rvt_ss0p72v125c.db "



set ADDITIONAL_LINK_LIB_FILES     "" \

set NDM_REFERENCE_LIB_DIRS_MV  " \
	${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/ndm/saed14rvt_frame_only.ndm \
        "

set NDM_REFERENCE_LIB_DIRS_MVT  " \
	${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/ndm/saed14rvt_frame_only.ndm \
        "

set NDM_REFERENCE_LIB_DIRS_PG  " \
	${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/ndm/saed14rvt_frame_only.ndm \
        "


set NDM_REFERENCE_LIB_DIRS  " \
	${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/ndm/saed14rvt_frame_only.ndm \
	"


set NDM_REFERENCE_LIB_DIRS_CLG  " \
	 ${DESIGN_REF_PATH}/SAED14nm_EDK_CORE_RVT_v_062020/stdcell_rvt/ndm/saed14rvt_frame_only.ndm \
        "
	
set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the MW ref libs

set TECH_FILE                     "${DESIGN_REF_PATH}/tech/milkyway/saed14nm_1p9m_mw.tf"  ;#  Milkyway technology file
set MAP_FILE                      "${DESIGN_REF_PATH}/tech/star_rc/saed14nm_tf_itf_tluplus.map"  ;#  Mapping file for TLUplus
set TLUPLUS_MAX_FILE              "${DESIGN_REF_PATH}/tech/star_rc/max/saed14nm_1p9m_Cmax.tluplus"  ;#  Max TLUplus file
set TLUPLUS_MIN_FILE              "${DESIGN_REF_PATH}/tech/star_rc/min/saed14nm_1p9m_Cmin.tluplus"  ;#  Min TLUplus file
set GDS_MAP_FILE          	  "${DESIGN_REF_PATH}/tech/milkyway/saed14nm_1p9m_gdsout_mw.map"
set STD_CELL_GDS                  " \
				${DESIGN_REF_PATH}/lib/stdcell_rvt/gds/saed14rvt.gds \
				"
set NDM_POWER_NET                "VDD" ;#
set NDM_POWER_PORT               "VDD" ;#
set NDM_GROUND_NET               "VSS" ;#
set NDM_GROUND_PORT              "VSS" ;#

set MIN_ROUTING_LAYER            "M2"   ;# Min routing layer
set MAX_ROUTING_LAYER            "M8"   ;# Max routing layer

##RH variable for ICC SAED library and design input data
#set ICC_INPUT_DATA "/global/scratch/mculver/PD_fest_2012/initial_design/dhm"

set LIBRARY_DONT_USE_FILE        "../../DATA_SAED/use_tie.tcl"   ;# Tcl file with library modifications for dont_use

##########################################################################################
# Multi-Voltage Common Variables
#
# Define the following MV common variables for the RM scripts for multi-voltage flows.
# Use as few or as many of the following definitions as needed by your design.
##########################################################################################

set PD1                          ""           ;# Name of power domain/voltage area  1
set PD1_CELLS                    ""           ;# Instances to include in power domain/voltage area 1
set VA1_COORDINATES              {}           ;# Coordinates for voltage area 1
set NDM_POWER_NET1                "VDD1"       ;# Power net for voltage area 1
set NDM_POWER_PORT1               "VDD"        ;# Power port for voltage area 1

set PD2                          ""           ;# Name of power domain/voltage area  2
set PD2_CELLS                    ""           ;# Instances to include in power domain/voltage area 2
set VA2_COORDINATES              {}           ;# Coordinates for voltage area 2
set NDM_POWER_NET2                "VDD2"       ;# Power net for voltage area 2
set NDM_POWER_PORT2               "VDD"        ;# Power port for voltage area 2

set PD3                          ""           ;# Name of power domain/voltage area  3
set PD3_CELLS                    ""           ;# Instances to include in power domain/voltage area 3
set VA3_COORDINATES              {}           ;# Coordinates for voltage area 3
set NDM_POWER_NET3                "VDD3"       ;# Power net for voltage area 3
set NDM_POWER_PORT3               "VDD"        ;# Power port for voltage area 3

set PD4                          ""           ;# Name of power domain/voltage area  4
set PD4_CELLS                    ""           ;# Instances to include in power domain/voltage area 4
set VA4_COORDINATES              {}           ;# Coordinates for voltage area 4
set NDM_POWER_NET4                "VDD4"       ;# Power net for voltage area 4
set NDM_POWER_PORT4               "VDD"        ;# Power port for voltage area 4

puts "RM-Info: Completed script [info script]\n"



 

#### Template Script for RTL->Gate-Level Flow (generated from GENUS 17.10-p007_1) 
set DESIGN darkriscv
set GEN_EFF medium
set MAP_OPT_EFF high

#set DATE [clock format [clock seconds] -format "%b%d-%T"] 
set _OUTPUTS_PATH outputs
set _REPORTS_PATH reports
set _LOG_PATH logs
##set ET_WORKDIR <ET work directory>
#set_db / .init_lib_search_path  {. ./LIB}
##set_db / .script_search_path {. <path>} 
#set_db / .init_hdl_search_path  {. ./RTL}
##Uncomment and specify machine names to enable super-threading.
#set_db / .super_thread_servers {localhost} 
set_db max_cpus_per_server 0
set_db auto_super_thread false
set_db super_thread_servers {}
##For design size of 1.5M - 5M gates, use 8 to 16 CPUs. For designs > 5M gates, use 16 to 32 CPUs
#set_db / .max_cpus_per_server 1

##Default undriven/unconnected setting is 'none'.  
##set_db / .hdl_unconnected_input_port_value 0 | 1 | x | none 
##set_db / .hdl_undriven_output_port_value   0 | 1 | x | none
##set_db / .hdl_undriven_signal_value        0 | 1 | x | none 


##set_db / .wireload_mode <value> 
set_db / .information_level 7 

###############################################################
## Library setup
###############################################################

#read_lib {./LIB/CNT_CDF_3.0_nldm.lib}
cd ./LIB
set libfiles [glob *.lib*]
set_db / .library $libfiles
cd ..

## PLE
#read_physical -lef { ./BasicLEF/tech.lef }
#set leffiles [glob -nocomplain -directory  ./LEF *.lef*]
#set BasicLEF "./BasicLEF/tech.lef "
#set BasicLEF [glob -nocomplain -directory  ./BasicLEF *.lef*]
#set str "${BasicLEF} ${leffiles}"
#puts $str
#pwd
#set_db / .lef_library $str
#set_db / .lef_library $leffiles
 
## Provide either cap_table_file or the qrc_tech_file
##set_db / .cap_table_file <file> 
#set_db / .qrc_tech_file <file>

##set_db / .lp_insert_clock_gating true 

####################################################################
## Load Design
####################################################################

cd ./RTL
set RTLfiles [glob *.v*]
read_hdl $RTLfiles
cd ..
#read_hdl ./RTL/adder_1bit.v
elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration


check_design
check_design -unresolved

####################################################################
## Constraints Setup
####################################################################
cd ./SDC
set SDCfiles [glob *.sdc*]
read_sdc $SDCfiles
cd ..
#read_sdc ./SDC/adder_1bit.sdc
puts "The number of exceptions is [llength [vfind "design:$DESIGN" -exception *]]"

#set_db "design:$DESIGN" .force_wireload <wireload name> 

if {![file exists ${_LOG_PATH}]} {
  file mkdir ${_LOG_PATH}
  puts "Creating directory ${_LOG_PATH}"
}


if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
}


#### To turn off sequential merging on the design 
#### uncomment & use the following attributes.
##set_db / .optimize_merge_flops false 
##set_db / .optimize_merge_latches false 
#### For a particular instance use attribute 'optimize_merge_seqs' to turn off sequential merging. 



####################################################################################################
## Synthesizing to generic 
####################################################################################################
#set_db allow_invalid_primary_power_pins_libcell true
set_db / .syn_generic_effort $GEN_EFF
syn_generic
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
report_dp > $_REPORTS_PATH/generic/${DESIGN}_datapath.rpt
write_snapshot -outdir $_REPORTS_PATH -tag generic
report_summary -directory $_REPORTS_PATH





####################################################################################################
## Synthesizing to gates
####################################################################################################


set_db / .syn_map_effort $MAP_OPT_EFF
syn_map
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED
write_snapshot -outdir $_REPORTS_PATH -tag map
report_summary -directory $_REPORTS_PATH
report_dp > $_REPORTS_PATH/map/${DESIGN}_datapath.rpt



write_do_lec -revised_design fv_map -logfile ${_LOG_PATH}/rtl2intermediate.lec.log > ${_OUTPUTS_PATH}/rtl2intermediate.lec.do

## ungroup -threshold <value>

#######################################################################################################
## Optimize Netlist
#######################################################################################################

## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
##set_db / .remove_assigns true 
##set_remove_assign_options -buffer_or_inverter <libcell> -design <design|subdesign> 
##set_db / .use_tiehilo_for_const <none|duplicate|unique> 
set_db / .syn_opt_effort $MAP_OPT_EFF
syn_opt
write_snapshot -outdir $_REPORTS_PATH -tag syn_opt
report_summary -directory $_REPORTS_PATH

puts "Runtime & Memory after 'syn_opt'"
time_info OPT




write_snapshot -outdir $_REPORTS_PATH -tag final
report_summary -directory $_REPORTS_PATH
write_hdl  > ${_OUTPUTS_PATH}/${DESIGN}_m.v
## write_script > ${_OUTPUTS_PATH}/${DESIGN}_m.script
write_sdc > ${_OUTPUTS_PATH}/${DESIGN}_m.sdc


#################################
### write_do_lec
#################################


write_do_lec -golden_design fv_map -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile  ${_LOG_PATH}/intermediate2final.lec.log > ${_OUTPUTS_PATH}/intermediate2final.lec.do
##Uncomment if the RTL is to be compared with the final netlist..
write_do_lec -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile ${_LOG_PATH}/rtl2final.lec.log > ${_OUTPUTS_PATH}/rtl2final.lec.do

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

#file copy [get_db / .stdout_log] ${_LOG_PATH}
report qor
report_power
quit

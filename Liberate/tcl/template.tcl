#$Id$

set_vdd -type primary VDD $VDD
set_gnd -type primary VSS 0
#set_gnd -no_model     GND 0

set_var slew_lower_rise 0.2
set_var slew_lower_fall 0.2
set_var slew_upper_rise 0.8
set_var slew_upper_fall 0.8

set_var measure_slew_lower_rise 0.2
set_var measure_slew_lower_fall 0.2
set_var measure_slew_upper_rise 0.8
set_var measure_slew_upper_fall 0.8

set_var delay_inp_rise 0.5
set_var delay_inp_fall 0.5
set_var delay_out_rise 0.5
set_var delay_out_fall 0.5

set_var def_arc_msg_level 0
set_var process_match_pins_to_ports 1
set_var sim_duration 1e-5
#set_var min_transition 6e-12
set_var max_transition 3e-7
#set_var min_output_cap 1e-16

### Define templates - slew (0-100%) min,max=10ps,500ps
define_template -type delay      -index_1 {1 100 } -index_2 {0.0001 0.3 } delay_template
define_template -type power      -index_1 {1 100 } -index_2 {0.0001 0.3 } power_template
define_template -type constraint -index_1 {1 100 } -index_2 {1 100 } const_template


set cells { XOR2X1 XOR2X2 XNOR2X1 XNOR2X2 OR3X1 OR2X1 OR2X2 OR2X4 OAI22X1 
OAI222X1 OAI221X1 OAI21X1 NOR3X1 NOR2X1 NOR2X2 NOR2X4 NAND3X1 NAND2X1 
NAND2X2 NAND2X4 MX4X1 MX4X2 MX2X1 MX2X2 INVX1 INVX2 INVX4 INVX8 INVX16 INVX32 
DFFRX1 DFFRX2 DFFQX1 DFFQX2 BUFX1 BUFX2 BUFX4 BUFX8 BUFX16 BUFX32 
AOI22X1 AOI222X1 AOI221X1 AOI21X1 AND3X1 AND2X1 AND2X2 AND2X4 ADDHX1 ADDFX1  }

### Define related supply for all cells and pins
set_pin_vdd -supply_name VDD $cells {*}
set_pin_gnd -supply_name VSS $cells {*}

set cell XOR2X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist { A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell XOR2X2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist { A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell XNOR2X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist { A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell XNOR2X2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist { A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell OR3X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B C } \
       -output { Y } \
       -pinlist { A B C Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell OR2X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist { A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell OR2X2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist { A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell OR2X4
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist { A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell OAI22X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A0 A1 B0 B1 } \
       -output { Y } \
       -pinlist { A0 A1 B0 B1 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell OAI222X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A0 A1 B0 B1 C0 C1  } \
       -output { Y } \
       -pinlist { A0 A1 B0 B1 C0 C1 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell OAI221X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A0 A1 B0 B1 C0 } \
       -output { Y } \
       -pinlist { A0 A1 B0 B1 C0 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell OAI21X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A0 A1 B0 } \
       -output { Y } \
       -pinlist { A0 A1 B0  Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell NOR3X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B C } \
       -output { Y } \
       -pinlist {  A B C Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell NOR2X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist {  A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell NOR2X2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist {  A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell NOR2X4
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist {  A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell NAND3X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B C} \
       -output { Y } \
       -pinlist {  A B C Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell NAND2X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist {  A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell NAND2X2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist {  A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell NAND2X4
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B } \
       -output { Y } \
       -pinlist {  A B Y } \
       -delay delay_template \
       -power power_template \
       $cell
}


set cell MX4X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B C D S0 S1  } \
       -output { Y } \
       -pinlist {  A B C D S0 S1  Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell MX4X2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B C D S0 S1  } \
       -output { Y } \
       -pinlist {  A B C D S0 S1  Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell MX2X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B S0 } \
       -output { Y } \
       -pinlist {  A B S0 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell MX2X2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B S0 } \
       -output { Y } \
       -pinlist {  A B S0 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}


set cell INVX1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell INVX2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell INVX4
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell INVX8
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell INVX16
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell INVX32
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}


set cell DFFQX1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -clock { CK } \
       -input { D } \
       -output { Q } \
       -pinlist { CK D Q} \
       -delay delay_template \
       -power power_template \
       -constraint const_template \
       $cell
}

set cell DFFQX2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -clock { CK } \
       -input { D } \
       -output { Q } \
       -pinlist { CK D Q} \
       -delay delay_template \
       -power power_template \
       -constraint const_template \
       $cell
}

set cell DFFRX1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -clock { CK } \
       -async { RN } \
       -input { D } \
       -output { Q QN} \
       -pinlist { CK D RN  Q QN} \
       -delay delay_template \
       -power power_template \
       -constraint const_template \
       $cell
}

set cell DFFRX2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -clock { CK } \
       -async { RN } \
       -input { D } \
       -output { Q QN} \
       -pinlist { CK D RN  Q QN} \
       -delay delay_template \
       -power power_template \
       -constraint const_template \
       $cell
}


set cell BUFX1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell BUFX2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell BUFX4
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell BUFX8
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell BUFX16
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell BUFX32
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A  } \
       -output { Y } \
       -pinlist {  A Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell AOI22X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A0 A1 B0 B1  } \
       -output { Y } \
       -pinlist {  A0 A1 B0 B1 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell AOI222X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A0 A1 B0 B1 C0 C1 } \
       -output { Y } \
       -pinlist {  A0 A1 B0 B1 C0 C1 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell AOI221X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A0 A1 B0 B1 C0  } \
       -output { Y } \
       -pinlist {  A0 A1 B0 B1 C0 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell AOI21X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A0 A1 B0 } \
       -output { Y } \
       -pinlist {  A0 A1 B0 Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell AND3X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B C } \
       -output { Y } \
       -pinlist { A B C Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell AND2X1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B  } \
       -output { Y } \
       -pinlist { A B  Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell AND2X2
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B  } \
       -output { Y } \
       -pinlist { A B  Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell AND2X4
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B  } \
       -output { Y } \
       -pinlist { A B  Y } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell ADDHX1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B  } \
       -output { S CO } \
       -pinlist { A B S CO } \
       -delay delay_template \
       -power power_template \
       $cell
}

set cell ADDFX1
if {[ALAPI_active_cell $cell]} {
    define_cell \
       -input { A B CI } \
       -output { S CO } \
       -pinlist { A B CI S CO } \
       -delay delay_template \
       -power power_template \
       $cell
}



# set cell SDFFQX1
# if {[ALAPI_active_cell $cell]} {
    # define_cell \
       # -clock { CK } \
       # -input { D SE SI } \
       # -output { Q } \
       # -pinlist { CK D SE SI Q } \
       # -delay delay_template \
       # -power power_template \
       # -constraint const_template \
       # $cell
# }

# set cell SDFFSRHQX1
# if {[ALAPI_active_cell $cell]} {
# define_cell \
       # -clock { CK } \
       # -async { RN SN } \
       # -input { D SE SI } \
       # -output { Q } \
       # -pinlist { CK D RN SE SI SN Q } \
       # -delay delay_template \
       # -power power_template \
       # -constraint const_template \
       # $cell
# }

# set cell TLATQX1
# if {[ALAPI_active_cell $cell]} {
    # define_cell \
       # -clock { G } \
       # -input { D } \
       # -output { Q } \
       # -pinlist { D G Q } \
       # -delay delay_template \
       # -power power_template \
       # -constraint const_template \
       # $cell
# }

# set cell TLATSRX1
# if {[ALAPI_active_cell $cell]} {
    # define_cell \
       # -clock { G } \
       # -async { RN SN } \
       # -input { D } \
       # -output { Q QN } \
       # -pinlist { D G RN SN Q QN } \
       # -delay delay_template \
       # -power power_template \
       # -constraint const_template \
       # $cell
# }

# set cell XOR2X1
# if {[ALAPI_active_cell $cell]} {
    # define_cell \
       # -input { A B } \
       # -output { Y } \
       # -pinlist { A B Y } \
       # -delay delay_template \
       # -power power_template \
       # $cell
# }

# set cell DFF2QX1
# if {[ALAPI_active_cell $cell]} {
    # define_cell \
        # -clock { CK } \
        # -input { D1 D2 } \
        # -output { Q1 Q2 } \
        # -pinlist { D1 D2 CK Q1 Q2 } \
        # -delay delay_template \
        # -power power_template \
        # -constraint const_template \
        # $cell

    # define_bundle_pins $cell D  {D1 D2}
    # define_bundle_pins $cell Q  {Q1 Q2}
    # ## probe all outputs for common pin constraint and mpw arcs
    # # set_constraint_criteria -cells $cell -pin CK -probe {Q1 Q2} ;
    
    # # define_bundle_pins -use_pin D1  $cell D
    # # define_bundle_pins -use_pin Q1  $cell Q
# }

# set cell SPDFF2RQX1
# if {[ALAPI_active_cell $cell]} {
    # define_cell \
	# -clock { CK } \
	# -async { RN } \
	# -input { D1 D2 SE SI1 SI2 } \
	# -output { Q1 Q2 } \
	# -pinlist { D1 D2 SE SI1 SI2 RN CK Q1 Q2 } \
	# -delay delay_template \
	# -power power_template \
	# -constraint const_template \
	# $cell

    # define_bundle_pins $cell D  {D1 D2}
    # define_bundle_pins $cell SI {SI1 SI2}
    # define_bundle_pins $cell Q  {Q1 Q2}
    # ## probe all outputs for common pin constraint and mpw arcs
    # # set_constraint_criteria -cells $cell -pin CK -probe {Q1 Q2} ;
    # # set_constraint_criteria -cells $cell -pin RN -probe {Q1 Q2} ;
    # # set_constraint_criteria -cells $cell -pin SE -probe {Q1 Q2} ;
    
    # # define_bundle_pins -use_pin D1  $cell D  {D1 D2}
    # # define_bundle_pins -use_pin SI1 $cell D  {SI1 SI2}
    # # define_bundle_pins -use_pin Q1  $cell Q  {Q1 Q2}
# }

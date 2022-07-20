set sdc_version 1.4


# Set the current design
current_design s1423

set_units -time 1ns
set_units -capacitance 1pF


create_clock -name "CLK" -add -period 1000 [get_ports blif_clk_net]

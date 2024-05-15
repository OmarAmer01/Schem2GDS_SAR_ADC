#################################################
# * Constraints Script.
# * Date 5/2/24
# * Author Omar T. Amer
#################################################

set TARGET_LIB_MAX_FILENAME "saed90nm_max_htm_lvt"
set TARGET_LIB_MIN_FILENAME "saed90nm_min_ltl_lvt" 

# Set parameters
set PERIOD [expr 1/1.1]

# Create the clock
create_clock -name i_clk [get_ports intf.i_clk] -period $PERIOD

# Input delay
set_input_delay [expr 0.2 * $PERIOD] -clock [get_clocks i_clk] {intf.i_start intf.i_comp}

# Output delay
set_output_delay [expr 0.2 * $PERIOD] -clock [get_clocks i_clk] [all_outputs]



# Clock parameters
set_clock_uncertainty  [expr 0.1 * $PERIOD] [get_clocks]
set_clock_latency      [expr 0.2 * $PERIOD]  [get_clocks i_clk]


# Wire load model
set_wire_load_model -name "8000" -library $TARGET_LIB_MAX_FILENAME
set_wire_load_mode enclosed

# Driving cell
set_driving_cell -no_design_rule -max -lib_cell TNBUFFX1_LVT {intf.i_start intf.i_comp}

# MCMM
set_operating_conditions -min_library $TARGET_LIB_MIN_FILENAME -min BEST  -max_library $TARGET_LIB_MAX_FILENAME -max WORST

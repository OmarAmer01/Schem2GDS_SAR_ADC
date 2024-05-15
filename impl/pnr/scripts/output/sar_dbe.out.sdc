################################################################################
#
# Design name:  routing
#
# Created by icc2 write_sdc on Tue May 14 14:20:25 2024
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


# Mode: default
# Corner: default
# Scenario: default

# /home/vlsi/Desktop/asic_final/impl/synth/cons_ICC2.sdc, line 14; \
#   /home/vlsi/Desktop/asic_final/impl/synth/cons_ICC2.sdc, line 26
create_clock -name i_clk -period 0.909091 -waveform {0 0.454545} [get_ports \
    {intf_i_clk}]
set_propagated_clock [get_clocks {i_clk}]
set_operating_conditions -analysis_type on_chip_variation -max WORST -min BEST \
    -max_library saed90nm_max_htm_lvt -min_library saed90nm_min_ltl_lvt
# Warning: Libcell power domain derates are skipped!

# Set latency for io paths.
# -origin user
set_clock_latency -min 0.0340811 [get_clocks {i_clk}]
# -origin user
set_clock_latency -max 0.0316345 [get_clocks {i_clk}]
# Set propagated on clock sources to avoid removing latency for IO paths.
set_propagated_clock  [get_ports {intf_i_clk}]
set_clock_uncertainty 0.0909091 [get_clocks {i_clk}]
# /run/media/vlsi/MALAK_AHMED/the final \
#   inshallah/asic_final/impl/pnr/scripts/CTS.tcl, line 46
set_driving_cell -lib_cell NBUFFX4_LVT -max -library \
    saed90nm_max_htm_lvt.db:saed90nm_max_htm_lvt [get_ports {intf_i_clk}]
set_driving_cell -lib_cell NBUFFX4_LVT -min -library \
    saed90nm_min_ltl_lvt.db:saed90nm_min_ltl_lvt [get_ports {intf_i_clk}]
# /home/vlsi/Desktop/asic_final/impl/synth/cons_ICC2.sdc, line 34
set_driving_cell -lib_cell TNBUFFX1_LVT -no_design_rule -max -library \
    saed90nm_max_htm_lvt.db:saed90nm_max_htm_lvt [get_ports {intf_i_start}]
# /home/vlsi/Desktop/asic_final/impl/synth/cons_ICC2.sdc, line 34
set_driving_cell -lib_cell TNBUFFX1_LVT -no_design_rule -max -library \
    saed90nm_max_htm_lvt.db:saed90nm_max_htm_lvt [get_ports {intf_i_comp}]

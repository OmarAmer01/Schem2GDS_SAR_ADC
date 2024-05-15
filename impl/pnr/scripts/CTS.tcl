# CTS

copy_block -from_block SAR_DBE.dlib:placement.design -to_block CTS1
current_block SAR_DBE.dlib:CTS1.design

report_clock_qor -type structure
derive_clock_cell_references -output cts_leg_set.tcl > /dev/null


set CTS_CELLS [get_lib_cells "*/NBUFFX2_LVT */NBUFFX4_LVT */NBUFFX8_LVT "]





#NDR

set CTS_NDR_MIN_ROUTING_LAYER	"M4"
set CTS_NDR_MAX_ROUTING_LAYER	"M5"
set CTS_LEAF_NDR_MIN_ROUTING_LAYER	"M1"
set CTS_LEAF_NDR_MAX_ROUTING_LAYER	"M5"
set CTS_NDR_RULE_NAME 		"cts_w2_s2_vlg"
#set CTS_LEAF_NDR_RULE_NAME	"cts_w1_s2"

create_routing_rule $CTS_NDR_RULE_NAME\
		-default_reference_rule \
		-taper_distance 0.4 \
		-driver_taper_distance 0.4 \
  	 	-widths   {M3 0.16 M4 0.32 M5 0.32} \
  	 	-spacings {M3 0.16 M4 0.32 M5 0.32}
                

set_clock_routing_rules -rules $CTS_NDR_RULE_NAME \
		-min_routing_layer $CTS_NDR_MIN_ROUTING_LAYER \
		-max_routing_layer $CTS_NDR_MAX_ROUTING_LAYER
		
report_routing_rules -verbose

report_clock_routing_rules

#Sink pins will not follows NDRs
set_clock_routing_rules -net_type sink -default_rule -min_routing_layer M1 -max_routing_layer M2

#DRC 
report_ports -verbose [get_ports *clk*]
set_driving_cell -scenarios [all_scenarios] -lib_cell NBUFFX4_LVT [get_ports *clk*]


set_app_options -name time.remove_clock_reconvergence_pessimism -value true
report_clock_settings

#
set_clock_tree_options -target_skew 0.5 -clock [get_clocks *]
set_clock_tree_options -target_latency 0.1  -clock [get_clocks *]

exec mkdir reports
report_timing -max_paths 100 -delay_type min > reports/hold_b4_clkopt.rpt
report_timing -max_paths 100 -delay_type max > reports/setup_b4_clkopt.rpt
report_constraint -all_violators -verbose > reports/viol_b4_clkopt.rpt

clock_opt

report_timing -max_paths 100 -delay_type min > reports/hold_after_clkopt.rpt
report_timing -max_paths 100 -delay_type max > reports/setup_after_clkopt.rpt
report_constraint -all_violators -verbose > reports/viol_after_clkopt.rpt

save_block
start_gui

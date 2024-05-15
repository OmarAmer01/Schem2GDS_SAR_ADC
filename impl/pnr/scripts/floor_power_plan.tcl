open_block SAR_DBE.dlib:sar_dbe_ADC_RESOLUTION10.design


initialize_floorplan -side_ratio {1 1} -core_offset {1}
place_pins -self
create_placement -floorplan


set_block_pin_constraint -self -allowed_layers {M3 M4 M5 M6}

# copy block to a new block to work on it
copy_block -from_block SAR_DBE.dlib:sar_dbe_ADC_RESOLUTION10.design -to_block power_plan
current_block power_plan.design

# remove ignored layer M8
report_ignored_layers
remove_ignored_layers -all -max_routing_layer -min_routing_layer
report_ignored_layers

set_app_option -name plan.pgroute.auto_connect_pg_net -value true


create_net -power VDD
create_net -ground VSS

# hierarchical [include top module + sub modules]
connect_pg_net -net VDD [get_pins -hierarchical "*/VDD"]
connect_pg_net -net VSS [get_pins -hierarchical "*/VSS"]




# P G   R I N G   C R E A T I O N

# create_pg_ring_pattern ring_pattern -horizontal_layer M9    -horizontal_width {1} -horizontal_spacing {1}     -vertical_layer M8 -vertical_width {1}     -vertical_spacing {1}

#set_pg_strategy core_ring -core -pattern \
#    {{pattern: ring_pattern}{nets: {VDD VSS}}{offset: {0.5 0.5}}} \
#    -extension {{stop: innermost_ring}}

#compile_pg -strategies core_ring


# PG MESH CREATION

#create_pg_mesh_pattern pg_mesh1 -layers {{{vertical_layer: M8} {width: 1.12} {spacing: interleaving}         {pitch: 15.36}  {trim: true}}            {{horizontal_layer: M9 } {width: 1.12} {spacing: interleaving}         {pitch: 15.36} {trim: true}}}

create_pg_mesh_pattern pg_mesh1    -parameters {w1 p1 w2 p2 f t}    -layers {{{vertical_layer: M8} {width: @w1} {spacing: interleaving}         {pitch: @p1} {offset: @f} {trim: @t}}            {{horizontal_layer: M9 } {width: @w2} {spacing: interleaving}         {pitch: @p2} {offset: @f} {trim: @t}}}


set_pg_strategy s_mesh1 \
   -pattern {{pattern: pg_mesh1} {nets: {VDD VSS VSS VDD}} \
{offset_start: 2 2} {parameters: 1.5 20 1.5 20 1.5 false}} \
   -core -extension {{stop:design_boundary_and_generate_pin}}

#set_pg_strategy s_mesh1  -core  -pattern {{pattern: pg_mesh1} {nets: {VSS VDD}}}  -extension {{stop:design_boundary_and_generate_pin}}

# S T A N D A R D    C E L L    R A I L    I N S E R T I O N
create_pg_std_cell_conn_pattern     std_cell_rail      -layers {M1}

set_pg_strategy rail_strat -core \
    -pattern {{name: std_cell_rail} {nets: VDD VSS} }
    
compile_pg -strategies rail_strat    
compile_pg -strategies s_mesh1

set_parasitic_parameters -late_spec maxTLU -early_spec maxTLU
analyze_power_plan -voltage 1.3 -power_budget 300 -use_terminals_as_pads -nets VDD


save_block
exit





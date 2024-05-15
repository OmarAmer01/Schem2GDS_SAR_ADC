# put the search path directory of the technology   
set_app_var search_path .
set TECH_FILE astroTechFile.tf

# put the directory of your ndm created from the library manager
set reference_library ../../ndm/saed90nm_m_lvt.ndm

#create design library from technology file & ndm

create_lib -technology $TECH_FILE -ref_libs $reference_library SAR_DBE.dlib

#read gate level netlist output from synthesis
read_verilog /home/vlsi/Desktop/asic_final/impl/synth/sar_dbe.v
#read_ddc /home/vlsi/Desktop/asic_final/impl/synth/sar_dbe.ddc

link_block

set Tech $search_path/Technology_Kit/starrcxt
read_parasitic_tech -layermap tech2itf.map -tlup saed90nm_1p9m_1t_Cmax.tluplus -name maxTLU

read_parasitic_tech -layermap tech2itf.map -tlup saed90nm_1p9m_1t_Cmin.tluplus  -name minTLU

set TARGET_LIB_MAX_FILENAME "saed90nm_max_htm_lvt"
set TARGET_LIB_MIN_FILENAME "saed90nm_min_ltl_lvt" 

#put the sdc file output from synthesis
read_sdc ../../synth/cons_ICC2.sdc

get_site_defs

set_attribute [get_site_defs unit] symmetry y

set_attribute [get_layers {M1 M3 M5 M7 M9} ] routing_direction horizontal

set_attribute [get_layers {M2 M4 M6 M8 } ] routing_direction vertical

get_attribute [get_layers M7] routing_direction

report_ignored_layers

set_ignored_layers -max_routing_layer M8

report_ignored_layers
save_block
report_clocks
exit







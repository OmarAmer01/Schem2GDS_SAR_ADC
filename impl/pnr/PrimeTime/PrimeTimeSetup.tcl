# Prime Time Setup
# Change the directories acc. to your project loaction

set Design_name sar_dbe

#set search_path /eda/synopsys/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/
set search_path ../../synth/models/

set target_library_max saed90nm_max_htm_lvt.db
set target_library_min saed90nm_min_ltl_lvt.db

set link_path "* $target_library_max $target_library_min"

set Netlist_files  ../scripts/output/sar_dbe_for_pt_v.v

set SPEF_files     {../scripts/output/sar_dbe.out.spef.maxTLU_-40.spef ../scripts/output/sar_dbe.out.spef.minTLU_125.spef}

set constrains_file ../scripts/output/sar_dbe.out.sdc



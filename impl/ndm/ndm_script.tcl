# TECHNOLOGY FILE
start_gui

set TECH_FILE /eda/synopsys/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/process/astro/tech/astroTechFile.tf
#set TECH_FILE //eda/synopsys/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm/Technology_Kit/techfiles/saed90nm_1p9m_cd.tf

set DB_FILE /eda/synopsys/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/saed90nm_max_htm_lvt.db
set DB_FILE_MIN /eda/synopsys/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/saed90nm_min_ltl_lvt.db

set_app_options -list {lib.workspace.save_design_views {true}}
set_app_options -list {lib.workspace.keep_all_physical_cells {true}}
set_app_options -list {design.enable_lib_cell_editing {mutable}}
set_app_options -list {lib.workspace.save_layout_views {true}}

create_workspace -flow exploration -technology $TECH_FILE ASIC_SAR_FINAL


# Ya rab

read_lef /home/vlsi/Desktop/asic_final/impl/ndm/saed90nm_lvt.lef
read_db $DB_FILE
read_db $DB_FILE_MIN
group_libs
process_workspaces  -directory /home/vlsi/Desktop/asic_final/impl/ndm


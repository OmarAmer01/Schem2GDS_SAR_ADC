#################################################
# * Synthesis Script.
# * Date 4/27/24
# * Author Omar T. Amer
#################################################

# Gotta go fast
set_host_options -max_cores 4

###### The pads add crazy delay, so we kept the old logs before pad insertion but we forgot to save a copy of the old script.

####### SET FILE PATHS
set MAX_PAD_LIB "/eda/synopsys/SAED90_EDK/SAED_EDK90nm_IO/IO_Standard_Cell_Library/synopsys/models/saed90nm_io_max.db"
set MIN_PAD_LIB "/eda/synopsys/SAED90_EDK/SAED_EDK90nm_IO/IO_Standard_Cell_Library/synopsys/models/saed90nm_io_min.db"

set TARGET_LIB_PATH "/eda/synopsys/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/"
set REPORT_DIR "./reports"

###### SET FILE NAMES
set TARGET_LIB_MIN_FILENAME "saed90nm_min_ltl_lvt"
set TARGET_LIB_MAX_FILENAME "saed90nm_max_htm_lvt"

set TARGET_LIB_MIN "$TARGET_LIB_MIN_FILENAME.db"
set TARGET_LIB_MAX "$TARGET_LIB_MAX_FILENAME.db"


##### Set things up...
set TOP_MODULE  "sar_dbe"
set ADC_RESOLUTION 10

# Set the search path
set_app_var search_path "$TARGET_LIB_PATH"

# Set target and link libraries
## Standard Cell libraries
set target_library [list $TARGET_LIB_MAX]

## Standard Cell & Hard Macros libraries
set link_library [list * $TARGET_LIB_MAX $MAX_PAD_LIB]

# MCMM
set_min_library $TARGET_LIB_MAX -min_version $TARGET_LIB_MIN
set_min_library $MAX_PAD_LIB -min_version $MIN_PAD_LIB
list_libs

# Read Design Files
set DESIGN_FILE_LIST [open syn_filelist.f "r"]
set DESIGN_FILE_GLOBS [list]

while {[gets $DESIGN_FILE_LIST file] != -1} {
    lappend DESIGN_FILE_GLOBS $file
}
# Close the file
close $DESIGN_FILE_LIST

set DESIGN_FILES [list]

foreach file_glob $DESIGN_FILE_GLOBS {
    set matches [glob ../../$file_glob]
    foreach match $matches {
        lappend DESIGN_FILES $match
        puts $DESIGN_FILES
    }
}

read_file $DESIGN_FILES -autoread -top $TOP_MODULE -format sverilog -param ADC_RESOLUTION=>$ADC_RESOLUTION

list_designs
check_design

# Get constraints
source ./cons.sdc


uniquify
#compile -map_effort high -boundary_optimization -retime
compile_ultra

define_name_rules no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri true
set verilogout_equation false


write_file -format verilog -output $TOP_MODULE.v
write_file -hierarchy -format ddc -output $TOP_MODULE.ddc

# Reporting...
report_area > $REPORT_DIR/area.rpt
report_cell > $REPORT_DIR/cell.rpt
report_clock > $REPORT_DIR/clock.rpt
report_design > $REPORT_DIR/design.rpt
report_hierarchy > $REPORT_DIR/hierarchy.rpt
report_power > $REPORT_DIR/pwr.rpr
report_qor > $REPORT_DIR/qor.rpt
report_timing -max_paths 100 -delay_type min > $REPORT_DIR/hold.rpt
report_timing -max_paths 100 -delay_type max > $REPORT_DIR/setup.rpt
report_constraint -all_violators -verbose > $REPORT_DIR/viol.rpt

exit

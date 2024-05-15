# Formality Script
# (B O N U S)

set_svf ../synth/default.svf


# Read FILES
# Read Design Files
set DESIGN_FILE_LIST [open ../synth/syn_filelist.f "r"]
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

read_sverilog -r $DESIGN_FILES
set_top r:/WORK/sar_dbe 


read_verilog -container i -libname WORK -05 { ../synth/sar_dbe.v } 
read_db {/eda/synopsys/SAED90nm_EDK_10072017/saed90nm_max_htm_lvt.db} 
set_top i:/WORK/sar_dbe_ADC_RESOLUTION10 

start_gui
match
verify

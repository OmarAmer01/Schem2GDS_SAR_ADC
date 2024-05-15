new_project spyglass-1 -force
set_option enableSV yesset_option enableSV yesset_option enableSV yesset_option enableSV yesset_option enableSV yes
read_file -type verilog {../../hdl/custom_sar_reg.sv ../../hdl/sar_dbe.sv ../../hdl/set_propagator.sv ../../intf/dbe_if.sv}
current_goal Design_Read -alltop
gui_start

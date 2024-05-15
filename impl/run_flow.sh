# Run the whole ASIC flow on our SAR Digital Backend.

# Synthesis
cd synth
dc_shell -f synth.tcl | tee reports/dc_log.log

# Floorplanning, Powerplanning, CTS, Placement, and Routing
cd ../pnr
./compile_ic.sh


# Launch PrimeTime
cd PrimeTime
pt_shell -f PrimeTime.tcl 

# Return to root.
cd ../..




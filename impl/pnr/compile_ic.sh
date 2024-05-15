# Run the ICC2 Flow and keep logs.

# Clean UP
rm -rf SAR_DBE.dlib
rm -rf *.txt
rm -rf *.svf
rm -rf *.log
rm -rf logs/*
rm -rf work_dir
rm -rf outputs/*
rm -rf legalizer_debug_plots
rm -rf reports

# Log directory
mkdir logs

# 1. Set things up.
icc2_shell -file ./scripts/setup.tcl | tee ./logs/setup_log.log

# 2. Floor and power planning
icc2_shell -file ./scripts/floor_power_plan.tcl | tee ./logs/floor_power.log

# 3. Placement
icc2_shell -file ./scripts/placement.tcl | tee ./logs/place.log

# 4. CTS
icc2_shell -file ./scripts/CTS.tcl | tee ./logs/CTS.log

# 5. Routing
icc2_shell -file ./scripts/routing.tcl | tee ./logs/route.log




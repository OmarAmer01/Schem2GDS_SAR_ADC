log * -r

add wave -position end -group "DBE" sim:/sar_top_tb/dbe_if/i_rstn
add wave -position end -group "DBE" sim:/sar_top_tb/dbe_if/i_clk
add wave -position end -group "DBE" sim:/sar_top_tb/dbe_if/i_comp
add wave -position end -group "DBE" sim:/sar_top_tb/dbe_if/i_start
add wave -position end -group "DBE" -radix unsigned sim:/sar_top_tb/dbe_if/o_a2d
add wave -position end -group "DBE" sim:/sar_top_tb/dbe_if/o_eoc

add wave -position end -group "AFE" sim:/sar_top_tb/afe_if/i_dac_out
add wave -position end -group "AFE" sim:/sar_top_tb/afe_if/o_comp
add wave -position end -group "AFE" sim:/sar_top_tb/afe_if/v_ref
add wave -position end -group "AFE" sim:/sar_top_tb/afe_if/i_vin




config wave -signalnamewidth 1
coverage save -onexit cov_db.ucdb
run -all
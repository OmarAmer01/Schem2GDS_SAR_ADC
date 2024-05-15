/*
==============================================
* SAR ADC Digital Controller

    Performs successive approximation based on
    analog readings.

*   Date: 5/9/24
==============================================
*/

module sar_dbe #(
    parameter int ADC_RESOLUTION=10
) (
    dbe_if.dut intf
);

  logic [ADC_RESOLUTION:0] setn_array;
  custom_sar_reg #(ADC_RESOLUTION) U_ctrl_logic (
      .i_comp(intf.i_comp),
      .i_setn(setn_array),
      .i_rstn(intf.i_start),
      .o_a2d (intf.o_a2d),
      .dummy_ground(1'b0) // Really, yes.
  );

  logic [ADC_RESOLUTION:0] set_propagator_out;

  // Hmmm we need DC to use QN of the FF instead of an inverter.
  // God willing it is smart enough.
  assign intf.o_eoc = ~set_propagator_out[0];
  set_propagator#(ADC_RESOLUTION) u_SET_PROP (
      .i_clk(intf.i_clk),
      .i_load_half(intf.i_start),
      .d(1'b0),
      .q(set_propagator_out),
      .q_bar(setn_array)
  );

endmodule

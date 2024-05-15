/*
==========================================
* SET Signal Propagator

This is to propagate the set signal to the
bottom special register.

* Date: 5/9/24
==========================================
*/

module set_propagator #(
    parameter int ADC_RESOLUTION=10
) (
    input i_clk,
    input i_load_half,  // Load 10'b1_000000000
    input d,  // Set to zero. Hardwired.
    output logic [ADC_RESOLUTION:0] q,  // We output this so the synthesis tool doesnt cry
    output logic [ADC_RESOLUTION:0] q_bar // Our golden boy we actually need this output to control
    // the set of the bottom register which has active low set amazing pdk really thanks synopsys

    // And yes. The width should be one greater than the resolution.
);

assign q_bar = ~q;

always_ff @(posedge i_clk, negedge i_load_half) begin
  if (~i_load_half) q <= {1'b1, {(ADC_RESOLUTION) {1'b0}}};
  else q <= {d, q[ADC_RESOLUTION:1]};
end


endmodule

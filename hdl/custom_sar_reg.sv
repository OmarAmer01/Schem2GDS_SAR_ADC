/*
==========================================
* SAR Logic
              (As seen in)
  (An ultralow-energy ADC for Smart Dust)

* Date: 5/9/24
==========================================
*/

module custom_sar_reg #(
    parameter int ADC_RESOLUTION=10
) (
    input i_comp,
    input [ADC_RESOLUTION:0] i_setn,
    input i_rstn,
    output [ADC_RESOLUTION-1:0] o_a2d,
    input dummy_ground // Because DC cant deal with posedge 0
);

  logic [ADC_RESOLUTION:0] sar_reg_out;

  // Start from 1 becuase the 0th reg is special ❤️
  for (genvar i = 1; i <= ADC_RESOLUTION; i++) begin : gen_custom_reg
    always_ff @(posedge sar_reg_out[i-1], negedge i_setn[i], negedge i_rstn) begin
      if (~i_setn[i]) sar_reg_out[i] <= 1'b1;
      else if (~i_rstn) sar_reg_out[i] <= 1'b0;
      else sar_reg_out[i] <= i_comp;
    end
  end

  assign o_a2d = sar_reg_out[ADC_RESOLUTION:1];

  always_ff @(posedge dummy_ground, negedge i_rstn, negedge i_setn[0]) begin
    if (~i_setn[0]) sar_reg_out[0] <= 1'b1;
    else if (~i_rstn) sar_reg_out[0] <= 1'b0;
    else sar_reg_out[0] <= 1'b0;
  end

endmodule

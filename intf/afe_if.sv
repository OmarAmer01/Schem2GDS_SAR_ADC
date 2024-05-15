/*
==============================================
* SAR ADC Analog Frontend Interface

Simulation model for the AFE.
Returns the comparison signal of the opamp

                |**
VIN   ----- (+) |       **
                |    OPAMP    ** --- comp
V_DAC ----- (-) |       **
                | **


*   Date: 4/25/24
==============================================
*/


interface afe_if#(parameter int ADC_RESOLUTION) (
    input logic i_clk
);
  real i_vin, v_ref;
  logic [ADC_RESOLUTION-1:0] i_dac_out;
  logic o_comp;

  clocking mon_cb @(posedge i_clk);
    default input #1step output negedge;
    input i_vin, v_ref, i_dac_out, o_comp;
  endclocking

  clocking drv_cb @(posedge i_clk);
    default input #1step output negedge;
    output i_vin, v_ref, i_dac_out;
  endclocking

endinterface

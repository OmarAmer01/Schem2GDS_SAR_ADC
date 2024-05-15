/*
==============================================
* SAR ADC Analog Frontend

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
import tst_config_pkg::ADC_RESOLUTION;
module sar_afe (
    afe_if intf
);
  assign intf.o_comp = intf.v_ref * (intf.i_dac_out/real'(2**ADC_RESOLUTION)) <= intf.i_vin;
endmodule

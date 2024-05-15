/*
==============================================
* SAR ADC (Analog and Digital Parts)

*   Date: 4/25/24
==============================================
*/

import tst_config_pkg::VREF;
module sar_adc(dbe_if.dut dbe, afe_if afe);
    sar_dbe u_dbe(dbe);
    sar_afe u_afe(afe);

    assign afe.v_ref = VREF;
    assign afe.i_dac_out = dbe.o_a2d;
    assign dbe.i_comp = afe.o_comp;
endmodule

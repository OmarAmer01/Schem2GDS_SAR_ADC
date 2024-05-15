/*
==============================================
* SAR ADC Digital Controller Interface

*   Date: 4/25/24
==============================================
*/

interface dbe_if #(
    parameter int ADC_RESOLUTION = 10
) (
    input i_clk
);
  logic                      i_rstn;
  logic                      i_start;
  logic                      i_comp;
  logic                      o_eoc;
  logic [ADC_RESOLUTION-1:0] o_a2d;

  modport dut(input i_clk, i_rstn, i_start, i_comp, output o_eoc, o_a2d);

`ifndef SYNTHESIS

  clocking drv_cb @(posedge i_clk);
    default input #1step output negedge;
    output i_rstn, i_start, i_comp;
  endclocking

  clocking mon_cb @(posedge i_clk);
    default input #1step output negedge;
    input i_rstn, i_start, i_comp, o_eoc, o_a2d;
  endclocking


  //! Bus functional model

  task automatic reset();
    // Pulse the start bit.
    i_start = 1'b0;
    @(drv_cb);
    i_rstn = 1'b0;
    @(drv_cb);
    @(drv_cb);
    @(drv_cb);
    i_rstn = 1'b1;
  endtask


  task automatic start_conv();
    // Pulse the start bit.
    drv_cb.i_start <= 1'b0;
    @(drv_cb);
    drv_cb.i_start <= 1'b1;
  endtask

  function automatic real read_analog_val(real vref = 2 ** ADC_RESOLUTION);
    // Convert the binary reading into an analog value.
    return (mon_cb.o_a2d / real'(2 ** ADC_RESOLUTION)) * vref;
  endfunction

`endif

endinterface


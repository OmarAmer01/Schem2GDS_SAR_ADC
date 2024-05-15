/*
========================================
* Pulse Shift Register TB

Shifts a pulse through an array of FFs.

Like a pulse stretcher without the OR
gate.

!Input pulse is shifted from MSB to LSB
*   MSB         LSB
? >> 1   0   0   0
? >> 0   1   0   0
? >> 0   0   1   0
? >> 0   0   0   1
? >> 0   0   0   0

* Date: 4/25/24
========================================
*/

`timescale 1ns / 1ps
module pulse_shreg_tb;
  logic i_clk;
  logic i_arstn;
  logic i_pulse;
  logic [9:0] o_taps;

  localparam PERIOD = 100;
  always begin
    #(PERIOD / 2) i_clk = ~i_clk;
  end

  pulse_shreg UUT (.*);

  initial begin
    $monitor("PULSE: %0b | TAPS: %b => %t ns", i_pulse, o_taps, $time);
  end

  initial begin
    i_clk = 0;
    i_arstn = 0;
    i_pulse = 0;
    @(posedge i_clk);
    i_arstn = 1;
    i_pulse = 1;

    repeat (15) begin
        @(posedge i_clk);
        i_pulse = 0;
    end
    $finish();
  end

endmodule

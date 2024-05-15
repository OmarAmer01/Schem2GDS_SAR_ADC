/*
==============================================
* End-to-End Testbench
Tests the whole system.

*   Date: 4/25/24
vlog -f filelist.f +cover +fcover -lint
vsim -c sar_top_tb -do "sim.do" -voptargs=+acc -assertdebug -msgmode both  -coverage -sv_seed random -cvgperinstance
vcover report -details -html -output ./cov_rep cov_db.ucdb
==============================================
*/

import drv::*;
import mon::*;
import seqr::*;
import tst_config_pkg::*;
module sar_top_tb;


  logic i_clk;
  dbe_if dbe_if (i_clk);
  afe_if afe_if (i_clk);


  driver drv;
  monitor mon;
  sequencer seqr;
  mailbox seqr_drv_mbx;

  initial i_clk = 0;
  always #(50) i_clk = ~i_clk;

  sar_adc UUT (
      .dbe(dbe_if),
      .afe(afe_if)
  );

  `include "ac.svh"

  initial begin
    seqr_drv_mbx = new(1);
    drv = new(afe_if, dbe_if, seqr_drv_mbx);
    mon = new(afe_if, dbe_if);
    seqr = new(seqr_drv_mbx);
    $display("TEST IN PROGRESS");
    fork
      drv.run();
      mon.run();
      seqr.run();
    join_none
  end

endmodule

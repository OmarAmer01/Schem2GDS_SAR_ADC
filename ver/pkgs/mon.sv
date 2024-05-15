/*
==============================================
* Monitor
    Monitors the DUT for acitivty
*   Date: 4/25/24
==============================================
*/

package mon;
  import txn::*;
  import tst_config_pkg::*;
  class monitor;
    virtual afe_if afe_vif;
    virtual dbe_if dbe_vif;
    static int no_mon = 0;

    function new(virtual afe_if afe_vif_h, virtual dbe_if dbe_vif_h);
      afe_vif = afe_vif_h;
      dbe_vif = dbe_vif_h;
    endfunction

    task run();
      forever begin
        @(dbe_vif.mon_cb);
        if (~dbe_vif.mon_cb.o_eoc) begin
          txn #(tst_config_pkg::VREF) read = new(
              dbe_vif.mon_cb.o_a2d * real'(tst_config_pkg::VREF) / (2**ADC_RESOLUTION)
          );
          read.print(0, no_mon, "R");
          no_mon++;
        end
      end
    endtask

  endclass
endpackage

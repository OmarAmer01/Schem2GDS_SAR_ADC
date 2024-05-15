/*
==============================================
* Driver
 Generates a random analog value and sends
 it to the ADC for conversion.

*   Date: 4/25/24
==============================================
*/
package drv;
  import txn::*;
  import tst_config_pkg::*;
  class driver;
    static int no_driven = 0;
    mailbox mbx_h;
    virtual afe_if afe_vif;
    virtual dbe_if dbe_vif;
    txn #(tst_config_pkg::VREF) to_drive;
    covergroup cg_delay;
      coverpoint to_drive.delay {bins zero = {0}; bins non_zero = {[1 : $]};}
    endgroup

    function new(virtual afe_if afe_if_h, virtual dbe_if dbe_if_h, mailbox mbx_h);
      afe_vif = afe_if_h;
      dbe_vif = dbe_if_h;
      this.mbx_h = mbx_h;
      cg_delay = new;
    endfunction

    task automatic send_and_start_conversion(txn#(tst_config_pkg::VREF) to_send);
      afe_vif.drv_cb.i_vin <= to_send.value;
      dbe_vif.start_conv();
      repeat (ADC_RESOLUTION + 1) @(dbe_vif.drv_cb);
    endtask

    task automatic run();

      dbe_vif.reset();

      forever begin
        mbx_h.get(to_drive);
        cg_delay.sample();
        repeat (to_drive.delay) @(dbe_vif.drv_cb);
        to_drive.print(0, no_driven, "W");
        no_driven++;
        send_and_start_conversion(to_drive);
      end

    endtask

  endclass
endpackage

/*
==============================================
* Sequencer
    Sends transactions to the driver.
*   Date: 4/25/24
==============================================
*/

package seqr;
  import txn::*;
  import tst_config_pkg::*;
  class sequencer;
    mailbox mbx_h;
    function new(mailbox mbx_h);
      this.mbx_h = mbx_h;
    endfunction


    task sanity_sequence(ref txn#(tst_config_pkg::VREF) to_send);
        // Sends a normal transaction
        txn#(tst_config_pkg::VREF) _to_send = new(11.2);
        _to_send.randomize();
        to_send = _to_send;
    endtask

    task automatic run();
        txn#(tst_config_pkg::VREF) to_send;
        repeat (tst_config_pkg::SANITY_SEQUENCE_ITERATIONS+1) begin
            sanity_sequence(to_send);
            mbx_h.put(to_send);
        end
        $finish();
    endtask

  endclass
endpackage

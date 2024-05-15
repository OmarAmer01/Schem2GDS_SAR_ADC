/*
==============================================
* Transaction
 Generates a random analog value

*   Date: 4/25/24
==============================================
*/

package txn;
  import tst_config_pkg::*;
  class txn #(
      parameter real VREF = tst_config_pkg::VREF
  );
    rand int value_unscaled;
    rand int scaler;
    rand int delay;
    real value;
    constraint value_is_between_zero_vref_c {VREF >= value_unscaled; value_unscaled >= 0;}
    constraint scaler_is_a_power_of_10_c {scaler inside {1, 10, 100};}
    constraint favor_burst_over_single_conversion_c {delay dist {0 :/ 80, [1:10]:/20};}
    function new(real value = -1);
      this.value = value;
    endfunction


    function void post_randomize();
      value = real'(value_unscaled) / scaler;
    endfunction

    function void print(bit verbose=0, int id, string name);
      if (~verbose) return;

      $display("======================");
      $display("|   ID  | [%s] Value  |", name);
      $display("|--------------------|");
      $display("| %4d  | %4.2f      |", id, value);
      $display("======================\n");

    endfunction

  endclass

endpackage

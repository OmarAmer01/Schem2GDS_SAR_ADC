
`define DIFF dbe_if.read_analog_val() - real'(afe_if.mon_cb.i_vin)

property conversion_has_one_lsb_error;
  @(posedge dbe_if.mon_cb) ~dbe_if.mon_cb.o_eoc |-> (`DIFF <= LSB_VAL) && (`DIFF >= -LSB_VAL);
endproperty

a_conversion_has_one_lsb_error :
assert property (conversion_has_one_lsb_error)
else
  $fatal(
      1,
      "vin = %.2f | analogval = %.2f | ERR: %.2f",
      $sampled(afe_if.mon_cb.i_vin),
      $sampled(dbe_if.read_analog_val()),
      $sampled(`DIFF),
  );
c_conversion_has_one_lsb_error :
cover property (conversion_has_one_lsb_error);



covergroup cg @(posedge dbe_if.i_clk);
  coverpoint dbe_if.o_a2d;
endgroup

cg cg_inst;

initial begin
    cg_inst = new;
end
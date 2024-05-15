/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12
// Date      : Fri May 10 17:39:29 2024
/////////////////////////////////////////////////////////////


module sar_dbe_ADC_RESOLUTION10 ( intf_i_clk, intf_i_start, intf_i_comp, 
        intf_o_eoc, intf_o_a2d );
  output [9:0] intf_o_a2d;
  input intf_i_clk, intf_i_start, intf_i_comp;
  output intf_o_eoc;
  wire   U_ctrl_logic_sar_reg_out_0_, u_SET_PROP_n11, u_SET_PROP_n10,
         u_SET_PROP_n9, u_SET_PROP_n8, u_SET_PROP_n7, u_SET_PROP_n6,
         u_SET_PROP_n5, u_SET_PROP_n4, u_SET_PROP_n3, u_SET_PROP_n2, n1, n3,
         n4, n6, n8, n10, n12, n14, n16, n18, n20, n22, n25, n26, n27, n28,
         n29, n31, n32, n33, n34, n35;

  DFFASX1_LVT u_SET_PROP_q_reg_10_ ( .D(1'b0), .CLK(intf_i_clk), .SETB(
        intf_i_start), .Q(u_SET_PROP_n2), .QN(n29) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_0_ ( .D(1'b0), .CLK(1'b0), .RSTB(
        intf_i_start), .SETB(intf_o_eoc), .QN(n22) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_1_ ( .D(n3), .CLK(
        U_ctrl_logic_sar_reg_out_0_), .RSTB(n35), .SETB(intf_i_start), .Q(n20)
         );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_2_ ( .D(n3), .CLK(intf_o_a2d[0]), 
        .RSTB(n34), .SETB(intf_i_start), .Q(n18) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_3_ ( .D(n3), .CLK(intf_o_a2d[1]), 
        .RSTB(n33), .SETB(intf_i_start), .Q(n16) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_4_ ( .D(n3), .CLK(intf_o_a2d[2]), 
        .RSTB(n32), .SETB(intf_i_start), .Q(n14) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_5_ ( .D(n3), .CLK(intf_o_a2d[3]), 
        .RSTB(n31), .SETB(intf_i_start), .Q(n12) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_6_ ( .D(n3), .CLK(intf_o_a2d[4]), 
        .RSTB(n28), .SETB(intf_i_start), .Q(n10) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_7_ ( .D(n3), .CLK(intf_o_a2d[5]), 
        .RSTB(n27), .SETB(intf_i_start), .Q(n8) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_8_ ( .D(n3), .CLK(intf_o_a2d[6]), 
        .RSTB(n26), .SETB(intf_i_start), .Q(n6) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_9_ ( .D(n3), .CLK(intf_o_a2d[7]), 
        .RSTB(n25), .SETB(intf_i_start), .Q(n4) );
  DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_10_ ( .D(n3), .CLK(intf_o_a2d[8]), 
        .RSTB(n29), .SETB(intf_i_start), .Q(n1) );
  INVX0_LVT U2 ( .INP(n1), .ZN(intf_o_a2d[9]) );
  INVX0_LVT U5 ( .INP(n4), .ZN(intf_o_a2d[8]) );
  INVX0_LVT U7 ( .INP(n6), .ZN(intf_o_a2d[7]) );
  INVX0_LVT U9 ( .INP(n8), .ZN(intf_o_a2d[6]) );
  INVX0_LVT U11 ( .INP(n10), .ZN(intf_o_a2d[5]) );
  INVX0_LVT U13 ( .INP(n12), .ZN(intf_o_a2d[4]) );
  INVX0_LVT U15 ( .INP(n14), .ZN(intf_o_a2d[3]) );
  INVX0_LVT U17 ( .INP(n16), .ZN(intf_o_a2d[2]) );
  INVX0_LVT U19 ( .INP(n18), .ZN(intf_o_a2d[1]) );
  INVX0_LVT U21 ( .INP(n20), .ZN(intf_o_a2d[0]) );
  INVX0_LVT U24 ( .INP(n22), .ZN(U_ctrl_logic_sar_reg_out_0_) );
  DFFARX1_LVT u_SET_PROP_q_reg_8_ ( .D(u_SET_PROP_n3), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n4), .QN(n26) );
  DFFARX1_LVT u_SET_PROP_q_reg_9_ ( .D(u_SET_PROP_n2), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n3), .QN(n25) );
  DFFARX1_LVT u_SET_PROP_q_reg_7_ ( .D(u_SET_PROP_n4), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n5), .QN(n27) );
  DFFARX1_LVT u_SET_PROP_q_reg_6_ ( .D(u_SET_PROP_n5), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n6), .QN(n28) );
  DFFARX1_LVT u_SET_PROP_q_reg_5_ ( .D(u_SET_PROP_n6), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n7), .QN(n31) );
  DFFARX1_LVT u_SET_PROP_q_reg_4_ ( .D(u_SET_PROP_n7), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n8), .QN(n32) );
  DFFARX1_LVT u_SET_PROP_q_reg_3_ ( .D(u_SET_PROP_n8), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n9), .QN(n33) );
  DFFARX1_LVT u_SET_PROP_q_reg_2_ ( .D(u_SET_PROP_n9), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n10), .QN(n34) );
  DFFARX1_LVT u_SET_PROP_q_reg_1_ ( .D(u_SET_PROP_n10), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .Q(u_SET_PROP_n11), .QN(n35) );
  DFFARX1_LVT u_SET_PROP_q_reg_0_ ( .D(u_SET_PROP_n11), .CLK(intf_i_clk), 
        .RSTB(intf_i_start), .QN(intf_o_eoc) );
  INVX0_LVT U26 ( .INP(intf_i_comp), .ZN(n3) );
endmodule


// IC Compiler II Version V-2023.12 Verilog Writer
// Generated on 5/14/2024 at 14:20:25
// Library Name: SAR_DBE.dlib
// Block Name: routing
// User Label: 
// Write Command: write_verilog ./output/sar_dbe_for_pt_v.v
module sar_dbe_ADC_RESOLUTION10 ( intf_i_clk , intf_i_start , intf_i_comp , 
    intf_o_eoc , intf_o_a2d ) ;
input  intf_i_clk ;
input  intf_i_start ;
input  intf_i_comp ;
output intf_o_eoc ;
output [9:0] intf_o_a2d ;

DFFASX1_LVT u_SET_PROP_q_reg_10_ ( .D ( 1'b0 ) , .CLK ( intf_i_clk ) , 
    .SETB ( intf_i_start ) , .Q ( u_SET_PROP_n2 ) , .QN ( n29 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_0_ ( .D ( 1'b0 ) , .CLK ( 1'b0 ) , 
    .RSTB ( intf_i_start ) , .SETB ( intf_o_eoc ) , .QN ( n22 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_1_ ( .D ( n3 ) , 
    .CLK ( U_ctrl_logic_sar_reg_out_0_ ) , .RSTB ( n35 ) , 
    .SETB ( intf_i_start ) , .Q ( n20 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_2_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[0] ) , .RSTB ( n34 ) , .SETB ( intf_i_start ) , 
    .Q ( n18 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_3_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[1] ) , .RSTB ( n33 ) , .SETB ( intf_i_start ) , 
    .Q ( n16 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_4_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[2] ) , .RSTB ( n32 ) , .SETB ( intf_i_start ) , 
    .Q ( n14 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_5_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[3] ) , .RSTB ( n31 ) , .SETB ( intf_i_start ) , 
    .Q ( n12 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_6_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[4] ) , .RSTB ( n28 ) , .SETB ( intf_i_start ) , 
    .Q ( n10 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_7_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[5] ) , .RSTB ( n27 ) , .SETB ( intf_i_start ) , 
    .Q ( n8 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_8_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[6] ) , .RSTB ( n26 ) , .SETB ( intf_i_start ) , 
    .Q ( n6 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_9_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[7] ) , .RSTB ( n25 ) , .SETB ( intf_i_start ) , 
    .Q ( n4 ) ) ;
DFFASRX1_LVT U_ctrl_logic_sar_reg_out_reg_10_ ( .D ( n3 ) , 
    .CLK ( intf_o_a2d[8] ) , .RSTB ( n29 ) , .SETB ( intf_i_start ) , 
    .Q ( n1 ) ) ;
INVX0_LVT U2 ( .INP ( n1 ) , .ZN ( intf_o_a2d[9] ) ) ;
INVX0_LVT U5 ( .INP ( n4 ) , .ZN ( intf_o_a2d[8] ) ) ;
INVX0_LVT U7 ( .INP ( n6 ) , .ZN ( intf_o_a2d[7] ) ) ;
INVX0_LVT U9 ( .INP ( n8 ) , .ZN ( intf_o_a2d[6] ) ) ;
INVX0_LVT U11 ( .INP ( n10 ) , .ZN ( intf_o_a2d[5] ) ) ;
INVX0_LVT U13 ( .INP ( n12 ) , .ZN ( intf_o_a2d[4] ) ) ;
INVX0_LVT U15 ( .INP ( n14 ) , .ZN ( intf_o_a2d[3] ) ) ;
INVX0_LVT U17 ( .INP ( n16 ) , .ZN ( intf_o_a2d[2] ) ) ;
INVX0_LVT U19 ( .INP ( n18 ) , .ZN ( intf_o_a2d[1] ) ) ;
INVX0_LVT U21 ( .INP ( n20 ) , .ZN ( intf_o_a2d[0] ) ) ;
INVX0_LVT U24 ( .INP ( n22 ) , .ZN ( U_ctrl_logic_sar_reg_out_0_ ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_8_ ( .D ( u_SET_PROP_n3 ) , .CLK ( intf_i_clk ) , 
    .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n4 ) , .QN ( n26 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_9_ ( .D ( u_SET_PROP_n2 ) , .CLK ( intf_i_clk ) , 
    .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n3 ) , .QN ( n25 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_7_ ( .D ( u_SET_PROP_n4 ) , .CLK ( intf_i_clk ) , 
    .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n5 ) , .QN ( n27 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_6_ ( .D ( u_SET_PROP_n5 ) , .CLK ( intf_i_clk ) , 
    .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n6 ) , .QN ( n28 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_5_ ( .D ( u_SET_PROP_n6 ) , .CLK ( intf_i_clk ) , 
    .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n7 ) , .QN ( n31 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_4_ ( .D ( u_SET_PROP_n7 ) , .CLK ( intf_i_clk ) , 
    .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n8 ) , .QN ( n32 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_3_ ( .D ( u_SET_PROP_n8 ) , .CLK ( intf_i_clk ) , 
    .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n9 ) , .QN ( n33 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_2_ ( .D ( u_SET_PROP_n9 ) , .CLK ( intf_i_clk ) , 
    .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n10 ) , .QN ( n34 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_1_ ( .D ( u_SET_PROP_n10 ) , 
    .CLK ( intf_i_clk ) , .RSTB ( intf_i_start ) , .Q ( u_SET_PROP_n11 ) , 
    .QN ( n35 ) ) ;
DFFARX1_LVT u_SET_PROP_q_reg_0_ ( .D ( u_SET_PROP_n11 ) , 
    .CLK ( intf_i_clk ) , .RSTB ( intf_i_start ) , .QN ( intf_o_eoc ) ) ;
INVX0_LVT U26 ( .INP ( intf_i_comp ) , .ZN ( n3 ) ) ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x243600y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x250000y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x256400y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x262800y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x269200y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x275600y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x282000y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x288400y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x294800y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x301200y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x307600y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x314000y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x320400y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x326800y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x333200y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x339600y10000 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x346000y10000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x10000y38800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x10000y67600 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x16400y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x38800y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x45200y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x51600y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x58000y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x83600y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x90000y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x96400y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x102800y67600 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x109200y67600 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x346000y67600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x131600y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x138000y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x144400y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x150800y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x157200y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x163600y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x170000y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x195600y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x202000y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x208400y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x214800y96400 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x221200y96400 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x346000y96400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x10000y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x16400y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x22800y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x29200y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x35600y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x42000y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x67600y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x74000y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x80400y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x86800y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x93200y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x99600y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x106000y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x112400y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x118800y125200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x243600y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x250000y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x256400y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x262800y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x269200y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x275600y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x282000y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x288400y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x294800y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x301200y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x307600y154000 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x314000y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x336400y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x342800y154000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x131600y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x138000y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x144400y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x150800y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x157200y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x163600y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x170000y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x176400y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x182800y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x208400y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x214800y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x221200y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x227600y182800 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x346000y182800 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x10000y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x16400y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x22800y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x29200y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x35600y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x42000y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x67600y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x74000y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x80400y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x86800y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x93200y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x99600y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x106000y211600 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x112400y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x227600y211600 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x234000y211600 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x131600y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x138000y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x144400y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x150800y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x157200y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x163600y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x170000y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x176400y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x182800y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x189200y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x195600y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x202000y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x208400y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x214800y240400 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x221200y240400 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x346000y240400 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x10000y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x16400y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x22800y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x29200y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x35600y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x42000y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x86800y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x93200y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x99600y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x106000y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x112400y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x240400y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x246800y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x253200y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x259600y269200 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x266000y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x288400y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x294800y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x301200y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x307600y269200 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x314000y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x336400y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x342800y269200 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x131600y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x138000y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x144400y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x150800y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x157200y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x163600y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x189200y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x195600y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x202000y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x208400y298000 () ;
SHFILL2_LVT \xofiller!SHFILL2_LVT!x214800y298000 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x221200y298000 () ;
SHFILL1_LVT \xofiller!SHFILL1_LVT!x346000y298000 () ;
endmodule



/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sun Oct 11 00:10:06 2026
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \rst_reg[1] ;

  DFFRQX2M \rst_reg_reg[0]  ( .D(\rst_reg[1] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \rst_reg_reg[1]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\rst_reg[1] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \rst_reg[1] ;

  DFFRQX2M \rst_reg_reg[0]  ( .D(\rst_reg[1] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \rst_reg_reg[1]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\rst_reg[1] )
         );
endmodule


module clk_div_DATA_WIDTH8_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module clk_div_DATA_WIDTH8_0_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module clk_div_DATA_WIDTH8_0 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, 
        O_div_clk );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en;
  output O_div_clk;
  wire   N2, O_div_clk_reg, flip, N15, N16, N17, N18, N19, N20, N21, n19, n20,
         n21, n22, n23, n24, n25, n26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38;
  wire   [6:0] halfp1;
  wire   [6:0] counter;

  clk_div_DATA_WIDTH8_0_DW01_inc_0 add_54 ( .A(counter), .SUM({N21, N20, N19, 
        N18, N17, N16, N15}) );
  clk_div_DATA_WIDTH8_0_DW01_inc_1 add_22 ( .A(I_div_ratio[7:1]), .SUM(halfp1)
         );
  DFFRQX2M O_div_clk_reg_reg ( .D(n20), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        O_div_clk_reg) );
  DFFSQX2M flip_reg ( .D(n19), .CK(I_ref_clk), .SN(I_rst_n), .Q(flip) );
  DFFRQX2M \counter_reg[6]  ( .D(n21), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[0]  ( .D(n38), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[3]  ( .D(n24), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[5]  ( .D(n22), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(n23), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[2]  ( .D(n25), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n26), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[1]) );
  MX2X2M U3 ( .A(I_ref_clk), .B(O_div_clk_reg), .S0(N2), .Y(O_div_clk) );
  NOR2BX2M U4 ( .AN(I_clk_en), .B(n36), .Y(N2) );
  OAI2B11X1M U5 ( .A1N(counter[0]), .A0(N2), .B0(n1), .C0(n2), .Y(n38) );
  CLKNAND2X2M U6 ( .A(N15), .B(n3), .Y(n1) );
  AO2B2X1M U7 ( .B0(N16), .B1(n3), .A0(counter[1]), .A1N(N2), .Y(n26) );
  AO2B2X1M U8 ( .B0(N17), .B1(n3), .A0(counter[2]), .A1N(N2), .Y(n25) );
  OAI2BB2X1M U9 ( .B0(N2), .B1(n4), .A0N(N18), .A1N(n3), .Y(n24) );
  AO2B2X1M U10 ( .B0(N19), .B1(n3), .A0(counter[4]), .A1N(N2), .Y(n23) );
  AO2B2X1M U11 ( .B0(N20), .B1(n3), .A0(counter[5]), .A1N(N2), .Y(n22) );
  OAI2BB2X1M U12 ( .B0(N2), .B1(n5), .A0N(N21), .A1N(n3), .Y(n21) );
  NOR3BX1M U13 ( .AN(N2), .B(n6), .C(n7), .Y(n3) );
  XNOR2X1M U14 ( .A(O_div_clk_reg), .B(n2), .Y(n20) );
  OAI21X1M U15 ( .A0(n6), .A1(n7), .B0(N2), .Y(n2) );
  NOR2X1M U16 ( .A(n8), .B(I_div_ratio[0]), .Y(n6) );
  XNOR2X1M U17 ( .A(flip), .B(n9), .Y(n19) );
  CLKNAND2X2M U18 ( .A(n7), .B(N2), .Y(n9) );
  AND2X1M U19 ( .A(n10), .B(I_div_ratio[0]), .Y(n7) );
  MXI2X1M U20 ( .A(n11), .B(n8), .S0(flip), .Y(n10) );
  NAND4X1M U21 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(n8) );
  NOR4X1M U22 ( .A(n16), .B(n17), .C(n18), .D(n27), .Y(n15) );
  CLKXOR2X2M U23 ( .A(counter[2]), .B(I_div_ratio[3]), .Y(n27) );
  CLKXOR2X2M U24 ( .A(counter[1]), .B(I_div_ratio[2]), .Y(n18) );
  CLKXOR2X2M U25 ( .A(counter[0]), .B(I_div_ratio[1]), .Y(n17) );
  CLKXOR2X2M U26 ( .A(counter[6]), .B(I_div_ratio[7]), .Y(n16) );
  XNOR2X1M U27 ( .A(I_div_ratio[5]), .B(counter[4]), .Y(n14) );
  XNOR2X1M U28 ( .A(I_div_ratio[6]), .B(counter[5]), .Y(n13) );
  CLKXOR2X2M U29 ( .A(I_div_ratio[4]), .B(n4), .Y(n12) );
  CLKINVX1M U30 ( .A(counter[3]), .Y(n4) );
  NAND4X1M U31 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n11) );
  NOR4X1M U32 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n31) );
  CLKXOR2X2M U33 ( .A(halfp1[3]), .B(counter[3]), .Y(n35) );
  CLKXOR2X2M U34 ( .A(halfp1[2]), .B(counter[2]), .Y(n34) );
  CLKXOR2X2M U35 ( .A(halfp1[1]), .B(counter[1]), .Y(n33) );
  CLKXOR2X2M U36 ( .A(halfp1[0]), .B(counter[0]), .Y(n32) );
  XNOR2X1M U37 ( .A(counter[5]), .B(halfp1[5]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(n5), .B(halfp1[6]), .Y(n29) );
  CLKINVX1M U39 ( .A(counter[6]), .Y(n5) );
  XNOR2X1M U40 ( .A(counter[4]), .B(halfp1[4]), .Y(n28) );
  NOR4BX1M U41 ( .AN(n37), .B(I_div_ratio[2]), .C(I_div_ratio[3]), .D(
        I_div_ratio[1]), .Y(n36) );
  NOR4X1M U42 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n37) );
endmodule


module CLKDIV_MUX_WIDTH8 ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[7]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[4]) );
  NOR4X1M U11 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND4BX1M U12 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NOR3X2M U13 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NAND4BX1M U14 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NAND3X2M U15 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  NOR3X2M U16 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  OAI211X2M U17 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U18 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U19 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  INVX2M U21 ( .A(IN[1]), .Y(n16) );
  INVX2M U22 ( .A(IN[2]), .Y(n15) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
endmodule


module clk_div_DATA_WIDTH8_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module clk_div_DATA_WIDTH8_1_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module clk_div_DATA_WIDTH8_1 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, 
        O_div_clk );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en;
  output O_div_clk;
  wire   N2, O_div_clk_reg, flip, N15, N16, N17, N18, N19, N20, N21, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46;
  wire   [6:0] halfp1;
  wire   [6:0] counter;

  clk_div_DATA_WIDTH8_1_DW01_inc_0 add_54 ( .A(counter), .SUM({N21, N20, N19, 
        N18, N17, N16, N15}) );
  clk_div_DATA_WIDTH8_1_DW01_inc_1 add_22 ( .A(I_div_ratio[7:1]), .SUM(halfp1)
         );
  DFFRQX2M O_div_clk_reg_reg ( .D(n45), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        O_div_clk_reg) );
  DFFSQX2M flip_reg ( .D(n46), .CK(I_ref_clk), .SN(I_rst_n), .Q(flip) );
  DFFRQX2M \counter_reg[6]  ( .D(n44), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[0]  ( .D(n38), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[3]  ( .D(n41), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[5]  ( .D(n43), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(n42), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[2]  ( .D(n40), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n39), .CK(I_ref_clk), .RN(I_rst_n), .Q(
        counter[1]) );
  MX2X2M U3 ( .A(I_ref_clk), .B(O_div_clk_reg), .S0(N2), .Y(O_div_clk) );
  NOR2BX2M U4 ( .AN(I_clk_en), .B(n36), .Y(N2) );
  OAI2B11X1M U5 ( .A1N(counter[0]), .A0(N2), .B0(n1), .C0(n2), .Y(n38) );
  CLKNAND2X2M U6 ( .A(N15), .B(n3), .Y(n1) );
  AO2B2X1M U7 ( .B0(N16), .B1(n3), .A0(counter[1]), .A1N(N2), .Y(n39) );
  AO2B2X1M U8 ( .B0(N17), .B1(n3), .A0(counter[2]), .A1N(N2), .Y(n40) );
  OAI2BB2X1M U9 ( .B0(N2), .B1(n4), .A0N(N18), .A1N(n3), .Y(n41) );
  AO2B2X1M U10 ( .B0(N19), .B1(n3), .A0(counter[4]), .A1N(N2), .Y(n42) );
  AO2B2X1M U11 ( .B0(N20), .B1(n3), .A0(counter[5]), .A1N(N2), .Y(n43) );
  OAI2BB2X1M U12 ( .B0(N2), .B1(n5), .A0N(N21), .A1N(n3), .Y(n44) );
  NOR3BX1M U13 ( .AN(N2), .B(n6), .C(n7), .Y(n3) );
  XNOR2X1M U14 ( .A(O_div_clk_reg), .B(n2), .Y(n45) );
  OAI21X1M U15 ( .A0(n6), .A1(n7), .B0(N2), .Y(n2) );
  NOR2X1M U16 ( .A(n8), .B(I_div_ratio[0]), .Y(n6) );
  XNOR2X1M U17 ( .A(flip), .B(n9), .Y(n46) );
  CLKNAND2X2M U18 ( .A(n7), .B(N2), .Y(n9) );
  AND2X1M U19 ( .A(n10), .B(I_div_ratio[0]), .Y(n7) );
  MXI2X1M U20 ( .A(n11), .B(n8), .S0(flip), .Y(n10) );
  NAND4X1M U21 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(n8) );
  NOR4X1M U22 ( .A(n16), .B(n17), .C(n18), .D(n27), .Y(n15) );
  CLKXOR2X2M U23 ( .A(counter[2]), .B(I_div_ratio[3]), .Y(n27) );
  CLKXOR2X2M U24 ( .A(counter[1]), .B(I_div_ratio[2]), .Y(n18) );
  CLKXOR2X2M U25 ( .A(counter[0]), .B(I_div_ratio[1]), .Y(n17) );
  CLKXOR2X2M U26 ( .A(counter[6]), .B(I_div_ratio[7]), .Y(n16) );
  XNOR2X1M U27 ( .A(I_div_ratio[5]), .B(counter[4]), .Y(n14) );
  XNOR2X1M U28 ( .A(I_div_ratio[6]), .B(counter[5]), .Y(n13) );
  CLKXOR2X2M U29 ( .A(I_div_ratio[4]), .B(n4), .Y(n12) );
  CLKINVX1M U30 ( .A(counter[3]), .Y(n4) );
  NAND4X1M U31 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n11) );
  NOR4X1M U32 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n31) );
  CLKXOR2X2M U33 ( .A(halfp1[3]), .B(counter[3]), .Y(n35) );
  CLKXOR2X2M U34 ( .A(halfp1[2]), .B(counter[2]), .Y(n34) );
  CLKXOR2X2M U35 ( .A(halfp1[1]), .B(counter[1]), .Y(n33) );
  CLKXOR2X2M U36 ( .A(halfp1[0]), .B(counter[0]), .Y(n32) );
  XNOR2X1M U37 ( .A(counter[5]), .B(halfp1[5]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(n5), .B(halfp1[6]), .Y(n29) );
  CLKINVX1M U39 ( .A(counter[6]), .Y(n5) );
  XNOR2X1M U40 ( .A(counter[4]), .B(halfp1[4]), .Y(n28) );
  NOR4BX1M U41 ( .AN(n37), .B(I_div_ratio[2]), .C(I_div_ratio[3]), .D(
        I_div_ratio[1]), .Y(n36) );
  NOR4X1M U42 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n37) );
endmodule


module uart_tx_fsm ( CLK, RST, Data_Valid, ser_done, parity_enable, Ser_enable, 
        mux_sel, busy );
  output [1:0] mux_sel;
  input CLK, RST, Data_Valid, ser_done, parity_enable;
  output Ser_enable, busy;
  wire   busy_c, n4, n5, n6, n7, n8, n9, n1, n2, n3;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M busy_reg ( .D(busy_c), .CK(CLK), .RN(RST), .Q(busy) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  INVX2M U3 ( .A(n9), .Y(n1) );
  AOI21X2M U4 ( .A0(n6), .A1(n7), .B0(current_state[2]), .Y(next_state[0]) );
  NAND2BX2M U5 ( .AN(ser_done), .B(current_state[0]), .Y(n6) );
  OAI21X2M U6 ( .A0(Data_Valid), .A1(current_state[0]), .B0(n3), .Y(n7) );
  NOR3X2M U7 ( .A(n5), .B(ser_done), .C(current_state[2]), .Y(Ser_enable) );
  OAI21X2M U8 ( .A0(current_state[1]), .A1(n2), .B0(n8), .Y(n9) );
  NAND2X2M U9 ( .A(current_state[1]), .B(n2), .Y(n8) );
  NAND2X2M U10 ( .A(n1), .B(current_state[0]), .Y(n5) );
  INVX2M U11 ( .A(current_state[0]), .Y(n2) );
  OAI2B2X1M U12 ( .A1N(current_state[2]), .A0(n8), .B0(current_state[2]), .B1(
        n9), .Y(mux_sel[0]) );
  OAI21X2M U13 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n8), .Y(
        mux_sel[1]) );
  NOR3X2M U14 ( .A(n3), .B(current_state[2]), .C(n4), .Y(next_state[2]) );
  AOI2B1X1M U15 ( .A1N(parity_enable), .A0(ser_done), .B0(n2), .Y(n4) );
  OAI21X2M U16 ( .A0(current_state[2]), .A1(n2), .B0(n8), .Y(busy_c) );
  AOI21X2M U17 ( .A0(n1), .A1(n5), .B0(current_state[2]), .Y(next_state[1]) );
  INVX2M U18 ( .A(current_state[1]), .Y(n3) );
endmodule


module Serializer_WIDTH8 ( CLK, RST, DATA, Enable, Busy, Data_Valid, ser_out, 
        ser_done );
  input [7:0] DATA;
  input CLK, RST, Enable, Busy, Data_Valid;
  output ser_out, ser_done;
  wire   N23, N24, N25, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n1, n2, n3, n25;
  wire   [7:1] DATA_V;
  wire   [2:0] ser_count;

  DFFRQX2M \DATA_V_reg[6]  ( .D(n19), .CK(CLK), .RN(RST), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n20), .CK(CLK), .RN(RST), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n21), .CK(CLK), .RN(RST), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n22), .CK(CLK), .RN(RST), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n23), .CK(CLK), .RN(RST), .Q(DATA_V[2]) );
  DFFRQX2M \DATA_V_reg[1]  ( .D(n24), .CK(CLK), .RN(RST), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n18), .CK(CLK), .RN(RST), .Q(DATA_V[7]) );
  DFFRQX2M \DATA_V_reg[0]  ( .D(n17), .CK(CLK), .RN(RST), .Q(ser_out) );
  DFFRQX2M \ser_count_reg[2]  ( .D(N25), .CK(CLK), .RN(RST), .Q(ser_count[2])
         );
  DFFRQX2M \ser_count_reg[1]  ( .D(N24), .CK(CLK), .RN(RST), .Q(ser_count[1])
         );
  DFFRQX2M \ser_count_reg[0]  ( .D(N23), .CK(CLK), .RN(RST), .Q(ser_count[0])
         );
  NOR2X2M U3 ( .A(n2), .B(n1), .Y(n6) );
  NOR2X2M U4 ( .A(n1), .B(n6), .Y(n4) );
  INVX2M U5 ( .A(Enable), .Y(n2) );
  BUFX2M U6 ( .A(n7), .Y(n1) );
  NOR2BX2M U7 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  OAI2BB1X2M U8 ( .A0N(ser_out), .A1N(n4), .B0(n5), .Y(n17) );
  AOI22X1M U9 ( .A0(DATA_V[1]), .A1(n6), .B0(DATA[0]), .B1(n1), .Y(n5) );
  OAI2BB1X2M U10 ( .A0N(DATA_V[1]), .A1N(n4), .B0(n13), .Y(n24) );
  AOI22X1M U11 ( .A0(DATA_V[2]), .A1(n6), .B0(DATA[1]), .B1(n1), .Y(n13) );
  OAI2BB1X2M U12 ( .A0N(n4), .A1N(DATA_V[2]), .B0(n12), .Y(n23) );
  AOI22X1M U13 ( .A0(DATA_V[3]), .A1(n6), .B0(DATA[2]), .B1(n1), .Y(n12) );
  OAI2BB1X2M U14 ( .A0N(n4), .A1N(DATA_V[3]), .B0(n11), .Y(n22) );
  AOI22X1M U15 ( .A0(DATA_V[4]), .A1(n6), .B0(DATA[3]), .B1(n1), .Y(n11) );
  OAI2BB1X2M U16 ( .A0N(n4), .A1N(DATA_V[4]), .B0(n10), .Y(n21) );
  AOI22X1M U17 ( .A0(DATA_V[5]), .A1(n6), .B0(DATA[4]), .B1(n1), .Y(n10) );
  OAI2BB1X2M U18 ( .A0N(n4), .A1N(DATA_V[5]), .B0(n9), .Y(n20) );
  AOI22X1M U19 ( .A0(DATA_V[6]), .A1(n6), .B0(DATA[5]), .B1(n1), .Y(n9) );
  OAI2BB1X2M U20 ( .A0N(n4), .A1N(DATA_V[6]), .B0(n8), .Y(n19) );
  AOI22X1M U21 ( .A0(DATA_V[7]), .A1(n6), .B0(DATA[6]), .B1(n1), .Y(n8) );
  AO22X1M U22 ( .A0(n4), .A1(DATA_V[7]), .B0(DATA[7]), .B1(n1), .Y(n18) );
  OAI32X1M U23 ( .A0(n14), .A1(n3), .A2(n2), .B0(n15), .B1(n25), .Y(N25) );
  NAND2X2M U24 ( .A(ser_count[0]), .B(n25), .Y(n14) );
  AOI21X2M U25 ( .A0(Enable), .A1(n3), .B0(N23), .Y(n15) );
  INVX2M U26 ( .A(ser_count[2]), .Y(n25) );
  AND3X2M U27 ( .A(ser_count[0]), .B(ser_count[2]), .C(ser_count[1]), .Y(
        ser_done) );
  NOR2X2M U28 ( .A(n2), .B(ser_count[0]), .Y(N23) );
  NOR2X2M U29 ( .A(n16), .B(n2), .Y(N24) );
  CLKXOR2X2M U30 ( .A(ser_count[0]), .B(n3), .Y(n16) );
  INVX2M U31 ( .A(ser_count[1]), .Y(n3) );
endmodule


module mux ( CLK, RST, IN_0, IN_1, IN_2, IN_3, SEL, OUT );
  input [1:0] SEL;
  input CLK, RST, IN_0, IN_1, IN_2, IN_3;
  output OUT;
  wire   mux_out, n2, n3, n1;

  DFFSQX2M OUT_reg ( .D(mux_out), .CK(CLK), .SN(RST), .Q(OUT) );
  INVX2M U3 ( .A(SEL[0]), .Y(n1) );
  OAI2B2X1M U4 ( .A1N(SEL[1]), .A0(n2), .B0(SEL[1]), .B1(n3), .Y(mux_out) );
  AOI22X1M U5 ( .A0(IN_0), .A1(n1), .B0(SEL[0]), .B1(IN_1), .Y(n3) );
  AOI22X1M U6 ( .A0(IN_2), .A1(n1), .B0(IN_3), .B1(SEL[0]), .Y(n2) );
endmodule


module parity_calc_WIDTH8 ( CLK, RST, parity_enable, parity_type, Busy, DATA, 
        Data_Valid, parity );
  input [7:0] DATA;
  input CLK, RST, parity_enable, parity_type, Busy, Data_Valid;
  output parity;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2
;
  wire   [7:0] DATA_V;

  DFFRQX2M parity_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(parity) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(DATA_V[0]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(DATA_V[2]) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(DATA_V[7]) );
  NOR2BX2M U2 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  AO2B2X2M U3 ( .B0(DATA[0]), .B1(n7), .A0(DATA_V[0]), .A1N(n7), .Y(n9) );
  AO2B2X2M U4 ( .B0(DATA[1]), .B1(n7), .A0(DATA_V[1]), .A1N(n7), .Y(n10) );
  AO2B2X2M U5 ( .B0(DATA[2]), .B1(n7), .A0(DATA_V[2]), .A1N(n7), .Y(n11) );
  AO2B2X2M U6 ( .B0(DATA[3]), .B1(n7), .A0(DATA_V[3]), .A1N(n7), .Y(n12) );
  AO2B2X2M U7 ( .B0(DATA[4]), .B1(n7), .A0(DATA_V[4]), .A1N(n7), .Y(n13) );
  AO2B2X2M U8 ( .B0(DATA[5]), .B1(n7), .A0(DATA_V[5]), .A1N(n7), .Y(n14) );
  AO2B2X2M U9 ( .B0(DATA[6]), .B1(n7), .A0(DATA_V[6]), .A1N(n7), .Y(n15) );
  AO2B2X2M U10 ( .B0(DATA[7]), .B1(n7), .A0(DATA_V[7]), .A1N(n7), .Y(n16) );
  XNOR2X2M U11 ( .A(DATA_V[2]), .B(DATA_V[3]), .Y(n5) );
  OAI2BB2X1M U12 ( .B0(n1), .B1(n2), .A0N(parity), .A1N(n2), .Y(n8) );
  INVX2M U13 ( .A(parity_enable), .Y(n2) );
  XOR3XLM U14 ( .A(n3), .B(parity_type), .C(n4), .Y(n1) );
  XOR3XLM U15 ( .A(DATA_V[1]), .B(DATA_V[0]), .C(n5), .Y(n4) );
  XOR3XLM U16 ( .A(DATA_V[5]), .B(DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U17 ( .A(DATA_V[7]), .B(DATA_V[6]), .Y(n6) );
endmodule


module UART_TX_DATA_WIDTH8 ( CLK, RST, P_DATA, Data_Valid, parity_enable, 
        parity_type, TX_OUT, busy );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, parity_enable, parity_type;
  output TX_OUT, busy;
  wire   seriz_done, seriz_en, ser_data, parity, n1, n2;
  wire   [1:0] mux_sel;

  uart_tx_fsm U0_fsm ( .CLK(CLK), .RST(n1), .Data_Valid(Data_Valid), 
        .ser_done(seriz_done), .parity_enable(parity_enable), .Ser_enable(
        seriz_en), .mux_sel(mux_sel), .busy(busy) );
  Serializer_WIDTH8 U0_Serializer ( .CLK(CLK), .RST(n1), .DATA(P_DATA), 
        .Enable(seriz_en), .Busy(busy), .Data_Valid(Data_Valid), .ser_out(
        ser_data), .ser_done(seriz_done) );
  mux U0_mux ( .CLK(CLK), .RST(n1), .IN_0(1'b0), .IN_1(ser_data), .IN_2(parity), .IN_3(1'b1), .SEL(mux_sel), .OUT(TX_OUT) );
  parity_calc_WIDTH8 U0_parity_calc ( .CLK(CLK), .RST(n1), .parity_enable(
        parity_enable), .parity_type(parity_type), .Busy(busy), .DATA(P_DATA), 
        .Data_Valid(Data_Valid), .parity(parity) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module uart_rx_fsm_DATA_WIDTH8 ( CLK, RST, S_DATA, Prescale, parity_enable, 
        bit_count, edge_count, par_err, stp_err, strt_glitch, strt_chk_en, 
        edge_bit_en, deser_en, par_chk_en, stp_chk_en, dat_samp_en, data_valid
 );
  input [5:0] Prescale;
  input [3:0] bit_count;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, parity_enable, par_err, stp_err, strt_glitch;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
         dat_samp_en, data_valid;
  wire   \sub_40/carry[5] , \sub_40/carry[4] , \sub_40/carry[3] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47;
  wire   [5:0] check_edge;
  wire   [5:0] error_check_edge;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign error_check_edge[0] = Prescale[0];

  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  XNOR2X2M U3 ( .A(Prescale[1]), .B(edge_count[1]), .Y(n34) );
  OR2X2M U4 ( .A(Prescale[1]), .B(error_check_edge[0]), .Y(n1) );
  INVX2M U5 ( .A(Prescale[3]), .Y(n5) );
  XNOR2X1M U6 ( .A(Prescale[5]), .B(\sub_40/carry[5] ), .Y(error_check_edge[5]) );
  OR2X1M U7 ( .A(Prescale[4]), .B(\sub_40/carry[4] ), .Y(\sub_40/carry[5] ) );
  XNOR2X1M U8 ( .A(\sub_40/carry[4] ), .B(Prescale[4]), .Y(error_check_edge[4]) );
  OR2X1M U9 ( .A(Prescale[3]), .B(\sub_40/carry[3] ), .Y(\sub_40/carry[4] ) );
  XNOR2X1M U10 ( .A(\sub_40/carry[3] ), .B(Prescale[3]), .Y(
        error_check_edge[3]) );
  OR2X1M U11 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\sub_40/carry[3] ) );
  XNOR2X1M U12 ( .A(Prescale[1]), .B(Prescale[2]), .Y(error_check_edge[2]) );
  CLKINVX1M U13 ( .A(error_check_edge[0]), .Y(check_edge[0]) );
  OAI2BB1X1M U14 ( .A0N(error_check_edge[0]), .A1N(Prescale[1]), .B0(n1), .Y(
        check_edge[1]) );
  NOR2X1M U15 ( .A(n1), .B(Prescale[2]), .Y(n2) );
  AO21XLM U16 ( .A0(n1), .A1(Prescale[2]), .B0(n2), .Y(check_edge[2]) );
  CLKNAND2X2M U17 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U18 ( .A0(n2), .A1(n5), .B0(n3), .Y(check_edge[3]) );
  XNOR2X1M U19 ( .A(Prescale[4]), .B(n3), .Y(check_edge[4]) );
  NOR2X1M U20 ( .A(Prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U21 ( .A(Prescale[5]), .B(n4), .Y(check_edge[5]) );
  NOR2X1M U22 ( .A(current_state[1]), .B(n6), .Y(strt_chk_en) );
  NOR2X1M U23 ( .A(current_state[2]), .B(n7), .Y(par_chk_en) );
  OAI31X1M U24 ( .A0(n8), .A1(parity_enable), .A2(n9), .B0(n10), .Y(
        next_state[2]) );
  AOI31X1M U25 ( .A0(n11), .A1(n12), .A2(n13), .B0(stp_chk_en), .Y(n10) );
  NOR2X1M U26 ( .A(n14), .B(n15), .Y(n13) );
  CLKINVX1M U27 ( .A(bit_count[3]), .Y(n15) );
  CLKINVX1M U28 ( .A(n7), .Y(n12) );
  OAI21X1M U29 ( .A0(current_state[2]), .A1(n16), .B0(n7), .Y(next_state[1])
         );
  AOI31X1M U30 ( .A0(current_state[0]), .A1(n11), .A2(n17), .B0(
        current_state[1]), .Y(n16) );
  NOR3X1M U31 ( .A(bit_count[0]), .B(strt_glitch), .C(bit_count[3]), .Y(n17)
         );
  OAI221X1M U32 ( .A0(S_DATA), .A1(n18), .B0(n19), .B1(n8), .C0(n20), .Y(
        next_state[0]) );
  AOI31X1M U33 ( .A0(n21), .A1(n22), .A2(n23), .B0(n24), .Y(n20) );
  NOR4X1M U34 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n24) );
  CLKXOR2X2M U35 ( .A(error_check_edge[5]), .B(edge_count[5]), .Y(n28) );
  CLKXOR2X2M U36 ( .A(error_check_edge[4]), .B(edge_count[4]), .Y(n27) );
  NAND3BX1M U37 ( .AN(bit_count[2]), .B(bit_count[3]), .C(stp_chk_en), .Y(n26)
         );
  NOR2X1M U38 ( .A(n22), .B(n7), .Y(stp_chk_en) );
  NAND4X1M U39 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n25) );
  XNOR2X1M U40 ( .A(edge_count[2]), .B(error_check_edge[2]), .Y(n32) );
  NOR2X1M U41 ( .A(n33), .B(n34), .Y(n31) );
  CLKXOR2X2M U42 ( .A(error_check_edge[0]), .B(edge_count[0]), .Y(n33) );
  XNOR2X1M U43 ( .A(edge_count[3]), .B(error_check_edge[3]), .Y(n30) );
  MXI2X1M U44 ( .A(n35), .B(n36), .S0(parity_enable), .Y(n29) );
  CLKNAND2X2M U45 ( .A(bit_count[1]), .B(n14), .Y(n36) );
  OR2X1M U46 ( .A(bit_count[1]), .B(n14), .Y(n35) );
  MXI2X1M U47 ( .A(S_DATA), .B(n37), .S0(current_state[0]), .Y(n23) );
  NOR4BX1M U48 ( .AN(strt_glitch), .B(bit_count[3]), .C(bit_count[0]), .D(n38), 
        .Y(n37) );
  CLKINVX1M U49 ( .A(n9), .Y(n19) );
  NAND3X1M U50 ( .A(n11), .B(n14), .C(bit_count[3]), .Y(n9) );
  CLKINVX1M U51 ( .A(bit_count[0]), .Y(n14) );
  CLKINVX1M U52 ( .A(n38), .Y(n11) );
  CLKNAND2X2M U53 ( .A(n39), .B(n40), .Y(n38) );
  NOR4X1M U54 ( .A(bit_count[2]), .B(bit_count[1]), .C(n41), .D(n42), .Y(n40)
         );
  CLKXOR2X2M U55 ( .A(edge_count[0]), .B(check_edge[0]), .Y(n42) );
  CLKXOR2X2M U56 ( .A(edge_count[4]), .B(check_edge[4]), .Y(n41) );
  NOR4X1M U57 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n39) );
  CLKXOR2X2M U58 ( .A(edge_count[3]), .B(check_edge[3]), .Y(n46) );
  CLKXOR2X2M U59 ( .A(edge_count[2]), .B(check_edge[2]), .Y(n45) );
  CLKXOR2X2M U60 ( .A(edge_count[5]), .B(check_edge[5]), .Y(n44) );
  CLKXOR2X2M U61 ( .A(edge_count[1]), .B(check_edge[1]), .Y(n43) );
  CLKNAND2X2M U62 ( .A(n6), .B(n7), .Y(edge_bit_en) );
  CLKNAND2X2M U63 ( .A(current_state[1]), .B(n47), .Y(n7) );
  CLKINVX1M U64 ( .A(n8), .Y(deser_en) );
  NAND3X1M U65 ( .A(current_state[1]), .B(n22), .C(current_state[0]), .Y(n8)
         );
  CLKINVX1M U66 ( .A(current_state[2]), .Y(n22) );
  NOR3X1M U67 ( .A(n18), .B(stp_err), .C(par_err), .Y(data_valid) );
  NAND3X1M U68 ( .A(current_state[2]), .B(current_state[1]), .C(
        current_state[0]), .Y(n18) );
  CLKNAND2X2M U69 ( .A(n21), .B(n6), .Y(dat_samp_en) );
  AO21XLM U70 ( .A0(n47), .A1(S_DATA), .B0(current_state[2]), .Y(n6) );
  CLKINVX1M U71 ( .A(current_state[0]), .Y(n47) );
  CLKINVX1M U72 ( .A(current_state[1]), .Y(n21) );
endmodule


module edge_bit_counter ( CLK, RST, Enable, Prescale, bit_count, edge_count );
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  input CLK, RST, Enable;
  wire   N8, N9, N10, N11, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, n4, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, \add_31/carry[5] , \add_31/carry[4] , \add_31/carry[3] ,
         \add_31/carry[2] , n1, n2, n3, n5, n6, n7, n8, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33;

  DFFRX1M \bit_count_reg[3]  ( .D(n17), .CK(CLK), .RN(RST), .Q(bit_count[3]), 
        .QN(n4) );
  DFFRQX2M \bit_count_reg[2]  ( .D(n18), .CK(CLK), .RN(RST), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_count[1])
         );
  DFFRQX2M \bit_count_reg[0]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_count[0])
         );
  DFFRQX2M \edge_count_reg[5]  ( .D(N24), .CK(CLK), .RN(RST), .Q(edge_count[5]) );
  DFFRQX2M \edge_count_reg[4]  ( .D(N23), .CK(CLK), .RN(RST), .Q(edge_count[4]) );
  DFFRQX2M \edge_count_reg[3]  ( .D(N22), .CK(CLK), .RN(RST), .Q(edge_count[3]) );
  DFFRQX2M \edge_count_reg[2]  ( .D(N21), .CK(CLK), .RN(RST), .Q(edge_count[2]) );
  DFFRQX2M \edge_count_reg[1]  ( .D(N20), .CK(CLK), .RN(RST), .Q(edge_count[1]) );
  DFFRQX2M \edge_count_reg[0]  ( .D(N19), .CK(CLK), .RN(RST), .Q(edge_count[0]) );
  INVX2M U3 ( .A(n13), .Y(n29) );
  INVX2M U4 ( .A(Enable), .Y(n33) );
  NOR2X2M U5 ( .A(n33), .B(N31), .Y(n13) );
  AOI21X2M U6 ( .A0(n30), .A1(Enable), .B0(n13), .Y(n16) );
  NOR2BX2M U7 ( .AN(N8), .B(n29), .Y(N20) );
  NOR2BX2M U8 ( .AN(N9), .B(n29), .Y(N21) );
  NOR2BX2M U9 ( .AN(N10), .B(n29), .Y(N22) );
  NOR2BX2M U10 ( .AN(N11), .B(n29), .Y(N23) );
  OAI32X1M U11 ( .A0(n33), .A1(bit_count[0]), .A2(n13), .B0(n30), .B1(n29), 
        .Y(n20) );
  OAI32X1M U12 ( .A0(n14), .A1(bit_count[2]), .A2(n31), .B0(n15), .B1(n32), 
        .Y(n18) );
  AOI21BX2M U13 ( .A0(Enable), .A1(n31), .B0N(n16), .Y(n15) );
  NAND3X2M U14 ( .A(bit_count[0]), .B(n29), .C(Enable), .Y(n14) );
  OAI22X1M U15 ( .A0(n16), .A1(n31), .B0(bit_count[1]), .B1(n14), .Y(n19) );
  NOR2X2M U16 ( .A(n1), .B(n29), .Y(N24) );
  XNOR2X2M U17 ( .A(\add_31/carry[5] ), .B(edge_count[5]), .Y(n1) );
  NOR2X2M U18 ( .A(edge_count[0]), .B(n29), .Y(N19) );
  OAI32X1M U19 ( .A0(n9), .A1(n10), .A2(n33), .B0(n11), .B1(n4), .Y(n17) );
  NAND3X2M U20 ( .A(N31), .B(n4), .C(bit_count[2]), .Y(n9) );
  NOR2X2M U21 ( .A(n12), .B(n13), .Y(n11) );
  AOI2BB1X2M U22 ( .A0N(n10), .A1N(n32), .B0(n33), .Y(n12) );
  NAND2X2M U23 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n10) );
  INVX2M U24 ( .A(bit_count[0]), .Y(n30) );
  INVX2M U25 ( .A(bit_count[1]), .Y(n31) );
  ADDHX1M U26 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_31/carry[2] ), 
        .S(N8) );
  ADDHX1M U27 ( .A(edge_count[2]), .B(\add_31/carry[2] ), .CO(
        \add_31/carry[3] ), .S(N9) );
  ADDHX1M U28 ( .A(edge_count[3]), .B(\add_31/carry[3] ), .CO(
        \add_31/carry[4] ), .S(N10) );
  INVX2M U29 ( .A(bit_count[2]), .Y(n32) );
  ADDHX1M U30 ( .A(edge_count[4]), .B(\add_31/carry[4] ), .CO(
        \add_31/carry[5] ), .S(N11) );
  OR2X2M U31 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U32 ( .A(Prescale[3]), .Y(n7) );
  CLKINVX1M U33 ( .A(Prescale[0]), .Y(N25) );
  OAI2BB1X1M U34 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N26) );
  NOR2X1M U35 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U36 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N27) );
  CLKNAND2X2M U37 ( .A(n3), .B(n7), .Y(n5) );
  OAI21X1M U38 ( .A0(n3), .A1(n7), .B0(n5), .Y(N28) );
  XNOR2X1M U39 ( .A(Prescale[4]), .B(n5), .Y(N29) );
  NOR2X1M U40 ( .A(Prescale[4]), .B(n5), .Y(n6) );
  CLKXOR2X2M U41 ( .A(Prescale[5]), .B(n6), .Y(N30) );
  NOR2BX1M U42 ( .AN(edge_count[0]), .B(N25), .Y(n8) );
  OAI2B2X1M U43 ( .A1N(N26), .A0(n8), .B0(edge_count[1]), .B1(n8), .Y(n24) );
  NOR2BX1M U44 ( .AN(N25), .B(edge_count[0]), .Y(n21) );
  OAI2B2X1M U45 ( .A1N(edge_count[1]), .A0(n21), .B0(N26), .B1(n21), .Y(n23)
         );
  XNOR2X1M U46 ( .A(N30), .B(edge_count[5]), .Y(n22) );
  NAND3X1M U47 ( .A(n24), .B(n23), .C(n22), .Y(n28) );
  CLKXOR2X2M U48 ( .A(N29), .B(edge_count[4]), .Y(n27) );
  CLKXOR2X2M U49 ( .A(N27), .B(edge_count[2]), .Y(n26) );
  CLKXOR2X2M U50 ( .A(N28), .B(edge_count[3]), .Y(n25) );
  NOR4X1M U51 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(N31) );
endmodule


module data_sampling ( CLK, RST, S_DATA, Prescale, edge_count, Enable, 
        sampled_bit );
  input [5:0] Prescale;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, Enable;
  output sampled_bit;
  wire   N58, n19, n20, n21, \add_21/carry[4] , \add_21/carry[3] ,
         \add_21/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  wire   [4:0] half_edges;
  wire   [4:0] half_edges_p1;
  wire   [4:0] half_edges_n1;
  wire   [2:0] Samples;

  DFFRQX2M \Samples_reg[2]  ( .D(n21), .CK(CLK), .RN(RST), .Q(Samples[2]) );
  DFFRQX2M \Samples_reg[1]  ( .D(n20), .CK(CLK), .RN(RST), .Q(Samples[1]) );
  DFFRQX2M \Samples_reg[0]  ( .D(n19), .CK(CLK), .RN(RST), .Q(Samples[0]) );
  DFFRQX2M sampled_bit_reg ( .D(N58), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  INVX2M U3 ( .A(half_edges[2]), .Y(n8) );
  ADDHX1M U4 ( .A(half_edges[2]), .B(\add_21/carry[2] ), .CO(\add_21/carry[3] ), .S(half_edges_p1[2]) );
  ADDHX1M U5 ( .A(half_edges[1]), .B(half_edges[0]), .CO(\add_21/carry[2] ), 
        .S(half_edges_p1[1]) );
  ADDHX1M U6 ( .A(half_edges[3]), .B(\add_21/carry[3] ), .CO(\add_21/carry[4] ), .S(half_edges_p1[3]) );
  INVX2M U7 ( .A(Prescale[3]), .Y(n4) );
  CLKINVX1M U8 ( .A(Prescale[1]), .Y(half_edges[0]) );
  NOR2X1M U9 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n1) );
  AO21XLM U10 ( .A0(Prescale[1]), .A1(Prescale[2]), .B0(n1), .Y(half_edges[1])
         );
  CLKNAND2X2M U11 ( .A(n1), .B(n4), .Y(n2) );
  OAI21X1M U12 ( .A0(n1), .A1(n4), .B0(n2), .Y(half_edges[2]) );
  XNOR2X1M U13 ( .A(Prescale[4]), .B(n2), .Y(half_edges[3]) );
  NOR2X1M U14 ( .A(Prescale[4]), .B(n2), .Y(n3) );
  CLKXOR2X2M U15 ( .A(Prescale[5]), .B(n3), .Y(half_edges[4]) );
  CLKXOR2X2M U16 ( .A(\add_21/carry[4] ), .B(half_edges[4]), .Y(
        half_edges_p1[4]) );
  NOR2X1M U17 ( .A(half_edges[1]), .B(half_edges[0]), .Y(n5) );
  AO21XLM U18 ( .A0(half_edges[0]), .A1(half_edges[1]), .B0(n5), .Y(
        half_edges_n1[1]) );
  CLKNAND2X2M U19 ( .A(n5), .B(n8), .Y(n6) );
  OAI21X1M U20 ( .A0(n5), .A1(n8), .B0(n6), .Y(half_edges_n1[2]) );
  XNOR2X1M U21 ( .A(half_edges[3]), .B(n6), .Y(half_edges_n1[3]) );
  NOR2X1M U22 ( .A(half_edges[3]), .B(n6), .Y(n7) );
  CLKXOR2X2M U23 ( .A(half_edges[4]), .B(n7), .Y(half_edges_n1[4]) );
  MXI2X1M U24 ( .A(n9), .B(n10), .S0(n11), .Y(n21) );
  NOR2X1M U25 ( .A(n12), .B(n13), .Y(n11) );
  NAND4X1M U26 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n13) );
  CLKXOR2X2M U27 ( .A(n18), .B(half_edges_p1[1]), .Y(n17) );
  XNOR2X1M U28 ( .A(edge_count[2]), .B(half_edges_p1[2]), .Y(n16) );
  XNOR2X1M U29 ( .A(edge_count[3]), .B(half_edges_p1[3]), .Y(n15) );
  CLKXOR2X2M U30 ( .A(n22), .B(half_edges_p1[4]), .Y(n14) );
  NAND4BX1M U31 ( .AN(edge_count[5]), .B(n23), .C(n24), .D(n25), .Y(n12) );
  XNOR2X1M U32 ( .A(edge_count[0]), .B(Prescale[1]), .Y(n23) );
  CLKNAND2X2M U33 ( .A(Samples[2]), .B(Enable), .Y(n9) );
  MXI2X1M U34 ( .A(n10), .B(n26), .S0(n24), .Y(n20) );
  NAND4X1M U35 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n24) );
  NOR4BX1M U36 ( .AN(n25), .B(edge_count[5]), .C(n31), .D(n32), .Y(n30) );
  CLKXOR2X2M U37 ( .A(half_edges[1]), .B(edge_count[1]), .Y(n32) );
  CLKXOR2X2M U38 ( .A(half_edges[0]), .B(edge_count[0]), .Y(n31) );
  XNOR2X1M U39 ( .A(edge_count[3]), .B(half_edges[3]), .Y(n29) );
  CLKXOR2X2M U40 ( .A(n22), .B(half_edges[4]), .Y(n28) );
  CLKINVX1M U41 ( .A(edge_count[4]), .Y(n22) );
  XNOR2X1M U42 ( .A(edge_count[2]), .B(half_edges[2]), .Y(n27) );
  CLKNAND2X2M U43 ( .A(Samples[1]), .B(Enable), .Y(n26) );
  MXI2X1M U44 ( .A(n10), .B(n33), .S0(n25), .Y(n19) );
  NAND4X1M U45 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n25) );
  NOR3X1M U46 ( .A(n38), .B(edge_count[5]), .C(n39), .Y(n37) );
  CLKXOR2X2M U47 ( .A(Prescale[1]), .B(edge_count[0]), .Y(n39) );
  CLKXOR2X2M U48 ( .A(half_edges_n1[4]), .B(edge_count[4]), .Y(n38) );
  XNOR2X1M U49 ( .A(edge_count[2]), .B(half_edges_n1[2]), .Y(n36) );
  XNOR2X1M U50 ( .A(edge_count[3]), .B(half_edges_n1[3]), .Y(n35) );
  CLKXOR2X2M U51 ( .A(n18), .B(half_edges_n1[1]), .Y(n34) );
  CLKINVX1M U52 ( .A(edge_count[1]), .Y(n18) );
  CLKNAND2X2M U53 ( .A(Samples[0]), .B(Enable), .Y(n33) );
  CLKNAND2X2M U54 ( .A(S_DATA), .B(Enable), .Y(n10) );
  AOI21BX1M U55 ( .A0(n40), .A1(n41), .B0N(Enable), .Y(N58) );
  OAI21X1M U56 ( .A0(Samples[0]), .A1(Samples[1]), .B0(Samples[2]), .Y(n41) );
  CLKNAND2X2M U57 ( .A(Samples[0]), .B(Samples[1]), .Y(n40) );
endmodule


module deserializer_DATA_WIDTH8 ( CLK, RST, sampled_bit, Enable, edge_count, 
        Prescale, P_DATA );
  input [5:0] edge_count;
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, Enable;
  wire   N1, N2, N3, N4, N5, N6, N7, n1, n10, n11, n12, n13, n14, n15, n16,
         n17, n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31;

  DFFRQX2M \P_DATA_reg[0]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  OAI22X1M U3 ( .A0(n31), .A1(n30), .B0(n1), .B1(n29), .Y(n11) );
  OAI22X1M U4 ( .A0(n31), .A1(n29), .B0(n1), .B1(n28), .Y(n12) );
  OAI22X1M U5 ( .A0(n31), .A1(n28), .B0(n1), .B1(n27), .Y(n13) );
  OAI22X1M U6 ( .A0(n31), .A1(n27), .B0(n1), .B1(n26), .Y(n14) );
  OAI22X1M U7 ( .A0(n31), .A1(n26), .B0(n1), .B1(n25), .Y(n15) );
  OAI22X1M U8 ( .A0(n31), .A1(n25), .B0(n1), .B1(n24), .Y(n16) );
  INVX2M U9 ( .A(n1), .Y(n31) );
  NAND2X2M U10 ( .A(N7), .B(Enable), .Y(n1) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n30), .A0N(P_DATA[0]), .A1N(n1), .Y(n10) );
  OAI2BB2X1M U12 ( .B0(n31), .B1(n24), .A0N(sampled_bit), .A1N(n31), .Y(n17)
         );
  INVX2M U13 ( .A(P_DATA[2]), .Y(n29) );
  INVX2M U14 ( .A(P_DATA[6]), .Y(n25) );
  INVX2M U15 ( .A(P_DATA[7]), .Y(n24) );
  INVX2M U16 ( .A(P_DATA[3]), .Y(n28) );
  INVX2M U17 ( .A(P_DATA[1]), .Y(n30) );
  INVX2M U18 ( .A(P_DATA[4]), .Y(n27) );
  INVX2M U19 ( .A(P_DATA[5]), .Y(n26) );
  OR2X2M U20 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U21 ( .A(Prescale[3]), .Y(n6) );
  CLKINVX1M U22 ( .A(Prescale[0]), .Y(N1) );
  OAI2BB1X1M U23 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N2) );
  NOR2X1M U24 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U25 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N3) );
  CLKNAND2X2M U26 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U27 ( .A0(n3), .A1(n6), .B0(n4), .Y(N4) );
  XNOR2X1M U28 ( .A(Prescale[4]), .B(n4), .Y(N5) );
  NOR2X1M U29 ( .A(Prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U30 ( .A(Prescale[5]), .B(n5), .Y(N6) );
  NOR2BX1M U31 ( .AN(edge_count[0]), .B(N1), .Y(n7) );
  OAI2B2X1M U32 ( .A1N(N2), .A0(n7), .B0(edge_count[1]), .B1(n7), .Y(n19) );
  NOR2BX1M U33 ( .AN(N1), .B(edge_count[0]), .Y(n8) );
  OAI2B2X1M U34 ( .A1N(edge_count[1]), .A0(n8), .B0(N2), .B1(n8), .Y(n18) );
  XNOR2X1M U35 ( .A(N6), .B(edge_count[5]), .Y(n9) );
  NAND3X1M U36 ( .A(n19), .B(n18), .C(n9), .Y(n23) );
  CLKXOR2X2M U37 ( .A(N5), .B(edge_count[4]), .Y(n22) );
  CLKXOR2X2M U38 ( .A(N3), .B(edge_count[2]), .Y(n21) );
  CLKXOR2X2M U39 ( .A(N4), .B(edge_count[3]), .Y(n20) );
  NOR4X1M U40 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(N7) );
endmodule


module strt_chk ( CLK, RST, sampled_bit, Enable, strt_glitch );
  input CLK, RST, sampled_bit, Enable;
  output strt_glitch;
  wire   n1;

  DFFRQX2M strt_glitch_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  AO2B2X2M U2 ( .B0(sampled_bit), .B1(Enable), .A0(strt_glitch), .A1N(Enable), 
        .Y(n1) );
endmodule


module par_chk_DATA_WIDTH8 ( CLK, RST, parity_type, sampled_bit, Enable, 
        P_DATA, par_err );
  input [7:0] P_DATA;
  input CLK, RST, parity_type, sampled_bit, Enable;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRQX2M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_err) );
  XNOR2X2M U2 ( .A(sampled_bit), .B(parity_type), .Y(n5) );
  OAI2BB2X1M U3 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  INVX2M U4 ( .A(Enable), .Y(n2) );
  XOR3XLM U5 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  XOR3XLM U6 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U7 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U9 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
endmodule


module stp_chk ( CLK, RST, sampled_bit, Enable, stp_err );
  input CLK, RST, sampled_bit, Enable;
  output stp_err;
  wire   n2, n1;

  DFFRQX2M stp_err_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_err) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(Enable), .Y(n1) );
endmodule


module UART_RX ( CLK, RST, RX_IN, parity_enable, parity_type, Prescale, P_DATA, 
        data_valid, parity_error, framing_error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, parity_enable, parity_type;
  output data_valid, parity_error, framing_error;
  wire   strt_glitch, strt_chk_en, edge_bit_en, deser_en, par_chk_en,
         stp_chk_en, dat_samp_en, sampled_bit, n1, n2;
  wire   [3:0] bit_count;
  wire   [5:0] edge_count;

  uart_rx_fsm_DATA_WIDTH8 U0_uart_fsm ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .parity_enable(parity_enable), .bit_count(
        bit_count), .edge_count(edge_count), .par_err(parity_error), .stp_err(
        framing_error), .strt_glitch(strt_glitch), .strt_chk_en(strt_chk_en), 
        .edge_bit_en(edge_bit_en), .deser_en(deser_en), .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .dat_samp_en(dat_samp_en), .data_valid(data_valid)
         );
  edge_bit_counter U0_edge_bit_counter ( .CLK(CLK), .RST(n1), .Enable(
        edge_bit_en), .Prescale(Prescale), .bit_count(bit_count), .edge_count(
        edge_count) );
  data_sampling U0_data_sampling ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .edge_count(edge_count), .Enable(dat_samp_en), 
        .sampled_bit(sampled_bit) );
  deserializer_DATA_WIDTH8 U0_deserializer ( .CLK(CLK), .RST(n1), 
        .sampled_bit(sampled_bit), .Enable(deser_en), .edge_count(edge_count), 
        .Prescale(Prescale), .P_DATA(P_DATA) );
  strt_chk U0_strt_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(strt_chk_en), .strt_glitch(strt_glitch) );
  par_chk_DATA_WIDTH8 U0_par_chk ( .CLK(CLK), .RST(n1), .parity_type(
        parity_type), .sampled_bit(sampled_bit), .Enable(par_chk_en), .P_DATA(
        P_DATA), .par_err(parity_error) );
  stp_chk U0_stp_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(stp_chk_en), .stp_err(framing_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_DATA_WIDTH8 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, 
        TX_IN_P, TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, 
        parity_type, parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  wire   n1, n2;

  UART_TX_DATA_WIDTH8 U0_UART_TX ( .CLK(TX_CLK), .RST(n1), .P_DATA(TX_IN_P), 
        .Data_Valid(TX_IN_V), .parity_enable(parity_enable), .parity_type(
        parity_type), .TX_OUT(TX_OUT_S), .busy(TX_OUT_V) );
  UART_RX U0_UART_RX ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), 
        .parity_enable(parity_enable), .parity_type(parity_type), .Prescale(
        Prescale), .P_DATA(RX_OUT_P), .data_valid(RX_OUT_V), .parity_error(
        parity_error), .framing_error(framing_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module DATA_SYNC_BUS_WIDTH8_NUM_STAGES2 ( Unsync_bus, bus_enable, CLK, RST, 
        sync_bus, enable_pusle );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, CLK, RST;
  output enable_pusle;
  wire   pulse_ff, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_ff;

  DFFRQX2M pulse_ff_reg ( .D(sync_ff[0]), .CK(CLK), .RN(RST), .Q(pulse_ff) );
  DFFRQX2M \sync_ff_reg[0]  ( .D(sync_ff[1]), .CK(CLK), .RN(RST), .Q(
        sync_ff[0]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M enable_pusle_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pusle) );
  DFFRQX2M \sync_ff_reg[1]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_ff[1]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(pulse_ff), .B(sync_ff[0]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(Unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(Unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(Unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(Unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(Unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(Unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(Unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module RegFile_WIDTH8_DEPTH16_ADDR4 ( WrData, Address, WrEn, RdEn, CLK, RST, 
        RdData, RdData_VLD, REG0, REG1, REG2, REG3 );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WrEn, RdEn, CLK, RST;
  output RdData_VLD;
  wire   N11, N12, N13, N14, \mem[15][7] , \mem[15][6] , \mem[15][5] ,
         \mem[15][4] , \mem[15][3] , \mem[15][2] , \mem[15][1] , \mem[15][0] ,
         \mem[14][7] , \mem[14][6] , \mem[14][5] , \mem[14][4] , \mem[14][3] ,
         \mem[14][2] , \mem[14][1] , \mem[14][0] , \mem[13][7] , \mem[13][6] ,
         \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] , \mem[13][1] ,
         \mem[13][0] , \mem[12][7] , \mem[12][6] , \mem[12][5] , \mem[12][4] ,
         \mem[12][3] , \mem[12][2] , \mem[12][1] , \mem[12][0] , \mem[11][7] ,
         \mem[11][6] , \mem[11][5] , \mem[11][4] , \mem[11][3] , \mem[11][2] ,
         \mem[11][1] , \mem[11][0] , \mem[10][7] , \mem[10][6] , \mem[10][5] ,
         \mem[10][4] , \mem[10][3] , \mem[10][2] , \mem[10][1] , \mem[10][0] ,
         \mem[9][7] , \mem[9][6] , \mem[9][5] , \mem[9][4] , \mem[9][3] ,
         \mem[9][2] , \mem[9][1] , \mem[9][0] , \mem[8][7] , \mem[8][6] ,
         \mem[8][5] , \mem[8][4] , \mem[8][3] , \mem[8][2] , \mem[8][1] ,
         \mem[8][0] , \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[6][7] ,
         \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] ,
         \mem[6][1] , \mem[6][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] ,
         \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] ,
         \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] ,
         \mem[4][2] , \mem[4][1] , \mem[4][0] , N36, N37, N38, N39, N40, N41,
         N42, N43, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \mem_reg[15][7]  ( .D(n169), .CK(CLK), .RN(n279), .Q(\mem[15][7] )
         );
  DFFRQX2M \mem_reg[15][6]  ( .D(n168), .CK(CLK), .RN(n279), .Q(\mem[15][6] )
         );
  DFFRQX2M \mem_reg[15][5]  ( .D(n167), .CK(CLK), .RN(n279), .Q(\mem[15][5] )
         );
  DFFRQX2M \mem_reg[15][4]  ( .D(n166), .CK(CLK), .RN(n279), .Q(\mem[15][4] )
         );
  DFFRQX2M \mem_reg[15][3]  ( .D(n165), .CK(CLK), .RN(n279), .Q(\mem[15][3] )
         );
  DFFRQX2M \mem_reg[15][2]  ( .D(n164), .CK(CLK), .RN(n279), .Q(\mem[15][2] )
         );
  DFFRQX2M \mem_reg[15][1]  ( .D(n163), .CK(CLK), .RN(n279), .Q(\mem[15][1] )
         );
  DFFRQX2M \mem_reg[15][0]  ( .D(n162), .CK(CLK), .RN(n279), .Q(\mem[15][0] )
         );
  DFFRQX2M \mem_reg[13][7]  ( .D(n153), .CK(CLK), .RN(n280), .Q(\mem[13][7] )
         );
  DFFRQX2M \mem_reg[13][6]  ( .D(n152), .CK(CLK), .RN(n280), .Q(\mem[13][6] )
         );
  DFFRQX2M \mem_reg[13][5]  ( .D(n151), .CK(CLK), .RN(n280), .Q(\mem[13][5] )
         );
  DFFRQX2M \mem_reg[13][4]  ( .D(n150), .CK(CLK), .RN(n280), .Q(\mem[13][4] )
         );
  DFFRQX2M \mem_reg[13][3]  ( .D(n149), .CK(CLK), .RN(n280), .Q(\mem[13][3] )
         );
  DFFRQX2M \mem_reg[13][2]  ( .D(n148), .CK(CLK), .RN(n280), .Q(\mem[13][2] )
         );
  DFFRQX2M \mem_reg[13][1]  ( .D(n147), .CK(CLK), .RN(n280), .Q(\mem[13][1] )
         );
  DFFRQX2M \mem_reg[13][0]  ( .D(n146), .CK(CLK), .RN(n280), .Q(\mem[13][0] )
         );
  DFFRQX2M \mem_reg[11][7]  ( .D(n137), .CK(CLK), .RN(n281), .Q(\mem[11][7] )
         );
  DFFRQX2M \mem_reg[11][6]  ( .D(n136), .CK(CLK), .RN(n281), .Q(\mem[11][6] )
         );
  DFFRQX2M \mem_reg[11][5]  ( .D(n135), .CK(CLK), .RN(n281), .Q(\mem[11][5] )
         );
  DFFRQX2M \mem_reg[11][4]  ( .D(n134), .CK(CLK), .RN(n281), .Q(\mem[11][4] )
         );
  DFFRQX2M \mem_reg[11][3]  ( .D(n133), .CK(CLK), .RN(n281), .Q(\mem[11][3] )
         );
  DFFRQX2M \mem_reg[11][2]  ( .D(n132), .CK(CLK), .RN(n281), .Q(\mem[11][2] )
         );
  DFFRQX2M \mem_reg[11][1]  ( .D(n131), .CK(CLK), .RN(n281), .Q(\mem[11][1] )
         );
  DFFRQX2M \mem_reg[11][0]  ( .D(n130), .CK(CLK), .RN(n281), .Q(\mem[11][0] )
         );
  DFFRQX2M \mem_reg[9][7]  ( .D(n121), .CK(CLK), .RN(n282), .Q(\mem[9][7] ) );
  DFFRQX2M \mem_reg[9][6]  ( .D(n120), .CK(CLK), .RN(n282), .Q(\mem[9][6] ) );
  DFFRQX2M \mem_reg[9][5]  ( .D(n119), .CK(CLK), .RN(n282), .Q(\mem[9][5] ) );
  DFFRQX2M \mem_reg[9][4]  ( .D(n118), .CK(CLK), .RN(n282), .Q(\mem[9][4] ) );
  DFFRQX2M \mem_reg[9][3]  ( .D(n117), .CK(CLK), .RN(n282), .Q(\mem[9][3] ) );
  DFFRQX2M \mem_reg[9][2]  ( .D(n116), .CK(CLK), .RN(n282), .Q(\mem[9][2] ) );
  DFFRQX2M \mem_reg[9][1]  ( .D(n115), .CK(CLK), .RN(n282), .Q(\mem[9][1] ) );
  DFFRQX2M \mem_reg[9][0]  ( .D(n114), .CK(CLK), .RN(n284), .Q(\mem[9][0] ) );
  DFFRQX2M \mem_reg[7][7]  ( .D(n105), .CK(CLK), .RN(n283), .Q(\mem[7][7] ) );
  DFFRQX2M \mem_reg[7][6]  ( .D(n104), .CK(CLK), .RN(n283), .Q(\mem[7][6] ) );
  DFFRQX2M \mem_reg[7][5]  ( .D(n103), .CK(CLK), .RN(n283), .Q(\mem[7][5] ) );
  DFFRQX2M \mem_reg[7][4]  ( .D(n102), .CK(CLK), .RN(n283), .Q(\mem[7][4] ) );
  DFFRQX2M \mem_reg[7][3]  ( .D(n101), .CK(CLK), .RN(n283), .Q(\mem[7][3] ) );
  DFFRQX2M \mem_reg[7][2]  ( .D(n100), .CK(CLK), .RN(n285), .Q(\mem[7][2] ) );
  DFFRQX2M \mem_reg[7][1]  ( .D(n99), .CK(CLK), .RN(n285), .Q(\mem[7][1] ) );
  DFFRQX2M \mem_reg[7][0]  ( .D(n98), .CK(CLK), .RN(n285), .Q(\mem[7][0] ) );
  DFFRQX2M \mem_reg[5][7]  ( .D(n89), .CK(CLK), .RN(n284), .Q(\mem[5][7] ) );
  DFFRQX2M \mem_reg[5][6]  ( .D(n88), .CK(CLK), .RN(n284), .Q(\mem[5][6] ) );
  DFFRQX2M \mem_reg[5][5]  ( .D(n87), .CK(CLK), .RN(n284), .Q(\mem[5][5] ) );
  DFFRQX2M \mem_reg[5][4]  ( .D(n86), .CK(CLK), .RN(n284), .Q(\mem[5][4] ) );
  DFFRQX2M \mem_reg[5][3]  ( .D(n85), .CK(CLK), .RN(n286), .Q(\mem[5][3] ) );
  DFFRQX2M \mem_reg[5][2]  ( .D(n84), .CK(CLK), .RN(n286), .Q(\mem[5][2] ) );
  DFFRQX2M \mem_reg[5][1]  ( .D(n83), .CK(CLK), .RN(n286), .Q(\mem[5][1] ) );
  DFFRQX2M \mem_reg[5][0]  ( .D(n82), .CK(CLK), .RN(n286), .Q(\mem[5][0] ) );
  DFFRQX2M \mem_reg[14][7]  ( .D(n161), .CK(CLK), .RN(n279), .Q(\mem[14][7] )
         );
  DFFRQX2M \mem_reg[14][6]  ( .D(n160), .CK(CLK), .RN(n279), .Q(\mem[14][6] )
         );
  DFFRQX2M \mem_reg[14][5]  ( .D(n159), .CK(CLK), .RN(n281), .Q(\mem[14][5] )
         );
  DFFRQX2M \mem_reg[14][4]  ( .D(n158), .CK(CLK), .RN(n281), .Q(\mem[14][4] )
         );
  DFFRQX2M \mem_reg[14][3]  ( .D(n157), .CK(CLK), .RN(n281), .Q(\mem[14][3] )
         );
  DFFRQX2M \mem_reg[14][2]  ( .D(n156), .CK(CLK), .RN(n281), .Q(\mem[14][2] )
         );
  DFFRQX2M \mem_reg[14][1]  ( .D(n155), .CK(CLK), .RN(n281), .Q(\mem[14][1] )
         );
  DFFRQX2M \mem_reg[14][0]  ( .D(n154), .CK(CLK), .RN(n280), .Q(\mem[14][0] )
         );
  DFFRQX2M \mem_reg[12][7]  ( .D(n145), .CK(CLK), .RN(n280), .Q(\mem[12][7] )
         );
  DFFRQX2M \mem_reg[12][6]  ( .D(n144), .CK(CLK), .RN(n282), .Q(\mem[12][6] )
         );
  DFFRQX2M \mem_reg[12][5]  ( .D(n143), .CK(CLK), .RN(n282), .Q(\mem[12][5] )
         );
  DFFRQX2M \mem_reg[12][4]  ( .D(n142), .CK(CLK), .RN(n282), .Q(\mem[12][4] )
         );
  DFFRQX2M \mem_reg[12][3]  ( .D(n141), .CK(CLK), .RN(n282), .Q(\mem[12][3] )
         );
  DFFRQX2M \mem_reg[12][2]  ( .D(n140), .CK(CLK), .RN(n282), .Q(\mem[12][2] )
         );
  DFFRQX2M \mem_reg[12][1]  ( .D(n139), .CK(CLK), .RN(n281), .Q(\mem[12][1] )
         );
  DFFRQX2M \mem_reg[12][0]  ( .D(n138), .CK(CLK), .RN(n281), .Q(\mem[12][0] )
         );
  DFFRQX2M \mem_reg[10][7]  ( .D(n129), .CK(CLK), .RN(n283), .Q(\mem[10][7] )
         );
  DFFRQX2M \mem_reg[10][6]  ( .D(n128), .CK(CLK), .RN(n283), .Q(\mem[10][6] )
         );
  DFFRQX2M \mem_reg[10][5]  ( .D(n127), .CK(CLK), .RN(n283), .Q(\mem[10][5] )
         );
  DFFRQX2M \mem_reg[10][4]  ( .D(n126), .CK(CLK), .RN(n283), .Q(\mem[10][4] )
         );
  DFFRQX2M \mem_reg[10][3]  ( .D(n125), .CK(CLK), .RN(n283), .Q(\mem[10][3] )
         );
  DFFRQX2M \mem_reg[10][2]  ( .D(n124), .CK(CLK), .RN(n282), .Q(\mem[10][2] )
         );
  DFFRQX2M \mem_reg[10][1]  ( .D(n123), .CK(CLK), .RN(n282), .Q(\mem[10][1] )
         );
  DFFRQX2M \mem_reg[10][0]  ( .D(n122), .CK(CLK), .RN(n282), .Q(\mem[10][0] )
         );
  DFFRQX2M \mem_reg[8][7]  ( .D(n113), .CK(CLK), .RN(n284), .Q(\mem[8][7] ) );
  DFFRQX2M \mem_reg[8][6]  ( .D(n112), .CK(CLK), .RN(n284), .Q(\mem[8][6] ) );
  DFFRQX2M \mem_reg[8][5]  ( .D(n111), .CK(CLK), .RN(n284), .Q(\mem[8][5] ) );
  DFFRQX2M \mem_reg[8][4]  ( .D(n110), .CK(CLK), .RN(n284), .Q(\mem[8][4] ) );
  DFFRQX2M \mem_reg[8][3]  ( .D(n109), .CK(CLK), .RN(n284), .Q(\mem[8][3] ) );
  DFFRQX2M \mem_reg[8][2]  ( .D(n108), .CK(CLK), .RN(n283), .Q(\mem[8][2] ) );
  DFFRQX2M \mem_reg[8][1]  ( .D(n107), .CK(CLK), .RN(n283), .Q(\mem[8][1] ) );
  DFFRQX2M \mem_reg[8][0]  ( .D(n106), .CK(CLK), .RN(n283), .Q(\mem[8][0] ) );
  DFFRQX2M \mem_reg[6][7]  ( .D(n97), .CK(CLK), .RN(n285), .Q(\mem[6][7] ) );
  DFFRQX2M \mem_reg[6][6]  ( .D(n96), .CK(CLK), .RN(n285), .Q(\mem[6][6] ) );
  DFFRQX2M \mem_reg[6][5]  ( .D(n95), .CK(CLK), .RN(n285), .Q(\mem[6][5] ) );
  DFFRQX2M \mem_reg[6][4]  ( .D(n94), .CK(CLK), .RN(n284), .Q(\mem[6][4] ) );
  DFFRQX2M \mem_reg[6][3]  ( .D(n93), .CK(CLK), .RN(n284), .Q(\mem[6][3] ) );
  DFFRQX2M \mem_reg[6][2]  ( .D(n92), .CK(CLK), .RN(n284), .Q(\mem[6][2] ) );
  DFFRQX2M \mem_reg[6][1]  ( .D(n91), .CK(CLK), .RN(n284), .Q(\mem[6][1] ) );
  DFFRQX2M \mem_reg[6][0]  ( .D(n90), .CK(CLK), .RN(n284), .Q(\mem[6][0] ) );
  DFFRQX2M \mem_reg[4][7]  ( .D(n81), .CK(CLK), .RN(n286), .Q(\mem[4][7] ) );
  DFFRQX2M \mem_reg[4][6]  ( .D(n80), .CK(CLK), .RN(n286), .Q(\mem[4][6] ) );
  DFFRQX2M \mem_reg[4][5]  ( .D(n79), .CK(CLK), .RN(n285), .Q(\mem[4][5] ) );
  DFFRQX2M \mem_reg[4][4]  ( .D(n78), .CK(CLK), .RN(n285), .Q(\mem[4][4] ) );
  DFFRQX2M \mem_reg[4][3]  ( .D(n77), .CK(CLK), .RN(n285), .Q(\mem[4][3] ) );
  DFFRQX2M \mem_reg[4][2]  ( .D(n76), .CK(CLK), .RN(n285), .Q(\mem[4][2] ) );
  DFFRQX2M \mem_reg[4][1]  ( .D(n75), .CK(CLK), .RN(n285), .Q(\mem[4][1] ) );
  DFFRQX2M \mem_reg[4][0]  ( .D(n74), .CK(CLK), .RN(n285), .Q(\mem[4][0] ) );
  DFFRQX2M \mem_reg[3][0]  ( .D(n66), .CK(CLK), .RN(n287), .Q(REG3[0]) );
  DFFRQX2M \RdData_reg[7]  ( .D(n177), .CK(CLK), .RN(n287), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n176), .CK(CLK), .RN(n279), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n175), .CK(CLK), .RN(n283), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n174), .CK(CLK), .RN(n280), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n173), .CK(CLK), .RN(n280), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n172), .CK(CLK), .RN(n280), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n171), .CK(CLK), .RN(n280), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n170), .CK(CLK), .RN(n280), .Q(RdData[0]) );
  DFFRQX2M \mem_reg[3][7]  ( .D(n73), .CK(CLK), .RN(n285), .Q(REG3[7]) );
  DFFRQX2M \mem_reg[2][1]  ( .D(n59), .CK(CLK), .RN(n286), .Q(REG2[1]) );
  DFFSQX2M \mem_reg[2][0]  ( .D(n58), .CK(CLK), .SN(n279), .Q(REG2[0]) );
  DFFRQX2M RdData_VLD_reg ( .D(n41), .CK(CLK), .RN(n283), .Q(RdData_VLD) );
  DFFRQX2M \mem_reg[3][1]  ( .D(n67), .CK(CLK), .RN(n287), .Q(REG3[1]) );
  DFFSQX2M \mem_reg[3][5]  ( .D(n71), .CK(CLK), .SN(n279), .Q(REG3[5]) );
  DFFRQX2M \mem_reg[3][6]  ( .D(n72), .CK(CLK), .RN(n285), .Q(REG3[6]) );
  DFFRQX2M \mem_reg[3][3]  ( .D(n69), .CK(CLK), .RN(n287), .Q(REG3[3]) );
  DFFRQX2M \mem_reg[3][2]  ( .D(n68), .CK(CLK), .RN(n287), .Q(REG3[2]) );
  DFFRQX2M \mem_reg[3][4]  ( .D(n70), .CK(CLK), .RN(n285), .Q(REG3[4]) );
  DFFRQX2M \mem_reg[2][4]  ( .D(n62), .CK(CLK), .RN(n286), .Q(REG2[4]) );
  DFFSQX2M \mem_reg[2][7]  ( .D(n65), .CK(CLK), .SN(n279), .Q(REG2[7]) );
  DFFRQX2M \mem_reg[2][3]  ( .D(n61), .CK(CLK), .RN(n286), .Q(REG2[3]) );
  DFFRQX2M \mem_reg[2][6]  ( .D(n64), .CK(CLK), .RN(n287), .Q(REG2[6]) );
  DFFRQX2M \mem_reg[2][2]  ( .D(n60), .CK(CLK), .RN(n286), .Q(REG2[2]) );
  DFFRQX2M \mem_reg[0][1]  ( .D(n43), .CK(CLK), .RN(n287), .Q(REG0[1]) );
  DFFRQX2M \mem_reg[0][0]  ( .D(n42), .CK(CLK), .RN(n287), .Q(REG0[0]) );
  DFFRQX2M \mem_reg[0][2]  ( .D(n44), .CK(CLK), .RN(n287), .Q(REG0[2]) );
  DFFRQX2M \mem_reg[0][3]  ( .D(n45), .CK(CLK), .RN(n287), .Q(REG0[3]) );
  DFFRQX2M \mem_reg[0][4]  ( .D(n46), .CK(CLK), .RN(n287), .Q(REG0[4]) );
  DFFRQX2M \mem_reg[0][5]  ( .D(n47), .CK(CLK), .RN(n287), .Q(REG0[5]) );
  DFFRQX2M \mem_reg[0][7]  ( .D(n49), .CK(CLK), .RN(n287), .Q(REG0[7]) );
  DFFRQX2M \mem_reg[0][6]  ( .D(n48), .CK(CLK), .RN(n279), .Q(REG0[6]) );
  DFFRQX2M \mem_reg[1][6]  ( .D(n56), .CK(CLK), .RN(n286), .Q(REG1[6]) );
  DFFRQX2M \mem_reg[1][1]  ( .D(n51), .CK(CLK), .RN(n288), .Q(REG1[1]) );
  DFFRQX2M \mem_reg[1][5]  ( .D(n55), .CK(CLK), .RN(n286), .Q(REG1[5]) );
  DFFRQX2M \mem_reg[1][4]  ( .D(n54), .CK(CLK), .RN(n286), .Q(REG1[4]) );
  DFFRQX2M \mem_reg[1][7]  ( .D(n57), .CK(CLK), .RN(n286), .Q(REG1[7]) );
  DFFRQX2M \mem_reg[1][3]  ( .D(n53), .CK(CLK), .RN(n286), .Q(REG1[3]) );
  DFFRQX2M \mem_reg[1][2]  ( .D(n52), .CK(CLK), .RN(n288), .Q(REG1[2]) );
  DFFRQX2M \mem_reg[1][0]  ( .D(n50), .CK(CLK), .RN(n287), .Q(REG1[0]) );
  DFFRQX2M \mem_reg[2][5]  ( .D(n63), .CK(CLK), .RN(n287), .Q(REG2[5]) );
  NOR2X2M U3 ( .A(n271), .B(N13), .Y(n20) );
  NOR2X2M U4 ( .A(N12), .B(N13), .Y(n15) );
  INVX2M U5 ( .A(WrData[7]), .Y(n303) );
  INVX2M U6 ( .A(n275), .Y(n276) );
  INVX2M U7 ( .A(n1), .Y(n274) );
  INVX2M U8 ( .A(WrEn), .Y(n295) );
  INVX2M U9 ( .A(n40), .Y(n294) );
  OR2X2M U10 ( .A(n271), .B(n272), .Y(n1) );
  BUFX2M U11 ( .A(n2), .Y(n275) );
  INVX2M U12 ( .A(n4), .Y(n278) );
  INVX2M U13 ( .A(n3), .Y(n277) );
  NAND2X2M U14 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U15 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U16 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U17 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U18 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U19 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U20 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U21 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U22 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U23 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U24 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U25 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U26 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U27 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U28 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U29 ( .A(n15), .B(n16), .Y(n14) );
  NOR2X2M U30 ( .A(n295), .B(RdEn), .Y(n13) );
  AND2X2M U31 ( .A(n27), .B(n272), .Y(n16) );
  AND2X2M U32 ( .A(n38), .B(n272), .Y(n30) );
  NAND2X2M U33 ( .A(RdEn), .B(n295), .Y(n40) );
  BUFX2M U34 ( .A(n293), .Y(n279) );
  BUFX2M U35 ( .A(n290), .Y(n286) );
  BUFX2M U36 ( .A(n290), .Y(n285) );
  BUFX2M U37 ( .A(n291), .Y(n284) );
  BUFX2M U38 ( .A(n292), .Y(n282) );
  BUFX2M U39 ( .A(n292), .Y(n281) );
  BUFX2M U40 ( .A(n293), .Y(n280) );
  BUFX2M U41 ( .A(n291), .Y(n283) );
  BUFX2M U42 ( .A(n289), .Y(n287) );
  BUFX2M U43 ( .A(n289), .Y(n288) );
  OR2X2M U44 ( .A(n271), .B(N11), .Y(n2) );
  OR2X2M U45 ( .A(n272), .B(N12), .Y(n3) );
  OR2X2M U46 ( .A(N11), .B(N12), .Y(n4) );
  INVX2M U47 ( .A(N11), .Y(n272) );
  INVX2M U48 ( .A(N13), .Y(n273) );
  INVX2M U49 ( .A(N12), .Y(n271) );
  INVX2M U50 ( .A(WrData[0]), .Y(n302) );
  INVX2M U51 ( .A(WrData[5]), .Y(n297) );
  AND2X2M U52 ( .A(n27), .B(N11), .Y(n18) );
  AND2X2M U53 ( .A(n38), .B(N11), .Y(n32) );
  AND2X2M U54 ( .A(N13), .B(N12), .Y(n26) );
  AND2X2M U55 ( .A(N13), .B(n271), .Y(n23) );
  NOR2BX2M U56 ( .AN(n13), .B(N14), .Y(n27) );
  INVX2M U57 ( .A(N14), .Y(n270) );
  AND2X2M U58 ( .A(N14), .B(n13), .Y(n38) );
  INVX2M U59 ( .A(WrData[1]), .Y(n301) );
  INVX2M U60 ( .A(WrData[2]), .Y(n300) );
  INVX2M U61 ( .A(WrData[3]), .Y(n299) );
  INVX2M U62 ( .A(WrData[4]), .Y(n298) );
  INVX2M U63 ( .A(WrData[6]), .Y(n296) );
  BUFX2M U64 ( .A(RST), .Y(n290) );
  BUFX2M U65 ( .A(RST), .Y(n292) );
  BUFX2M U66 ( .A(RST), .Y(n291) );
  BUFX2M U67 ( .A(RST), .Y(n293) );
  BUFX2M U68 ( .A(RST), .Y(n289) );
  AO22X1M U69 ( .A0(N43), .A1(n294), .B0(RdData[0]), .B1(n40), .Y(n170) );
  AO22X1M U70 ( .A0(N39), .A1(n294), .B0(RdData[4]), .B1(n40), .Y(n174) );
  AO22X1M U71 ( .A0(N37), .A1(n294), .B0(RdData[6]), .B1(n40), .Y(n176) );
  AO22X1M U72 ( .A0(N36), .A1(n294), .B0(RdData[7]), .B1(n40), .Y(n177) );
  AO22X1M U73 ( .A0(N42), .A1(n294), .B0(RdData[1]), .B1(n40), .Y(n171) );
  AO22X1M U74 ( .A0(N41), .A1(n294), .B0(RdData[2]), .B1(n40), .Y(n172) );
  AO22X1M U75 ( .A0(N40), .A1(n294), .B0(RdData[3]), .B1(n40), .Y(n173) );
  AO22X1M U76 ( .A0(N38), .A1(n294), .B0(RdData[5]), .B1(n40), .Y(n175) );
  OAI2BB2X1M U77 ( .B0(n14), .B1(n302), .A0N(REG0[0]), .A1N(n14), .Y(n42) );
  OAI2BB2X1M U78 ( .B0(n14), .B1(n301), .A0N(REG0[1]), .A1N(n14), .Y(n43) );
  OAI2BB2X1M U79 ( .B0(n14), .B1(n300), .A0N(REG0[2]), .A1N(n14), .Y(n44) );
  OAI2BB2X1M U80 ( .B0(n14), .B1(n299), .A0N(REG0[3]), .A1N(n14), .Y(n45) );
  OAI2BB2X1M U81 ( .B0(n14), .B1(n298), .A0N(REG0[4]), .A1N(n14), .Y(n46) );
  OAI2BB2X1M U82 ( .B0(n14), .B1(n297), .A0N(REG0[5]), .A1N(n14), .Y(n47) );
  OAI2BB2X1M U83 ( .B0(n14), .B1(n296), .A0N(REG0[6]), .A1N(n14), .Y(n48) );
  OAI2BB2X1M U84 ( .B0(n14), .B1(n303), .A0N(REG0[7]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U85 ( .B0(n301), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n59) );
  OAI2BB2X1M U86 ( .B0(n300), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n60) );
  OAI2BB2X1M U87 ( .B0(n299), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n61) );
  OAI2BB2X1M U88 ( .B0(n298), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n62) );
  OAI2BB2X1M U89 ( .B0(n297), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n63) );
  OAI2BB2X1M U90 ( .B0(n296), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n64) );
  OAI2BB2X1M U91 ( .B0(n302), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n66) );
  OAI2BB2X1M U92 ( .B0(n301), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n67) );
  OAI2BB2X1M U93 ( .B0(n300), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n68) );
  OAI2BB2X1M U94 ( .B0(n299), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n69) );
  OAI2BB2X1M U95 ( .B0(n298), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n70) );
  OAI2BB2X1M U96 ( .B0(n296), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n72) );
  OAI2BB2X1M U97 ( .B0(n303), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U98 ( .B0(n302), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n50) );
  OAI2BB2X1M U99 ( .B0(n301), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n51) );
  OAI2BB2X1M U100 ( .B0(n300), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n52) );
  OAI2BB2X1M U101 ( .B0(n299), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n53) );
  OAI2BB2X1M U102 ( .B0(n298), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n54) );
  OAI2BB2X1M U103 ( .B0(n297), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n55) );
  OAI2BB2X1M U104 ( .B0(n296), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n56) );
  OAI2BB2X1M U105 ( .B0(n303), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U106 ( .B0(n302), .B1(n29), .A0N(\mem[8][0] ), .A1N(n29), .Y(n106) );
  OAI2BB2X1M U107 ( .B0(n301), .B1(n29), .A0N(\mem[8][1] ), .A1N(n29), .Y(n107) );
  OAI2BB2X1M U108 ( .B0(n300), .B1(n29), .A0N(\mem[8][2] ), .A1N(n29), .Y(n108) );
  OAI2BB2X1M U109 ( .B0(n299), .B1(n29), .A0N(\mem[8][3] ), .A1N(n29), .Y(n109) );
  OAI2BB2X1M U110 ( .B0(n298), .B1(n29), .A0N(\mem[8][4] ), .A1N(n29), .Y(n110) );
  OAI2BB2X1M U111 ( .B0(n297), .B1(n29), .A0N(\mem[8][5] ), .A1N(n29), .Y(n111) );
  OAI2BB2X1M U112 ( .B0(n296), .B1(n29), .A0N(\mem[8][6] ), .A1N(n29), .Y(n112) );
  OAI2BB2X1M U113 ( .B0(n303), .B1(n29), .A0N(\mem[8][7] ), .A1N(n29), .Y(n113) );
  OAI2BB2X1M U114 ( .B0(n302), .B1(n31), .A0N(\mem[9][0] ), .A1N(n31), .Y(n114) );
  OAI2BB2X1M U115 ( .B0(n301), .B1(n31), .A0N(\mem[9][1] ), .A1N(n31), .Y(n115) );
  OAI2BB2X1M U116 ( .B0(n300), .B1(n31), .A0N(\mem[9][2] ), .A1N(n31), .Y(n116) );
  OAI2BB2X1M U117 ( .B0(n299), .B1(n31), .A0N(\mem[9][3] ), .A1N(n31), .Y(n117) );
  OAI2BB2X1M U118 ( .B0(n298), .B1(n31), .A0N(\mem[9][4] ), .A1N(n31), .Y(n118) );
  OAI2BB2X1M U119 ( .B0(n297), .B1(n31), .A0N(\mem[9][5] ), .A1N(n31), .Y(n119) );
  OAI2BB2X1M U120 ( .B0(n296), .B1(n31), .A0N(\mem[9][6] ), .A1N(n31), .Y(n120) );
  OAI2BB2X1M U121 ( .B0(n303), .B1(n31), .A0N(\mem[9][7] ), .A1N(n31), .Y(n121) );
  OAI2BB2X1M U122 ( .B0(n302), .B1(n33), .A0N(\mem[10][0] ), .A1N(n33), .Y(
        n122) );
  OAI2BB2X1M U123 ( .B0(n301), .B1(n33), .A0N(\mem[10][1] ), .A1N(n33), .Y(
        n123) );
  OAI2BB2X1M U124 ( .B0(n300), .B1(n33), .A0N(\mem[10][2] ), .A1N(n33), .Y(
        n124) );
  OAI2BB2X1M U125 ( .B0(n299), .B1(n33), .A0N(\mem[10][3] ), .A1N(n33), .Y(
        n125) );
  OAI2BB2X1M U126 ( .B0(n298), .B1(n33), .A0N(\mem[10][4] ), .A1N(n33), .Y(
        n126) );
  OAI2BB2X1M U127 ( .B0(n297), .B1(n33), .A0N(\mem[10][5] ), .A1N(n33), .Y(
        n127) );
  OAI2BB2X1M U128 ( .B0(n296), .B1(n33), .A0N(\mem[10][6] ), .A1N(n33), .Y(
        n128) );
  OAI2BB2X1M U129 ( .B0(n303), .B1(n33), .A0N(\mem[10][7] ), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U130 ( .B0(n302), .B1(n34), .A0N(\mem[11][0] ), .A1N(n34), .Y(
        n130) );
  OAI2BB2X1M U131 ( .B0(n301), .B1(n34), .A0N(\mem[11][1] ), .A1N(n34), .Y(
        n131) );
  OAI2BB2X1M U132 ( .B0(n300), .B1(n34), .A0N(\mem[11][2] ), .A1N(n34), .Y(
        n132) );
  OAI2BB2X1M U133 ( .B0(n299), .B1(n34), .A0N(\mem[11][3] ), .A1N(n34), .Y(
        n133) );
  OAI2BB2X1M U134 ( .B0(n298), .B1(n34), .A0N(\mem[11][4] ), .A1N(n34), .Y(
        n134) );
  OAI2BB2X1M U135 ( .B0(n297), .B1(n34), .A0N(\mem[11][5] ), .A1N(n34), .Y(
        n135) );
  OAI2BB2X1M U136 ( .B0(n296), .B1(n34), .A0N(\mem[11][6] ), .A1N(n34), .Y(
        n136) );
  OAI2BB2X1M U137 ( .B0(n303), .B1(n34), .A0N(\mem[11][7] ), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U138 ( .B0(n302), .B1(n24), .A0N(\mem[5][0] ), .A1N(n24), .Y(n82)
         );
  OAI2BB2X1M U139 ( .B0(n301), .B1(n24), .A0N(\mem[5][1] ), .A1N(n24), .Y(n83)
         );
  OAI2BB2X1M U140 ( .B0(n300), .B1(n24), .A0N(\mem[5][2] ), .A1N(n24), .Y(n84)
         );
  OAI2BB2X1M U141 ( .B0(n299), .B1(n24), .A0N(\mem[5][3] ), .A1N(n24), .Y(n85)
         );
  OAI2BB2X1M U142 ( .B0(n298), .B1(n24), .A0N(\mem[5][4] ), .A1N(n24), .Y(n86)
         );
  OAI2BB2X1M U143 ( .B0(n297), .B1(n24), .A0N(\mem[5][5] ), .A1N(n24), .Y(n87)
         );
  OAI2BB2X1M U144 ( .B0(n296), .B1(n24), .A0N(\mem[5][6] ), .A1N(n24), .Y(n88)
         );
  OAI2BB2X1M U145 ( .B0(n303), .B1(n24), .A0N(\mem[5][7] ), .A1N(n24), .Y(n89)
         );
  OAI2BB2X1M U146 ( .B0(n302), .B1(n28), .A0N(\mem[7][0] ), .A1N(n28), .Y(n98)
         );
  OAI2BB2X1M U147 ( .B0(n301), .B1(n28), .A0N(\mem[7][1] ), .A1N(n28), .Y(n99)
         );
  OAI2BB2X1M U148 ( .B0(n300), .B1(n28), .A0N(\mem[7][2] ), .A1N(n28), .Y(n100) );
  OAI2BB2X1M U149 ( .B0(n299), .B1(n28), .A0N(\mem[7][3] ), .A1N(n28), .Y(n101) );
  OAI2BB2X1M U150 ( .B0(n298), .B1(n28), .A0N(\mem[7][4] ), .A1N(n28), .Y(n102) );
  OAI2BB2X1M U151 ( .B0(n297), .B1(n28), .A0N(\mem[7][5] ), .A1N(n28), .Y(n103) );
  OAI2BB2X1M U152 ( .B0(n296), .B1(n28), .A0N(\mem[7][6] ), .A1N(n28), .Y(n104) );
  OAI2BB2X1M U153 ( .B0(n303), .B1(n28), .A0N(\mem[7][7] ), .A1N(n28), .Y(n105) );
  OAI2BB2X1M U154 ( .B0(n302), .B1(n22), .A0N(\mem[4][0] ), .A1N(n22), .Y(n74)
         );
  OAI2BB2X1M U155 ( .B0(n301), .B1(n22), .A0N(\mem[4][1] ), .A1N(n22), .Y(n75)
         );
  OAI2BB2X1M U156 ( .B0(n300), .B1(n22), .A0N(\mem[4][2] ), .A1N(n22), .Y(n76)
         );
  OAI2BB2X1M U157 ( .B0(n299), .B1(n22), .A0N(\mem[4][3] ), .A1N(n22), .Y(n77)
         );
  OAI2BB2X1M U158 ( .B0(n298), .B1(n22), .A0N(\mem[4][4] ), .A1N(n22), .Y(n78)
         );
  OAI2BB2X1M U159 ( .B0(n297), .B1(n22), .A0N(\mem[4][5] ), .A1N(n22), .Y(n79)
         );
  OAI2BB2X1M U160 ( .B0(n296), .B1(n22), .A0N(\mem[4][6] ), .A1N(n22), .Y(n80)
         );
  OAI2BB2X1M U161 ( .B0(n303), .B1(n22), .A0N(\mem[4][7] ), .A1N(n22), .Y(n81)
         );
  OAI2BB2X1M U162 ( .B0(n302), .B1(n25), .A0N(\mem[6][0] ), .A1N(n25), .Y(n90)
         );
  OAI2BB2X1M U163 ( .B0(n301), .B1(n25), .A0N(\mem[6][1] ), .A1N(n25), .Y(n91)
         );
  OAI2BB2X1M U164 ( .B0(n300), .B1(n25), .A0N(\mem[6][2] ), .A1N(n25), .Y(n92)
         );
  OAI2BB2X1M U165 ( .B0(n299), .B1(n25), .A0N(\mem[6][3] ), .A1N(n25), .Y(n93)
         );
  OAI2BB2X1M U166 ( .B0(n298), .B1(n25), .A0N(\mem[6][4] ), .A1N(n25), .Y(n94)
         );
  OAI2BB2X1M U167 ( .B0(n297), .B1(n25), .A0N(\mem[6][5] ), .A1N(n25), .Y(n95)
         );
  OAI2BB2X1M U168 ( .B0(n296), .B1(n25), .A0N(\mem[6][6] ), .A1N(n25), .Y(n96)
         );
  OAI2BB2X1M U169 ( .B0(n303), .B1(n25), .A0N(\mem[6][7] ), .A1N(n25), .Y(n97)
         );
  OAI2BB2X1M U170 ( .B0(n302), .B1(n35), .A0N(\mem[12][0] ), .A1N(n35), .Y(
        n138) );
  OAI2BB2X1M U171 ( .B0(n301), .B1(n35), .A0N(\mem[12][1] ), .A1N(n35), .Y(
        n139) );
  OAI2BB2X1M U172 ( .B0(n300), .B1(n35), .A0N(\mem[12][2] ), .A1N(n35), .Y(
        n140) );
  OAI2BB2X1M U173 ( .B0(n299), .B1(n35), .A0N(\mem[12][3] ), .A1N(n35), .Y(
        n141) );
  OAI2BB2X1M U174 ( .B0(n298), .B1(n35), .A0N(\mem[12][4] ), .A1N(n35), .Y(
        n142) );
  OAI2BB2X1M U175 ( .B0(n297), .B1(n35), .A0N(\mem[12][5] ), .A1N(n35), .Y(
        n143) );
  OAI2BB2X1M U176 ( .B0(n296), .B1(n35), .A0N(\mem[12][6] ), .A1N(n35), .Y(
        n144) );
  OAI2BB2X1M U177 ( .B0(n303), .B1(n35), .A0N(\mem[12][7] ), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U178 ( .B0(n302), .B1(n36), .A0N(\mem[13][0] ), .A1N(n36), .Y(
        n146) );
  OAI2BB2X1M U179 ( .B0(n301), .B1(n36), .A0N(\mem[13][1] ), .A1N(n36), .Y(
        n147) );
  OAI2BB2X1M U180 ( .B0(n300), .B1(n36), .A0N(\mem[13][2] ), .A1N(n36), .Y(
        n148) );
  OAI2BB2X1M U181 ( .B0(n299), .B1(n36), .A0N(\mem[13][3] ), .A1N(n36), .Y(
        n149) );
  OAI2BB2X1M U182 ( .B0(n298), .B1(n36), .A0N(\mem[13][4] ), .A1N(n36), .Y(
        n150) );
  OAI2BB2X1M U183 ( .B0(n297), .B1(n36), .A0N(\mem[13][5] ), .A1N(n36), .Y(
        n151) );
  OAI2BB2X1M U184 ( .B0(n296), .B1(n36), .A0N(\mem[13][6] ), .A1N(n36), .Y(
        n152) );
  OAI2BB2X1M U185 ( .B0(n303), .B1(n36), .A0N(\mem[13][7] ), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U186 ( .B0(n302), .B1(n37), .A0N(\mem[14][0] ), .A1N(n37), .Y(
        n154) );
  OAI2BB2X1M U187 ( .B0(n301), .B1(n37), .A0N(\mem[14][1] ), .A1N(n37), .Y(
        n155) );
  OAI2BB2X1M U188 ( .B0(n300), .B1(n37), .A0N(\mem[14][2] ), .A1N(n37), .Y(
        n156) );
  OAI2BB2X1M U189 ( .B0(n299), .B1(n37), .A0N(\mem[14][3] ), .A1N(n37), .Y(
        n157) );
  OAI2BB2X1M U190 ( .B0(n298), .B1(n37), .A0N(\mem[14][4] ), .A1N(n37), .Y(
        n158) );
  OAI2BB2X1M U191 ( .B0(n297), .B1(n37), .A0N(\mem[14][5] ), .A1N(n37), .Y(
        n159) );
  OAI2BB2X1M U192 ( .B0(n296), .B1(n37), .A0N(\mem[14][6] ), .A1N(n37), .Y(
        n160) );
  OAI2BB2X1M U193 ( .B0(n303), .B1(n37), .A0N(\mem[14][7] ), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U194 ( .B0(n302), .B1(n39), .A0N(\mem[15][0] ), .A1N(n39), .Y(
        n162) );
  OAI2BB2X1M U195 ( .B0(n301), .B1(n39), .A0N(\mem[15][1] ), .A1N(n39), .Y(
        n163) );
  OAI2BB2X1M U196 ( .B0(n300), .B1(n39), .A0N(\mem[15][2] ), .A1N(n39), .Y(
        n164) );
  OAI2BB2X1M U197 ( .B0(n299), .B1(n39), .A0N(\mem[15][3] ), .A1N(n39), .Y(
        n165) );
  OAI2BB2X1M U198 ( .B0(n298), .B1(n39), .A0N(\mem[15][4] ), .A1N(n39), .Y(
        n166) );
  OAI2BB2X1M U199 ( .B0(n297), .B1(n39), .A0N(\mem[15][5] ), .A1N(n39), .Y(
        n167) );
  OAI2BB2X1M U200 ( .B0(n296), .B1(n39), .A0N(\mem[15][6] ), .A1N(n39), .Y(
        n168) );
  OAI2BB2X1M U201 ( .B0(n303), .B1(n39), .A0N(\mem[15][7] ), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U202 ( .B0(n302), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n58) );
  OAI2BB2X1M U203 ( .B0(n303), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U204 ( .B0(n297), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n71) );
  AO21XLM U205 ( .A0(RdData_VLD), .A1(n13), .B0(n294), .Y(n41) );
  AOI22X1M U206 ( .A0(\mem[10][0] ), .A1(n276), .B0(\mem[11][0] ), .B1(n274), 
        .Y(n6) );
  AOI22X1M U207 ( .A0(\mem[8][0] ), .A1(n278), .B0(\mem[9][0] ), .B1(n277), 
        .Y(n5) );
  CLKNAND2X2M U208 ( .A(N14), .B(n273), .Y(n254) );
  AOI21X1M U209 ( .A0(n6), .A1(n5), .B0(n254), .Y(n181) );
  AOI22X1M U210 ( .A0(\mem[14][0] ), .A1(n276), .B0(\mem[15][0] ), .B1(n274), 
        .Y(n8) );
  AOI22X1M U211 ( .A0(\mem[12][0] ), .A1(n278), .B0(\mem[13][0] ), .B1(n277), 
        .Y(n7) );
  CLKNAND2X2M U212 ( .A(N14), .B(N13), .Y(n257) );
  AOI21X1M U213 ( .A0(n8), .A1(n7), .B0(n257), .Y(n180) );
  AOI22X1M U214 ( .A0(REG2[0]), .A1(n276), .B0(REG3[0]), .B1(n274), .Y(n10) );
  AOI22X1M U215 ( .A0(REG0[0]), .A1(n278), .B0(REG1[0]), .B1(n277), .Y(n9) );
  CLKNAND2X2M U216 ( .A(n273), .B(n270), .Y(n260) );
  AOI21X1M U217 ( .A0(n10), .A1(n9), .B0(n260), .Y(n179) );
  AOI22X1M U218 ( .A0(\mem[6][0] ), .A1(n276), .B0(\mem[7][0] ), .B1(n274), 
        .Y(n12) );
  AOI22X1M U219 ( .A0(\mem[4][0] ), .A1(n278), .B0(\mem[5][0] ), .B1(n277), 
        .Y(n11) );
  CLKNAND2X2M U220 ( .A(N13), .B(n270), .Y(n263) );
  AOI21X1M U221 ( .A0(n12), .A1(n11), .B0(n263), .Y(n178) );
  OR4X1M U222 ( .A(n181), .B(n180), .C(n179), .D(n178), .Y(N43) );
  AOI22X1M U223 ( .A0(\mem[10][1] ), .A1(n276), .B0(\mem[11][1] ), .B1(n274), 
        .Y(n183) );
  AOI22X1M U224 ( .A0(\mem[8][1] ), .A1(n278), .B0(\mem[9][1] ), .B1(n277), 
        .Y(n182) );
  AOI21X1M U225 ( .A0(n183), .A1(n182), .B0(n254), .Y(n193) );
  AOI22X1M U226 ( .A0(\mem[14][1] ), .A1(n276), .B0(\mem[15][1] ), .B1(n274), 
        .Y(n185) );
  AOI22X1M U227 ( .A0(\mem[12][1] ), .A1(n278), .B0(\mem[13][1] ), .B1(n277), 
        .Y(n184) );
  AOI21X1M U228 ( .A0(n185), .A1(n184), .B0(n257), .Y(n192) );
  AOI22X1M U229 ( .A0(REG2[1]), .A1(n276), .B0(REG3[1]), .B1(n274), .Y(n187)
         );
  AOI22X1M U230 ( .A0(REG0[1]), .A1(n278), .B0(REG1[1]), .B1(n277), .Y(n186)
         );
  AOI21X1M U231 ( .A0(n187), .A1(n186), .B0(n260), .Y(n191) );
  AOI22X1M U232 ( .A0(\mem[6][1] ), .A1(n276), .B0(\mem[7][1] ), .B1(n274), 
        .Y(n189) );
  AOI22X1M U233 ( .A0(\mem[4][1] ), .A1(n278), .B0(\mem[5][1] ), .B1(n277), 
        .Y(n188) );
  AOI21X1M U234 ( .A0(n189), .A1(n188), .B0(n263), .Y(n190) );
  OR4X1M U235 ( .A(n193), .B(n192), .C(n191), .D(n190), .Y(N42) );
  AOI22X1M U236 ( .A0(\mem[10][2] ), .A1(n276), .B0(\mem[11][2] ), .B1(n274), 
        .Y(n195) );
  AOI22X1M U237 ( .A0(\mem[8][2] ), .A1(n278), .B0(\mem[9][2] ), .B1(n277), 
        .Y(n194) );
  AOI21X1M U238 ( .A0(n195), .A1(n194), .B0(n254), .Y(n205) );
  AOI22X1M U239 ( .A0(\mem[14][2] ), .A1(n276), .B0(\mem[15][2] ), .B1(n274), 
        .Y(n197) );
  AOI22X1M U240 ( .A0(\mem[12][2] ), .A1(n278), .B0(\mem[13][2] ), .B1(n277), 
        .Y(n196) );
  AOI21X1M U241 ( .A0(n197), .A1(n196), .B0(n257), .Y(n204) );
  AOI22X1M U242 ( .A0(REG2[2]), .A1(n276), .B0(REG3[2]), .B1(n274), .Y(n199)
         );
  AOI22X1M U243 ( .A0(REG0[2]), .A1(n278), .B0(REG1[2]), .B1(n277), .Y(n198)
         );
  AOI21X1M U244 ( .A0(n199), .A1(n198), .B0(n260), .Y(n203) );
  AOI22X1M U245 ( .A0(\mem[6][2] ), .A1(n276), .B0(\mem[7][2] ), .B1(n274), 
        .Y(n201) );
  AOI22X1M U246 ( .A0(\mem[4][2] ), .A1(n278), .B0(\mem[5][2] ), .B1(n277), 
        .Y(n200) );
  AOI21X1M U247 ( .A0(n201), .A1(n200), .B0(n263), .Y(n202) );
  OR4X1M U248 ( .A(n205), .B(n204), .C(n203), .D(n202), .Y(N41) );
  AOI22X1M U249 ( .A0(\mem[10][3] ), .A1(n276), .B0(\mem[11][3] ), .B1(n274), 
        .Y(n207) );
  AOI22X1M U250 ( .A0(\mem[8][3] ), .A1(n278), .B0(\mem[9][3] ), .B1(n277), 
        .Y(n206) );
  AOI21X1M U251 ( .A0(n207), .A1(n206), .B0(n254), .Y(n217) );
  AOI22X1M U252 ( .A0(\mem[14][3] ), .A1(n276), .B0(\mem[15][3] ), .B1(n274), 
        .Y(n209) );
  AOI22X1M U253 ( .A0(\mem[12][3] ), .A1(n278), .B0(\mem[13][3] ), .B1(n277), 
        .Y(n208) );
  AOI21X1M U254 ( .A0(n209), .A1(n208), .B0(n257), .Y(n216) );
  AOI22X1M U255 ( .A0(REG2[3]), .A1(n276), .B0(REG3[3]), .B1(n274), .Y(n211)
         );
  AOI22X1M U256 ( .A0(REG0[3]), .A1(n278), .B0(REG1[3]), .B1(n277), .Y(n210)
         );
  AOI21X1M U257 ( .A0(n211), .A1(n210), .B0(n260), .Y(n215) );
  AOI22X1M U258 ( .A0(\mem[6][3] ), .A1(n276), .B0(\mem[7][3] ), .B1(n274), 
        .Y(n213) );
  AOI22X1M U259 ( .A0(\mem[4][3] ), .A1(n278), .B0(\mem[5][3] ), .B1(n277), 
        .Y(n212) );
  AOI21X1M U260 ( .A0(n213), .A1(n212), .B0(n263), .Y(n214) );
  OR4X1M U261 ( .A(n217), .B(n216), .C(n215), .D(n214), .Y(N40) );
  AOI22X1M U262 ( .A0(\mem[10][4] ), .A1(n276), .B0(\mem[11][4] ), .B1(n274), 
        .Y(n219) );
  AOI22X1M U263 ( .A0(\mem[8][4] ), .A1(n278), .B0(\mem[9][4] ), .B1(n277), 
        .Y(n218) );
  AOI21X1M U264 ( .A0(n219), .A1(n218), .B0(n254), .Y(n229) );
  AOI22X1M U265 ( .A0(\mem[14][4] ), .A1(n276), .B0(\mem[15][4] ), .B1(n274), 
        .Y(n221) );
  AOI22X1M U266 ( .A0(\mem[12][4] ), .A1(n278), .B0(\mem[13][4] ), .B1(n277), 
        .Y(n220) );
  AOI21X1M U267 ( .A0(n221), .A1(n220), .B0(n257), .Y(n228) );
  AOI22X1M U268 ( .A0(REG2[4]), .A1(n276), .B0(REG3[4]), .B1(n274), .Y(n223)
         );
  AOI22X1M U269 ( .A0(REG0[4]), .A1(n278), .B0(REG1[4]), .B1(n277), .Y(n222)
         );
  AOI21X1M U270 ( .A0(n223), .A1(n222), .B0(n260), .Y(n227) );
  AOI22X1M U271 ( .A0(\mem[6][4] ), .A1(n276), .B0(\mem[7][4] ), .B1(n274), 
        .Y(n225) );
  AOI22X1M U272 ( .A0(\mem[4][4] ), .A1(n278), .B0(\mem[5][4] ), .B1(n277), 
        .Y(n224) );
  AOI21X1M U273 ( .A0(n225), .A1(n224), .B0(n263), .Y(n226) );
  OR4X1M U274 ( .A(n229), .B(n228), .C(n227), .D(n226), .Y(N39) );
  AOI22X1M U275 ( .A0(\mem[10][5] ), .A1(n276), .B0(\mem[11][5] ), .B1(n274), 
        .Y(n231) );
  AOI22X1M U276 ( .A0(\mem[8][5] ), .A1(n278), .B0(\mem[9][5] ), .B1(n277), 
        .Y(n230) );
  AOI21X1M U277 ( .A0(n231), .A1(n230), .B0(n254), .Y(n241) );
  AOI22X1M U278 ( .A0(\mem[14][5] ), .A1(n276), .B0(\mem[15][5] ), .B1(n274), 
        .Y(n233) );
  AOI22X1M U279 ( .A0(\mem[12][5] ), .A1(n278), .B0(\mem[13][5] ), .B1(n277), 
        .Y(n232) );
  AOI21X1M U280 ( .A0(n233), .A1(n232), .B0(n257), .Y(n240) );
  AOI22X1M U281 ( .A0(REG2[5]), .A1(n276), .B0(REG3[5]), .B1(n274), .Y(n235)
         );
  AOI22X1M U282 ( .A0(REG0[5]), .A1(n278), .B0(REG1[5]), .B1(n277), .Y(n234)
         );
  AOI21X1M U283 ( .A0(n235), .A1(n234), .B0(n260), .Y(n239) );
  AOI22X1M U284 ( .A0(\mem[6][5] ), .A1(n276), .B0(\mem[7][5] ), .B1(n274), 
        .Y(n237) );
  AOI22X1M U285 ( .A0(\mem[4][5] ), .A1(n278), .B0(\mem[5][5] ), .B1(n277), 
        .Y(n236) );
  AOI21X1M U286 ( .A0(n237), .A1(n236), .B0(n263), .Y(n238) );
  OR4X1M U287 ( .A(n241), .B(n240), .C(n239), .D(n238), .Y(N38) );
  AOI22X1M U288 ( .A0(\mem[10][6] ), .A1(n276), .B0(\mem[11][6] ), .B1(n274), 
        .Y(n243) );
  AOI22X1M U289 ( .A0(\mem[8][6] ), .A1(n278), .B0(\mem[9][6] ), .B1(n277), 
        .Y(n242) );
  AOI21X1M U290 ( .A0(n243), .A1(n242), .B0(n254), .Y(n253) );
  AOI22X1M U291 ( .A0(\mem[14][6] ), .A1(n276), .B0(\mem[15][6] ), .B1(n274), 
        .Y(n245) );
  AOI22X1M U292 ( .A0(\mem[12][6] ), .A1(n278), .B0(\mem[13][6] ), .B1(n277), 
        .Y(n244) );
  AOI21X1M U293 ( .A0(n245), .A1(n244), .B0(n257), .Y(n252) );
  AOI22X1M U294 ( .A0(REG2[6]), .A1(n276), .B0(REG3[6]), .B1(n274), .Y(n247)
         );
  AOI22X1M U295 ( .A0(REG0[6]), .A1(n278), .B0(REG1[6]), .B1(n277), .Y(n246)
         );
  AOI21X1M U296 ( .A0(n247), .A1(n246), .B0(n260), .Y(n251) );
  AOI22X1M U297 ( .A0(\mem[6][6] ), .A1(n276), .B0(\mem[7][6] ), .B1(n274), 
        .Y(n249) );
  AOI22X1M U298 ( .A0(\mem[4][6] ), .A1(n278), .B0(\mem[5][6] ), .B1(n277), 
        .Y(n248) );
  AOI21X1M U299 ( .A0(n249), .A1(n248), .B0(n263), .Y(n250) );
  OR4X1M U300 ( .A(n253), .B(n252), .C(n251), .D(n250), .Y(N37) );
  AOI22X1M U301 ( .A0(\mem[10][7] ), .A1(n276), .B0(\mem[11][7] ), .B1(n274), 
        .Y(n256) );
  AOI22X1M U302 ( .A0(\mem[8][7] ), .A1(n278), .B0(\mem[9][7] ), .B1(n277), 
        .Y(n255) );
  AOI21X1M U303 ( .A0(n256), .A1(n255), .B0(n254), .Y(n269) );
  AOI22X1M U304 ( .A0(\mem[14][7] ), .A1(n276), .B0(\mem[15][7] ), .B1(n274), 
        .Y(n259) );
  AOI22X1M U305 ( .A0(\mem[12][7] ), .A1(n278), .B0(\mem[13][7] ), .B1(n277), 
        .Y(n258) );
  AOI21X1M U306 ( .A0(n259), .A1(n258), .B0(n257), .Y(n268) );
  AOI22X1M U307 ( .A0(REG2[7]), .A1(n276), .B0(REG3[7]), .B1(n274), .Y(n262)
         );
  AOI22X1M U308 ( .A0(REG0[7]), .A1(n278), .B0(REG1[7]), .B1(n277), .Y(n261)
         );
  AOI21X1M U309 ( .A0(n262), .A1(n261), .B0(n260), .Y(n267) );
  AOI22X1M U310 ( .A0(\mem[6][7] ), .A1(n276), .B0(\mem[7][7] ), .B1(n274), 
        .Y(n265) );
  AOI22X1M U311 ( .A0(\mem[4][7] ), .A1(n278), .B0(\mem[5][7] ), .B1(n277), 
        .Y(n264) );
  AOI21X1M U312 ( .A0(n265), .A1(n264), .B0(n263), .Y(n266) );
  OR4X1M U313 ( .A(n269), .B(n268), .C(n267), .D(n266), .Y(N36) );
endmodule


module SYS_CTRL_DATA_WIDTH8_ADDR4 ( CLK, RST, ALU_OUT, OUT_VALID, ALU_FUN, 
        ALU_EN, CLKG_EN, Address, WrEn, RdEn, WrData, RdData, RdData_Valid, 
        RX_P_DATA, RX_D_VLD, FIFO_P_DATA, WR_INC, FIFO_FULL, clk_div_en );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [7:0] FIFO_P_DATA;
  input CLK, RST, OUT_VALID, RdData_Valid, RX_D_VLD, FIFO_FULL;
  output ALU_EN, CLKG_EN, WrEn, RdEn, WR_INC, clk_div_en;
  wire   n12, n13, n14, n15, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n4, n5,
         n6, n7, n8, n9, n10, n11, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n91, n92, n93, n94, n95;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  DFFSX1M \Address_reg_reg[2]  ( .D(n89), .CK(CLK), .SN(RST), .QN(n13) );
  DFFRX1M \Address_reg_reg[3]  ( .D(n90), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \Address_reg_reg[0]  ( .D(n87), .CK(CLK), .RN(RST), .QN(n15) );
  DFFRX1M \Address_reg_reg[1]  ( .D(n88), .CK(CLK), .RN(RST), .QN(n14) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(RST), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  NOR2X2M U5 ( .A(n8), .B(n93), .Y(ALU_FUN[2]) );
  NOR2X2M U6 ( .A(n8), .B(n95), .Y(ALU_FUN[0]) );
  NOR2BX2M U7 ( .AN(current_state[2]), .B(current_state[1]), .Y(n82) );
  NOR2BX2M U8 ( .AN(current_state[1]), .B(current_state[2]), .Y(n86) );
  OAI221X1M U9 ( .A0(n75), .A1(n15), .B0(RX_D_VLD), .B1(n60), .C0(n84), .Y(
        Address[0]) );
  NAND4BX1M U10 ( .AN(n40), .B(n34), .C(n76), .D(n77), .Y(Address[2]) );
  OAI22X1M U11 ( .A0(n18), .A1(n94), .B0(n75), .B1(n14), .Y(Address[1]) );
  OAI22X1M U12 ( .A0(n18), .A1(n92), .B0(n75), .B1(n12), .Y(Address[3]) );
  INVX2M U13 ( .A(CLKG_EN), .Y(n8) );
  INVX2M U14 ( .A(WrEn), .Y(n9) );
  AND2X2M U15 ( .A(n54), .B(n66), .Y(n75) );
  INVX2M U16 ( .A(RdEn), .Y(n18) );
  AOI2BB1X2M U17 ( .A0N(n51), .A1N(n16), .B0(n5), .Y(WR_INC) );
  NAND3X2M U18 ( .A(n60), .B(n29), .C(n66), .Y(WrEn) );
  INVX2M U19 ( .A(n43), .Y(n16) );
  INVX2M U20 ( .A(n36), .Y(n7) );
  INVX2M U21 ( .A(n5), .Y(n6) );
  INVX2M U22 ( .A(n65), .Y(n21) );
  NAND2X2M U23 ( .A(n60), .B(n61), .Y(n31) );
  INVX2M U24 ( .A(n28), .Y(n11) );
  NAND2X2M U25 ( .A(n83), .B(n86), .Y(n36) );
  NAND2X2M U26 ( .A(n82), .B(n85), .Y(n43) );
  NAND2X2M U27 ( .A(n86), .B(n85), .Y(n28) );
  NOR2X2M U28 ( .A(n8), .B(n94), .Y(ALU_FUN[1]) );
  NAND2X2M U29 ( .A(n45), .B(n42), .Y(RdEn) );
  NAND2X2M U30 ( .A(n79), .B(n82), .Y(n45) );
  NAND2X2M U31 ( .A(n83), .B(n80), .Y(n60) );
  NAND2X2M U32 ( .A(n80), .B(n85), .Y(n29) );
  NAND2X2M U33 ( .A(n79), .B(n86), .Y(n66) );
  NAND2X2M U34 ( .A(n81), .B(n86), .Y(n54) );
  NOR2X2M U35 ( .A(n8), .B(n92), .Y(ALU_FUN[3]) );
  NOR2X2M U36 ( .A(n9), .B(n95), .Y(WrData[0]) );
  NOR2X2M U37 ( .A(n9), .B(n26), .Y(WrData[5]) );
  NAND2X2M U38 ( .A(n82), .B(n83), .Y(n61) );
  NAND2X2M U39 ( .A(n79), .B(n80), .Y(n59) );
  AOI21X2M U40 ( .A0(n42), .A1(n43), .B0(n6), .Y(n41) );
  NAND2X2M U41 ( .A(n81), .B(n82), .Y(n44) );
  BUFX2M U42 ( .A(FIFO_FULL), .Y(n5) );
  BUFX2M U43 ( .A(FIFO_FULL), .Y(n4) );
  NAND2X2M U44 ( .A(n42), .B(n36), .Y(n51) );
  NAND2X2M U45 ( .A(n32), .B(n61), .Y(n40) );
  NOR2X2M U46 ( .A(n59), .B(n22), .Y(n65) );
  NOR2X2M U47 ( .A(n9), .B(n94), .Y(WrData[1]) );
  NOR2X2M U48 ( .A(n9), .B(n93), .Y(WrData[2]) );
  NOR2X2M U49 ( .A(n9), .B(n92), .Y(WrData[3]) );
  NOR2X2M U50 ( .A(n9), .B(n91), .Y(WrData[4]) );
  NOR2X2M U51 ( .A(n9), .B(n25), .Y(WrData[6]) );
  NOR3X2M U52 ( .A(n94), .B(n35), .C(n26), .Y(n46) );
  NAND3X2M U53 ( .A(n95), .B(n91), .C(n64), .Y(n53) );
  INVX2M U54 ( .A(n34), .Y(n19) );
  INVX2M U55 ( .A(n42), .Y(n17) );
  NAND2X2M U56 ( .A(n53), .B(n33), .Y(n48) );
  INVX2M U57 ( .A(n35), .Y(n24) );
  NOR2BX2M U58 ( .AN(current_state[3]), .B(current_state[0]), .Y(n85) );
  AND2X2M U59 ( .A(current_state[0]), .B(current_state[3]), .Y(n83) );
  AOI2BB2XLM U60 ( .B0(RX_P_DATA[0]), .B1(RdEn), .A0N(n29), .A1N(n22), .Y(n84)
         );
  AOI32X1M U61 ( .A0(current_state[2]), .A1(current_state[3]), .A2(
        current_state[1]), .B0(n80), .B1(n81), .Y(n34) );
  AOI2BB2XLM U62 ( .B0(RX_P_DATA[2]), .B1(RdEn), .A0N(n60), .A1N(n22), .Y(n76)
         );
  NOR3BX2M U63 ( .AN(n44), .B(n78), .C(CLKG_EN), .Y(n77) );
  OAI21X2M U64 ( .A0(n75), .A1(n13), .B0(n59), .Y(n78) );
  NOR2BX2M U65 ( .AN(current_state[0]), .B(current_state[3]), .Y(n79) );
  NOR2X2M U66 ( .A(current_state[2]), .B(current_state[1]), .Y(n80) );
  NOR2X2M U67 ( .A(current_state[3]), .B(current_state[0]), .Y(n81) );
  NAND3X2M U68 ( .A(current_state[2]), .B(current_state[1]), .C(n81), .Y(n42)
         );
  INVX2M U69 ( .A(RX_P_DATA[1]), .Y(n94) );
  INVX2M U70 ( .A(RX_D_VLD), .Y(n22) );
  NOR2X2M U71 ( .A(n4), .B(n74), .Y(FIFO_P_DATA[0]) );
  AOI222X1M U72 ( .A0(RdData[0]), .A1(n17), .B0(ALU_OUT[8]), .B1(n16), .C0(
        ALU_OUT[0]), .C1(n7), .Y(n74) );
  NOR2X2M U73 ( .A(n4), .B(n73), .Y(FIFO_P_DATA[1]) );
  AOI222X1M U74 ( .A0(RdData[1]), .A1(n17), .B0(ALU_OUT[9]), .B1(n16), .C0(
        ALU_OUT[1]), .C1(n7), .Y(n73) );
  NOR2X2M U75 ( .A(n4), .B(n72), .Y(FIFO_P_DATA[2]) );
  AOI222X1M U76 ( .A0(RdData[2]), .A1(n17), .B0(ALU_OUT[10]), .B1(n16), .C0(
        ALU_OUT[2]), .C1(n7), .Y(n72) );
  NOR2X2M U77 ( .A(n4), .B(n71), .Y(FIFO_P_DATA[3]) );
  AOI222X1M U78 ( .A0(RdData[3]), .A1(n17), .B0(ALU_OUT[11]), .B1(n16), .C0(
        ALU_OUT[3]), .C1(n7), .Y(n71) );
  NOR2X2M U79 ( .A(n4), .B(n70), .Y(FIFO_P_DATA[4]) );
  AOI222X1M U80 ( .A0(RdData[4]), .A1(n17), .B0(ALU_OUT[12]), .B1(n16), .C0(
        ALU_OUT[4]), .C1(n7), .Y(n70) );
  NOR2X2M U81 ( .A(n5), .B(n69), .Y(FIFO_P_DATA[5]) );
  AOI222X1M U82 ( .A0(RdData[5]), .A1(n17), .B0(ALU_OUT[13]), .B1(n16), .C0(
        ALU_OUT[5]), .C1(n7), .Y(n69) );
  NOR2X2M U83 ( .A(n5), .B(n68), .Y(FIFO_P_DATA[6]) );
  AOI222X1M U84 ( .A0(RdData[6]), .A1(n17), .B0(ALU_OUT[14]), .B1(n16), .C0(
        ALU_OUT[6]), .C1(n7), .Y(n68) );
  NOR2X2M U85 ( .A(n5), .B(n67), .Y(FIFO_P_DATA[7]) );
  AOI222X1M U86 ( .A0(RdData[7]), .A1(n17), .B0(ALU_OUT[15]), .B1(n16), .C0(
        ALU_OUT[7]), .C1(n7), .Y(n67) );
  OAI211X2M U87 ( .A0(n34), .A1(n37), .B0(n38), .C0(n39), .Y(next_state[2]) );
  AND2X2M U88 ( .A(n44), .B(n45), .Y(n38) );
  AOI32X1M U89 ( .A0(n46), .A1(RX_P_DATA[4]), .A2(n47), .B0(n24), .B1(n48), 
        .Y(n37) );
  AOI221XLM U90 ( .A0(n7), .A1(n6), .B0(n40), .B1(n22), .C0(n41), .Y(n39) );
  OAI211X2M U91 ( .A0(RdData_Valid), .A1(n45), .B0(n55), .C0(n56), .Y(
        next_state[0]) );
  AOI211X2M U92 ( .A0(n23), .A1(n19), .B0(n57), .C0(n58), .Y(n56) );
  AOI22X1M U93 ( .A0(n7), .A1(n5), .B0(OUT_VALID), .B1(n11), .Y(n55) );
  AOI31X2M U94 ( .A0(n44), .A1(n29), .A2(n54), .B0(n22), .Y(n57) );
  NAND3X2M U95 ( .A(current_state[2]), .B(current_state[1]), .C(n79), .Y(n32)
         );
  INVX2M U96 ( .A(RX_P_DATA[0]), .Y(n95) );
  INVX2M U97 ( .A(RX_P_DATA[2]), .Y(n93) );
  NAND4BX1M U98 ( .AN(n27), .B(n28), .C(n29), .D(n30), .Y(next_state[3]) );
  OAI31X1M U99 ( .A0(n33), .A1(n34), .A2(n35), .B0(n36), .Y(n27) );
  AOI221XLM U100 ( .A0(n5), .A1(n16), .B0(n20), .B1(RX_D_VLD), .C0(n31), .Y(
        n30) );
  INVX2M U101 ( .A(n32), .Y(n20) );
  NAND4BX1M U102 ( .AN(n49), .B(n28), .C(n21), .D(n50), .Y(next_state[1]) );
  OAI31X1M U103 ( .A0(n35), .A1(n34), .A2(n53), .B0(n54), .Y(n49) );
  AOI221XLM U104 ( .A0(n5), .A1(n51), .B0(RX_D_VLD), .B1(n31), .C0(n52), .Y(
        n50) );
  OAI2B2X1M U105 ( .A1N(RdData_Valid), .A0(n45), .B0(RX_D_VLD), .B1(n32), .Y(
        n52) );
  INVX2M U106 ( .A(RX_P_DATA[3]), .Y(n92) );
  NOR4X1M U107 ( .A(n25), .B(n93), .C(RX_P_DATA[1]), .D(RX_P_DATA[5]), .Y(n64)
         );
  OAI22X1M U108 ( .A0(n93), .A1(n21), .B0(n65), .B1(n13), .Y(n89) );
  AOI31X2M U109 ( .A0(n59), .A1(n32), .A2(n10), .B0(RX_D_VLD), .Y(n58) );
  INVX2M U110 ( .A(n31), .Y(n10) );
  OAI22X1M U111 ( .A0(n95), .A1(n21), .B0(n65), .B1(n15), .Y(n87) );
  OAI22X1M U112 ( .A0(n94), .A1(n21), .B0(n65), .B1(n14), .Y(n88) );
  OAI22X1M U113 ( .A0(n92), .A1(n21), .B0(n65), .B1(n12), .Y(n90) );
  NOR3X2M U114 ( .A(n95), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n47) );
  NAND3X2M U115 ( .A(RX_P_DATA[3]), .B(RX_D_VLD), .C(RX_P_DATA[7]), .Y(n35) );
  NAND3X2M U116 ( .A(RX_P_DATA[0]), .B(n64), .C(RX_P_DATA[4]), .Y(n33) );
  AND2X2M U117 ( .A(RX_P_DATA[7]), .B(WrEn), .Y(WrData[7]) );
  INVX2M U118 ( .A(RX_P_DATA[6]), .Y(n25) );
  INVX2M U119 ( .A(RX_P_DATA[4]), .Y(n91) );
  INVX2M U120 ( .A(RX_P_DATA[5]), .Y(n26) );
  INVX2M U121 ( .A(n62), .Y(n23) );
  AOI32X1M U122 ( .A0(n63), .A1(n95), .A2(n46), .B0(n48), .B1(n24), .Y(n62) );
  NOR3X2M U123 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n63)
         );
  BUFX2M U124 ( .A(CLKG_EN), .Y(ALU_EN) );
  NAND3X2M U125 ( .A(n36), .B(n28), .C(n43), .Y(CLKG_EN) );
endmodule


module fifo_mem_A_SIZE4_D_SIZE8_F_DEPTH16_P_SIZE5 ( w_clk, w_rstn, w_full, 
        w_inc, w_addr, r_addr, w_data, r_data );
  input [3:0] w_addr;
  input [3:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rstn, w_full, w_inc;
  wire   N9, N10, N11, N12, \FIFO_MEM[15][7] , \FIFO_MEM[15][6] ,
         \FIFO_MEM[15][5] , \FIFO_MEM[15][4] , \FIFO_MEM[15][3] ,
         \FIFO_MEM[15][2] , \FIFO_MEM[15][1] , \FIFO_MEM[15][0] ,
         \FIFO_MEM[14][7] , \FIFO_MEM[14][6] , \FIFO_MEM[14][5] ,
         \FIFO_MEM[14][4] , \FIFO_MEM[14][3] , \FIFO_MEM[14][2] ,
         \FIFO_MEM[14][1] , \FIFO_MEM[14][0] , \FIFO_MEM[13][7] ,
         \FIFO_MEM[13][6] , \FIFO_MEM[13][5] , \FIFO_MEM[13][4] ,
         \FIFO_MEM[13][3] , \FIFO_MEM[13][2] , \FIFO_MEM[13][1] ,
         \FIFO_MEM[13][0] , \FIFO_MEM[12][7] , \FIFO_MEM[12][6] ,
         \FIFO_MEM[12][5] , \FIFO_MEM[12][4] , \FIFO_MEM[12][3] ,
         \FIFO_MEM[12][2] , \FIFO_MEM[12][1] , \FIFO_MEM[12][0] ,
         \FIFO_MEM[11][7] , \FIFO_MEM[11][6] , \FIFO_MEM[11][5] ,
         \FIFO_MEM[11][4] , \FIFO_MEM[11][3] , \FIFO_MEM[11][2] ,
         \FIFO_MEM[11][1] , \FIFO_MEM[11][0] , \FIFO_MEM[10][7] ,
         \FIFO_MEM[10][6] , \FIFO_MEM[10][5] , \FIFO_MEM[10][4] ,
         \FIFO_MEM[10][3] , \FIFO_MEM[10][2] , \FIFO_MEM[10][1] ,
         \FIFO_MEM[10][0] , \FIFO_MEM[9][7] , \FIFO_MEM[9][6] ,
         \FIFO_MEM[9][5] , \FIFO_MEM[9][4] , \FIFO_MEM[9][3] ,
         \FIFO_MEM[9][2] , \FIFO_MEM[9][1] , \FIFO_MEM[9][0] ,
         \FIFO_MEM[8][7] , \FIFO_MEM[8][6] , \FIFO_MEM[8][5] ,
         \FIFO_MEM[8][4] , \FIFO_MEM[8][3] , \FIFO_MEM[8][2] ,
         \FIFO_MEM[8][1] , \FIFO_MEM[8][0] , \FIFO_MEM[7][7] ,
         \FIFO_MEM[7][6] , \FIFO_MEM[7][5] , \FIFO_MEM[7][4] ,
         \FIFO_MEM[7][3] , \FIFO_MEM[7][2] , \FIFO_MEM[7][1] ,
         \FIFO_MEM[7][0] , \FIFO_MEM[6][7] , \FIFO_MEM[6][6] ,
         \FIFO_MEM[6][5] , \FIFO_MEM[6][4] , \FIFO_MEM[6][3] ,
         \FIFO_MEM[6][2] , \FIFO_MEM[6][1] , \FIFO_MEM[6][0] ,
         \FIFO_MEM[5][7] , \FIFO_MEM[5][6] , \FIFO_MEM[5][5] ,
         \FIFO_MEM[5][4] , \FIFO_MEM[5][3] , \FIFO_MEM[5][2] ,
         \FIFO_MEM[5][1] , \FIFO_MEM[5][0] , \FIFO_MEM[4][7] ,
         \FIFO_MEM[4][6] , \FIFO_MEM[4][5] , \FIFO_MEM[4][4] ,
         \FIFO_MEM[4][3] , \FIFO_MEM[4][2] , \FIFO_MEM[4][1] ,
         \FIFO_MEM[4][0] , \FIFO_MEM[3][7] , \FIFO_MEM[3][6] ,
         \FIFO_MEM[3][5] , \FIFO_MEM[3][4] , \FIFO_MEM[3][3] ,
         \FIFO_MEM[3][2] , \FIFO_MEM[3][1] , \FIFO_MEM[3][0] ,
         \FIFO_MEM[2][7] , \FIFO_MEM[2][6] , \FIFO_MEM[2][5] ,
         \FIFO_MEM[2][4] , \FIFO_MEM[2][3] , \FIFO_MEM[2][2] ,
         \FIFO_MEM[2][1] , \FIFO_MEM[2][0] , \FIFO_MEM[1][7] ,
         \FIFO_MEM[1][6] , \FIFO_MEM[1][5] , \FIFO_MEM[1][4] ,
         \FIFO_MEM[1][3] , \FIFO_MEM[1][2] , \FIFO_MEM[1][1] ,
         \FIFO_MEM[1][0] , \FIFO_MEM[0][7] , \FIFO_MEM[0][6] ,
         \FIFO_MEM[0][5] , \FIFO_MEM[0][4] , \FIFO_MEM[0][3] ,
         \FIFO_MEM[0][2] , \FIFO_MEM[0][1] , \FIFO_MEM[0][0] , n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292;
  assign N9 = r_addr[0];
  assign N10 = r_addr[1];
  assign N11 = r_addr[2];
  assign N12 = r_addr[3];

  DFFRQX2M \FIFO_MEM_reg[15][7]  ( .D(n165), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[15][7] ) );
  DFFRQX2M \FIFO_MEM_reg[15][6]  ( .D(n164), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[15][6] ) );
  DFFRQX2M \FIFO_MEM_reg[15][5]  ( .D(n163), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[15][5] ) );
  DFFRQX2M \FIFO_MEM_reg[15][4]  ( .D(n162), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[15][4] ) );
  DFFRQX2M \FIFO_MEM_reg[15][3]  ( .D(n161), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[15][3] ) );
  DFFRQX2M \FIFO_MEM_reg[15][2]  ( .D(n160), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[15][2] ) );
  DFFRQX2M \FIFO_MEM_reg[15][1]  ( .D(n159), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[15][1] ) );
  DFFRQX2M \FIFO_MEM_reg[15][0]  ( .D(n158), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[15][0] ) );
  DFFRQX2M \FIFO_MEM_reg[13][7]  ( .D(n149), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[13][7] ) );
  DFFRQX2M \FIFO_MEM_reg[13][6]  ( .D(n148), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[13][6] ) );
  DFFRQX2M \FIFO_MEM_reg[13][5]  ( .D(n147), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[13][5] ) );
  DFFRQX2M \FIFO_MEM_reg[13][4]  ( .D(n146), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[13][4] ) );
  DFFRQX2M \FIFO_MEM_reg[13][3]  ( .D(n145), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[13][3] ) );
  DFFRQX2M \FIFO_MEM_reg[13][2]  ( .D(n144), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[13][2] ) );
  DFFRQX2M \FIFO_MEM_reg[13][1]  ( .D(n143), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[13][1] ) );
  DFFRQX2M \FIFO_MEM_reg[13][0]  ( .D(n142), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[13][0] ) );
  DFFRQX2M \FIFO_MEM_reg[11][7]  ( .D(n133), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[11][7] ) );
  DFFRQX2M \FIFO_MEM_reg[11][6]  ( .D(n132), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[11][6] ) );
  DFFRQX2M \FIFO_MEM_reg[11][5]  ( .D(n131), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[11][5] ) );
  DFFRQX2M \FIFO_MEM_reg[11][4]  ( .D(n130), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[11][4] ) );
  DFFRQX2M \FIFO_MEM_reg[11][3]  ( .D(n129), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[11][3] ) );
  DFFRQX2M \FIFO_MEM_reg[11][2]  ( .D(n128), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[11][2] ) );
  DFFRQX2M \FIFO_MEM_reg[11][1]  ( .D(n127), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[11][1] ) );
  DFFRQX2M \FIFO_MEM_reg[11][0]  ( .D(n126), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[11][0] ) );
  DFFRQX2M \FIFO_MEM_reg[9][7]  ( .D(n117), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[9][7] ) );
  DFFRQX2M \FIFO_MEM_reg[9][6]  ( .D(n116), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[9][6] ) );
  DFFRQX2M \FIFO_MEM_reg[9][5]  ( .D(n115), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[9][5] ) );
  DFFRQX2M \FIFO_MEM_reg[9][4]  ( .D(n114), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[9][4] ) );
  DFFRQX2M \FIFO_MEM_reg[9][3]  ( .D(n113), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[9][3] ) );
  DFFRQX2M \FIFO_MEM_reg[9][2]  ( .D(n112), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[9][2] ) );
  DFFRQX2M \FIFO_MEM_reg[9][1]  ( .D(n111), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[9][1] ) );
  DFFRQX2M \FIFO_MEM_reg[9][0]  ( .D(n110), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[9][0] ) );
  DFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n101), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[7][7] ) );
  DFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n100), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[7][6] ) );
  DFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n99), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[7][5] ) );
  DFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n98), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[7][4] ) );
  DFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n97), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[7][3] ) );
  DFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n96), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[7][2] ) );
  DFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n95), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[7][1] ) );
  DFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n94), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[7][0] ) );
  DFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n85), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[5][7] ) );
  DFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n84), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[5][6] ) );
  DFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n83), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[5][5] ) );
  DFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n82), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[5][4] ) );
  DFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n81), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[5][3] ) );
  DFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n80), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[5][2] ) );
  DFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n79), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[5][1] ) );
  DFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n78), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[5][0] ) );
  DFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n69), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[3][7] ) );
  DFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n68), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[3][6] ) );
  DFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n67), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[3][5] ) );
  DFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n66), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[3][4] ) );
  DFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n65), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[3][3] ) );
  DFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n64), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[3][2] ) );
  DFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n63), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[3][1] ) );
  DFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n62), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[3][0] ) );
  DFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n53), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[1][7] ) );
  DFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n52), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[1][6] ) );
  DFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n51), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[1][5] ) );
  DFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n50), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[1][4] ) );
  DFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n49), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[1][3] ) );
  DFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n48), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[1][2] ) );
  DFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n47), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[1][1] ) );
  DFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n46), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[1][0] ) );
  DFFRQX2M \FIFO_MEM_reg[14][7]  ( .D(n157), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[14][7] ) );
  DFFRQX2M \FIFO_MEM_reg[14][6]  ( .D(n156), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[14][6] ) );
  DFFRQX2M \FIFO_MEM_reg[14][5]  ( .D(n155), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[14][5] ) );
  DFFRQX2M \FIFO_MEM_reg[14][4]  ( .D(n154), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[14][4] ) );
  DFFRQX2M \FIFO_MEM_reg[14][3]  ( .D(n153), .CK(w_clk), .RN(n268), .Q(
        \FIFO_MEM[14][3] ) );
  DFFRQX2M \FIFO_MEM_reg[14][2]  ( .D(n152), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[14][2] ) );
  DFFRQX2M \FIFO_MEM_reg[14][1]  ( .D(n151), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[14][1] ) );
  DFFRQX2M \FIFO_MEM_reg[14][0]  ( .D(n150), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[14][0] ) );
  DFFRQX2M \FIFO_MEM_reg[12][7]  ( .D(n141), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[12][7] ) );
  DFFRQX2M \FIFO_MEM_reg[12][6]  ( .D(n140), .CK(w_clk), .RN(n269), .Q(
        \FIFO_MEM[12][6] ) );
  DFFRQX2M \FIFO_MEM_reg[12][5]  ( .D(n139), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[12][5] ) );
  DFFRQX2M \FIFO_MEM_reg[12][4]  ( .D(n138), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[12][4] ) );
  DFFRQX2M \FIFO_MEM_reg[12][3]  ( .D(n137), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[12][3] ) );
  DFFRQX2M \FIFO_MEM_reg[12][2]  ( .D(n136), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[12][2] ) );
  DFFRQX2M \FIFO_MEM_reg[12][1]  ( .D(n135), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[12][1] ) );
  DFFRQX2M \FIFO_MEM_reg[12][0]  ( .D(n134), .CK(w_clk), .RN(n270), .Q(
        \FIFO_MEM[12][0] ) );
  DFFRQX2M \FIFO_MEM_reg[10][7]  ( .D(n125), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[10][7] ) );
  DFFRQX2M \FIFO_MEM_reg[10][6]  ( .D(n124), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[10][6] ) );
  DFFRQX2M \FIFO_MEM_reg[10][5]  ( .D(n123), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[10][5] ) );
  DFFRQX2M \FIFO_MEM_reg[10][4]  ( .D(n122), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[10][4] ) );
  DFFRQX2M \FIFO_MEM_reg[10][3]  ( .D(n121), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[10][3] ) );
  DFFRQX2M \FIFO_MEM_reg[10][2]  ( .D(n120), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[10][2] ) );
  DFFRQX2M \FIFO_MEM_reg[10][1]  ( .D(n119), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[10][1] ) );
  DFFRQX2M \FIFO_MEM_reg[10][0]  ( .D(n118), .CK(w_clk), .RN(n271), .Q(
        \FIFO_MEM[10][0] ) );
  DFFRQX2M \FIFO_MEM_reg[8][7]  ( .D(n109), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[8][7] ) );
  DFFRQX2M \FIFO_MEM_reg[8][6]  ( .D(n108), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[8][6] ) );
  DFFRQX2M \FIFO_MEM_reg[8][5]  ( .D(n107), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[8][5] ) );
  DFFRQX2M \FIFO_MEM_reg[8][4]  ( .D(n106), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[8][4] ) );
  DFFRQX2M \FIFO_MEM_reg[8][3]  ( .D(n105), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[8][3] ) );
  DFFRQX2M \FIFO_MEM_reg[8][2]  ( .D(n104), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[8][2] ) );
  DFFRQX2M \FIFO_MEM_reg[8][1]  ( .D(n103), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[8][1] ) );
  DFFRQX2M \FIFO_MEM_reg[8][0]  ( .D(n102), .CK(w_clk), .RN(n272), .Q(
        \FIFO_MEM[8][0] ) );
  DFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n93), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[6][7] ) );
  DFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n92), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[6][6] ) );
  DFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n91), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[6][5] ) );
  DFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n90), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[6][4] ) );
  DFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n89), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[6][3] ) );
  DFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n88), .CK(w_clk), .RN(n273), .Q(
        \FIFO_MEM[6][2] ) );
  DFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n87), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[6][1] ) );
  DFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n86), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[6][0] ) );
  DFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n77), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[4][7] ) );
  DFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n76), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[4][6] ) );
  DFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n75), .CK(w_clk), .RN(n274), .Q(
        \FIFO_MEM[4][5] ) );
  DFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n74), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[4][4] ) );
  DFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n73), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[4][3] ) );
  DFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n72), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[4][2] ) );
  DFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n71), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[4][1] ) );
  DFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n70), .CK(w_clk), .RN(n275), .Q(
        \FIFO_MEM[4][0] ) );
  DFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n61), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[2][7] ) );
  DFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n60), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[2][6] ) );
  DFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n59), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[2][5] ) );
  DFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n58), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[2][4] ) );
  DFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n57), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[2][3] ) );
  DFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n56), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[2][2] ) );
  DFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n55), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[2][1] ) );
  DFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n54), .CK(w_clk), .RN(n276), .Q(
        \FIFO_MEM[2][0] ) );
  DFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n45), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[0][7] ) );
  DFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n44), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[0][6] ) );
  DFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n43), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[0][5] ) );
  DFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n42), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[0][4] ) );
  DFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n41), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[0][3] ) );
  DFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n40), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[0][2] ) );
  DFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n39), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[0][1] ) );
  DFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n38), .CK(w_clk), .RN(n277), .Q(
        \FIFO_MEM[0][0] ) );
  NOR2X2M U2 ( .A(n292), .B(w_addr[2]), .Y(n17) );
  NOR2X2M U3 ( .A(w_addr[1]), .B(w_addr[2]), .Y(n12) );
  BUFX2M U4 ( .A(n278), .Y(n276) );
  BUFX2M U5 ( .A(n279), .Y(n275) );
  BUFX2M U6 ( .A(n279), .Y(n274) );
  BUFX2M U7 ( .A(n280), .Y(n273) );
  BUFX2M U8 ( .A(n280), .Y(n272) );
  BUFX2M U9 ( .A(n281), .Y(n271) );
  BUFX2M U10 ( .A(n281), .Y(n270) );
  BUFX2M U11 ( .A(n282), .Y(n269) );
  BUFX2M U12 ( .A(n282), .Y(n268) );
  BUFX2M U13 ( .A(n278), .Y(n277) );
  INVX2M U14 ( .A(n1), .Y(n264) );
  BUFX2M U15 ( .A(w_rstn), .Y(n278) );
  BUFX2M U16 ( .A(w_rstn), .Y(n279) );
  BUFX2M U17 ( .A(w_rstn), .Y(n280) );
  BUFX2M U18 ( .A(w_rstn), .Y(n281) );
  BUFX2M U19 ( .A(w_rstn), .Y(n282) );
  NAND2X2M U20 ( .A(n17), .B(n13), .Y(n16) );
  NAND2X2M U21 ( .A(n17), .B(n15), .Y(n18) );
  NAND2X2M U22 ( .A(n20), .B(n13), .Y(n19) );
  NAND2X2M U23 ( .A(n20), .B(n15), .Y(n21) );
  NAND2X2M U24 ( .A(n23), .B(n13), .Y(n22) );
  NAND2X2M U25 ( .A(n23), .B(n15), .Y(n25) );
  NAND2X2M U26 ( .A(n28), .B(n20), .Y(n33) );
  NAND2X2M U27 ( .A(n30), .B(n20), .Y(n34) );
  NAND2X2M U28 ( .A(n28), .B(n23), .Y(n35) );
  NAND2X2M U29 ( .A(n30), .B(n23), .Y(n37) );
  NAND2X2M U30 ( .A(n15), .B(n12), .Y(n14) );
  NAND2X2M U31 ( .A(n28), .B(n12), .Y(n27) );
  NAND2X2M U32 ( .A(n30), .B(n12), .Y(n29) );
  NAND2X2M U33 ( .A(n28), .B(n17), .Y(n31) );
  NAND2X2M U34 ( .A(n30), .B(n17), .Y(n32) );
  NAND2X2M U35 ( .A(n12), .B(n13), .Y(n11) );
  AND2X2M U36 ( .A(n24), .B(n291), .Y(n13) );
  NOR2BX2M U37 ( .AN(w_inc), .B(w_full), .Y(n26) );
  AND2X2M U38 ( .A(n36), .B(n291), .Y(n28) );
  OR2X2M U39 ( .A(n262), .B(n263), .Y(n1) );
  INVX2M U40 ( .A(n4), .Y(n265) );
  INVX2M U41 ( .A(n2), .Y(n267) );
  INVX2M U42 ( .A(n3), .Y(n266) );
  INVX2M U43 ( .A(w_data[0]), .Y(n283) );
  INVX2M U44 ( .A(w_data[1]), .Y(n284) );
  INVX2M U45 ( .A(w_data[2]), .Y(n285) );
  INVX2M U46 ( .A(w_data[3]), .Y(n286) );
  INVX2M U47 ( .A(w_data[4]), .Y(n287) );
  INVX2M U48 ( .A(w_data[5]), .Y(n288) );
  INVX2M U49 ( .A(w_data[6]), .Y(n289) );
  INVX2M U50 ( .A(w_data[7]), .Y(n290) );
  OAI2BB2X1M U51 ( .B0(n11), .B1(n283), .A0N(\FIFO_MEM[0][0] ), .A1N(n11), .Y(
        n38) );
  OAI2BB2X1M U52 ( .B0(n11), .B1(n284), .A0N(\FIFO_MEM[0][1] ), .A1N(n11), .Y(
        n39) );
  OAI2BB2X1M U53 ( .B0(n11), .B1(n285), .A0N(\FIFO_MEM[0][2] ), .A1N(n11), .Y(
        n40) );
  OAI2BB2X1M U54 ( .B0(n11), .B1(n286), .A0N(\FIFO_MEM[0][3] ), .A1N(n11), .Y(
        n41) );
  OAI2BB2X1M U55 ( .B0(n11), .B1(n287), .A0N(\FIFO_MEM[0][4] ), .A1N(n11), .Y(
        n42) );
  OAI2BB2X1M U56 ( .B0(n11), .B1(n288), .A0N(\FIFO_MEM[0][5] ), .A1N(n11), .Y(
        n43) );
  OAI2BB2X1M U57 ( .B0(n11), .B1(n289), .A0N(\FIFO_MEM[0][6] ), .A1N(n11), .Y(
        n44) );
  OAI2BB2X1M U58 ( .B0(n11), .B1(n290), .A0N(\FIFO_MEM[0][7] ), .A1N(n11), .Y(
        n45) );
  OAI2BB2X1M U59 ( .B0(n283), .B1(n16), .A0N(\FIFO_MEM[2][0] ), .A1N(n16), .Y(
        n54) );
  OAI2BB2X1M U60 ( .B0(n284), .B1(n16), .A0N(\FIFO_MEM[2][1] ), .A1N(n16), .Y(
        n55) );
  OAI2BB2X1M U61 ( .B0(n285), .B1(n16), .A0N(\FIFO_MEM[2][2] ), .A1N(n16), .Y(
        n56) );
  OAI2BB2X1M U62 ( .B0(n286), .B1(n16), .A0N(\FIFO_MEM[2][3] ), .A1N(n16), .Y(
        n57) );
  OAI2BB2X1M U63 ( .B0(n287), .B1(n16), .A0N(\FIFO_MEM[2][4] ), .A1N(n16), .Y(
        n58) );
  OAI2BB2X1M U64 ( .B0(n288), .B1(n16), .A0N(\FIFO_MEM[2][5] ), .A1N(n16), .Y(
        n59) );
  OAI2BB2X1M U65 ( .B0(n289), .B1(n16), .A0N(\FIFO_MEM[2][6] ), .A1N(n16), .Y(
        n60) );
  OAI2BB2X1M U66 ( .B0(n290), .B1(n16), .A0N(\FIFO_MEM[2][7] ), .A1N(n16), .Y(
        n61) );
  OAI2BB2X1M U67 ( .B0(n283), .B1(n18), .A0N(\FIFO_MEM[3][0] ), .A1N(n18), .Y(
        n62) );
  OAI2BB2X1M U68 ( .B0(n284), .B1(n18), .A0N(\FIFO_MEM[3][1] ), .A1N(n18), .Y(
        n63) );
  OAI2BB2X1M U69 ( .B0(n285), .B1(n18), .A0N(\FIFO_MEM[3][2] ), .A1N(n18), .Y(
        n64) );
  OAI2BB2X1M U70 ( .B0(n286), .B1(n18), .A0N(\FIFO_MEM[3][3] ), .A1N(n18), .Y(
        n65) );
  OAI2BB2X1M U71 ( .B0(n287), .B1(n18), .A0N(\FIFO_MEM[3][4] ), .A1N(n18), .Y(
        n66) );
  OAI2BB2X1M U72 ( .B0(n288), .B1(n18), .A0N(\FIFO_MEM[3][5] ), .A1N(n18), .Y(
        n67) );
  OAI2BB2X1M U73 ( .B0(n289), .B1(n18), .A0N(\FIFO_MEM[3][6] ), .A1N(n18), .Y(
        n68) );
  OAI2BB2X1M U74 ( .B0(n290), .B1(n18), .A0N(\FIFO_MEM[3][7] ), .A1N(n18), .Y(
        n69) );
  OAI2BB2X1M U75 ( .B0(n283), .B1(n14), .A0N(\FIFO_MEM[1][0] ), .A1N(n14), .Y(
        n46) );
  OAI2BB2X1M U76 ( .B0(n284), .B1(n14), .A0N(\FIFO_MEM[1][1] ), .A1N(n14), .Y(
        n47) );
  OAI2BB2X1M U77 ( .B0(n285), .B1(n14), .A0N(\FIFO_MEM[1][2] ), .A1N(n14), .Y(
        n48) );
  OAI2BB2X1M U78 ( .B0(n286), .B1(n14), .A0N(\FIFO_MEM[1][3] ), .A1N(n14), .Y(
        n49) );
  OAI2BB2X1M U79 ( .B0(n287), .B1(n14), .A0N(\FIFO_MEM[1][4] ), .A1N(n14), .Y(
        n50) );
  OAI2BB2X1M U80 ( .B0(n288), .B1(n14), .A0N(\FIFO_MEM[1][5] ), .A1N(n14), .Y(
        n51) );
  OAI2BB2X1M U81 ( .B0(n289), .B1(n14), .A0N(\FIFO_MEM[1][6] ), .A1N(n14), .Y(
        n52) );
  OAI2BB2X1M U82 ( .B0(n290), .B1(n14), .A0N(\FIFO_MEM[1][7] ), .A1N(n14), .Y(
        n53) );
  OAI2BB2X1M U83 ( .B0(n283), .B1(n27), .A0N(\FIFO_MEM[8][0] ), .A1N(n27), .Y(
        n102) );
  OAI2BB2X1M U84 ( .B0(n284), .B1(n27), .A0N(\FIFO_MEM[8][1] ), .A1N(n27), .Y(
        n103) );
  OAI2BB2X1M U85 ( .B0(n285), .B1(n27), .A0N(\FIFO_MEM[8][2] ), .A1N(n27), .Y(
        n104) );
  OAI2BB2X1M U86 ( .B0(n286), .B1(n27), .A0N(\FIFO_MEM[8][3] ), .A1N(n27), .Y(
        n105) );
  OAI2BB2X1M U87 ( .B0(n287), .B1(n27), .A0N(\FIFO_MEM[8][4] ), .A1N(n27), .Y(
        n106) );
  OAI2BB2X1M U88 ( .B0(n288), .B1(n27), .A0N(\FIFO_MEM[8][5] ), .A1N(n27), .Y(
        n107) );
  OAI2BB2X1M U89 ( .B0(n289), .B1(n27), .A0N(\FIFO_MEM[8][6] ), .A1N(n27), .Y(
        n108) );
  OAI2BB2X1M U90 ( .B0(n290), .B1(n27), .A0N(\FIFO_MEM[8][7] ), .A1N(n27), .Y(
        n109) );
  OAI2BB2X1M U91 ( .B0(n283), .B1(n29), .A0N(\FIFO_MEM[9][0] ), .A1N(n29), .Y(
        n110) );
  OAI2BB2X1M U92 ( .B0(n284), .B1(n29), .A0N(\FIFO_MEM[9][1] ), .A1N(n29), .Y(
        n111) );
  OAI2BB2X1M U93 ( .B0(n285), .B1(n29), .A0N(\FIFO_MEM[9][2] ), .A1N(n29), .Y(
        n112) );
  OAI2BB2X1M U94 ( .B0(n286), .B1(n29), .A0N(\FIFO_MEM[9][3] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U95 ( .B0(n287), .B1(n29), .A0N(\FIFO_MEM[9][4] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U96 ( .B0(n288), .B1(n29), .A0N(\FIFO_MEM[9][5] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U97 ( .B0(n289), .B1(n29), .A0N(\FIFO_MEM[9][6] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U98 ( .B0(n290), .B1(n29), .A0N(\FIFO_MEM[9][7] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U99 ( .B0(n283), .B1(n31), .A0N(\FIFO_MEM[10][0] ), .A1N(n31), 
        .Y(n118) );
  OAI2BB2X1M U100 ( .B0(n284), .B1(n31), .A0N(\FIFO_MEM[10][1] ), .A1N(n31), 
        .Y(n119) );
  OAI2BB2X1M U101 ( .B0(n285), .B1(n31), .A0N(\FIFO_MEM[10][2] ), .A1N(n31), 
        .Y(n120) );
  OAI2BB2X1M U102 ( .B0(n286), .B1(n31), .A0N(\FIFO_MEM[10][3] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U103 ( .B0(n287), .B1(n31), .A0N(\FIFO_MEM[10][4] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U104 ( .B0(n288), .B1(n31), .A0N(\FIFO_MEM[10][5] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U105 ( .B0(n289), .B1(n31), .A0N(\FIFO_MEM[10][6] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U106 ( .B0(n290), .B1(n31), .A0N(\FIFO_MEM[10][7] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U107 ( .B0(n283), .B1(n32), .A0N(\FIFO_MEM[11][0] ), .A1N(n32), 
        .Y(n126) );
  OAI2BB2X1M U108 ( .B0(n284), .B1(n32), .A0N(\FIFO_MEM[11][1] ), .A1N(n32), 
        .Y(n127) );
  OAI2BB2X1M U109 ( .B0(n285), .B1(n32), .A0N(\FIFO_MEM[11][2] ), .A1N(n32), 
        .Y(n128) );
  OAI2BB2X1M U110 ( .B0(n286), .B1(n32), .A0N(\FIFO_MEM[11][3] ), .A1N(n32), 
        .Y(n129) );
  OAI2BB2X1M U111 ( .B0(n287), .B1(n32), .A0N(\FIFO_MEM[11][4] ), .A1N(n32), 
        .Y(n130) );
  OAI2BB2X1M U112 ( .B0(n288), .B1(n32), .A0N(\FIFO_MEM[11][5] ), .A1N(n32), 
        .Y(n131) );
  OAI2BB2X1M U113 ( .B0(n289), .B1(n32), .A0N(\FIFO_MEM[11][6] ), .A1N(n32), 
        .Y(n132) );
  OAI2BB2X1M U114 ( .B0(n290), .B1(n32), .A0N(\FIFO_MEM[11][7] ), .A1N(n32), 
        .Y(n133) );
  OAI2BB2X1M U115 ( .B0(n283), .B1(n19), .A0N(\FIFO_MEM[4][0] ), .A1N(n19), 
        .Y(n70) );
  OAI2BB2X1M U116 ( .B0(n284), .B1(n19), .A0N(\FIFO_MEM[4][1] ), .A1N(n19), 
        .Y(n71) );
  OAI2BB2X1M U117 ( .B0(n285), .B1(n19), .A0N(\FIFO_MEM[4][2] ), .A1N(n19), 
        .Y(n72) );
  OAI2BB2X1M U118 ( .B0(n286), .B1(n19), .A0N(\FIFO_MEM[4][3] ), .A1N(n19), 
        .Y(n73) );
  OAI2BB2X1M U119 ( .B0(n287), .B1(n19), .A0N(\FIFO_MEM[4][4] ), .A1N(n19), 
        .Y(n74) );
  OAI2BB2X1M U120 ( .B0(n288), .B1(n19), .A0N(\FIFO_MEM[4][5] ), .A1N(n19), 
        .Y(n75) );
  OAI2BB2X1M U121 ( .B0(n289), .B1(n19), .A0N(\FIFO_MEM[4][6] ), .A1N(n19), 
        .Y(n76) );
  OAI2BB2X1M U122 ( .B0(n290), .B1(n19), .A0N(\FIFO_MEM[4][7] ), .A1N(n19), 
        .Y(n77) );
  OAI2BB2X1M U123 ( .B0(n283), .B1(n21), .A0N(\FIFO_MEM[5][0] ), .A1N(n21), 
        .Y(n78) );
  OAI2BB2X1M U124 ( .B0(n284), .B1(n21), .A0N(\FIFO_MEM[5][1] ), .A1N(n21), 
        .Y(n79) );
  OAI2BB2X1M U125 ( .B0(n285), .B1(n21), .A0N(\FIFO_MEM[5][2] ), .A1N(n21), 
        .Y(n80) );
  OAI2BB2X1M U126 ( .B0(n286), .B1(n21), .A0N(\FIFO_MEM[5][3] ), .A1N(n21), 
        .Y(n81) );
  OAI2BB2X1M U127 ( .B0(n287), .B1(n21), .A0N(\FIFO_MEM[5][4] ), .A1N(n21), 
        .Y(n82) );
  OAI2BB2X1M U128 ( .B0(n288), .B1(n21), .A0N(\FIFO_MEM[5][5] ), .A1N(n21), 
        .Y(n83) );
  OAI2BB2X1M U129 ( .B0(n289), .B1(n21), .A0N(\FIFO_MEM[5][6] ), .A1N(n21), 
        .Y(n84) );
  OAI2BB2X1M U130 ( .B0(n290), .B1(n21), .A0N(\FIFO_MEM[5][7] ), .A1N(n21), 
        .Y(n85) );
  OAI2BB2X1M U131 ( .B0(n283), .B1(n22), .A0N(\FIFO_MEM[6][0] ), .A1N(n22), 
        .Y(n86) );
  OAI2BB2X1M U132 ( .B0(n284), .B1(n22), .A0N(\FIFO_MEM[6][1] ), .A1N(n22), 
        .Y(n87) );
  OAI2BB2X1M U133 ( .B0(n285), .B1(n22), .A0N(\FIFO_MEM[6][2] ), .A1N(n22), 
        .Y(n88) );
  OAI2BB2X1M U134 ( .B0(n286), .B1(n22), .A0N(\FIFO_MEM[6][3] ), .A1N(n22), 
        .Y(n89) );
  OAI2BB2X1M U135 ( .B0(n287), .B1(n22), .A0N(\FIFO_MEM[6][4] ), .A1N(n22), 
        .Y(n90) );
  OAI2BB2X1M U136 ( .B0(n288), .B1(n22), .A0N(\FIFO_MEM[6][5] ), .A1N(n22), 
        .Y(n91) );
  OAI2BB2X1M U137 ( .B0(n289), .B1(n22), .A0N(\FIFO_MEM[6][6] ), .A1N(n22), 
        .Y(n92) );
  OAI2BB2X1M U138 ( .B0(n290), .B1(n22), .A0N(\FIFO_MEM[6][7] ), .A1N(n22), 
        .Y(n93) );
  OAI2BB2X1M U139 ( .B0(n283), .B1(n25), .A0N(\FIFO_MEM[7][0] ), .A1N(n25), 
        .Y(n94) );
  OAI2BB2X1M U140 ( .B0(n284), .B1(n25), .A0N(\FIFO_MEM[7][1] ), .A1N(n25), 
        .Y(n95) );
  OAI2BB2X1M U141 ( .B0(n285), .B1(n25), .A0N(\FIFO_MEM[7][2] ), .A1N(n25), 
        .Y(n96) );
  OAI2BB2X1M U142 ( .B0(n286), .B1(n25), .A0N(\FIFO_MEM[7][3] ), .A1N(n25), 
        .Y(n97) );
  OAI2BB2X1M U143 ( .B0(n287), .B1(n25), .A0N(\FIFO_MEM[7][4] ), .A1N(n25), 
        .Y(n98) );
  OAI2BB2X1M U144 ( .B0(n288), .B1(n25), .A0N(\FIFO_MEM[7][5] ), .A1N(n25), 
        .Y(n99) );
  OAI2BB2X1M U145 ( .B0(n289), .B1(n25), .A0N(\FIFO_MEM[7][6] ), .A1N(n25), 
        .Y(n100) );
  OAI2BB2X1M U146 ( .B0(n290), .B1(n25), .A0N(\FIFO_MEM[7][7] ), .A1N(n25), 
        .Y(n101) );
  OAI2BB2X1M U147 ( .B0(n283), .B1(n33), .A0N(\FIFO_MEM[12][0] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U148 ( .B0(n284), .B1(n33), .A0N(\FIFO_MEM[12][1] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U149 ( .B0(n285), .B1(n33), .A0N(\FIFO_MEM[12][2] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U150 ( .B0(n286), .B1(n33), .A0N(\FIFO_MEM[12][3] ), .A1N(n33), 
        .Y(n137) );
  OAI2BB2X1M U151 ( .B0(n287), .B1(n33), .A0N(\FIFO_MEM[12][4] ), .A1N(n33), 
        .Y(n138) );
  OAI2BB2X1M U152 ( .B0(n288), .B1(n33), .A0N(\FIFO_MEM[12][5] ), .A1N(n33), 
        .Y(n139) );
  OAI2BB2X1M U153 ( .B0(n289), .B1(n33), .A0N(\FIFO_MEM[12][6] ), .A1N(n33), 
        .Y(n140) );
  OAI2BB2X1M U154 ( .B0(n290), .B1(n33), .A0N(\FIFO_MEM[12][7] ), .A1N(n33), 
        .Y(n141) );
  OAI2BB2X1M U155 ( .B0(n283), .B1(n34), .A0N(\FIFO_MEM[13][0] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U156 ( .B0(n284), .B1(n34), .A0N(\FIFO_MEM[13][1] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U157 ( .B0(n285), .B1(n34), .A0N(\FIFO_MEM[13][2] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U158 ( .B0(n286), .B1(n34), .A0N(\FIFO_MEM[13][3] ), .A1N(n34), 
        .Y(n145) );
  OAI2BB2X1M U159 ( .B0(n287), .B1(n34), .A0N(\FIFO_MEM[13][4] ), .A1N(n34), 
        .Y(n146) );
  OAI2BB2X1M U160 ( .B0(n288), .B1(n34), .A0N(\FIFO_MEM[13][5] ), .A1N(n34), 
        .Y(n147) );
  OAI2BB2X1M U161 ( .B0(n289), .B1(n34), .A0N(\FIFO_MEM[13][6] ), .A1N(n34), 
        .Y(n148) );
  OAI2BB2X1M U162 ( .B0(n290), .B1(n34), .A0N(\FIFO_MEM[13][7] ), .A1N(n34), 
        .Y(n149) );
  OAI2BB2X1M U163 ( .B0(n283), .B1(n35), .A0N(\FIFO_MEM[14][0] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U164 ( .B0(n284), .B1(n35), .A0N(\FIFO_MEM[14][1] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U165 ( .B0(n285), .B1(n35), .A0N(\FIFO_MEM[14][2] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U166 ( .B0(n286), .B1(n35), .A0N(\FIFO_MEM[14][3] ), .A1N(n35), 
        .Y(n153) );
  OAI2BB2X1M U167 ( .B0(n287), .B1(n35), .A0N(\FIFO_MEM[14][4] ), .A1N(n35), 
        .Y(n154) );
  OAI2BB2X1M U168 ( .B0(n288), .B1(n35), .A0N(\FIFO_MEM[14][5] ), .A1N(n35), 
        .Y(n155) );
  OAI2BB2X1M U169 ( .B0(n289), .B1(n35), .A0N(\FIFO_MEM[14][6] ), .A1N(n35), 
        .Y(n156) );
  OAI2BB2X1M U170 ( .B0(n290), .B1(n35), .A0N(\FIFO_MEM[14][7] ), .A1N(n35), 
        .Y(n157) );
  OAI2BB2X1M U171 ( .B0(n283), .B1(n37), .A0N(\FIFO_MEM[15][0] ), .A1N(n37), 
        .Y(n158) );
  OAI2BB2X1M U172 ( .B0(n284), .B1(n37), .A0N(\FIFO_MEM[15][1] ), .A1N(n37), 
        .Y(n159) );
  OAI2BB2X1M U173 ( .B0(n285), .B1(n37), .A0N(\FIFO_MEM[15][2] ), .A1N(n37), 
        .Y(n160) );
  OAI2BB2X1M U174 ( .B0(n286), .B1(n37), .A0N(\FIFO_MEM[15][3] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U175 ( .B0(n287), .B1(n37), .A0N(\FIFO_MEM[15][4] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U176 ( .B0(n288), .B1(n37), .A0N(\FIFO_MEM[15][5] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U177 ( .B0(n289), .B1(n37), .A0N(\FIFO_MEM[15][6] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U178 ( .B0(n290), .B1(n37), .A0N(\FIFO_MEM[15][7] ), .A1N(n37), 
        .Y(n165) );
  NOR2BX2M U179 ( .AN(n26), .B(w_addr[3]), .Y(n24) );
  AND2X2M U180 ( .A(n24), .B(w_addr[0]), .Y(n15) );
  AND2X2M U181 ( .A(n36), .B(w_addr[0]), .Y(n30) );
  AND2X2M U182 ( .A(w_addr[3]), .B(n26), .Y(n36) );
  AND2X2M U183 ( .A(w_addr[2]), .B(n292), .Y(n20) );
  AND2X2M U184 ( .A(w_addr[2]), .B(w_addr[1]), .Y(n23) );
  INVX2M U185 ( .A(w_addr[1]), .Y(n292) );
  INVX2M U186 ( .A(w_addr[0]), .Y(n291) );
  OR2X2M U187 ( .A(N9), .B(N10), .Y(n2) );
  OR2X2M U188 ( .A(n263), .B(N10), .Y(n3) );
  OR2X2M U189 ( .A(n262), .B(N9), .Y(n4) );
  INVX2M U190 ( .A(N10), .Y(n262) );
  INVX2M U191 ( .A(N9), .Y(n263) );
  INVX2M U192 ( .A(N12), .Y(n260) );
  INVX2M U193 ( .A(N11), .Y(n261) );
  AOI22X1M U194 ( .A0(\FIFO_MEM[10][0] ), .A1(n265), .B0(\FIFO_MEM[11][0] ), 
        .B1(n264), .Y(n6) );
  AOI22X1M U195 ( .A0(\FIFO_MEM[8][0] ), .A1(n267), .B0(\FIFO_MEM[9][0] ), 
        .B1(n266), .Y(n5) );
  CLKNAND2X2M U196 ( .A(N12), .B(n261), .Y(n244) );
  AOI21X1M U197 ( .A0(n6), .A1(n5), .B0(n244), .Y(n171) );
  AOI22X1M U198 ( .A0(\FIFO_MEM[14][0] ), .A1(n265), .B0(\FIFO_MEM[15][0] ), 
        .B1(n264), .Y(n8) );
  AOI22X1M U199 ( .A0(\FIFO_MEM[12][0] ), .A1(n267), .B0(\FIFO_MEM[13][0] ), 
        .B1(n266), .Y(n7) );
  CLKNAND2X2M U200 ( .A(N12), .B(N11), .Y(n247) );
  AOI21X1M U201 ( .A0(n8), .A1(n7), .B0(n247), .Y(n170) );
  AOI22X1M U202 ( .A0(\FIFO_MEM[2][0] ), .A1(n265), .B0(\FIFO_MEM[3][0] ), 
        .B1(n264), .Y(n10) );
  AOI22X1M U203 ( .A0(\FIFO_MEM[0][0] ), .A1(n267), .B0(\FIFO_MEM[1][0] ), 
        .B1(n266), .Y(n9) );
  CLKNAND2X2M U204 ( .A(n261), .B(n260), .Y(n250) );
  AOI21X1M U205 ( .A0(n10), .A1(n9), .B0(n250), .Y(n169) );
  AOI22X1M U206 ( .A0(\FIFO_MEM[6][0] ), .A1(n265), .B0(\FIFO_MEM[7][0] ), 
        .B1(n264), .Y(n167) );
  AOI22X1M U207 ( .A0(\FIFO_MEM[4][0] ), .A1(n267), .B0(\FIFO_MEM[5][0] ), 
        .B1(n266), .Y(n166) );
  CLKNAND2X2M U208 ( .A(N11), .B(n260), .Y(n253) );
  AOI21X1M U209 ( .A0(n167), .A1(n166), .B0(n253), .Y(n168) );
  OR4X1M U210 ( .A(n171), .B(n170), .C(n169), .D(n168), .Y(r_data[0]) );
  AOI22X1M U211 ( .A0(\FIFO_MEM[10][1] ), .A1(n265), .B0(\FIFO_MEM[11][1] ), 
        .B1(n264), .Y(n173) );
  AOI22X1M U212 ( .A0(\FIFO_MEM[8][1] ), .A1(n267), .B0(\FIFO_MEM[9][1] ), 
        .B1(n266), .Y(n172) );
  AOI21X1M U213 ( .A0(n173), .A1(n172), .B0(n244), .Y(n183) );
  AOI22X1M U214 ( .A0(\FIFO_MEM[14][1] ), .A1(n265), .B0(\FIFO_MEM[15][1] ), 
        .B1(n264), .Y(n175) );
  AOI22X1M U215 ( .A0(\FIFO_MEM[12][1] ), .A1(n267), .B0(\FIFO_MEM[13][1] ), 
        .B1(n266), .Y(n174) );
  AOI21X1M U216 ( .A0(n175), .A1(n174), .B0(n247), .Y(n182) );
  AOI22X1M U217 ( .A0(\FIFO_MEM[2][1] ), .A1(n265), .B0(\FIFO_MEM[3][1] ), 
        .B1(n264), .Y(n177) );
  AOI22X1M U218 ( .A0(\FIFO_MEM[0][1] ), .A1(n267), .B0(\FIFO_MEM[1][1] ), 
        .B1(n266), .Y(n176) );
  AOI21X1M U219 ( .A0(n177), .A1(n176), .B0(n250), .Y(n181) );
  AOI22X1M U220 ( .A0(\FIFO_MEM[6][1] ), .A1(n265), .B0(\FIFO_MEM[7][1] ), 
        .B1(n264), .Y(n179) );
  AOI22X1M U221 ( .A0(\FIFO_MEM[4][1] ), .A1(n267), .B0(\FIFO_MEM[5][1] ), 
        .B1(n266), .Y(n178) );
  AOI21X1M U222 ( .A0(n179), .A1(n178), .B0(n253), .Y(n180) );
  OR4X1M U223 ( .A(n183), .B(n182), .C(n181), .D(n180), .Y(r_data[1]) );
  AOI22X1M U224 ( .A0(\FIFO_MEM[10][2] ), .A1(n265), .B0(\FIFO_MEM[11][2] ), 
        .B1(n264), .Y(n185) );
  AOI22X1M U225 ( .A0(\FIFO_MEM[8][2] ), .A1(n267), .B0(\FIFO_MEM[9][2] ), 
        .B1(n266), .Y(n184) );
  AOI21X1M U226 ( .A0(n185), .A1(n184), .B0(n244), .Y(n195) );
  AOI22X1M U227 ( .A0(\FIFO_MEM[14][2] ), .A1(n265), .B0(\FIFO_MEM[15][2] ), 
        .B1(n264), .Y(n187) );
  AOI22X1M U228 ( .A0(\FIFO_MEM[12][2] ), .A1(n267), .B0(\FIFO_MEM[13][2] ), 
        .B1(n266), .Y(n186) );
  AOI21X1M U229 ( .A0(n187), .A1(n186), .B0(n247), .Y(n194) );
  AOI22X1M U230 ( .A0(\FIFO_MEM[2][2] ), .A1(n265), .B0(\FIFO_MEM[3][2] ), 
        .B1(n264), .Y(n189) );
  AOI22X1M U231 ( .A0(\FIFO_MEM[0][2] ), .A1(n267), .B0(\FIFO_MEM[1][2] ), 
        .B1(n266), .Y(n188) );
  AOI21X1M U232 ( .A0(n189), .A1(n188), .B0(n250), .Y(n193) );
  AOI22X1M U233 ( .A0(\FIFO_MEM[6][2] ), .A1(n265), .B0(\FIFO_MEM[7][2] ), 
        .B1(n264), .Y(n191) );
  AOI22X1M U234 ( .A0(\FIFO_MEM[4][2] ), .A1(n267), .B0(\FIFO_MEM[5][2] ), 
        .B1(n266), .Y(n190) );
  AOI21X1M U235 ( .A0(n191), .A1(n190), .B0(n253), .Y(n192) );
  OR4X1M U236 ( .A(n195), .B(n194), .C(n193), .D(n192), .Y(r_data[2]) );
  AOI22X1M U237 ( .A0(\FIFO_MEM[10][3] ), .A1(n265), .B0(\FIFO_MEM[11][3] ), 
        .B1(n264), .Y(n197) );
  AOI22X1M U238 ( .A0(\FIFO_MEM[8][3] ), .A1(n267), .B0(\FIFO_MEM[9][3] ), 
        .B1(n266), .Y(n196) );
  AOI21X1M U239 ( .A0(n197), .A1(n196), .B0(n244), .Y(n207) );
  AOI22X1M U240 ( .A0(\FIFO_MEM[14][3] ), .A1(n265), .B0(\FIFO_MEM[15][3] ), 
        .B1(n264), .Y(n199) );
  AOI22X1M U241 ( .A0(\FIFO_MEM[12][3] ), .A1(n267), .B0(\FIFO_MEM[13][3] ), 
        .B1(n266), .Y(n198) );
  AOI21X1M U242 ( .A0(n199), .A1(n198), .B0(n247), .Y(n206) );
  AOI22X1M U243 ( .A0(\FIFO_MEM[2][3] ), .A1(n265), .B0(\FIFO_MEM[3][3] ), 
        .B1(n264), .Y(n201) );
  AOI22X1M U244 ( .A0(\FIFO_MEM[0][3] ), .A1(n267), .B0(\FIFO_MEM[1][3] ), 
        .B1(n266), .Y(n200) );
  AOI21X1M U245 ( .A0(n201), .A1(n200), .B0(n250), .Y(n205) );
  AOI22X1M U246 ( .A0(\FIFO_MEM[6][3] ), .A1(n265), .B0(\FIFO_MEM[7][3] ), 
        .B1(n264), .Y(n203) );
  AOI22X1M U247 ( .A0(\FIFO_MEM[4][3] ), .A1(n267), .B0(\FIFO_MEM[5][3] ), 
        .B1(n266), .Y(n202) );
  AOI21X1M U248 ( .A0(n203), .A1(n202), .B0(n253), .Y(n204) );
  OR4X1M U249 ( .A(n207), .B(n206), .C(n205), .D(n204), .Y(r_data[3]) );
  AOI22X1M U250 ( .A0(\FIFO_MEM[10][4] ), .A1(n265), .B0(\FIFO_MEM[11][4] ), 
        .B1(n264), .Y(n209) );
  AOI22X1M U251 ( .A0(\FIFO_MEM[8][4] ), .A1(n267), .B0(\FIFO_MEM[9][4] ), 
        .B1(n266), .Y(n208) );
  AOI21X1M U252 ( .A0(n209), .A1(n208), .B0(n244), .Y(n219) );
  AOI22X1M U253 ( .A0(\FIFO_MEM[14][4] ), .A1(n265), .B0(\FIFO_MEM[15][4] ), 
        .B1(n264), .Y(n211) );
  AOI22X1M U254 ( .A0(\FIFO_MEM[12][4] ), .A1(n267), .B0(\FIFO_MEM[13][4] ), 
        .B1(n266), .Y(n210) );
  AOI21X1M U255 ( .A0(n211), .A1(n210), .B0(n247), .Y(n218) );
  AOI22X1M U256 ( .A0(\FIFO_MEM[2][4] ), .A1(n265), .B0(\FIFO_MEM[3][4] ), 
        .B1(n264), .Y(n213) );
  AOI22X1M U257 ( .A0(\FIFO_MEM[0][4] ), .A1(n267), .B0(\FIFO_MEM[1][4] ), 
        .B1(n266), .Y(n212) );
  AOI21X1M U258 ( .A0(n213), .A1(n212), .B0(n250), .Y(n217) );
  AOI22X1M U259 ( .A0(\FIFO_MEM[6][4] ), .A1(n265), .B0(\FIFO_MEM[7][4] ), 
        .B1(n264), .Y(n215) );
  AOI22X1M U260 ( .A0(\FIFO_MEM[4][4] ), .A1(n267), .B0(\FIFO_MEM[5][4] ), 
        .B1(n266), .Y(n214) );
  AOI21X1M U261 ( .A0(n215), .A1(n214), .B0(n253), .Y(n216) );
  OR4X1M U262 ( .A(n219), .B(n218), .C(n217), .D(n216), .Y(r_data[4]) );
  AOI22X1M U263 ( .A0(\FIFO_MEM[10][5] ), .A1(n265), .B0(\FIFO_MEM[11][5] ), 
        .B1(n264), .Y(n221) );
  AOI22X1M U264 ( .A0(\FIFO_MEM[8][5] ), .A1(n267), .B0(\FIFO_MEM[9][5] ), 
        .B1(n266), .Y(n220) );
  AOI21X1M U265 ( .A0(n221), .A1(n220), .B0(n244), .Y(n231) );
  AOI22X1M U266 ( .A0(\FIFO_MEM[14][5] ), .A1(n265), .B0(\FIFO_MEM[15][5] ), 
        .B1(n264), .Y(n223) );
  AOI22X1M U267 ( .A0(\FIFO_MEM[12][5] ), .A1(n267), .B0(\FIFO_MEM[13][5] ), 
        .B1(n266), .Y(n222) );
  AOI21X1M U268 ( .A0(n223), .A1(n222), .B0(n247), .Y(n230) );
  AOI22X1M U269 ( .A0(\FIFO_MEM[2][5] ), .A1(n265), .B0(\FIFO_MEM[3][5] ), 
        .B1(n264), .Y(n225) );
  AOI22X1M U270 ( .A0(\FIFO_MEM[0][5] ), .A1(n267), .B0(\FIFO_MEM[1][5] ), 
        .B1(n266), .Y(n224) );
  AOI21X1M U271 ( .A0(n225), .A1(n224), .B0(n250), .Y(n229) );
  AOI22X1M U272 ( .A0(\FIFO_MEM[6][5] ), .A1(n265), .B0(\FIFO_MEM[7][5] ), 
        .B1(n264), .Y(n227) );
  AOI22X1M U273 ( .A0(\FIFO_MEM[4][5] ), .A1(n267), .B0(\FIFO_MEM[5][5] ), 
        .B1(n266), .Y(n226) );
  AOI21X1M U274 ( .A0(n227), .A1(n226), .B0(n253), .Y(n228) );
  OR4X1M U275 ( .A(n231), .B(n230), .C(n229), .D(n228), .Y(r_data[5]) );
  AOI22X1M U276 ( .A0(\FIFO_MEM[10][6] ), .A1(n265), .B0(\FIFO_MEM[11][6] ), 
        .B1(n264), .Y(n233) );
  AOI22X1M U277 ( .A0(\FIFO_MEM[8][6] ), .A1(n267), .B0(\FIFO_MEM[9][6] ), 
        .B1(n266), .Y(n232) );
  AOI21X1M U278 ( .A0(n233), .A1(n232), .B0(n244), .Y(n243) );
  AOI22X1M U279 ( .A0(\FIFO_MEM[14][6] ), .A1(n265), .B0(\FIFO_MEM[15][6] ), 
        .B1(n264), .Y(n235) );
  AOI22X1M U280 ( .A0(\FIFO_MEM[12][6] ), .A1(n267), .B0(\FIFO_MEM[13][6] ), 
        .B1(n266), .Y(n234) );
  AOI21X1M U281 ( .A0(n235), .A1(n234), .B0(n247), .Y(n242) );
  AOI22X1M U282 ( .A0(\FIFO_MEM[2][6] ), .A1(n265), .B0(\FIFO_MEM[3][6] ), 
        .B1(n264), .Y(n237) );
  AOI22X1M U283 ( .A0(\FIFO_MEM[0][6] ), .A1(n267), .B0(\FIFO_MEM[1][6] ), 
        .B1(n266), .Y(n236) );
  AOI21X1M U284 ( .A0(n237), .A1(n236), .B0(n250), .Y(n241) );
  AOI22X1M U285 ( .A0(\FIFO_MEM[6][6] ), .A1(n265), .B0(\FIFO_MEM[7][6] ), 
        .B1(n264), .Y(n239) );
  AOI22X1M U286 ( .A0(\FIFO_MEM[4][6] ), .A1(n267), .B0(\FIFO_MEM[5][6] ), 
        .B1(n266), .Y(n238) );
  AOI21X1M U287 ( .A0(n239), .A1(n238), .B0(n253), .Y(n240) );
  OR4X1M U288 ( .A(n243), .B(n242), .C(n241), .D(n240), .Y(r_data[6]) );
  AOI22X1M U289 ( .A0(\FIFO_MEM[10][7] ), .A1(n265), .B0(\FIFO_MEM[11][7] ), 
        .B1(n264), .Y(n246) );
  AOI22X1M U290 ( .A0(\FIFO_MEM[8][7] ), .A1(n267), .B0(\FIFO_MEM[9][7] ), 
        .B1(n266), .Y(n245) );
  AOI21X1M U291 ( .A0(n246), .A1(n245), .B0(n244), .Y(n259) );
  AOI22X1M U292 ( .A0(\FIFO_MEM[14][7] ), .A1(n265), .B0(\FIFO_MEM[15][7] ), 
        .B1(n264), .Y(n249) );
  AOI22X1M U293 ( .A0(\FIFO_MEM[12][7] ), .A1(n267), .B0(\FIFO_MEM[13][7] ), 
        .B1(n266), .Y(n248) );
  AOI21X1M U294 ( .A0(n249), .A1(n248), .B0(n247), .Y(n258) );
  AOI22X1M U295 ( .A0(\FIFO_MEM[2][7] ), .A1(n265), .B0(\FIFO_MEM[3][7] ), 
        .B1(n264), .Y(n252) );
  AOI22X1M U296 ( .A0(\FIFO_MEM[0][7] ), .A1(n267), .B0(\FIFO_MEM[1][7] ), 
        .B1(n266), .Y(n251) );
  AOI21X1M U297 ( .A0(n252), .A1(n251), .B0(n250), .Y(n257) );
  AOI22X1M U298 ( .A0(\FIFO_MEM[6][7] ), .A1(n265), .B0(\FIFO_MEM[7][7] ), 
        .B1(n264), .Y(n255) );
  AOI22X1M U299 ( .A0(\FIFO_MEM[4][7] ), .A1(n267), .B0(\FIFO_MEM[5][7] ), 
        .B1(n266), .Y(n254) );
  AOI21X1M U300 ( .A0(n255), .A1(n254), .B0(n253), .Y(n256) );
  OR4X1M U301 ( .A(n259), .B(n258), .C(n257), .D(n256), .Y(r_data[7]) );
endmodule


module DF_Sync_DATA_SIZE5_0 ( sync_clk, sync_rstn, unsync_ip, sync_op );
  input [4:0] unsync_ip;
  output [4:0] sync_op;
  input sync_clk, sync_rstn;

  wire   [4:0] meta_flop;

  DFFRQX2M \sync_op_reg[2]  ( .D(meta_flop[2]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[2]) );
  DFFRQX2M \sync_op_reg[4]  ( .D(meta_flop[4]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[4]) );
  DFFRQX2M \sync_op_reg[3]  ( .D(meta_flop[3]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[3]) );
  DFFRQX2M \sync_op_reg[0]  ( .D(meta_flop[0]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[0]) );
  DFFRQX2M \sync_op_reg[1]  ( .D(meta_flop[1]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[1]) );
  DFFRQX2M \meta_flop_reg[4]  ( .D(unsync_ip[4]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[4]) );
  DFFRQX2M \meta_flop_reg[3]  ( .D(unsync_ip[3]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[3]) );
  DFFRQX2M \meta_flop_reg[2]  ( .D(unsync_ip[2]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[2]) );
  DFFRQX2M \meta_flop_reg[1]  ( .D(unsync_ip[1]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[1]) );
  DFFRQX2M \meta_flop_reg[0]  ( .D(unsync_ip[0]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[0]) );
endmodule


module fifo_wr_P_SIZE5 ( w_clk, w_rstn, w_inc, sync_rd_ptr, w_addr, gray_w_ptr, 
        full );
  input [4:0] sync_rd_ptr;
  output [3:0] w_addr;
  output [4:0] gray_w_ptr;
  input w_clk, w_rstn, w_inc;
  output full;
  wire   N3, N4, N5, N6, N7, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, \add_38/carry[4] , \add_38/carry[3] , \add_38/carry[2] , n1,
         n3;
  wire   [4:0] comb_gray_w_ptr;

  DFFRQX2M \w_ptr_reg[4]  ( .D(n14), .CK(w_clk), .RN(w_rstn), .Q(
        comb_gray_w_ptr[4]) );
  DFFRQX2M \w_ptr_reg[0]  ( .D(n15), .CK(w_clk), .RN(w_rstn), .Q(w_addr[0]) );
  DFFRX1M \w_ptr_reg[2]  ( .D(n12), .CK(w_clk), .RN(w_rstn), .Q(w_addr[2]), 
        .QN(n2) );
  DFFRQX2M \w_ptr_reg[3]  ( .D(n13), .CK(w_clk), .RN(w_rstn), .Q(w_addr[3]) );
  DFFRQX2M \w_ptr_reg[1]  ( .D(n11), .CK(w_clk), .RN(w_rstn), .Q(w_addr[1]) );
  DFFRQX2M \gray_w_ptr_reg[3]  ( .D(comb_gray_w_ptr[3]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[3]) );
  DFFRQX2M \gray_w_ptr_reg[2]  ( .D(comb_gray_w_ptr[2]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[2]) );
  DFFRQX2M \gray_w_ptr_reg[1]  ( .D(comb_gray_w_ptr[1]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[1]) );
  DFFRQX2M \gray_w_ptr_reg[0]  ( .D(comb_gray_w_ptr[0]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[0]) );
  DFFRQX2M \gray_w_ptr_reg[4]  ( .D(comb_gray_w_ptr[4]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[4]) );
  NOR2BX2M U3 ( .AN(w_inc), .B(full), .Y(n4) );
  OAI2BB2X1M U4 ( .B0(n4), .B1(n3), .A0N(N6), .A1N(n4), .Y(n13) );
  OAI2BB2X1M U5 ( .B0(n4), .B1(n1), .A0N(N4), .A1N(n4), .Y(n11) );
  AND4X2M U6 ( .A(n5), .B(n6), .C(n7), .D(n8), .Y(full) );
  XNOR2X2M U7 ( .A(comb_gray_w_ptr[0]), .B(sync_rd_ptr[0]), .Y(n5) );
  XNOR2X2M U8 ( .A(comb_gray_w_ptr[1]), .B(sync_rd_ptr[1]), .Y(n6) );
  XNOR2X2M U9 ( .A(comb_gray_w_ptr[2]), .B(sync_rd_ptr[2]), .Y(n8) );
  OAI2BB2X1M U10 ( .B0(n4), .B1(n2), .A0N(N5), .A1N(n4), .Y(n12) );
  INVX2M U11 ( .A(w_addr[1]), .Y(n1) );
  INVX2M U12 ( .A(w_addr[3]), .Y(n3) );
  NOR2X2M U13 ( .A(n9), .B(n10), .Y(n7) );
  XNOR2X2M U14 ( .A(comb_gray_w_ptr[4]), .B(sync_rd_ptr[4]), .Y(n9) );
  XNOR2X2M U15 ( .A(comb_gray_w_ptr[3]), .B(sync_rd_ptr[3]), .Y(n10) );
  AO2B2X2M U16 ( .B0(N7), .B1(n4), .A0(comb_gray_w_ptr[4]), .A1N(n4), .Y(n14)
         );
  AO2B2X2M U17 ( .B0(N3), .B1(n4), .A0(w_addr[0]), .A1N(n4), .Y(n15) );
  CLKXOR2X2M U18 ( .A(n1), .B(n2), .Y(comb_gray_w_ptr[1]) );
  CLKXOR2X2M U19 ( .A(comb_gray_w_ptr[4]), .B(w_addr[3]), .Y(
        comb_gray_w_ptr[3]) );
  CLKXOR2X2M U20 ( .A(w_addr[0]), .B(w_addr[1]), .Y(comb_gray_w_ptr[0]) );
  CLKXOR2X2M U21 ( .A(n2), .B(n3), .Y(comb_gray_w_ptr[2]) );
  ADDHX1M U22 ( .A(w_addr[2]), .B(\add_38/carry[2] ), .CO(\add_38/carry[3] ), 
        .S(N5) );
  ADDHX1M U23 ( .A(w_addr[1]), .B(w_addr[0]), .CO(\add_38/carry[2] ), .S(N4)
         );
  ADDHX1M U24 ( .A(w_addr[3]), .B(\add_38/carry[3] ), .CO(\add_38/carry[4] ), 
        .S(N6) );
  CLKINVX1M U25 ( .A(w_addr[0]), .Y(N3) );
  CLKXOR2X2M U26 ( .A(\add_38/carry[4] ), .B(comb_gray_w_ptr[4]), .Y(N7) );
endmodule


module fifo_rd_P_SIZE5 ( r_clk, r_rstn, r_inc, sync_wr_ptr, rd_addr, empty, 
        gray_rd_ptr );
  input [4:0] sync_wr_ptr;
  output [3:0] rd_addr;
  output [4:0] gray_rd_ptr;
  input r_clk, r_rstn, r_inc;
  output empty;
  wire   N3, N4, N5, N6, N7, n1, n2, n3, n4, n5, n6, \add_38/carry[4] ,
         \add_38/carry[3] , \add_38/carry[2] , n7, n8, n9, n10, n11, n12, n13,
         n14;
  wire   [4:0] comb_gray_rd_ptr;

  DFFRQX2M \rd_ptr_reg[4]  ( .D(n2), .CK(r_clk), .RN(r_rstn), .Q(
        comb_gray_rd_ptr[4]) );
  DFFRQX2M \rd_ptr_reg[0]  ( .D(n6), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[0])
         );
  DFFRQX2M \rd_ptr_reg[1]  ( .D(n5), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[1])
         );
  DFFRQX2M \rd_ptr_reg[2]  ( .D(n4), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[2])
         );
  DFFRQX2M \rd_ptr_reg[3]  ( .D(n3), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[3])
         );
  DFFRQX2M \gray_rd_ptr_reg[3]  ( .D(comb_gray_rd_ptr[3]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[3]) );
  DFFRQX2M \gray_rd_ptr_reg[2]  ( .D(comb_gray_rd_ptr[2]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[2]) );
  DFFRQX2M \gray_rd_ptr_reg[1]  ( .D(comb_gray_rd_ptr[1]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[1]) );
  DFFRQX2M \gray_rd_ptr_reg[0]  ( .D(comb_gray_rd_ptr[0]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[0]) );
  DFFRQX2M \gray_rd_ptr_reg[4]  ( .D(comb_gray_rd_ptr[4]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[4]) );
  NOR2BX2M U3 ( .AN(r_inc), .B(empty), .Y(n1) );
  AO2B2X2M U4 ( .B0(N7), .B1(n1), .A0(comb_gray_rd_ptr[4]), .A1N(n1), .Y(n2)
         );
  AO2B2X2M U5 ( .B0(N6), .B1(n1), .A0(rd_addr[3]), .A1N(n1), .Y(n3) );
  AO2B2X2M U6 ( .B0(N5), .B1(n1), .A0(rd_addr[2]), .A1N(n1), .Y(n4) );
  AO2B2X2M U7 ( .B0(N4), .B1(n1), .A0(rd_addr[1]), .A1N(n1), .Y(n5) );
  AO2B2X2M U8 ( .B0(N3), .B1(n1), .A0(rd_addr[0]), .A1N(n1), .Y(n6) );
  CLKXOR2X2M U9 ( .A(rd_addr[3]), .B(comb_gray_rd_ptr[4]), .Y(
        comb_gray_rd_ptr[3]) );
  CLKXOR2X2M U10 ( .A(rd_addr[3]), .B(rd_addr[2]), .Y(comb_gray_rd_ptr[2]) );
  CLKXOR2X2M U11 ( .A(rd_addr[2]), .B(rd_addr[1]), .Y(comb_gray_rd_ptr[1]) );
  CLKXOR2X2M U12 ( .A(rd_addr[1]), .B(rd_addr[0]), .Y(comb_gray_rd_ptr[0]) );
  ADDHX1M U13 ( .A(rd_addr[2]), .B(\add_38/carry[2] ), .CO(\add_38/carry[3] ), 
        .S(N5) );
  ADDHX1M U14 ( .A(rd_addr[1]), .B(rd_addr[0]), .CO(\add_38/carry[2] ), .S(N4)
         );
  ADDHX1M U15 ( .A(rd_addr[3]), .B(\add_38/carry[3] ), .CO(\add_38/carry[4] ), 
        .S(N6) );
  CLKINVX1M U16 ( .A(rd_addr[0]), .Y(N3) );
  CLKXOR2X2M U17 ( .A(\add_38/carry[4] ), .B(comb_gray_rd_ptr[4]), .Y(N7) );
  CLKXOR2X2M U18 ( .A(comb_gray_rd_ptr[2]), .B(sync_wr_ptr[2]), .Y(n14) );
  NOR2BX1M U19 ( .AN(comb_gray_rd_ptr[0]), .B(sync_wr_ptr[0]), .Y(n7) );
  OAI2B2X1M U20 ( .A1N(sync_wr_ptr[1]), .A0(n7), .B0(comb_gray_rd_ptr[1]), 
        .B1(n7), .Y(n10) );
  NOR2BX1M U21 ( .AN(sync_wr_ptr[0]), .B(comb_gray_rd_ptr[0]), .Y(n8) );
  OAI2B2X1M U22 ( .A1N(comb_gray_rd_ptr[1]), .A0(n8), .B0(sync_wr_ptr[1]), 
        .B1(n8), .Y(n9) );
  CLKNAND2X2M U23 ( .A(n10), .B(n9), .Y(n13) );
  CLKXOR2X2M U24 ( .A(comb_gray_rd_ptr[3]), .B(sync_wr_ptr[3]), .Y(n12) );
  CLKXOR2X2M U25 ( .A(comb_gray_rd_ptr[4]), .B(sync_wr_ptr[4]), .Y(n11) );
  NOR4X1M U26 ( .A(n14), .B(n13), .C(n12), .D(n11), .Y(empty) );
endmodule


module DF_Sync_DATA_SIZE5_1 ( sync_clk, sync_rstn, unsync_ip, sync_op );
  input [4:0] unsync_ip;
  output [4:0] sync_op;
  input sync_clk, sync_rstn;

  wire   [4:0] meta_flop;

  DFFRQX2M \sync_op_reg[4]  ( .D(meta_flop[4]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[4]) );
  DFFRQX2M \sync_op_reg[3]  ( .D(meta_flop[3]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[3]) );
  DFFRQX2M \sync_op_reg[2]  ( .D(meta_flop[2]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[2]) );
  DFFRQX2M \sync_op_reg[1]  ( .D(meta_flop[1]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[1]) );
  DFFRQX2M \sync_op_reg[0]  ( .D(meta_flop[0]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[0]) );
  DFFRQX2M \meta_flop_reg[4]  ( .D(unsync_ip[4]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[4]) );
  DFFRQX2M \meta_flop_reg[3]  ( .D(unsync_ip[3]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[3]) );
  DFFRQX2M \meta_flop_reg[2]  ( .D(unsync_ip[2]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[2]) );
  DFFRQX2M \meta_flop_reg[1]  ( .D(unsync_ip[1]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[1]) );
  DFFRQX2M \meta_flop_reg[0]  ( .D(unsync_ip[0]), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[0]) );
endmodule


module Async_fifo_D_SIZE8_A_SIZE4_P_SIZE5_F_DEPTH16 ( i_w_clk, i_w_rstn, 
        i_w_inc, i_r_clk, i_r_rstn, i_r_inc, i_w_data, o_r_data, o_full, 
        o_empty );
  input [7:0] i_w_data;
  output [7:0] o_r_data;
  input i_w_clk, i_w_rstn, i_w_inc, i_r_clk, i_r_rstn, i_r_inc;
  output o_full, o_empty;
  wire   n1, n2, n3, n4;
  wire   [3:0] w_addr;
  wire   [3:0] r_addr;
  wire   [4:0] gray_w_ptr;
  wire   [4:0] w2r_ptr;
  wire   [4:0] r2w_ptr;
  wire   [4:0] gray_rd_ptr;

  fifo_mem_A_SIZE4_D_SIZE8_F_DEPTH16_P_SIZE5 u_fifo_mem ( .w_clk(i_w_clk), 
        .w_rstn(n1), .w_full(o_full), .w_inc(i_w_inc), .w_addr(w_addr), 
        .r_addr(r_addr), .w_data(i_w_data), .r_data(o_r_data) );
  DF_Sync_DATA_SIZE5_0 u_w2r_sync ( .sync_clk(i_r_clk), .sync_rstn(n3), 
        .unsync_ip(gray_w_ptr), .sync_op(w2r_ptr) );
  fifo_wr_P_SIZE5 u_fifo_wr ( .w_clk(i_w_clk), .w_rstn(n1), .w_inc(i_w_inc), 
        .sync_rd_ptr(r2w_ptr), .w_addr(w_addr), .gray_w_ptr(gray_w_ptr), 
        .full(o_full) );
  fifo_rd_P_SIZE5 u_fifo_rd ( .r_clk(i_r_clk), .r_rstn(n3), .r_inc(i_r_inc), 
        .sync_wr_ptr(w2r_ptr), .rd_addr(r_addr), .empty(o_empty), 
        .gray_rd_ptr(gray_rd_ptr) );
  DF_Sync_DATA_SIZE5_1 u_r2w_sync ( .sync_clk(i_w_clk), .sync_rstn(n1), 
        .unsync_ip(gray_rd_ptr), .sync_op(r2w_ptr) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(i_w_rstn), .Y(n2) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(i_r_rstn), .Y(n4) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;
  wire   Latch_Out;

  TLATNX2M Latch_Out_reg ( .D(CLK_EN), .GN(CLK), .Q(Latch_Out) );
  AND2X2M U2 ( .A(Latch_Out), .B(CLK), .Y(GATED_CLK) );
endmodule


module ALU_OPER_WIDTH8_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0
 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_OPER_WIDTH8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPER_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_OPER_WIDTH8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_OPER_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n14, n13, n15, n11, n12, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n6), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n5), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n8), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n7), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U39 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U40 ( .A(A[3]), .Y(n36) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[4]), .Y(n35) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_OPER_WIDTH8 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_Comb;

  ALU_OPER_WIDTH8_DW_div_uns_0 div_52 ( .a({n12, n11, n10, n9, n8, n7, n6, n5}), .b({B[7], n4, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  ALU_OPER_WIDTH8_DW01_sub_0 sub_46 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, 
        n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, 
        N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_DW01_add_0 add_43 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, 
        n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, 
        N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_DW02_mult_0 mult_49 ( .A({n12, n11, n10, n9, n8, n7, n6, n5}), .B({B[7], n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, 
        N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  BUFX2M U3 ( .A(A[6]), .Y(n11) );
  INVX2M U4 ( .A(EN), .Y(n124) );
  OAI2BB1X2M U7 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U8 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U9 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U10 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U11 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U12 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U13 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U14 ( .A0N(n127), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U15 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  AND2X2M U16 ( .A(n99), .B(n105), .Y(n42) );
  AND2X2M U17 ( .A(n106), .B(n105), .Y(n50) );
  BUFX2M U18 ( .A(n41), .Y(n13) );
  NOR2X2M U19 ( .A(n107), .B(n125), .Y(n41) );
  INVX2M U20 ( .A(n100), .Y(n125) );
  INVX2M U21 ( .A(n107), .Y(n127) );
  NOR2BX2M U22 ( .AN(n106), .B(n125), .Y(n37) );
  NOR2BX2M U23 ( .AN(n35), .B(n124), .Y(n31) );
  INVX2M U24 ( .A(n91), .Y(n126) );
  NOR3BX2M U25 ( .AN(n105), .B(n128), .C(ALU_FUN[2]), .Y(n49) );
  NOR2X2M U26 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U27 ( .A(n106), .B(n129), .C(n3), .Y(n46) );
  NAND2X2M U28 ( .A(EN), .B(n123), .Y(n32) );
  NAND2X2M U29 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U30 ( .A(ALU_FUN[0]), .Y(n129) );
  NOR2X2M U31 ( .A(n129), .B(n3), .Y(n105) );
  NOR2X2M U32 ( .A(n3), .B(ALU_FUN[0]), .Y(n100) );
  INVX2M U33 ( .A(ALU_FUN[1]), .Y(n128) );
  NAND3X2M U34 ( .A(n106), .B(ALU_FUN[0]), .C(n3), .Y(n101) );
  AND2X2M U35 ( .A(ALU_FUN[2]), .B(n128), .Y(n99) );
  AND4X2M U36 ( .A(N159), .B(n99), .C(n3), .D(n129), .Y(n90) );
  NOR3X2M U37 ( .A(n125), .B(ALU_FUN[2]), .C(n128), .Y(n35) );
  NAND3X2M U38 ( .A(n127), .B(n129), .C(n3), .Y(n36) );
  NAND3X2M U39 ( .A(n3), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  AOI31X2M U40 ( .A0(n93), .A1(n94), .A2(n95), .B0(n124), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U41 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U42 ( .A0(n13), .A1(n140), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U43 ( .A0(N109), .A1(n35), .B0(n5), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U44 ( .A0(n81), .A1(n82), .A2(n83), .B0(n124), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U45 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U46 ( .A0(n7), .A1(n126), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U47 ( .A0(N126), .A1(n49), .B0(n13), .B1(n139), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI31X2M U48 ( .A0(n75), .A1(n76), .A2(n77), .B0(n124), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U49 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U50 ( .A0(n8), .A1(n126), .B0(n13), .B1(n138), .C0(n78), .Y(n77)
         );
  AOI222X1M U51 ( .A0(N111), .A1(n35), .B0(n7), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U52 ( .A0(n69), .A1(n70), .A2(n71), .B0(n124), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U53 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U54 ( .A0(n9), .A1(n126), .B0(n13), .B1(n137), .C0(n72), .Y(n71)
         );
  AOI222X1M U55 ( .A0(N112), .A1(n35), .B0(n8), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U56 ( .A0(n63), .A1(n64), .A2(n65), .B0(n124), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U57 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U58 ( .A0(n126), .A1(n10), .B0(n13), .B1(n136), .C0(n66), .Y(n65)
         );
  AOI222X1M U59 ( .A0(N113), .A1(n35), .B0(n9), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U60 ( .A0(n57), .A1(n58), .A2(n59), .B0(n124), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U61 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U62 ( .A0(n126), .A1(n11), .B0(n13), .B1(n135), .C0(n60), .Y(n59)
         );
  AOI222X1M U63 ( .A0(N114), .A1(n35), .B0(n10), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U64 ( .A0(n51), .A1(n52), .A2(n53), .B0(n124), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U65 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U66 ( .A0(n126), .A1(n12), .B0(n13), .B1(n134), .C0(n54), .Y(n53)
         );
  AOI222X1M U67 ( .A0(N115), .A1(n35), .B0(n42), .B1(n11), .C0(N131), .C1(n49), 
        .Y(n52) );
  AOI31X2M U68 ( .A0(n38), .A1(n39), .A2(n40), .B0(n124), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U69 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U70 ( .A0(n13), .A1(n133), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI22X1M U71 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI21X2M U72 ( .A0(n33), .A1(n34), .B0(n124), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U73 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U74 ( .B0(N117), .B1(n35), .A0N(n133), .A1N(n36), .Y(n34) );
  OAI222X1M U75 ( .A0(n55), .A1(n122), .B0(n4), .B1(n56), .C0(n36), .C1(n135), 
        .Y(n54) );
  AOI221XLM U76 ( .A0(n11), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n56)
         );
  AOI221XLM U77 ( .A0(n46), .A1(n134), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U78 ( .A(n4), .Y(n122) );
  INVX2M U79 ( .A(n92), .Y(n123) );
  AOI211X2M U80 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  BUFX2M U81 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U82 ( .A(n6), .Y(n139) );
  INVX2M U83 ( .A(n5), .Y(n140) );
  INVX2M U84 ( .A(n11), .Y(n134) );
  INVX2M U85 ( .A(n12), .Y(n133) );
  INVX2M U86 ( .A(n8), .Y(n137) );
  INVX2M U87 ( .A(n7), .Y(n138) );
  INVX2M U88 ( .A(n10), .Y(n135) );
  INVX2M U89 ( .A(n9), .Y(n136) );
  BUFX2M U90 ( .A(B[6]), .Y(n4) );
  BUFX2M U91 ( .A(A[7]), .Y(n12) );
  BUFX2M U92 ( .A(A[5]), .Y(n10) );
  BUFX2M U93 ( .A(A[4]), .Y(n9) );
  BUFX2M U94 ( .A(A[3]), .Y(n8) );
  BUFX2M U95 ( .A(A[2]), .Y(n7) );
  BUFX2M U96 ( .A(A[1]), .Y(n6) );
  BUFX2M U97 ( .A(A[0]), .Y(n5) );
  INVX2M U98 ( .A(n25), .Y(n120) );
  OAI222X1M U99 ( .A0(n79), .A1(n119), .B0(B[2]), .B1(n80), .C0(n36), .C1(n139), .Y(n78) );
  AOI221XLM U100 ( .A0(n7), .A1(n46), .B0(n47), .B1(n138), .C0(n13), .Y(n80)
         );
  AOI221XLM U101 ( .A0(n46), .A1(n138), .B0(n7), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U102 ( .A0(n73), .A1(n121), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n138), .Y(n72) );
  AOI221XLM U103 ( .A0(n8), .A1(n46), .B0(n47), .B1(n137), .C0(n13), .Y(n74)
         );
  AOI221XLM U104 ( .A0(n46), .A1(n137), .B0(n8), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U105 ( .A0(n67), .A1(n132), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n137), .Y(n66) );
  INVX2M U106 ( .A(B[4]), .Y(n132) );
  AOI221XLM U107 ( .A0(n9), .A1(n46), .B0(n47), .B1(n136), .C0(n13), .Y(n68)
         );
  AOI221XLM U108 ( .A0(n46), .A1(n136), .B0(n9), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U109 ( .A0(n61), .A1(n131), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n136), .Y(n60) );
  INVX2M U110 ( .A(B[5]), .Y(n131) );
  AOI221XLM U111 ( .A0(n10), .A1(n46), .B0(n47), .B1(n135), .C0(n13), .Y(n62)
         );
  AOI221XLM U112 ( .A0(n46), .A1(n135), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U113 ( .A0(n44), .A1(n130), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n134), .Y(n43) );
  INVX2M U114 ( .A(B[7]), .Y(n130) );
  AOI221XLM U115 ( .A0(n46), .A1(n12), .B0(n47), .B1(n133), .C0(n13), .Y(n45)
         );
  AOI221XLM U116 ( .A0(n46), .A1(n133), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  OAI2B2X1M U117 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n139), .Y(n97) );
  AOI221XLM U118 ( .A0(n46), .A1(n140), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI2B2X1M U119 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n140), .Y(n85) );
  AOI221XLM U120 ( .A0(n46), .A1(n139), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  INVX2M U121 ( .A(n14), .Y(n118) );
  OAI21X2M U122 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U123 ( .A0(n5), .A1(n46), .B0(n47), .B1(n140), .C0(n13), .Y(n102)
         );
  AOI31X2M U124 ( .A0(N157), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U125 ( .A(n128), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI21X2M U126 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U127 ( .A0(n6), .A1(n46), .B0(n47), .B1(n139), .C0(n13), .Y(n87)
         );
  AOI31X2M U128 ( .A0(N158), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U129 ( .A(n129), .B(ALU_FUN[2]), .C(n128), .Y(n89) );
  INVX2M U130 ( .A(B[0]), .Y(n117) );
  INVX2M U131 ( .A(B[2]), .Y(n119) );
  INVX2M U132 ( .A(B[3]), .Y(n121) );
  NOR2X1M U133 ( .A(n133), .B(B[7]), .Y(n113) );
  NAND2BX1M U134 ( .AN(B[4]), .B(n9), .Y(n29) );
  NAND2BX1M U135 ( .AN(n9), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U136 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U137 ( .A(n121), .B(n8), .Y(n26) );
  NOR2X1M U138 ( .A(n119), .B(n7), .Y(n17) );
  NOR2X1M U139 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U140 ( .A(n7), .B(n119), .Y(n28) );
  NAND2BX1M U141 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U142 ( .A0(n14), .A1(n139), .B0(B[1]), .Y(n15) );
  AOI211X1M U143 ( .A0(n6), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U144 ( .A(n8), .B(n121), .Y(n27) );
  OAI31X1M U145 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U146 ( .AN(n10), .B(B[5]), .Y(n111) );
  OAI211X1M U147 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U148 ( .AN(B[5]), .B(n10), .Y(n30) );
  XNOR2X1M U149 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U150 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n134), .Y(n21)
         );
  CLKNAND2X2M U151 ( .A(B[7]), .B(n133), .Y(n114) );
  OAI21X1M U152 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U153 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U154 ( .A0(n24), .A1(n139), .B0(B[1]), .Y(n22) );
  AOI211X1M U155 ( .A0(n24), .A1(n139), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U156 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U157 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U158 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U159 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  CLKINVX1M U160 ( .A(n116), .Y(N158) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module SYS_TOP ( REF_CLK, UART_CLK, RST_N, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input REF_CLK, UART_CLK, RST_N, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_RST_REF, SYNC_RST_UART, CLK_TX, CLK_RX, RX_OUT_V, TX_BUSY,
         FIFO_EMPTY_TOP, RD_INC, RX_OUT_V_SYNC, WrEn_TOP, RdEn_TOP,
         RdData_Valid_TOP, ALU_OUT_VALID_TOP, ALU_EN_TOP, CLKG_EN, WR_INC_TOP,
         FIFO_FULL_TOP, ALU_CLK, n1, n2, n3, n4, n5;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] CLK_RX_DIV_RATIO;
  wire   [7:0] RX_OUT_P;
  wire   [7:0] FIFO_RD_DATA;
  wire   [7:0] RX_OUT_P_SYNC;
  wire   [7:0] WrData_TOP;
  wire   [3:0] Address_TOP;
  wire   [7:0] RdData_TOP;
  wire   [7:0] A_TOP;
  wire   [7:0] B_TOP;
  wire   [15:0] ALU_OUT_TOP;
  wire   [3:0] ALU_FUN_TOP;
  wire   [7:0] FIFO_P_DATA_TOP;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  RST_SYNC_NUM_STAGES2_0 RST_SYNC_REF ( .RST(RST_N), .CLK(REF_CLK), .SYNC_RST(
        SYNC_RST_REF) );
  RST_SYNC_NUM_STAGES2_1 RST_SYNC_UART ( .RST(RST_N), .CLK(UART_CLK), 
        .SYNC_RST(SYNC_RST_UART) );
  clk_div_DATA_WIDTH8_0 CLK_TX_TOP ( .I_ref_clk(UART_CLK), .I_rst_n(n2), 
        .I_clk_en(1'b1), .I_div_ratio(DIV_RATIO), .O_div_clk(CLK_TX) );
  CLKDIV_MUX_WIDTH8 CLKDIV_MUX_TOP ( .IN(UART_CONFIG[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        CLK_RX_DIV_RATIO[3:0]}) );
  clk_div_DATA_WIDTH8_1 CLK_RX_TOP ( .I_ref_clk(UART_CLK), .I_rst_n(n2), 
        .I_clk_en(1'b1), .I_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        CLK_RX_DIV_RATIO[3:0]}), .O_div_clk(CLK_RX) );
  UART_DATA_WIDTH8 UART_TOP ( .RST(n2), .TX_CLK(CLK_TX), .RX_CLK(CLK_RX), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(RX_OUT_P), .RX_OUT_V(RX_OUT_V), 
        .TX_IN_P(FIFO_RD_DATA), .TX_IN_V(n1), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        TX_BUSY), .Prescale(UART_CONFIG[7:2]), .parity_enable(UART_CONFIG[0]), 
        .parity_type(UART_CONFIG[1]), .parity_error(parity_error), 
        .framing_error(framing_error) );
  PULSE_GEN PULSE_GEN_TOP ( .clk(CLK_TX), .rst(n2), .lvl_sig(TX_BUSY), 
        .pulse_sig(RD_INC) );
  DATA_SYNC_BUS_WIDTH8_NUM_STAGES2 DATA_SYNC_TOP ( .Unsync_bus(RX_OUT_P), 
        .bus_enable(RX_OUT_V), .CLK(REF_CLK), .RST(n4), .sync_bus(
        RX_OUT_P_SYNC), .enable_pusle(RX_OUT_V_SYNC) );
  RegFile_WIDTH8_DEPTH16_ADDR4 RegFile_TOP ( .WrData(WrData_TOP), .Address(
        Address_TOP), .WrEn(WrEn_TOP), .RdEn(RdEn_TOP), .CLK(REF_CLK), .RST(n4), .RdData(RdData_TOP), .RdData_VLD(RdData_Valid_TOP), .REG0(A_TOP), .REG1(
        B_TOP), .REG2(UART_CONFIG), .REG3(DIV_RATIO) );
  SYS_CTRL_DATA_WIDTH8_ADDR4 SYS_CTRL_TOP ( .CLK(REF_CLK), .RST(n4), .ALU_OUT(
        ALU_OUT_TOP), .OUT_VALID(ALU_OUT_VALID_TOP), .ALU_FUN(ALU_FUN_TOP), 
        .ALU_EN(ALU_EN_TOP), .CLKG_EN(CLKG_EN), .Address(Address_TOP), .WrEn(
        WrEn_TOP), .RdEn(RdEn_TOP), .WrData(WrData_TOP), .RdData(RdData_TOP), 
        .RdData_Valid(RdData_Valid_TOP), .RX_P_DATA(RX_OUT_P_SYNC), .RX_D_VLD(
        RX_OUT_V_SYNC), .FIFO_P_DATA(FIFO_P_DATA_TOP), .WR_INC(WR_INC_TOP), 
        .FIFO_FULL(FIFO_FULL_TOP) );
  Async_fifo_D_SIZE8_A_SIZE4_P_SIZE5_F_DEPTH16 ASYNC_FIFO_TOP ( .i_w_clk(
        REF_CLK), .i_w_rstn(n4), .i_w_inc(WR_INC_TOP), .i_r_clk(CLK_TX), 
        .i_r_rstn(n2), .i_r_inc(RD_INC), .i_w_data(FIFO_P_DATA_TOP), 
        .o_r_data(FIFO_RD_DATA), .o_full(FIFO_FULL_TOP), .o_empty(
        FIFO_EMPTY_TOP) );
  CLK_GATE CLK_GATE_TOP ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  ALU_OPER_WIDTH8 ALU_TOP ( .A(A_TOP), .B(B_TOP), .EN(ALU_EN_TOP), .ALU_FUN(
        ALU_FUN_TOP), .CLK(ALU_CLK), .RST(n4), .ALU_OUT(ALU_OUT_TOP), 
        .OUT_VALID(ALU_OUT_VALID_TOP) );
  INVX2M U2 ( .A(n3), .Y(n2) );
  INVX2M U3 ( .A(FIFO_EMPTY_TOP), .Y(n1) );
  INVX4M U4 ( .A(n5), .Y(n4) );
  INVX2M U5 ( .A(SYNC_RST_REF), .Y(n5) );
  INVX2M U6 ( .A(SYNC_RST_UART), .Y(n3) );
endmodule


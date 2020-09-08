/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Apr  9 20:56:04 2019
/////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module COUNTER ( CLOCK, RESET, ENABLE, CONTROL, COUNT );
  output [3:0] COUNT;
  input CLOCK, RESET, ENABLE, CONTROL;
  wire   n5, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AO1P U13 ( .A(COUNT[1]), .B(n9), .C(n16), .D(n17), .Z(n12) );
  OR3 U26 ( .A(COUNT[1]), .B(COUNT[2]), .C(n17), .Z(n19) );
  AN3P U27 ( .A(COUNT[0]), .B(CONTROL), .C(COUNT[1]), .Z(n15) );
  FD3 \COUNT_reg[2]  ( .D(n23), .CP(CLOCK), .CD(RESET), .SD(1'b1), .Q(COUNT[2]), .QN(n27) );
  FD3 \COUNT_reg[3]  ( .D(n24), .CP(CLOCK), .CD(RESET), .SD(1'b1), .Q(COUNT[3]) );
  FD3 \COUNT_reg[1]  ( .D(n22), .CP(CLOCK), .CD(RESET), .SD(1'b1), .Q(COUNT[1]) );
  FD3 \COUNT_reg[0]  ( .D(n25), .CP(CLOCK), .CD(RESET), .SD(1'b1), .Q(COUNT[0]), .QN(n26) );
  IVP U28 ( .A(n16), .Z(n5) );
  EO U29 ( .A(n26), .B(n16), .Z(n25) );
  AO4 U30 ( .A(COUNT[1]), .B(n26), .C(COUNT[0]), .D(n9), .Z(n17) );
  ND2 U31 ( .A(ENABLE), .B(n20), .Z(n16) );
  AO3 U32 ( .A(COUNT[3]), .B(n27), .C(n7), .D(n21), .Z(n20) );
  AO2 U33 ( .A(COUNT[3]), .B(n9), .C(COUNT[1]), .D(n27), .Z(n21) );
  IVP U34 ( .A(n17), .Z(n7) );
  AO7 U35 ( .A(n12), .B(n27), .C(n13), .Z(n23) );
  AO3 U36 ( .A(n14), .B(n15), .C(n27), .D(n5), .Z(n13) );
  NR3 U37 ( .A(CONTROL), .B(COUNT[1]), .C(COUNT[0]), .Z(n14) );
  EN U38 ( .A(COUNT[1]), .B(n10), .Z(n22) );
  ND2 U39 ( .A(n11), .B(n5), .Z(n10) );
  EO U40 ( .A(n9), .B(COUNT[0]), .Z(n11) );
  EON1 U41 ( .A(n18), .B(n16), .C(n16), .D(COUNT[3]), .Z(n24) );
  AO2 U42 ( .A(n15), .B(COUNT[2]), .C(COUNT[3]), .D(n19), .Z(n18) );
  IVP U43 ( .A(CONTROL), .Z(n9) );
endmodule


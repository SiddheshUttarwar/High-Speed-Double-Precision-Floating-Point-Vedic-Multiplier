`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 04:33:21 PM
// Design Name: 
// Module Name: vedic_3bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vedic_3bit(mul,a,b);
input [2:0] a,b;
output wire [5:0]mul;
wire [8:0] temp;
and_gate g1(temp[0],a[0],b[0]);
and_gate g2(temp[1],a[1],b[0]);
and_gate g3(temp[2],a[0],b[1]);
and_gate g4(temp[3],a[2],b[0]);
and_gate g5(temp[4],a[1],b[1]);
and_gate g6(temp[5],a[0],b[2]);
and_gate g7(temp[6],a[1],b[2]);
and_gate g8(temp[7],a[2],b[1]);
and_gate g9(temp[8],a[2],b[2]);

wire c1;

assign mul[0] = temp[0];
half_adder ad1(mul[1],c1,temp[1],temp[2]);

wire s2,c2;
full_adder ad2(s2,c2,temp[3],temp[4],temp[5]);

wire s3,c3;
half_adder ad3(s3,c3,temp[6],temp[7]);

wire x1,x2,x3;

half_adder ad4(mul[2],x1,c1,s2);
full_adder ad5(mul[3],x2,c2,s3,x1);
full_adder ad6(mul[4],x3,c3,temp[8],x2);

assign mul[5] = x3;
endmodule

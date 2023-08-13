`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2022 10:50:51 PM
// Design Name: 
// Module Name: vedic_53bit
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


module vedic_53bit(m,a,b);
input [52:0] a,b;
output [105:0] m;

wire [51:0]out1,out2;

mux52bit mux1(out1,a[51:0],b[52]);
mux52bit mux2(out2,b[51:0],a[52]);

wire [51:0] out3;
wire c1;

adder52bit ad1(out3,c1,out1,out2,1'b0);

wire [103:0] out4;

vedic_52bit m1(out4,a[51:0],b[51:0]);

wire [51:0] out5;
wire c2;

adder52bit ad2(out5,c2,out3,out4[103:52],1'b0);

wire last;

andgate andg(last,a[52],b[52]);
wire sum,carry;

full_adder ad3(sum,carry,c1,c2,last);

//assigning output
assign m[51:0] = out4[51:0];
assign m[103:52] = out5;
assign m[104] = sum;
assign m[105] = carry;

endmodule

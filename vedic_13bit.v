`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 03:04:08 PM
// Design Name: 
// Module Name: vedic_13bit
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


module vedic_13bit(m,a,b);
input [12:0] a,b;
output [25:0] m;

wire [11:0]out1,out2;

mux12bit mux1(out1,a[11:0],b[12]);
mux12bit mux2(out2,b[11:0],a[12]);

wire [11:0] out3;
wire c1;

adder12bit ad1(out3,c1,out1,out2,1'b0);

wire [23:0] out4;

vedic_12bit m1(out4,a[11:0],b[11:0]);

wire [11:0] out5;
wire c2;

adder12bit ad2(out5,c2,out3,out4[23:12],1'b0);

wire last;

andgate andg(last,a[12],b[12]);
wire sum,carry;

full_adder ad3(sum,carry,c1,c2,last);

//assigning output
assign m[11:0] = out4[11:0];
assign m[23:12] = out5;
assign m[24] = sum;
assign m[25] = carry;

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 11:14:08 AM
// Design Name: 
// Module Name: adder52bit
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


module adder52bit(sum,carry,a,b,cin);
input [51:0]a,b;
input cin;
output [51:0] sum;
output carry;
wire c;
adder26bit ad1(sum[25:0],c,a[25:0],b[25:0],cin);
adder26bit ad2(sum[51:26],carry,a[51:26],b[51:26],c);
endmodule

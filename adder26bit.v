`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 04:08:23 PM
// Design Name: 
// Module Name: adder26bit
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


module adder26bit(sum,carry,a,b,cin);
input [25:0] a,b;
input cin;
output [25:0] sum;
output carry;
wire c;
adder13bit ad1(sum[12:0],c,a[12:0],b[12:0],cin);
adder13bit ad2(sum[25:13],carry,a[25:13],b[25:13],c);
endmodule

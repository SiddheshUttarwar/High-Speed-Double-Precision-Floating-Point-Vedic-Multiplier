`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 10:32:51 PM
// Design Name: 
// Module Name: adder6bit
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


module adder6bit(sum,carry,a,b,cin);
input [5:0] a,b;
input cin;
output [5:0] sum;
output carry;

wire c1;
adder3bit ad1(sum[2:0],c1,a[2:0],b[2:0],cin);
adder3bit ad2(sum[5:3],carry,a[5:3],b[5:3],c1);

endmodule

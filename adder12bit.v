`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 09:24:14 AM
// Design Name: 
// Module Name: adder12bit
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


module adder12bit(sum,carry,a,b,cin);
input [11:0] a,b;
input cin;
output [11:0] sum;
output carry;

wire c;

adder6bit ad1(sum[5:0] ,c, a[5:0] ,b[5:0] , cin);
adder6bit ad2(sum[11:6] ,carry, a[11:6] ,b[11:6] , c); 

endmodule

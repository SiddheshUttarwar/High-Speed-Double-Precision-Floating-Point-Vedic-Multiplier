`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 04:05:01 PM
// Design Name: 
// Module Name: adder13bit
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


module adder13bit(sum,carry,a,b,cin);
input [12:0] a,b;  
input cin;
output [12:0] sum;
wire [11:0] temp;
output carry;
wire sl;
wire c;
adder12bit ad1(temp,c,a[11:0],b[11:0],cin);
full_adder ad2(s,carry,a[12],b[12],c);
assign sum[11:0] = temp;
assign sum[12] = s;
endmodule

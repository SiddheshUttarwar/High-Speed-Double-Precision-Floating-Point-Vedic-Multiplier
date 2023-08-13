`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 10:32:51 PM
// Design Name: 
// Module Name: adder3bit
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


module adder3bit(sum,carry,a,b,cin);
input [2:0] a,b;
input cin;
output [2:0] sum;
output carry;

wire c1,c2;

full_adder ad1(sum[0],c1,a[0],b[0],cin);
full_adder ad2(sum[1],c2,a[1],b[1],c1);
full_adder ad3(sum[2],carry,a[2],b[2],c2);

endmodule

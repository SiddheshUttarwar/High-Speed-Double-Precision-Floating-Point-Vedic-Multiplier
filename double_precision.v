`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2022 08:52:09 PM
// Design Name: 
// Module Name: double_precision
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


module double_precision(mul,a,b);
input [63:0] a,b;
output [63:0] mul;
wire [105:0] temp;
wire [10:0] temp2;
assign mul[63] = a[63]^b[63];
exponent ex(temp2,a[62:52],b[62:52]);
vedic_53bit m(temp,{1'b1,a[51:0]},{1'b1,b[51:0]});
normalizer norm(mul[62:52],mul[51:0],temp,temp2);
endmodule

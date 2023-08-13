`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2022 12:47:35 PM
// Design Name: 
// Module Name: normalizer
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


module normalizer(oexp,op,in,exp);
input [105:0] in;
input [10:0] exp;
output reg [51:0] op;
output reg [10:0] oexp;
always @(*)
    if(in[105]==1)
    begin
        op <= in[104:53];
        oexp <= exp+1'd1;
    end
    else
    begin
        op <= in[103:52];
        oexp<=exp;
    end
endmodule

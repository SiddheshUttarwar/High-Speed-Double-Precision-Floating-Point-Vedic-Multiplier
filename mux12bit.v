`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 03:05:29 PM
// Design Name: 
// Module Name: mux12bit
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


module mux12bit(out,in,s);
input [11:0] in;
input s;
output reg [11:0] out;

always @(*)
begin
    case(s)
        1'b0 : out <= 12'b0;
        1'b1 : out <= in;
    endcase
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2022 10:52:19 PM
// Design Name: 
// Module Name: mux52bit
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


module mux52bit(out,in,s);
input [51:0] in;
input s;
output reg [51:0] out;
always @(*)
begin
    case(s)
        1'b0 : out <= 52'b0;
        1'b1 : out <= in;
    endcase
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 11:14:08 AM
// Design Name: 
// Module Name: vedic_52bit
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


module vedic_52bit(mul,a,b);
input [51:0] a,b;
output [103:0] mul;

wire [51:0] temp1,temp2,temp3,temp4;

vedic_26bit m1(temp1,a[25:0],b[25:0]);
vedic_26bit m2(temp2,a[25:0],b[51:26]);
vedic_26bit m3(temp3,a[51:26],b[25:0]);
vedic_26bit m4(temp4,a[51:26],b[51:26]);

wire [51:0]ado1;
wire c1;

adder52bit ad1(ado1,c1,temp2,temp3,1'b0);

wire [51:0] inp;
assign inp[25:0] = temp1[51:26];
assign inp[51:26] = temp4[25:0];

wire [51:0] ado2;
wire c2;

adder52bit ad2(ado2,c2,ado1,inp,1'b0);

wire c;
or g1(c,c1,c2);

wire [25:0]ado3;
assign ado3[25:1] = 25'b0;
assign ado3[0] = c;

wire [25:0] ado4;
wire cout;

adder26bit ad3(ado4,cout,ado3,temp4[51:26],1'b0);

assign mul[25:0] = temp1[25:0];
assign mul[77:26] = ado2;
assign mul[103:78] = ado4;

endmodule

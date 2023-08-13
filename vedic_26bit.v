`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 04:08:00 PM
// Design Name: 
// Module Name: vedic_26bit
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


module vedic_26bit(mul,a,b);
input [25:0] a,b;
output [51:0] mul;

wire [25:0] temp1,temp2,temp3,temp4;

vedic_13bit m1(temp1,a[12:0],b[12:0]);
vedic_13bit m2(temp2,a[12:0],b[25:13]);
vedic_13bit m3(temp3,a[25:13],b[12:0]);
vedic_13bit m4(temp4,a[25:13],b[25:13]);

wire [25:0]ado1;
wire c1;

adder26bit ad1(ado1,c1,temp2,temp3,1'b0);

wire [25:0] inp;
assign inp[12:0] = temp1[25:13];
assign inp[25:13] = temp4[12:0];

wire [25:0] ado2;
wire c2;

adder26bit ad2(ado2,c2,ado1,inp,1'b0);

wire c;
or g1(c,c1,c2);

wire [12:0]ado3;
assign ado3[12:1] = 12'b0;
assign ado3[0] = c;

wire [12:0] ado4;
wire cout;

adder13bit ad3(ado4,cout,ado3,temp4[25:13],1'b0);

assign mul[12:0] = temp1[12:0];
assign mul[38:13] = ado2;
assign mul[51:39] = ado4;

endmodule

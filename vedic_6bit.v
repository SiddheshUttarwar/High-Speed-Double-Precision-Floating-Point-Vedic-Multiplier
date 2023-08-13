`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 05:28:01 PM
// Design Name: 
// Module Name: vedic_6bit
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


module vedic_6bit(mul,a,b);
input [5:0] a,b;
output [11:0] mul;

wire [5:0] out1,out2,out3,out4;

vedic_3bit m1(out1,a[2:0],b[2:0]);
vedic_3bit m2(out2,a[2:0],b[5:3]);
vedic_3bit m3(out3,a[5:3],b[2:0]);
vedic_3bit m4(out4,a[5:3],b[5:3]);

wire [5:0]ado1;
wire c1;

adder6bit ad1(ado1,c1,out2,out3,1'b0);

wire [5:0] inp;
assign inp[2:0] = out1[5:3];
assign inp[5:3] = out4[2:0];

wire [5:0] ado2;
wire c2;

adder6bit ad2(ado2,c2,ado1,inp,1'b0);

wire c;
or g1(c,c1,c2);

wire [2:0]ado3;
assign ado3[2:1] = 2'b0;
assign ado3[0] = c;

wire [2:0] ado4;
wire cout;

adder3bit ad3(ado4,cout,ado3,out4[5:3],1'b0);

//assigning outputs

assign mul[2:0] = out1[2:0];
assign mul[8:3] = ado2;
assign mul[11:9] = ado4;

endmodule

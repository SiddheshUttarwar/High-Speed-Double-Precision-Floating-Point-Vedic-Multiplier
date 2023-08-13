`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 09:50:49 AM
// Design Name: 
// Module Name: vedic_12bit
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


module vedic_12bit(mul,a,b);
input [11:0] a,b; 
output [23:0] mul;

wire [11:0] temp1,temp2,temp3,temp4;

vedic_6bit m1(temp1,a[5:0],b[5:0]);
vedic_6bit m2(temp2,a[5:0],b[11:6]);
vedic_6bit m3(temp3,a[11:6],b[5:0]);
vedic_6bit m4(temp4,a[11:6],b[11:6]);

wire [11:0]ado1;
wire c1;

adder12bit ad1(ado1,c1,temp2,temp3,1'b0);

wire [11:0] inp;
assign inp[5:0] = temp1[11:6];
assign inp[11:6] = temp4[5:0];

wire [11:0] ado2;
wire c2;

adder12bit ad2(ado2,c2,ado1,inp,1'b0);

wire c;
or g1(c,c1,c2);

wire [5:0]ado3;
assign ado3[5:1] = 5'b0;
assign ado3[0] = c;

wire [5:0] ado4;
wire cout;

adder6bit ad3(ado4,cout,ado3,temp4[11:6],1'b0);

//assigning outputs

assign mul[5:0] = temp1[5:0];
assign mul[17:6] = ado2;
assign mul[23:18] = ado4;

endmodule

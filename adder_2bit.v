`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// File Name : adder_2bit
// Description : 2 Bit Adder
// Created By : Siddhesh Uttarwar
//////////////////////////////////////////////////////////////////////////////////


module adder_2bit(sum,carry,a,b);
input [1:0] a,b;
output wire [1:0] sum;
output wire carry;
wire c0;
full_adder ad1(sum[0],c0,a[0],b[0],1'b0);
full_adder ad2(sum[1],carry,a[1],b[1],c0);
endmodule

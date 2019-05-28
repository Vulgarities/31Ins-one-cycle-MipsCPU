`timescale 1ns / 1ps
module adder(
    input [31:0] a, 
    input [31:0] b,
    output [31:0] r
    );
    assign r = a+b;
 endmodule
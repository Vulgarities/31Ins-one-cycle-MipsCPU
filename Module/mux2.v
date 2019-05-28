`timescale 1ns / 1ps
module mux2(
    input [31:0] a,
    input [31:0] b,
    input Select,
    output wire[31:0] r
    );
    assign r = (Select==0)?a:b;
endmodule

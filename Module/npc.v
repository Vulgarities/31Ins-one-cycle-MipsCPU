`timescale 1ns / 1ps
module npc(
    input [31:0] a,
    input reset,
    output [31:0] r
    );
    assign r = (reset==1)? a : a+4;
endmodule

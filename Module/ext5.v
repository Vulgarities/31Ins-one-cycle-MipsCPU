`timescale 1ns / 1ps
module ext5(
    input  [4:0]  a,
    output [31:0] b
    );
    assign b = {27'b0,a};
endmodule

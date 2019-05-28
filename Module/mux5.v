`timescale 1ns / 1ps
module mux5(
    input [4:0] a,
    input [4:0] b,
    input Jalena,
    input Select,
    output [4:0] r
    );
    assign r = (Jalena==1) ? 5'b11111 : ( (Select==1) ?b:a );
endmodule

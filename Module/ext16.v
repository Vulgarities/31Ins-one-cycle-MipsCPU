`timescale 1ns / 1ps
module ext16(
    input [15:0] a,
    input s,          
    output [31:0] b
    );
    //value of s: 1--> sign_extend    0--> zero_extend
    assign b = s ? {{(16){a[15]}},a} : {16'b0,a};
endmodule
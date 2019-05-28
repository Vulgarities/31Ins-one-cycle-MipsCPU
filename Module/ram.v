`timescale 1ns / 1ps
module ram(
    input clk, 
    input wena,
    input rena, 
    input [31:0] addr,
    input       [31:0] data_in, 
    output reg [31:0] data_out
    );
    reg [31:0] memory[1023:0];
    always @(posedge clk)
    begin
        if(rena)
            data_out <= memory[(addr-32'h10010000)/4];
        if(wena)
            memory[(addr-32'h10010000)/4] <= data_in;
    end
endmodule

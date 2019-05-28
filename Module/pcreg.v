`timescale 1ns / 1ps
module pcreg(
    input clk,
    input rst,
    input  [31:0] data_in,
    output [31:0] data_out
    );
    reg [31:0] programcounter;
    always @(negedge clk or posedge rst) begin
        if(rst==1)
            programcounter = 31'h0040_0000;
        else
            programcounter = data_in;
    end
    assign data_out = programcounter;
endmodule
`timescale 1ns / 1ps
module regfile(
    input clk, 
    input reset, 
    input rf_w, 
    input [4:0] raddr1, 
    input [4:0] raddr2, 
    input [4:0]  waddr, 
    input [31:0] wdata, 
    output [31:0] rdata1, 
    output [31:0] rdata2
    );
    reg [31:0] array_reg[31:0];      //reg $0 ~ reg $31, bitlength:32
    assign rdata1 = array_reg[raddr1];
    assign rdata2 = array_reg[raddr2];    

    always @(negedge clk or posedge reset) begin      //negedge clk to write                                      
        if(reset) begin                               //when reset == 1 , reg0-reg31 <= 0
        array_reg[0]  <= 0;          
        array_reg[1]  <= 0;
        array_reg[2]  <= 0;
        array_reg[3]  <= 0;
        array_reg[4]  <= 0;
        array_reg[5]  <= 0;
        array_reg[6]  <= 0;
        array_reg[7]  <= 0;
        array_reg[8]  <= 0;
        array_reg[9]  <= 0;
        array_reg[10] <= 0;
        array_reg[11] <= 0;
        array_reg[12] <= 0;
        array_reg[13] <= 0;
        array_reg[14] <= 0;
        array_reg[15] <= 0;
        array_reg[16] <= 0;
        array_reg[17] <= 0;
        array_reg[18] <= 0;
        array_reg[19] <= 0;
        array_reg[20] <= 0;
        array_reg[21] <= 0;
        array_reg[22] <= 0;
        array_reg[23] <= 0;
        array_reg[24] <= 0;
        array_reg[25] <= 0;
        array_reg[26] <= 0;
        array_reg[27] <= 0;
        array_reg[28] <= 0;
        array_reg[29] <= 0;
        array_reg[30] <= 0;
        array_reg[31] <= 0;
        end     
        
        else if(rf_w)begin     //write able, not reset     
            if(waddr !=0)
                array_reg[waddr] <= wdata;
            else
                array_reg[0]   <= 0; 
        end             
    end 
endmodule

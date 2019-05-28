`timescale 1ns / 1ps
module sccomp_dataflow(
    input clk_in,
    input reset,
    output [31:0] inst,
    output [31:0] pc
	//output [7:0] o_seg,
	//output [7:0] o_sel  
    );
    //reg clk;
    wire [31:0]pc_in;
    wire [31:0]rdata;
    wire [31:0]addr;
    wire [31:0]wdata;
    wire DM_R;
    wire DM_W;
    //wire [31:0] inst;
    //wire [31:0] pc;
    integer count;
    assign pc_in = ((pc - 32'h0040_0000)); 
    /*parameter T=10;
    always @ (posedge clk_in)
    begin
        if(reset==1)
        begin
            count<=0;
            clk<=0;
        end
        if(count==0)
            clk<=0;
        else if(count==5)
            clk<=1;
        count=(count+1)%T;
    end*/
    wire clk;
    assign clk = clk_in;

    //seg7x16 led(clk,reset,1,pc,o_seg,o_sel);
    imem imem(pc_in[12:2] ,inst);   
    ram  dmem(.clk(clk),.wena(DM_W), .rena(DM_R),  .addr(addr),.data_in(wdata),.data_out(rdata));
    cpu sccpu(.clk(clk),.reset(reset),.inst(inst),.rdata(rdata),  .pc(pc), .addr(addr), .wdata(wdata), .rena(DM_R), .wena(DM_W));
endmodule

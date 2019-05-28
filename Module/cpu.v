`timescale 1ns / 1ps
module cpu(
    input         clk,
    input         reset,
    input  [31:0] inst,
    input  [31:0] rdata,
    output [31:0] pc,
    output [31:0] addr,
    output [31:0] wdata,
    output        rena,
    output        wena
    );
    wire [31:0] ALU;             
    wire [31:0] PC;                         
    wire [31:0] Rs;              
    wire [31:0] Rt;              
    wire [31:0] Mux1;            
    wire [31:0] Mux2;            
    wire [31:0] Mux3;            
    wire [4:0]  Mux4;            
    wire [4:0]  Mux5;            
    wire [31:0] Mux6;            
    wire [31:0] Mux7;            
    wire [31:0] Mux9;            
    wire [31:0] Mux8;            
    wire [31:0] EXT5;            
    wire [31:0] EXT16;           
    wire [31:0] EXT18;           
    wire [31:0] ADD;             
    wire [31:0] ADD8;            
    wire [31:0] NPC;             
    wire [31:0] CONNECT;
    wire M1;                         
    wire M2;                       
    wire M3;                       
    wire M4;                       
    wire M5;                       
    wire M6;                       
    wire M7;                       
    wire M9;                       
    wire M8;                                 
    wire Rf_W;                     
    wire Dm_W;                     
    wire Dm_R;                     
    wire C_EXT16;  
    wire [3:0] ALUC;                   
    wire [31:0] INSCODE;          
    assign pc    = PC;      //current inst addr
    assign addr  = ALU;     //addr for dmem caculated by alu
    assign wdata = Rt;      //wdata for dmem by regfile
    assign rena  = Dm_R;    
    assign wena  = Dm_W;

    ins_decoder ins_decode (inst,INSCODE);
    controller  optioncode (ALU,INSCODE,M1,M2,M3,M4,M5,M6,M7,M9,M8,ALUC,Rf_W,Dm_W,Dm_R,C_EXT16);   
    regfile cpu_ref  (clk,   reset,  Rf_W,     inst[25:21],  inst[20:16],  Mux5,   Mux6, Rs,  Rt);
    pcreg   cpu_pc   (clk,   reset,  Mux1,     PC);
    npc     cpu_npc  (PC,    reset,  NPC);    
    alu     cpu_alu  (Mux9,  Mux8,   ALUC,     ALU);
    adder   cpu_add  (EXT18, NPC,    ADD);
    adder   cpu_ad8  (PC,    4,      ADD8);
    connect connect  (PC[31:28],inst[25:0],    CONNECT);
    
    ext5    ext_5    (Mux4,       EXT5 );
    ext18   ext_18   (inst[15:0], EXT18);
    ext16   ext_16   (inst[15:0], C_EXT16,     EXT16);                     
                             
    mux2    mux1   (Mux3,     Mux2,     M1,     Mux1);
    mux2    mux2   (NPC,      ADD,      M2,     Mux2);
    mux2    mux3   (CONNECT,  Rs,       M3,     Mux3);
    mux2    mux6   (Mux7,     ADD8,     M6,     Mux6);
    mux2    mux7   (ALU,      rdata,    M7,     Mux7);
    mux2    mux9   (EXT5,     Rs,       M9,     Mux9);
    mux2    mux8   (Rt,       EXT16,    M8,     Mux8);
    mux5    mux4   (inst[10:6], Rs[4:0],    INSCODE[30],     M4,     Mux4);
    mux5    mux5   (inst[15:11],inst[20:16],INSCODE[30],     M5,     Mux5);
endmodule
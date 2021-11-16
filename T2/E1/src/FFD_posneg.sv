//Here you should configure the macro that defines which edge activates the clear
//`define <PosCLEAR or NegCLEAR>
`define NegCLEAR
//If neither NegCLEAR or PosCLEAR are defined, the FF will be posedge activated by default
`ifndef NegCLEAR
    `ifndef PosCLEAR
        `define PosCLEAR
    `endif
`endif

module FFD_posneg#(parameter LEN = 4)(
    input clk, clr, 
    input [LEN -1 : 0] datain,
    output reg [LEN -1 : 0] dataout
);

`ifndef PosCLEAR
always @(posedge clk or negedge clr)begin
    if (!clr) dataout <= {LEN{1'b0}};
`else
always @(posedge clk or posedge clr)begin
    if (clr) dataout <= {LEN{1'b0}};
`endif

    else begin
        dataout <= datain;  
    end
end
endmodule : FFD_posneg
`define FFD(clk, clr, en, D_i, Q_o, t_edge = posedge, clrval = 1)\
always @(posedge clk or t_edge clr)begin\
    if(clr == clrval) Q_o <= 1'b0;\
    else if (en) Q_o <= D_i;\
end

module FFD_posneg(
    input clock, clear, enable, Data,
    output reg Data_out
);

`FFD(clock, clear, enable, Data, Data_out, negedge, 0);

endmodule
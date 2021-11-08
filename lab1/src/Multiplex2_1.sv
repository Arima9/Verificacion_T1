module Multiplex2_1#(parameter DW = 8)(Ain, Bin, Sel, Sal);
input logic [DW-1:0] Ain, Bin;
output logic [DW-1:0] Sal;
input logic Sel;

assign Sal = Sel? Bin, Ain;

endmodule

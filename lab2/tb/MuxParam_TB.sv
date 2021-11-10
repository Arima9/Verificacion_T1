`timescale 1ns / 1ps
module Mux_Param_TB();
import MuxParam_pkg::*;
parameter Selector = 2;

logic [Selector-1:0] Sel;
MuxParam_pkg::op_codes_e_t Var_Enum[2**Selector];
MuxParam_pkg::mem_ctl_st_t Var_Stru[2**Selector];

MuxParam_pkg::op_codes_e_t ResultEn;
MuxParam_pkg::mem_ctl_st_t ResultSt;

MuxParam #(.T(MuxParam_pkg::op_codes_e_t), .SEL(Selector)) DUT0(.Entry(Var_Enum), .Select(Sel), .Sal(ResultEn));
MuxParam #(.T(MuxParam_pkg::mem_ctl_st_t), .SEL(Selector)) DUT1(.Entry(Var_Stru), .Select(Sel), .Sal(ResultSt));

task check_MuxParam_Enum;
input Aenum, Bstru, Sel, EnumMux, StruMux;
MuxParam_pkg::op_codes_e_t Aenum[2**Selector];
MuxParam_pkg::mem_ctl_st_t Bstru[2**Selector];
logic [Selector-1:0] Sel;
MuxParam_pkg::op_codes_e_t EnumMux;
MuxParam_pkg::mem_ctl_st_t StruMux;

MuxParam_pkg::op_codes_e_t ResultEnum_Gold;
MuxParam_pkg::mem_ctl_st_t ResultStru_Gold;

begin
	ResultEnum_Gold = Aenum[Sel];
	ResultStru_Gold = Bstru[Sel];
	
	if (EnumMux != ResultEnum_Gold)
		$display($time, "Error en el MUX de tipo Enumerado. Valor Obtenido %s, Valor Esperado %s", EnumMux.name, ResultEnum_Gold.name);
		$stop(1);
	if (StruMux != ResultStru_Gold)
		$display($time, "Error en el MUX de tipo Estructura. Valor Obtenido ", StruMux, ", Valor Esperado", ResultStru_Gold;
		$stop(1);
end

endtask

initial begin: TB
MuxParam_pkg::op_codes_e_t Var0[4];
MuxParam_pkg::mem_ctl_st_t Var1[4];

Var0[0] = 0;
Var0[1] = 1;
Var0[2] = 2;
Var0[3] = 3;

Var1[0].addr = 8'd153;
Var1[0].data = 8'd225;
Var1[0].op = 1'd0;

Var1[1].addr = 8'd222;
Var1[1].data = 8'd177;
Var1[1].op = 1'd1;

Var1[2].addr = 8'd45;
Var1[2].data = 8'd100;
Var1[2].op = 1'd1;

Var1[3].addr = 8'd133;
Var1[3].data = 8'd200;
Var1[3].op = 1'd0;

Var_Enum = Var0;
Var_Stru = Var1;
logic [Selector:0] Select; 

for (Select=0; Select < 2**Selector; Select++)begin
Sel = Select;
#1;
check_MuxParam_Enum(.Aenum(Var0), .Bstru(Var1), .Sel(Select), .EnumMux(ResultEn), .StruMux(ResultSt));
end
$display("Ha terminado la simulacion exitosamente.");
$stop(1);
end


endmodule

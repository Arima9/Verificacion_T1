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
		$display($time, "Error en el MUX de tipo Enumerado. Valor Obtenido %s, Valor Esperado %s", EnumMux, ResultEnum_Gold);
		$stop(1);
	if (StruMux != ResultStru_Gold)
		$display($time, "Error en el MUX de tipo Estructura. Valor Obtenido ", StruMux, ", Valor Esperado", ResultStru_Gold;
		$stop(1);
end

endtask



endmodule

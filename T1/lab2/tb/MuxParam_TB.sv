`timescale 1ns / 1ps
module Mux_Param_TB();
import MuxParam_pkg::*;
parameter Selector = 2;

logic [Selector-1:0] Sel;
op_codes_e_t Var_Enum[2**Selector];
mem_ctl_st_t Var_Stru[2**Selector];

op_codes_e_t ResultEn;
mem_ctl_st_t ResultSt;

MuxParam #(.T(op_codes_e_t), .SEL(Selector)) DUT0(.Entry(Var_Enum), .Select(Sel), .Sal(ResultEn));
MuxParam #(.T(mem_ctl_st_t), .SEL(Selector)) DUT1(.Entry(Var_Stru), .Select(Sel), .Sal(ResultSt));

task check_MuxParam_Enum;
input Aenum, Bstru, Sel, EnumMux, StruMux;
op_codes_e_t Aenum[2**Selector];
mem_ctl_st_t Bstru[2**Selector];
logic [Selector-1:0] Sel;
op_codes_e_t EnumMux;
mem_ctl_st_t StruMux;

op_codes_e_t ResultEnum_Gold;
mem_ctl_st_t ResultStru_Gold;

begin
	ResultEnum_Gold = Aenum[Sel];
	ResultStru_Gold = Bstru[Sel];
	
	if (EnumMux != ResultEnum_Gold)begin
		$display($time, "Error en el MUX de tipo Enumerado. Valor Obtenido %s, Valor Esperado %s", EnumMux.name, ResultEnum_Gold.name);
		$stop(1);
	end
	if (StruMux != ResultStru_Gold)begin
		$display($time, "Error en el MUX de tipo Estructura. Valor Obtenido ", StruMux, ", Valor Esperado", ResultStru_Gold);
		$stop(1);
	end
end

endtask

initial begin: TB

logic [Selector:0] Select;
op_codes_e_t Var0[4];
mem_ctl_st_t Var1[4];
	
Var0[0] = EXECUTE;
Var0[1] = FETCH;
Var0[2] = DECODE;
Var0[3] = WB;

Var1[0].addr = 8'd153;
Var1[0].data = 8'd225;
Var1[0].op = RD;

Var1[1].addr = 8'hA5;
Var1[1].data = 8'd177;
Var1[1].op = WR;

Var1[2].addr = 8'd45;
Var1[2].data = 8'd100;
Var1[2].op = WR;

Var1[3].addr = 8'd133;
Var1[3].data = 8'd200;
Var1[3].op = RD;

Var_Enum = Var0;
Var_Stru = Var1; 

for (Select=0; Select < 2**Selector; Select++)begin
Sel = Select;
#1;
check_MuxParam_Enum(.Aenum(Var0), .Bstru(Var1), .Sel(Select), .EnumMux(ResultEn), .StruMux(ResultSt));
end
$display("Simulacion ejecutada correctamente. Tiempo:",$time);
$stop(1);
end


endmodule

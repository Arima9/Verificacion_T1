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



endmodule
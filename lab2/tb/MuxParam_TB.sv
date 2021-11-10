`timescale 1ns / 1ps
module Mux_Param_TB();
import MuxParam_pkg::*;

MuxParam_pkg::op_codes_e_t Var0;
MuxParam_pkg::mem_ctl_st_t Var1;

MuxParam #(.T(MuxParam_pkg::op_codes_e_t), .SEL(2)) DUT0(.Entry(), .Select(), .Sal());
MuxParam #(.T(MuxParam_pkg::mem_ctl_st_t), .SEL(2)) DUT1(.Entry(), .Select(), .Sal());

endmodule
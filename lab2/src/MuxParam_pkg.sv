`ifndef MuxParam_pkg_sv
	`define MuxParam_pkg_sv
	package MuxParam_pkg;
	typedef enum logic [1:0] {EXECUTE, FETCH, DECODE, WB} op_codes_e_t;
	typedef struct {
		logic [7:0] addr;
		logic [3:0] data;
		enum {RD,WR} op;
		} mem_ctl_st_t;
	endpackage
`endif

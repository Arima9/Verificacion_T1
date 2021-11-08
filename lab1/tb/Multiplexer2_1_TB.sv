module Multiplexer2_1_TB();
parameter DW = 8;
logic [DW-1 : 0] A_t, B_t, Sal_t;
logic Sel_t;

Multiplex2_1#(DW)(.Ain(A_t), .Bin(B_t), .Sel(Sel_t), .Sal(Sal_t));

task Check_Mux;
	input i, j, k, Sal_Mux;
	logic k;
	logic [DW-1:0] i, j, Sal_Gold, Sal_Mux;
	
	begin
		if (k == '1) Sal_Gold = j;
		else Sal_Gold = i;
		
		if (Sal_Gold != Sal_Mux)begin
			$display($time, "Error: i=%d, j=%d, k=%d, esperado %d (%b), obtenido %d (%b)", i, j, k, Sal_Gold, Sal_Gold, Sal_Mux, Sal_Mux);
			$stop(1);
		end
	end
endtask

initial begin: TB
	logic [DW:0] A, B, OUT;
	logic [1:0]S;
	
	for (S=0; S < 2; S++) begin
		Sel_t = S;
		for(A = 0; A < 2**DW; A++)begin
			A_t = A;
			for(B= 0; B < 2**DW; B++)begin
				B_t = B;
				#5;
				Check_Mux(A, B, S, Sal_t);
			end
		end
	end
end
endmodule
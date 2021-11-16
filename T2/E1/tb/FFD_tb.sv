`define NegCLEAR //The FF_D will be negative edge activated.
`timescale 1 ns / 100 ps

module FFD_tb;
localparam WIDTH = 8;
logic [WIDTH-1:0] DATA_in, DATA_out;
logic Clock = 1'b0;
logic clear = `ifdef NegCLEAR 1'b1 `else 1'b0 `endif;

//Clock signal generator
always begin
    #1 Clock = ~Clock;
end 

FFD_posneg #(.LEN(WIDTH)) DUT(
    .clk(Clock), .clr(clear), 
    .datain(DATA_in),
    .dataout(DATA_out)
);

task Check_FF;
input D_in, D_in_FF, clk, clear;
logic [WIDTH-1:0] D_in, D_in_FF, D_out_gold;
logic clk, clear;
begin
    if (clear == `ifdef NegCLEAR 0 `else 1 `endif) D_out_gold = {WIDTH{1'b0}};
    else if (clk == 1) D_out_gold = D_in;

    if (D_in_FF != D_out_gold)begin
        $display($time,"Ha habido un error, se esperaba %d (%b): se obtuvo en su lugar %d (%b)", D_out_gold, D_out_gold, D_in_FF, D_in_FF);
        $stop(1);
    end 
end
endtask

initial begin: TB    
    integer i, j;
    for (j = 0; j< 2; j++)begin
        clear = j;    
        for (i = 0; i < 2**WIDTH; i++)begin
            DATA_in = i;
            #2
            Check_FF(.D_in(i), .D_in_FF(DATA_out), .clk(Clock), .clear(clear));
        end
    end
    $display("La simulacion ha terminado exitosamente. Tiempo = %t", $time);
    $stop(1);
end

endmodule
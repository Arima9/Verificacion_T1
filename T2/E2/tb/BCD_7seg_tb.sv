`timescale 10ns/1ns
`define SevDisp(Severity, t0, t1, t2) $Severity(t0, t1, t2);

module BCD_7seg_tb();
logic [3:0] BCDin;
logic [6:0] _7segOUT;

BCD_7Seg DUT(BCDin, _7segOUT);

task Check7seg;
input BCDcode, _7segresult;
logic [3:0] BCDcode;
logic [6:0] _7segresult, _7segGUIDE;

if (BCDcode > 4'd9) begin
    `SevDisp(fatal, 1, "Displaying fatal message, numero mayor a 9.", ); 
end
else if (BCDcode == 4'd5) begin
    `SevDisp(info, "Desplegando informacion,", " el numero BCD es igual a 5.", ); 
end
else if (BCDcode == 4'd15) begin
    `SevDisp(error, "Se ha llegado al tope de la variable.", ,);
end

if (BCDcode == 4'd0) _7segGUIDE = 7'd64;
else if (BCDcode == 4'd1) _7segGUIDE = 7'd121;
else if (BCDcode == 4'd2) _7segGUIDE = 7'd36;
else if (BCDcode == 4'd3) _7segGUIDE = 7'd48;
else if (BCDcode == 4'd4) _7segGUIDE = 7'd25;
else if (BCDcode == 4'd5) _7segGUIDE = 7'd18;
else if (BCDcode == 4'd6) _7segGUIDE = 7'd2;
else if (BCDcode == 4'd7) _7segGUIDE = 7'd120;
else if (BCDcode == 4'd8) _7segGUIDE = 7'd0;
else if (BCDcode == 4'd9) _7segGUIDE = 7'd16;
else _7segGUIDE = 7'd127;

    begin
        if (_7segresult != _7segGUIDE) begin
            `SevDisp(warning, "Mensaje de warning desplegado", , );
            $display("Hay un error en la simulacion, se obtuvo %d(%b), y se esperaba %d(%b).",_7segresult,_7segresult,_7segGUIDE,_7segGUIDE);
            $stop(1);
        end
    end

endtask

initial begin: TB
    integer i;
    for(i = 0; i < 16; i++)begin
        BCDin = i;
        #1;
        Check7seg(.BCDcode(BCDin), ._7segresult(_7segOUT));
        #1;
    end
    $display("La simulacion ha terminado exitosamente.");
    $stop(2);
end
endmodule
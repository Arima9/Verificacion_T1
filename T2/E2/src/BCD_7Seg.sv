module BCD_7Seg(
    input [3:0]BCD_in,
    output reg [6:0] Seg7
);

//     0
//     --  
//  5 |  | 1
//     --   <- 6
//  4 |  | 2
//     --
//     3
always @(BCD_in)
begin
   case (BCD_in)
       4'b0000 : Seg7 <= 7'b1000000; //d'64
       4'b0001 : Seg7 <= 7'b1111001; //d'121
       4'b0010 : Seg7 <= 7'b0100100; //d'36
       4'b0011 : Seg7 <= 7'b0110000; //d'48
       4'b0100 : Seg7 <= 7'b0011001; //d'25
       4'b0101 : Seg7 <= 7'b0010010; //d'18
       4'b0110 : Seg7 <= 7'b0000010; //d'2
       4'b0111 : Seg7 <= 7'b1111000; //d'120
       4'b1000 : Seg7 <= 7'b0000000; //d'0
       4'b1001 : Seg7 <= 7'b0010000; //d'16
	   4'b1010 : Seg7 <= 7'bxxxxxxx; //d'x
       4'b1011 : Seg7 <= 7'bxxxxxxx; //d'x
       4'b1100 : Seg7 <= 7'bxxxxxxx; //d'x
       4'b1101 : Seg7 <= 7'bxxxxxxx; //d'x
       4'b1110 : Seg7 <= 7'bxxxxxxx; //d'x
       4'b1111 : Seg7 <= 7'bxxxxxxx; //d'x
       default : Seg7 <= 7'b1111111; //d'127
    endcase
end
endmodule
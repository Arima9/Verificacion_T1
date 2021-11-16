onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FFD_tb/DUT/clk
add wave -noupdate /FFD_tb/DUT/clr
add wave -noupdate -radix hexadecimal /FFD_tb/DUT/datain
add wave -noupdate -radix hexadecimal /FFD_tb/DUT/dataout
add wave -noupdate -radix hexadecimal /FFD_tb/Check_FF/D_in
add wave -noupdate -radix hexadecimal /FFD_tb/Check_FF/D_in_FF
add wave -noupdate /FFD_tb/Check_FF/clk
add wave -noupdate /FFD_tb/Check_FF/clear
add wave -noupdate -radix hexadecimal /FFD_tb/Check_FF/D_out_gold
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 203
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {25600 ps}

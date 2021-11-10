onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Multiplexer2_1_TB/A_t
add wave -noupdate /Multiplexer2_1_TB/B_t
add wave -noupdate /Multiplexer2_1_TB/Sal_t
add wave -noupdate /Multiplexer2_1_TB/Sel_t
add wave -noupdate /Multiplexer2_1_TB/Check_Mux/Sal_Gold
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {327680 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 93
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
WaveRestoreZoom {327502 ps} {329283 ps}

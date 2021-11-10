onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Mux_Param_TB/Selector
add wave -noupdate /Mux_Param_TB/Sel
add wave -noupdate /Mux_Param_TB/Var_Enum
add wave -noupdate /Mux_Param_TB/Var_Stru
add wave -noupdate /Mux_Param_TB/ResultEn
add wave -noupdate /Mux_Param_TB/ResultSt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {194 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 224
configure wave -valuecolwidth 147
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
WaveRestoreZoom {0 ps} {840 ps}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Mux_Param_TB/DUT0/Entry
add wave -noupdate /Mux_Param_TB/DUT0/Select
add wave -noupdate /Mux_Param_TB/DUT0/Sal
add wave -noupdate /Mux_Param_TB/DUT1/Entry
add wave -noupdate /Mux_Param_TB/DUT1/Select
add wave -noupdate /Mux_Param_TB/DUT1/Sal
add wave -noupdate /Mux_Param_TB/check_MuxParam_Enum/Aenum
add wave -noupdate /Mux_Param_TB/check_MuxParam_Enum/Bstru
add wave -noupdate /Mux_Param_TB/check_MuxParam_Enum/Sel
add wave -noupdate /Mux_Param_TB/check_MuxParam_Enum/EnumMux
add wave -noupdate /Mux_Param_TB/check_MuxParam_Enum/StruMux
add wave -noupdate /Mux_Param_TB/check_MuxParam_Enum/ResultEnum_Gold
add wave -noupdate /Mux_Param_TB/check_MuxParam_Enum/ResultStru_Gold
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1 ns}

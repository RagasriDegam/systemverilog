
vlib work
vlog list.svh
vsim -novopt -suppress 12110 tb -assertdebug  +test_name=NWR_NRD +N=5 
add wave -r sim:/tb/pif/*
#do wave.do
run -all




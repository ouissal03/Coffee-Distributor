onerror {exit -code 1}
vlib work
vlog -work work Distributeur_Cafe.vo
vlog -work work Simulation.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Distributeur_Cafe_vlg_vec_tst -voptargs="+acc"
vcd file -direction Distributeur_Cafe.msim.vcd
vcd add -internal Distributeur_Cafe_vlg_vec_tst/*
vcd add -internal Distributeur_Cafe_vlg_vec_tst/i1/*
run -all
quit -f

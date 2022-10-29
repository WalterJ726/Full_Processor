transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/lab1 {E:/Duke_Materials/22fall/550/Labs/lab1/nand_gate.v}

vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/lab1 {E:/Duke_Materials/22fall/550/Labs/lab1/nand_gate_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  nand_gate_tb

add wave *
view structure
view signals
run -all

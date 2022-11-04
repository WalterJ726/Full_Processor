transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/processor.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/pc.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/extend.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/RCA.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/ripple_carry_adder_4b.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/regfile.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/alu.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/insn_decoder.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/dffe_ref.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/frequency_divider.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/full_adder.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/skeleton.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/imem.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/dmem.v}

vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4 {E:/Duke_Materials/22fall/550/Labs/Project4/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all

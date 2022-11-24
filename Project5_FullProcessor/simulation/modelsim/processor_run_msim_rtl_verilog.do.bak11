transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/processor.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/pc.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/extend.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/Mux_1.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/Mux_16.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/RCA.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/ripple_carry_adder_4b.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/regfile.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/CSA.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/alu.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/insn_decoder.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/dffe_ref.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/frequency_divider.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/full_adder.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/skeleton.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/clk_div4.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/control_decoder.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/imem.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/dmem.v}

vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor {E:/Duke_Materials/22fall/550/Labs/Project4_SimpleProcessor/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all

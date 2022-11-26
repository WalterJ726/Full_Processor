transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/processor.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/pc.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/extend.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/Mux_1.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/Mux_16.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/RCA.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/ripple_carry_adder_4b.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/regfile.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/CSA.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/alu.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/insn_decoder.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/dffe_ref.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/frequency_divider.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/full_adder.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/skeleton.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/clk_div4.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/imem.v}
vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/dmem.v}

vlog -vlog01compat -work work +incdir+E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor {E:/Duke_Materials/22fall/550/Labs/Project5_FullProcessor/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all

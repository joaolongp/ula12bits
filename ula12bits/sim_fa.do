if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vcom -work work package_ula.vhd
vcom -work work soma_sub.vhd
vcom -work work ula.vhd
vcom -work work tb_ula.vhd


vsim -voptargs=+acc=lprn -t ns work.tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1


run 90 ns


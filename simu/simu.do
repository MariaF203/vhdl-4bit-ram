puts "Simulation script for ModelSim "

# Create work library
vlib work

# Compile design files, then the testbench
vcom -93 ../src/d_ff.vhd
vcom -93 ../src/reg4.vhd
vcom -93 reg4_tb.vhd

# Load the testbench
vsim reg4_tb

# Add signals to the waveform viewer
add wave -divider "Clock / Reset"
add wave -radix binary     /reg4_tb/clk_tb
add wave -radix binary     /reg4_tb/rst_tb
add wave -divider "Data"
add wave -radix binary     /reg4_tb/d_tb
add wave -radix binary     /reg4_tb/q_tb

# Run the testbench
run -a

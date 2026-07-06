# 4-bit Memory in VHDL: From Logic Gates to Registers

Repository for the article *"Implementation of a 4-bit Memory in
VHDL: From Logic Gates to Registers"*. It contains the VHDL source for a
4-bit register built from D flip-flops, a testbench, and a script to run
the simulation with ModelSim.

The goal of this code is to illustrate the concepts explained in the
article, not to teach VHDL from scratch. Each file is commented and maps
directly to a section of the article.

## Repository structure

```
.
├── src/
│   ├── d_ff.vhd      Single-bit D flip-flop
│   └── reg4.vhd       4-bit register
└── simu/
    ├── reg4_tb.vhd    Testbench
    └── simu.do        ModelSim script
```

## Requirements

You can run the simulation with ModelSim.

- [ModelSim](https://www.intel.com/content/www/us/en/software-kit/750368/modelsim-intel-fpgas-standard-edition-software-version-18-1.html)
  (Intel FPGA Starter Edition is free)

## Running the simulation with ModelSim

From the `simu/` directory:

```tcl
vsim -do simu.do
```

This compiles `d_ff.vhd` and `reg4.vhd`, loads the testbench, opens the
waveform viewer, and runs the simulation.

## License

Feel free to reuse and adapt this code for learning purposes.

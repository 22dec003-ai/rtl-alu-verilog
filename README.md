# RTL Design Projects in Verilog

This repository contains basic RTL design modules written in Verilog along with their testbenches.  

## Included Designs

### 1. Parameterized ALU
## Features
- Data width (8-bit)
- Performs arithmetic and logical operations:
  - Addition  
  - Subtraction  
  - Bitwise AND, OR, XOR  
  - Logical shift left and right  
  - Comparison (A < B)
- Zero flag generation
- Complete testbench with stimulus 
- Waveform dump using VCD for EPWave

### 2. Synchronous FIFO
- Parameterized depth and data width
- Implements write and read pointer logic
- Provides **full** and **empty** status flags
- Includes a dedicated testbench to verify write/read functionality
- Demonstrates basic memory-based sequential RTL design

## Simulation
The design was verified using **Icarus Verilog** on **EDA Playground**.

Steps:
1. Compile the design and testbench  
2. Run simulation  
3. View waveform using EPWave/GTKWave  

## Author
**Ekta Jolly**  
PhD Research Scholar – Nanoscale Circuit Design & Low-Power VLSI


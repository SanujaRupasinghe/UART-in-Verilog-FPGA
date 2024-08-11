# UART-in-Verilog-FPGA
UART transceiver implemented in FPGA.

## Overview
This project demonstrates a UART (Universal Asynchronous Receiver/Transmitter) transceiver implemented in Verilog and deployed on a DE0 Nano FPGA. The repository contains two versions of the UART implementation, each with a set of modules and testbenches.

## Repository Structure

### Version 2
- **baudrate.v**: Baudrate generator implemented. 115200
- **baudrate_tb.v**: Testbench for the baudrate generator.
- **receiver.v**: UART receiver implemented.
- **transmitter.v**: UART transmitter implemented.
- **ROM.v**: ROM module to load bytes for transmission.
- **uart.v**: Complete UART implementation.

### Version 1
- **baudrate.v**: Baudrate generator implemented. 115200
- **baudrate_tb.v**: Testbench for the baudrate generator.
- **receiver.v**: UART receiver implemented.
- **transmitter.v**: UART transmitter implemented.
- **transmitter_tb.v**: Testbench for the UART transmitter.
- **uart.v**: Complete UART implementation.
- **testbench.v**: Testbench for the entire UART system.

## ROM Module Details - `ROM.v`
The ROM is structured with 32 8-bit registers, initialized with predefined values. The address is internally generated from 0 to 31, looping iteratively. Data is loaded on the negative edge of the `load_en` signal. For a given 5-bit address, when `load_en` is triggered (typically by pressing a switch), 8-bit data is loaded to the output.

## UART Transmitter - `transmitter.v`
The transmitter is designed to send data when `wr_en` is low and continues until `wr_en` goes high. To transmit data synchronized with the edges of `wr_en`, different methods were explored. The final implementation uses a **flag method** with two flags to identify the negative edge of `wr_en`. The transmitter is triggered on the positive edge of `wr_en`, allowing data to load from the ROM at the negative edge (button press) and transmit at the positive edge (button release). This state machine approach proved to be more reliable.

## Images
The following images provide visual insights into the project:

1. **Baudrate Test**
   ![Baudrate_test](https://github.com/user-attachments/assets/1bbe12f3-7955-4c15-821d-ea19ce19437b)

2. **UART Test**
   ![Uart_test](https://github.com/user-attachments/assets/2a8fbac3-d2f8-4ef8-a38a-793ee9eeba19)

3. **Implementation 1**
   ![WhatsApp Image 2024-08-11 at 13 32 30_d8afc58](https://github.com/user-attachments/assets/d1a40bde-2922-4678-828b-6651c504705e)

4. **Implementation 2**
   ![WhatsApp Image 2024-08-11 at 13 32 30_af6988fb](https://github.com/user-attachments/assets/676ff2f5-8fa4-464b-b60c-3fea7456ca9e)

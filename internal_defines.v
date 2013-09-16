////
//// Internal signal constants
////

// General
`define ENABLE				1'b1
`define DISABLE			1'b0

// ALU A source (mux)
`define A_FROM_RA			1'b0
`define A_FROM_RB			1'b1

// ALU B source (mux)
`define B_FROM_RB			2'b00
`define B_FROM_IMM_SE	2'b01
`define B_FROM_IMM_ZE	2'b10
`define B_FROM_SHAMT		2'b11

// Register write-back result origin
`define WRITE_FROM_ALU	2'b00
`define WRITE_FROM_MEM	2'b01
`define WRITE_FROM_PC	2'b10
`define WRITE_FROM_COP	2'b11

// Register write-back destination
`define WRITE_TO_RD		2'b00
`define WRITE_TO_RT		2'b01
`define WRITE_TO_R14		2'b10
`define WRITE_TO_R15		2'b11

// Next PC
`define PC_PLUS_4			2'b00
`define PC_OFFSET			2'b01
`define PC_FROM_ALU		2'b10

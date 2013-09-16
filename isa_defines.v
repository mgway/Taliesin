/* Taliesin Defines
 * 9/14/2013 - Version 1
 *
 * Description:
 * Contains useful define macros for machine code decoding. 
 * Primary opcodes are the opcodes that appear in the first 8 bits
 * of the instruction, while secondary opcodes appear in R-type instructions.
 * All primary opcodes should be self explanatory and map nicely to secondary
 * opcodes by left padding 4 bits. 
 * 
 */
 
// Primary Opcodes
`define OP_TRAP		8'h00
`define OP_RR			8'h01
`define OP_ADD 		8'h02
`define OP_ADDU		8'h03
`define OP_SUB			8'h04
`define OP_OR			8'h05
`define OP_XOR			8'h06
`define OP_AND			8'h07
`define OP_NOT			8'h08
`define OP_LSL			8'h09
`define OP_LSR			8'h0a
`define OP_ASR			8'h0b
`define OP_CMP			8'h0c
`define OP_SW			8'h0d
`define OP_LW			8'h0e
//      TRAP			8'h0f
`define OP_JEQ			8'h10
`define OP_LNE			8'h11
`define OP_JGT			8'h12
`define OP_JLT			8'h13
`define OP_JLE			8'h14
`define OP_JGE			8'h15
`define OP_JAL			8'h16

// Interrupt Handling
`define OP_SWI			8'h20
`define OP_RTI			8'h21

// Mathematics Extension
`define OP_COP			8'h30


// Secondary Opcodes
`define SOP_RET		12'h000
`define SOP_J			12'h001
`define SOP_ADD		12'h002
`define SOP_ADDU		12'h003
`define SOP_SUB		12'h004
`define SOP_OR			12'h005
`define SOP_XOR		12'h006
`define SOP_AND		12'h007
`define SOP_NOT		12'h008
`define SOP_LSL		12'h009
`define SOP_LSR		12'h00a
`define SOP_ASR		12'h00b
`define SOP_CMP		12'h00c
`define SOP_SW			12'h00d
`define SOP_LW			12'h00e
//      Undefined		12'h00f

// Secondary Opcodes for Math Extension
`define SOP_MTLO		12'h001
`define SOP_MTHI		12'h002
`define SOP_MFLO		12'h003
`define SOP_MFHI		12'h004
`define SOP_MULT		12'h005
`define SOP_MULTU		12'h006
`define SOP_DIV		12'h007
`define SOP_DIVU		12'h008

// Condition Register Fields
`define CR_N			32'd0
`define CR_Z			32'd1
`define CR_C			32'd2
`define CR_I			32'd3

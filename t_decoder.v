/* Taliesin Decoder
 * 9/14/2013 - Version 1
 *
 * Description:
 * Work in progress decoder
 * 
 */

`include "isa_defines.v"
`include "internal_defines.v"

module TALIESIN_DECODE (
	// Inputs
	op_primary, op_secondary,
	// Outputs
	alu_a_mux_sel, alu_b_mux_sel, cr_enable,
	writeback_source_sel, writeback_dest_sel, writeback_enable,
	memory_enable, next_pc_sel
	);
	
	input       [7:0] op_primary;
	input		  [11:0] op_secondary;
	
   output reg        writeback_enable, memory_enable, cr_enable;
   output reg  [1:0] alu_a_mux_sel, alu_b_mux_sel, next_pc_sel;
	output reg  [1:0] writeback_source_sel, writeback_dest_sel;

	always @(*) begin
		// Preset everything to avoid any unwanted latches
		writeback_enable 		= `DISABLE;
		memory_enable 			= `DISABLE;
		cr_enable 				= `DISABLE;
		next_pc_sel				= `PC_PLUS_4;
		alu_a_mux_sel			= `A_FROM_RA;
		alu_a_mux_sel			= `B_FROM_RB;
		writeback_source_sel = `WRITE_FROM_ALU;
		writeback_dest_sel 	= `WRITE_TO_RD;
		
		case (op_primary)
			`OP_TRAP: begin
			end
			
			`OP_RR: begin
				case (op_secondary)
					`SOP_RET: begin
						next_pc_sel = `PC_FROM_ALU;
					end
					`SOP_J: begin
						next_pc_sel = `PC_FROM_ALU;
					end
					default: begin
						writeback_enable 		= `ENABLE;
						writeback_source_sel = `WRITE_FROM_ALU;
						writeback_dest_sel 	= `WRITE_TO_RD;
						alu_a_mux_sel 			= `A_FROM_RA;
						alu_b_mux_sel 			= `B_FROM_RB; 
						cr_enable				= `ENABLE;
					end
				endcase
			end
		endcase // op_primary case
	end // Always @
endmodule

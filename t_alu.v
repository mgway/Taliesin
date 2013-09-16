
////
//// TALIESIN_ALU: Performs all arithmetic and logical operations
////
//// out (output)   - Final result
//// alu_A (input)  - Operand modified by the operation
//// alu_B (input)  - The second operand in arithmetic/logic ops, or the shift amount
//// alu_op(input)  - Selects which operation is to be performed
////                  sel[4:3] selects the type (add/shift/etc) 
////                  sel[2:0] describes the operation
////

`include "isa_defines.v"

module TALIESIN_ALU (a, b, operation, out);

	input  	  [31:0] a, b;
	input  		[7:0] operation;
	output reg 	[3:0] cr_out;
	output reg [31:0] out;
	
	reg 					carry;	// Temporary
	
	always @(*) begin
		case (alu_operation)
			`OP_ADD: 	{carry,out} = a + b;
			`OP_ADDU: 	out = a + b;
			`OP_SUB: 	out = a - b;
			`OP_OR: 		out = a | b;
			`OP_AND: 	out = a & b;
			`OP_NOT: 	out = ~a;
			`OP_LSL: 	out = a << b;
			`OP_LSR:    out = a >> b;
			`OP_ASR: 	out = $signed(a) >> b;
			`OP_CMP:		out = a - b;
			`OP_SW:		out = a;
			default:		out = 32'b0;
		endcase
		
		cr_out[`CR_N] = out[31];
		cr_out[`CR_Z] = (out == 0);
		cr_out[`CR_C] = carry;
		
	end
endmodule

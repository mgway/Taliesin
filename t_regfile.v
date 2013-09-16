/* Taliesin Register File
 * 9/14/2013 - Version 1
 *
 * Description:
 * Three port, 16 row, 32-bit register file. 
 * Two read ports (A and B) and one write port (C)
 * Line zero (aka r[0]) is permanently zero and all writes to r[0] will
 * be ignored.
 * 
 */
 
module TALIESIN_REGFILE (
	// Outputs
   port_a, port_b, // Output data for read ports A and B
	// Inputs
   port_a_num, port_b_num, // Read ports A and B register numbers, respectively
	port_a_num, port_c_data, port_c_we, // Write port C number, data, and write enable
	clk, rst_b
   );
	
	input        [4:0] port_a_num, port_b_num, port_C_num; 
	input       [31:0] port_c_data;
	input              port_c_we, clk, rst_b;
	output wire [31:0] port_a, port_a;

	reg         [31:0] store[0:15];
	integer            i;

	// Read port assignments
	assign port_a = store[port_a_num];
	assign port_b = store[port_b_num];

	// Reset and write setup
	always @(posedge clk or negedge rst_b) begin 
		if (!rst_b) begin
			for (i = 0; i < 16; i = i+1)
				store[i] <= 32'b0;
		end else if (port_c_we && (port_c_num != 0)) begin 
			store[port_c_num] <= port_c_data; 
		end 
	end 	
endmodule
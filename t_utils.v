/* Taliesin Utility modules
 * 9/14/2013 - Version 1
 *
 * Description:
 * A collection of some random modules to further 
 * abstract the rtl
 * 
 */

/*
 * Register: A register with parameter width
 *
 * Interface:
 * q      (output) - Current value of register 
 * d      (input)  - Next value of register
 * clk    (input)  - Clock (positive edge-sensitive)
 * enable (input)  - Load new value?
 * reset  (input)  - System reset
 */
module register(q, d, clk, enable, rst_b);

   parameter width = 32, reset_value = 0;

   output [(width-1):0]  q;
   reg    [(width-1):0]  q;
   input  [(width-1):0]  d;
   input                 clk, enable, rst_b;

   always @(posedge clk or negedge rst_b)
     if (~rst_b)
       q <= reset_value;
     else if (enable)
       q <= d;

endmodule // register

/*
 * mux2: A simple 2:1 mux with parameter width
 *
 * Interface:
 * out    (output) - Output of mux
 * in1..2 (input) - Data inputs
 * sel    (input)  - Selects which input port to output
 * width  (parameter) - size of input and output ports
 *
 */
module mux2(out, in1, in2, sel);

	parameter width = 32;
	
	input  [(width-1):0] in1, in2;
	input  sel;
	output [(width-1):0] out;

	assign out = sel?in2:in1;
    
endmodule //mux2

/* 
 * mux4: A simple 4:1 mux with parameter width
 *
 * out    (output) - Output of mux
 * in1..4 (input) - Data inputs
 * sel    (input)  - Selects which input port to output
 * width  (parameter) - size of input and output ports
 */
module mux4(out, in1, in2, in3, in4, sel);

	parameter width = 32;
	
	input  [(width-1):0] in1, in2, in3, in4;
	input  [1:0] sel;
	output [(width-1):0] out;
   wire   [(width-1):0] m1, m2;

   mux2   #(width) lower (m1, in1, in2, sel[0]);
   mux2   #(width) upper (m2, in3, in4, sel[0]);
   mux2   #(width) final (out, m1, m2, sel[1]);
	
endmodule //mux4
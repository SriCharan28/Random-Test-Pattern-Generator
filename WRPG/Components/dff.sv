module dff(clk,rst,set,en,d,q);
input logic clk,rst,set,en;
input logic [7:0] d;
output logic [7:0] q;
logic [7:0] r_next,r_reg;

always@(posedge clk)
	if(rst)
		r_reg <= 0;
	else if(set)
		r_reg <= 1;
	else
		r_reg <= r_next;

always_comb	
	if(en)
		r_next=d;
	else
		r_next=r_reg;	

always_comb
	q=r_reg;

endmodule
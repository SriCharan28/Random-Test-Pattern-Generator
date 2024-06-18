module or_gate
#(parameter N=8)
(a,b,y);
input logic[N-1:0] a,b;
output logic [N-1:0] y;
assign y=a|b;
endmodule

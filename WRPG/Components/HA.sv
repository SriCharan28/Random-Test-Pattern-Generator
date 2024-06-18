module HA
#(parameter N=8)
(a,b,sum,carry);
input logic[N-1:0] a,b;
output logic [N-1:0]sum,carry;
assign sum=a^b;
assign carry=a&b;
endmodule

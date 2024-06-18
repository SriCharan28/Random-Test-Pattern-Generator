module wrpg
(D,cin,cout,set,rst,en,clk,Y);
input logic set,rst,en,clk;
input logic [7:0] D,cin;
output logic [7:0] cout,Y;
//logic [7:0] Y1,Y2,S1,S2,c1,c2;
logic [7:0] Y1,Y2,S;
dff d1(clk,rst,set,en,D,Y1);
fa a1(Y1,Y2,cin,S,cout);
//HA a1(Y1,Y2,S1,c1);
//HA a2(S1,c1,S2,c2);
//or_gate o1(c1,c2,cout);
//dff d2(clk,rst,set,en,S2,Y2);
dff d2(clk,rst,set,en,S,Y2);
assign Y=Y2;
endmodule

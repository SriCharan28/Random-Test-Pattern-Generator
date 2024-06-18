module fa
(a,b,cin,s,cout);
input logic [7:0] a,b,cin;
output logic [7:0] s,cout;
assign s = a^b^cin;
assign  cout = (a&b)|(b&cin)|(a&cin);
endmodule


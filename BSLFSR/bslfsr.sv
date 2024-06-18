module bslfsr
(clk,set,q);
input logic clk,set;
output logic [7:0]q;
logic q8,q7,q6,q5,q4,q3,q2,q1;
logic x1;
logic t1,t2,t3;

assign x1=q1^q8;
always@(posedge clk,negedge set)
begin
	if(~set)
	begin
		q1<= 1'b1;
		q2<= 1'b1;
		q3<= 1'b1;
		q4<= 1'b1;
		q5<= 1'b1;
		q6<= 1'b1;
		q7<=1'b1;
		q8<=1'b1;
	end
	else 
	begin
		q8<=q7;
		q7<=q6;
		q6<=q5;
		q5<=q4;
		q4<=q3;
		q3<=q2;
		q2<=q1;
		q1<=x1;
	end
end
always_comb
begin
	if(q[7]==0)
	begin
		q={q2,q1,q4,q3,q6,q5,q7,q8};
	end
	else
	begin
		q={q1,q2,q3,q4,q5,q6,q7,q8};
	end
end

assign q={q1,q2,q3,q4,q5,q6,q7,q8};

endmodule

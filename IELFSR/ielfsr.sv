
module lfsr(clk,set,S,q);
input logic clk,set,S;
output logic [7:0]q;
logic q8,q7,q6,q5,q4,q3,q2,q1;
logic feedback;
always@*
begin
 if(~S)
   feedback=q1^q8;
 else 
  feedback=q7^q8;
end

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

	else begin
	 if(~S)
	  begin
		q8<=q7;
		q7<=q6;
		q6<=q5;
		q5<=q4;
		q4<=q3;
		q3<=q2;
		q2<=q1;
		q1<=feedback;
	  end
	
	 else
	  begin
		q8<=feedback;
		q7<=q6;
		q6<=q5;
		q5<=q4;
		q4<=q3;
		q3<=q2;
		q2<=q1;
		q1<=q8;
	 end
   end
end
assign q={q1,q2,q3,q4,q5,q6,q7,q8};

endmodule

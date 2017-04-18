`timescale 1ns/1ps

module half_adder (s,c,a,b);
	input a,b;
	output s,c;

	and #1
		g1(c,a,b);
	xor #1
		g2(s,a,b);
endmodule

module full_adder (a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;

	wire w1,w2,w3;

	half_adder half1(w1,w2,a,b);
	half_adder half2(sum,w3,cin,w1);

	assign cout = w2 || w3;
endmodule

module mux_2 (f,a,b,sel);
	input a,b,sel;
	output f,f1,f2;

	and #1
		g1(f1,a,nsel),
		g2(f2,b,sel);
	or #1
		g3(f,f1,f2);
	not #1
		g4(nsel,sel);
endmodule

module mux_8(out,a,b,c,d,e,sel);
	input a,b,c,d,e;
	output out;

	wire a,b,c,d,e;
	input [2:0]sel;
	input [2:0]nsel;

	not #1
		n1(nsel[0],sel[0]),
		n2(nsel[1],sel[1]),
		n3(nsel[2],sel[2]);
	and #1
		andg1(f1,nsel[0],nsel[1],nsel[2],a),
		andg2(f2,sel[0],nsel[1],nsel[2],b),
		andg3(f3,nsel[0],sel[1],nsel[2],c),
		andg4(f4,nsel[0],sel[1],sel[2],c),
		andg5(f5,sel[0],sel[1],sel[2],d),
		andg6(f6,sel[0],nsel[1],sel[2],e);
	or #1
		org1(out,f1,f2,f3,f4,f5,f6);
endmodule

module shift_left(bit,result);
	input bit;
	output result;

	wire bit;
	wire result;

	assign result = bit;

endmodule

module overflow(oper,a,b,sum,out);

	input oper,a,b,sum;
	output out;

	wire oper,a,b,sum;
	wire out;

	wire not_o,n_a,n_b,n_sum;

	not #1
		g1(not_o,oper),
		g2(n_a,a),
		g3(n_b,b),
		g4(n_sum,sum);
	and #1
		andg1(f1,oper,n_a,b,sum),
		andg2(f2,oper,a,n_b,n_sum),
		andg3(f3,not_o,n_a,n_b,sum),
		andg4(f4,not_o,a,b,n_sum);
	or #1
		org1(out,f1,f2,f3,f4);
endmodule

module one_bit_alu(a,b,c_in,oper,result,c_out,less,sum,sl_bit);
	input a,b,c_in,less,sl_bit;
	output result,c_out,sum;

	wire a,b;
	input [2:0] oper;
	wire result,c_in,c_out,less,sl_bit,sum;
	wire f1,f2,f3,not_b,b_out;

	and #1
		g1(f1,a,b);
	or #1
		g2(f2,a,b);
	not #1
		nb(not_b,b);
	mux_2 mux2(b_out,b,not_b,oper[2]);
	full_adder fa(a,b_out,c_in,sum,c_out);
	shift_left sl(sl_bit,f3);
	mux_8 mux8(result,f1,f2,sum,less,f3,oper);
endmodule

module alu_32bit(a,b,oper,result,zero,c_out,over);
	
	output zero,c_out,over;

	input [31:0] a;
	input [31:0] b;
	input [2:0] oper;
	output [31:0] result;
	wire zero,c_out,over;

	input [31:0] slt;
	input [30:0] temp;
	wire temp2;

	or #1
		zg(temp2,result[0],result[1],result[2],result[3],result[4],result[5],
			result[6],result[7],result[8],result[9],result[10],
			result[11],result[12],result[13],result[14],result[15],
			result[16],result[17],result[18],result[19],result[20],
			result[21],result[22],result[23],result[24],result[25],
			result[26],result[27],result[28],result[29],result[30],result[31]);
	not #1
		ng(zero,temp2);

	overflow over_flow(oper[2],a[31],b[31],slt[31],over);

	one_bit_alu alu0(a[0],b[0],oper[2],oper,result[0],temp[0],slt[31],slt[0],oper[1]);
	one_bit_alu alu1(a[1],b[1],temp[0],oper,result[1],temp[1],1'b0,slt[1],a[0]);
	one_bit_alu alu2(a[2],b[2],temp[1],oper,result[2],temp[2],1'b0,slt[2],a[1]);
	one_bit_alu alu3(a[3],b[3],temp[2],oper,result[3],temp[3],1'b0,slt[3],a[2]);
	one_bit_alu alu4(a[4],b[4],temp[3],oper,result[4],temp[4],1'b0,slt[4],a[3]);
	one_bit_alu alu5(a[5],b[5],temp[4],oper,result[5],temp[5],1'b0,slt[5],a[4]);
	one_bit_alu alu6(a[6],b[6],temp[5],oper,result[6],temp[6],1'b0,slt[6],a[5]);
	one_bit_alu alu7(a[7],b[7],temp[6],oper,result[7],temp[7],1'b0,slt[7],a[6]);
	one_bit_alu alu8(a[8],b[8],temp[7],oper,result[8],temp[8],1'b0,slt[8],a[7]);
	one_bit_alu alu9(a[9],b[9],temp[8],oper,result[9],temp[9],1'b0,slt[9],a[8]);
	one_bit_alu alu10(a[10],b[10],temp[9],oper,result[10],temp[10],1'b0,slt[10],a[9]);
	one_bit_alu alu11(a[11],b[11],temp[10],oper,result[11],temp[11],1'b0,slt[11],a[10]);
	one_bit_alu alu12(a[12],b[12],temp[11],oper,result[12],temp[12],1'b0,slt[12],a[11]);
	one_bit_alu alu13(a[13],b[13],temp[12],oper,result[13],temp[13],1'b0,slt[13],a[12]);
	one_bit_alu alu14(a[14],b[14],temp[13],oper,result[14],temp[14],1'b0,slt[14],a[13]);
	one_bit_alu alu15(a[15],b[15],temp[14],oper,result[15],temp[15],1'b0,slt[15],a[14]);
	one_bit_alu alu16(a[16],b[16],temp[15],oper,result[16],temp[16],1'b0,slt[16],a[15]);
	one_bit_alu alu17(a[17],b[17],temp[16],oper,result[17],temp[17],1'b0,slt[17],a[16]);
	one_bit_alu alu18(a[18],b[18],temp[17],oper,result[18],temp[18],1'b0,slt[18],a[17]);
	one_bit_alu alu19(a[19],b[19],temp[18],oper,result[19],temp[19],1'b0,slt[19],a[18]);
	one_bit_alu alu20(a[20],b[20],temp[19],oper,result[20],temp[20],1'b0,slt[20],a[19]);
	one_bit_alu alu21(a[21],b[21],temp[20],oper,result[21],temp[21],1'b0,slt[21],a[20]);
	one_bit_alu alu22(a[22],b[22],temp[21],oper,result[22],temp[22],1'b0,slt[22],a[21]);
	one_bit_alu alu23(a[23],b[23],temp[22],oper,result[23],temp[23],1'b0,slt[23],a[22]);
	one_bit_alu alu24(a[24],b[24],temp[23],oper,result[24],temp[24],1'b0,slt[24],a[23]);
	one_bit_alu alu25(a[25],b[25],temp[24],oper,result[25],temp[25],1'b0,slt[25],a[24]);
	one_bit_alu alu26(a[26],b[26],temp[25],oper,result[26],temp[26],1'b0,slt[26],a[25]);
	one_bit_alu alu27(a[27],b[27],temp[26],oper,result[27],temp[27],1'b0,slt[27],a[26]);
	one_bit_alu alu28(a[28],b[28],temp[27],oper,result[28],temp[28],1'b0,slt[28],a[27]);
	one_bit_alu alu29(a[29],b[29],temp[28],oper,result[29],temp[29],1'b0,slt[29],a[28]);
	one_bit_alu alu30(a[30],b[30],temp[29],oper,result[30],temp[30],1'b0,slt[30],a[29]);
	one_bit_alu alu31(a[31],b[31],temp[30],oper,result[31],c_out,1'b0,slt[31],a[30]);

	endmodule




module tester;

	reg [31:0] a;
	reg [31:0] b;

	reg [2:0] operation;
	reg [0:5000] index;
	wire [31:0] result;
	wire zero,c_out,overflow;

	alu_32bit aut( a,b,operation,result,zero,c_out,overflow);
	parameter max = 4294967296;
	
	initial begin
		$monitor($time,", %d, %d, %d, %d, %d, %d,%d",a,b,operation,result,zero,c_out,overflow);
		

			
		
		
			repeat(5000) begin
				operation=$random%7;
				if(operation==0) begin
					#1000 a=$random %max;b=$random %max;
				end

				if(operation==1) begin
					#1000 a=$random %max;b=$random %max;
				end
				if(operation==2) begin
					#1000 a=$random %max;b=$random %max;
				end

				if(operation==3) begin
					operation=2;
					#1000 a=$random %max;b=$random %max;
				end

				if(operation==4) begin
					#1000 a=$random %max;b=$random %max;
				end

				if(operation==5) begin
					operation=6;
					#1000 a=$random %max;b=$random %max;
				end

				if(operation==6) begin
					#1000 a=$random %max;b=$random %max;
				end

				if(operation==7) begin
					#1000 a=$random %max;b=$random %max;
				end
				
				
			end
					
				
				
					
		

		
		
	end
endmodule

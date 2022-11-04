module ripple_carry_adder_4b(a,b,c_in,sum,c_out,overflow);
 input[3:0] a;
 input[3:0] b;
 input c_in;
 output[3:0] sum;
 output c_out;
 output overflow;
 wire c[2:0];
 full_adder u1 (a[0],b[0],c_in,sum[0],c[0]);
 full_adder u2 (a[1],b[1],c[0],sum[1],c[1]);
 full_adder u3 (a[2],b[2],c[1],sum[2],c[2]);
 full_adder u4 (a[3],b[3],c[2],sum[3],c_out);
 
 xor overflow_(overflow,c[2],c_out);
 
 
 endmodule
 
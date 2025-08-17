`timescale 1ns/10ps
`celldefine
module ANTENNA (A);
input  A ;

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ACHCONX2 (A, B, CI, CON);
input  A ;
input  B ;
input  CI ;
output CON ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (CON, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A$CON = 0.24:0.24:0.24,
       tphlh$A$CON = 0.21:0.21:0.21,
       tplhl$B$CON = 0.11:0.12:0.13,
       tphlh$B$CON = 0.098:0.12:0.13,
       tplhl$CI$CON = 0.053:0.053:0.053,
       tphlh$CI$CON = 0.049:0.049:0.049;

     // path delays
     (A *> CON) = (tphlh$A$CON, tplhl$A$CON);
     (B *> CON) = (tphlh$B$CON, tplhl$B$CON);
     (CI *> CON) = (tphlh$CI$CON, tplhl$CI$CON);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFHX1 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.13:0.16:0.18,
       tplhl$A$S = 0.28:0.28:0.28,
       tphlh$A$S = 0.29:0.3:0.3,
       tphhl$A$S = 0.14:0.17:0.2,
       tpllh$A$CO = 0.16:0.16:0.16,
       tphhl$A$CO = 0.17:0.17:0.17,
       tpllh$B$S = 0.12:0.15:0.18,
       tplhl$B$S = 0.28:0.28:0.29,
       tphlh$B$S = 0.3:0.3:0.31,
       tphhl$B$S = 0.14:0.17:0.2,
       tpllh$B$CO = 0.15:0.16:0.17,
       tphhl$B$CO = 0.17:0.18:0.18,
       tpllh$CI$S = 0.12:0.15:0.19,
       tplhl$CI$S = 0.27:0.27:0.27,
       tphlh$CI$S = 0.29:0.29:0.3,
       tphhl$CI$S = 0.14:0.16:0.19,
       tpllh$CI$CO = 0.15:0.15:0.15,
       tphhl$CI$CO = 0.16:0.16:0.16;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFHX2 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.16:0.19:0.23,
       tplhl$A$S = 0.35:0.35:0.35,
       tphlh$A$S = 0.37:0.37:0.38,
       tphhl$A$S = 0.18:0.21:0.25,
       tpllh$A$CO = 0.18:0.18:0.18,
       tphhl$A$CO = 0.2:0.2:0.2,
       tpllh$B$S = 0.15:0.19:0.23,
       tplhl$B$S = 0.36:0.36:0.36,
       tphlh$B$S = 0.37:0.38:0.39,
       tphhl$B$S = 0.17:0.21:0.24,
       tpllh$B$CO = 0.17:0.18:0.19,
       tphhl$B$CO = 0.2:0.2:0.2,
       tpllh$CI$S = 0.15:0.19:0.23,
       tplhl$CI$S = 0.34:0.35:0.35,
       tphlh$CI$S = 0.36:0.37:0.38,
       tphhl$CI$S = 0.17:0.21:0.24,
       tpllh$CI$CO = 0.17:0.17:0.17,
       tphhl$CI$CO = 0.18:0.19:0.19;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFHX4 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.19:0.23:0.28,
       tplhl$A$S = 0.44:0.44:0.45,
       tphlh$A$S = 0.46:0.47:0.47,
       tphhl$A$S = 0.22:0.26:0.3,
       tpllh$A$CO = 0.21:0.21:0.21,
       tphhl$A$CO = 0.23:0.24:0.24,
       tpllh$B$S = 0.18:0.23:0.28,
       tplhl$B$S = 0.45:0.45:0.45,
       tphlh$B$S = 0.47:0.48:0.49,
       tphhl$B$S = 0.21:0.26:0.3,
       tpllh$B$CO = 0.21:0.21:0.22,
       tphhl$B$CO = 0.24:0.24:0.24,
       tpllh$CI$S = 0.18:0.23:0.28,
       tplhl$CI$S = 0.44:0.44:0.44,
       tphlh$CI$S = 0.46:0.47:0.47,
       tphhl$CI$S = 0.21:0.26:0.3,
       tpllh$CI$CO = 0.2:0.2:0.21,
       tphhl$CI$CO = 0.22:0.22:0.23;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFHXL (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.12:0.15:0.17,
       tplhl$A$S = 0.26:0.26:0.26,
       tphlh$A$S = 0.27:0.28:0.28,
       tphhl$A$S = 0.14:0.16:0.19,
       tpllh$A$CO = 0.15:0.15:0.16,
       tphhl$A$CO = 0.16:0.17:0.17,
       tpllh$B$S = 0.11:0.14:0.17,
       tplhl$B$S = 0.27:0.27:0.27,
       tphlh$B$S = 0.28:0.29:0.3,
       tphhl$B$S = 0.13:0.16:0.18,
       tpllh$B$CO = 0.15:0.16:0.16,
       tphhl$B$CO = 0.17:0.17:0.17,
       tpllh$CI$S = 0.11:0.14:0.18,
       tplhl$CI$S = 0.26:0.26:0.26,
       tphlh$CI$S = 0.27:0.28:0.28,
       tphhl$CI$S = 0.13:0.15:0.18,
       tpllh$CI$CO = 0.14:0.14:0.15,
       tphhl$CI$CO = 0.15:0.15:0.15;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFX1 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.15:0.18:0.21,
       tplhl$A$S = 0.33:0.33:0.33,
       tphlh$A$S = 0.35:0.35:0.35,
       tphhl$A$S = 0.17:0.2:0.23,
       tpllh$A$CO = 0.18:0.18:0.18,
       tphhl$A$CO = 0.2:0.2:0.2,
       tpllh$B$S = 0.14:0.17:0.21,
       tplhl$B$S = 0.33:0.34:0.34,
       tphlh$B$S = 0.35:0.36:0.37,
       tphhl$B$S = 0.16:0.19:0.23,
       tpllh$B$CO = 0.17:0.18:0.19,
       tphhl$B$CO = 0.2:0.2:0.21,
       tpllh$CI$S = 0.14:0.17:0.21,
       tplhl$CI$S = 0.32:0.32:0.33,
       tphlh$CI$S = 0.34:0.35:0.35,
       tphhl$CI$S = 0.16:0.19:0.23,
       tpllh$CI$CO = 0.17:0.17:0.17,
       tphhl$CI$CO = 0.19:0.19:0.19;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFX2 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.19:0.23:0.27,
       tplhl$A$S = 0.44:0.44:0.44,
       tphlh$A$S = 0.46:0.46:0.46,
       tphhl$A$S = 0.22:0.26:0.3,
       tpllh$A$CO = 0.21:0.21:0.21,
       tphhl$A$CO = 0.24:0.24:0.24,
       tpllh$B$S = 0.17:0.22:0.27,
       tplhl$B$S = 0.44:0.45:0.45,
       tphlh$B$S = 0.46:0.47:0.48,
       tphhl$B$S = 0.2:0.25:0.3,
       tpllh$B$CO = 0.21:0.22:0.23,
       tphhl$B$CO = 0.24:0.25:0.25,
       tpllh$CI$S = 0.17:0.22:0.27,
       tplhl$CI$S = 0.43:0.43:0.43,
       tphlh$CI$S = 0.45:0.46:0.47,
       tphhl$CI$S = 0.21:0.25:0.3,
       tpllh$CI$CO = 0.2:0.2:0.21,
       tphhl$CI$CO = 0.23:0.23:0.23;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFX4 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.19:0.23:0.28,
       tplhl$A$S = 0.44:0.44:0.45,
       tphlh$A$S = 0.46:0.47:0.47,
       tphhl$A$S = 0.22:0.26:0.3,
       tpllh$A$CO = 0.21:0.21:0.21,
       tphhl$A$CO = 0.23:0.24:0.24,
       tpllh$B$S = 0.18:0.23:0.28,
       tplhl$B$S = 0.45:0.45:0.45,
       tphlh$B$S = 0.47:0.48:0.49,
       tphhl$B$S = 0.21:0.26:0.3,
       tpllh$B$CO = 0.21:0.21:0.22,
       tphhl$B$CO = 0.24:0.24:0.24,
       tpllh$CI$S = 0.18:0.23:0.28,
       tplhl$CI$S = 0.44:0.44:0.44,
       tphlh$CI$S = 0.46:0.47:0.47,
       tphhl$CI$S = 0.21:0.26:0.3,
       tpllh$CI$CO = 0.2:0.2:0.21,
       tphhl$CI$CO = 0.22:0.22:0.23;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFXL (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.13:0.16:0.19,
       tplhl$A$S = 0.28:0.28:0.28,
       tphlh$A$S = 0.3:0.3:0.3,
       tphhl$A$S = 0.15:0.18:0.2,
       tpllh$A$CO = 0.16:0.16:0.17,
       tphhl$A$CO = 0.18:0.18:0.18,
       tpllh$B$S = 0.12:0.15:0.19,
       tplhl$B$S = 0.28:0.28:0.28,
       tphlh$B$S = 0.3:0.31:0.31,
       tphhl$B$S = 0.14:0.17:0.2,
       tpllh$B$CO = 0.16:0.17:0.17,
       tphhl$B$CO = 0.18:0.18:0.18,
       tpllh$CI$S = 0.12:0.15:0.19,
       tplhl$CI$S = 0.27:0.27:0.27,
       tphlh$CI$S = 0.29:0.3:0.3,
       tphhl$CI$S = 0.14:0.17:0.2,
       tpllh$CI$CO = 0.15:0.15:0.16,
       tphhl$CI$CO = 0.16:0.17:0.17;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: CI^B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: CI^B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: CI^A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: CI^A)) = (tphlh$B$S, tphhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (posedge CI *> (S +: B^A)) = (tpllh$CI$S, tplhl$CI$S);
     (negedge CI *> (S +: B^A)) = (tphlh$CI$S, tphhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDHX1 (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.12:0.12:0.12,
       tplhl$A$S = 0.18:0.18:0.18,
       tphlh$A$S = 0.17:0.17:0.17,
       tphhl$A$S = 0.13:0.13:0.13,
       tpllh$A$CO = 0.11:0.11:0.11,
       tphhl$A$CO = 0.08:0.08:0.08,
       tpllh$B$S = 0.093:0.093:0.093,
       tplhl$B$S = 0.16:0.16:0.16,
       tphlh$B$S = 0.12:0.12:0.12,
       tphhl$B$S = 0.088:0.088:0.088,
       tpllh$B$CO = 0.11:0.11:0.11,
       tphhl$B$CO = 0.074:0.074:0.074;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: A)) = (tphlh$B$S, tphhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDHX2 (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.16:0.16:0.16,
       tplhl$A$S = 0.22:0.22:0.22,
       tphlh$A$S = 0.21:0.21:0.21,
       tphhl$A$S = 0.16:0.16:0.16,
       tpllh$A$CO = 0.15:0.15:0.15,
       tphhl$A$CO = 0.1:0.1:0.1,
       tpllh$B$S = 0.14:0.14:0.14,
       tplhl$B$S = 0.19:0.19:0.19,
       tphlh$B$S = 0.15:0.15:0.15,
       tphhl$B$S = 0.13:0.13:0.13,
       tpllh$B$CO = 0.15:0.15:0.15,
       tphhl$B$CO = 0.099:0.099:0.099;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: A)) = (tphlh$B$S, tphhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDHX4 (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.22:0.22:0.22,
       tplhl$A$S = 0.25:0.25:0.25,
       tphlh$A$S = 0.24:0.24:0.24,
       tphhl$A$S = 0.24:0.24:0.24,
       tpllh$A$CO = 0.16:0.16:0.16,
       tphhl$A$CO = 0.11:0.11:0.11,
       tpllh$B$S = 0.15:0.15:0.15,
       tplhl$B$S = 0.22:0.22:0.22,
       tphlh$B$S = 0.2:0.2:0.2,
       tphhl$B$S = 0.18:0.18:0.18,
       tpllh$B$CO = 0.15:0.15:0.15,
       tphhl$B$CO = 0.1:0.1:0.1;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: A)) = (tphlh$B$S, tphhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDHXL (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.11:0.11:0.11,
       tplhl$A$S = 0.15:0.15:0.15,
       tphlh$A$S = 0.15:0.15:0.15,
       tphhl$A$S = 0.11:0.11:0.11,
       tpllh$A$CO = 0.092:0.092:0.092,
       tphhl$A$CO = 0.066:0.066:0.066,
       tpllh$B$S = 0.076:0.076:0.076,
       tplhl$B$S = 0.14:0.14:0.14,
       tphlh$B$S = 0.11:0.11:0.11,
       tphhl$B$S = 0.07:0.07:0.07,
       tpllh$B$CO = 0.086:0.086:0.086,
       tphhl$B$CO = 0.061:0.061:0.061;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (posedge A *> (S +: B)) = (tpllh$A$S, tplhl$A$S);
     (negedge A *> (S +: B)) = (tphlh$A$S, tphhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (posedge B *> (S +: A)) = (tpllh$B$S, tplhl$B$S);
     (negedge B *> (S +: A)) = (tphlh$B$S, tphhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.078:0.078:0.078,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.072:0.072:0.072;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.15:0.15:0.15,
       tphhl$A$Y = 0.1:0.1:0.1,
       tpllh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.097:0.097:0.097;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.16:0.16:0.16,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.15:0.15:0.15,
       tphhl$B$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.13:0.13:0.13,
       tphhl$A$Y = 0.09:0.09:0.09,
       tpllh$B$Y = 0.13:0.13:0.13,
       tphhl$B$Y = 0.085:0.085:0.085;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.15:0.15:0.15,
       tphhl$A$Y = 0.1:0.1:0.1,
       tpllh$B$Y = 0.15:0.15:0.15,
       tphhl$B$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.092:0.092:0.092,
       tphhl$A$Y = 0.066:0.066:0.066,
       tpllh$B$Y = 0.087:0.087:0.087,
       tphhl$B$Y = 0.061:0.061:0.061;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.17:0.17:0.17,
       tphhl$A$Y = 0.088:0.088:0.088,
       tpllh$B$Y = 0.16:0.16:0.16,
       tphhl$B$Y = 0.084:0.084:0.084,
       tpllh$C$Y = 0.15:0.15:0.15,
       tphhl$C$Y = 0.078:0.078:0.078;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X2 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.23:0.23:0.23,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.22:0.22:0.22,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$C$Y = 0.21:0.21:0.21,
       tphhl$C$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X4 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.24:0.24:0.24,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.23:0.23:0.23,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$C$Y = 0.22:0.22:0.22,
       tphhl$C$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X6 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.2:0.2:0.2,
       tphhl$A$Y = 0.098:0.098:0.098,
       tpllh$B$Y = 0.19:0.19:0.19,
       tphhl$B$Y = 0.094:0.094:0.094,
       tpllh$C$Y = 0.18:0.18:0.18,
       tphhl$C$Y = 0.089:0.089:0.089;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3X8 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.23:0.23:0.23,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.23:0.23:0.23,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$C$Y = 0.22:0.22:0.22,
       tphhl$C$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.14:0.14:0.14,
       tphhl$A$Y = 0.076:0.076:0.076,
       tpllh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.072:0.072:0.072,
       tpllh$C$Y = 0.13:0.13:0.13,
       tphhl$C$Y = 0.067:0.067:0.067;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.23:0.23:0.23,
       tphhl$A$Y = 0.095:0.095:0.095,
       tpllh$B$Y = 0.23:0.23:0.23,
       tphhl$B$Y = 0.092:0.092:0.092,
       tpllh$C$Y = 0.21:0.21:0.21,
       tphhl$C$Y = 0.086:0.086:0.086,
       tpllh$D$Y = 0.2:0.2:0.2,
       tphhl$D$Y = 0.081:0.081:0.081;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X2 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.31:0.31:0.31,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.3:0.3:0.3,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$C$Y = 0.29:0.29:0.29,
       tphhl$C$Y = 0.11:0.11:0.11,
       tpllh$D$Y = 0.28:0.28:0.28,
       tphhl$D$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X4 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.33:0.33:0.33,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.32:0.32:0.32,
       tphhl$B$Y = 0.12:0.12:0.12,
       tpllh$C$Y = 0.31:0.31:0.31,
       tphhl$C$Y = 0.11:0.11:0.11,
       tpllh$D$Y = 0.29:0.29:0.29,
       tphhl$D$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X6 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.28:0.28:0.28,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.27:0.27:0.27,
       tphhl$B$Y = 0.1:0.1:0.1,
       tpllh$C$Y = 0.26:0.26:0.26,
       tphhl$C$Y = 0.098:0.098:0.098,
       tpllh$D$Y = 0.24:0.24:0.24,
       tphhl$D$Y = 0.092:0.092:0.092;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4X8 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.32:0.32:0.32,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.31:0.31:0.31,
       tphhl$B$Y = 0.12:0.12:0.12,
       tpllh$C$Y = 0.3:0.3:0.3,
       tphhl$C$Y = 0.11:0.11:0.11,
       tpllh$D$Y = 0.29:0.29:0.29,
       tphhl$D$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND4XL (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.2:0.2:0.2,
       tphhl$A$Y = 0.082:0.082:0.082,
       tpllh$B$Y = 0.19:0.19:0.19,
       tphhl$B$Y = 0.08:0.08:0.08,
       tpllh$C$Y = 0.18:0.18:0.18,
       tphhl$C$Y = 0.075:0.075:0.075,
       tpllh$D$Y = 0.17:0.17:0.17,
       tphhl$D$Y = 0.07:0.07:0.07;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.12:0.12:0.12,
       tphhl$A0$Y = 0.13:0.13:0.13,
       tpllh$A1$Y = 0.12:0.12:0.12,
       tphhl$A1$Y = 0.13:0.13:0.13,
       tpllh$B0$Y = 0.068:0.07:0.072,
       tphhl$B0$Y = 0.093:0.11:0.13;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO21X2 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.16:0.16:0.16,
       tphhl$A0$Y = 0.18:0.18:0.18,
       tpllh$A1$Y = 0.16:0.16:0.16,
       tphhl$A1$Y = 0.17:0.17:0.17,
       tpllh$B0$Y = 0.087:0.089:0.09,
       tphhl$B0$Y = 0.13:0.15:0.17;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO21X4 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.17:0.17:0.17,
       tphhl$A0$Y = 0.19:0.19:0.19,
       tpllh$A1$Y = 0.17:0.17:0.17,
       tphhl$A1$Y = 0.18:0.18:0.18,
       tpllh$B0$Y = 0.092:0.093:0.095,
       tphhl$B0$Y = 0.13:0.15:0.18;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO21XL (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.11:0.11:0.11,
       tphhl$A0$Y = 0.11:0.11:0.11,
       tpllh$A1$Y = 0.1:0.1:0.1,
       tphhl$A1$Y = 0.1:0.1:0.1,
       tpllh$B0$Y = 0.057:0.058:0.06,
       tphhl$B0$Y = 0.073:0.086:0.099;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.13:0.14:0.14,
       tphhl$A0$Y = 0.12:0.14:0.15,
       tpllh$A1$Y = 0.13:0.13:0.14,
       tphhl$A1$Y = 0.12:0.13:0.15,
       tpllh$B0$Y = 0.11:0.12:0.12,
       tphhl$B0$Y = 0.1:0.12:0.14,
       tpllh$B1$Y = 0.11:0.11:0.11,
       tphhl$B1$Y = 0.095:0.11:0.13;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO22X2 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.17:0.18:0.18,
       tphhl$A0$Y = 0.16:0.18:0.2,
       tpllh$A1$Y = 0.17:0.17:0.18,
       tphhl$A1$Y = 0.15:0.17:0.19,
       tpllh$B0$Y = 0.15:0.16:0.16,
       tphhl$B0$Y = 0.14:0.16:0.19,
       tpllh$B1$Y = 0.15:0.15:0.15,
       tphhl$B1$Y = 0.13:0.15:0.18;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO22X4 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.18:0.19:0.19,
       tphhl$A0$Y = 0.16:0.19:0.21,
       tpllh$A1$Y = 0.18:0.18:0.19,
       tphhl$A1$Y = 0.16:0.18:0.2,
       tpllh$B0$Y = 0.16:0.16:0.17,
       tphhl$B0$Y = 0.14:0.17:0.19,
       tpllh$B1$Y = 0.16:0.16:0.16,
       tphhl$B1$Y = 0.14:0.16:0.18;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AO22XL (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.11:0.12:0.12,
       tphhl$A0$Y = 0.11:0.12:0.13,
       tpllh$A1$Y = 0.11:0.12:0.12,
       tphhl$A1$Y = 0.099:0.11:0.12,
       tpllh$B0$Y = 0.093:0.096:0.099,
       tphhl$B0$Y = 0.085:0.099:0.11,
       tpllh$B1$Y = 0.088:0.091:0.094,
       tphhl$B1$Y = 0.077:0.09:0.1;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI211X1 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.06:0.06:0.06,
       tphlh$A0$Y = 0.1:0.1:0.1,
       tplhl$A1$Y = 0.057:0.057:0.057,
       tphlh$A1$Y = 0.092:0.092:0.092,
       tplhl$B0$Y = 0.027:0.028:0.028,
       tphlh$B0$Y = 0.065:0.079:0.092,
       tplhl$C0$Y = 0.023:0.024:0.024,
       tphlh$C0$Y = 0.054:0.065:0.076;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI211X2 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.06:0.06:0.06,
       tphlh$A0$Y = 0.1:0.1:0.1,
       tplhl$A1$Y = 0.055:0.055:0.055,
       tphlh$A1$Y = 0.091:0.091:0.091,
       tplhl$B0$Y = 0.027:0.028:0.028,
       tphlh$B0$Y = 0.067:0.081:0.095,
       tplhl$C0$Y = 0.022:0.022:0.023,
       tphlh$C0$Y = 0.05:0.06:0.071;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI211X4 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.059:0.059:0.059,
       tphlh$A0$Y = 0.1:0.1:0.1,
       tplhl$A1$Y = 0.056:0.056:0.056,
       tphlh$A1$Y = 0.091:0.091:0.091,
       tplhl$B0$Y = 0.027:0.028:0.028,
       tphlh$B0$Y = 0.066:0.08:0.093,
       tplhl$C0$Y = 0.022:0.022:0.023,
       tphlh$C0$Y = 0.05:0.061:0.071;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI211XL (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.062:0.062:0.062,
       tphlh$A0$Y = 0.11:0.11:0.11,
       tplhl$A1$Y = 0.059:0.059:0.059,
       tphlh$A1$Y = 0.098:0.098:0.098,
       tplhl$B0$Y = 0.028:0.029:0.029,
       tphlh$B0$Y = 0.07:0.084:0.099,
       tplhl$C0$Y = 0.024:0.025:0.025,
       tphlh$C0$Y = 0.059:0.071:0.082;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.052:0.052:0.052,
       tphlh$A0$Y = 0.061:0.061:0.061,
       tplhl$A1$Y = 0.049:0.049:0.049,
       tphlh$A1$Y = 0.054:0.054:0.054,
       tplhl$B0$Y = 0.021:0.021:0.022,
       tphlh$B0$Y = 0.031:0.04:0.048;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X2 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.051:0.051:0.051,
       tphlh$A0$Y = 0.06:0.06:0.06,
       tplhl$A1$Y = 0.047:0.047:0.047,
       tphlh$A1$Y = 0.052:0.052:0.052,
       tplhl$B0$Y = 0.02:0.02:0.021,
       tphlh$B0$Y = 0.03:0.038:0.046;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X4 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.051:0.051:0.051,
       tphlh$A0$Y = 0.06:0.06:0.06,
       tplhl$A1$Y = 0.047:0.047:0.047,
       tphlh$A1$Y = 0.052:0.052:0.052,
       tplhl$B0$Y = 0.02:0.02:0.021,
       tphlh$B0$Y = 0.03:0.038:0.047;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21XL (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.053:0.053:0.053,
       tphlh$A0$Y = 0.064:0.064:0.064,
       tplhl$A1$Y = 0.049:0.049:0.049,
       tphlh$A1$Y = 0.056:0.056:0.056,
       tplhl$B0$Y = 0.022:0.022:0.023,
       tphlh$B0$Y = 0.033:0.043:0.052;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI221X1 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.066:0.068:0.07,
       tphlh$A0$Y = 0.1:0.12:0.13,
       tplhl$A1$Y = 0.063:0.065:0.066,
       tphlh$A1$Y = 0.095:0.11:0.12,
       tplhl$B0$Y = 0.059:0.06:0.062,
       tphlh$B0$Y = 0.086:0.1:0.12,
       tplhl$B1$Y = 0.055:0.056:0.058,
       tphlh$B1$Y = 0.076:0.091:0.11,
       tplhl$C0$Y = 0.024:0.025:0.025,
       tphlh$C0$Y = 0.043:0.066:0.089;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI221X2 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.063:0.065:0.067,
       tphlh$A0$Y = 0.1:0.11:0.13,
       tplhl$A1$Y = 0.059:0.061:0.063,
       tphlh$A1$Y = 0.091:0.1:0.11,
       tplhl$B0$Y = 0.058:0.059:0.06,
       tphlh$B0$Y = 0.084:0.1:0.12,
       tplhl$B1$Y = 0.053:0.054:0.056,
       tphlh$B1$Y = 0.073:0.088:0.1,
       tplhl$C0$Y = 0.022:0.023:0.024,
       tphlh$C0$Y = 0.041:0.062:0.084;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI221X4 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.064:0.066:0.068,
       tphlh$A0$Y = 0.1:0.11:0.13,
       tplhl$A1$Y = 0.06:0.062:0.063,
       tphlh$A1$Y = 0.091:0.1:0.12,
       tplhl$B0$Y = 0.058:0.059:0.061,
       tphlh$B0$Y = 0.085:0.1:0.12,
       tplhl$B1$Y = 0.053:0.055:0.056,
       tphlh$B1$Y = 0.074:0.088:0.1,
       tplhl$C0$Y = 0.023:0.024:0.025,
       tphlh$C0$Y = 0.042:0.064:0.087;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI221XL (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.069:0.071:0.074,
       tphlh$A0$Y = 0.11:0.13:0.14,
       tplhl$A1$Y = 0.066:0.069:0.071,
       tphlh$A1$Y = 0.1:0.12:0.13,
       tplhl$B0$Y = 0.062:0.064:0.065,
       tphlh$B0$Y = 0.093:0.11:0.13,
       tplhl$B1$Y = 0.059:0.06:0.062,
       tphlh$B1$Y = 0.084:0.1:0.12,
       tplhl$C0$Y = 0.025:0.026:0.027,
       tphlh$C0$Y = 0.048:0.071:0.095;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI222X1 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, C0, C1);
   and (I3_out, B0, B1);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.073:0.082:0.09,
       tphlh$A0$Y = 0.1:0.13:0.16,
       tplhl$A1$Y = 0.07:0.079:0.087,
       tphlh$A1$Y = 0.096:0.12:0.15,
       tplhl$B0$Y = 0.067:0.071:0.075,
       tphlh$B0$Y = 0.086:0.12:0.15,
       tplhl$B1$Y = 0.063:0.067:0.071,
       tphlh$B1$Y = 0.078:0.11:0.14,
       tplhl$C0$Y = 0.049:0.051:0.053,
       tphlh$C0$Y = 0.056:0.081:0.11,
       tplhl$C1$Y = 0.046:0.048:0.05,
       tphlh$C1$Y = 0.05:0.073:0.097;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI222X2 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, C0, C1);
   and (I3_out, B0, B1);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.071:0.079:0.087,
       tphlh$A0$Y = 0.1:0.13:0.16,
       tplhl$A1$Y = 0.067:0.075:0.083,
       tphlh$A1$Y = 0.092:0.12:0.14,
       tplhl$B0$Y = 0.065:0.069:0.073,
       tphlh$B0$Y = 0.084:0.11:0.14,
       tplhl$B1$Y = 0.061:0.064:0.068,
       tphlh$B1$Y = 0.075:0.1:0.13,
       tplhl$C0$Y = 0.047:0.05:0.052,
       tphlh$C0$Y = 0.055:0.08:0.1,
       tplhl$C1$Y = 0.043:0.045:0.047,
       tphlh$C1$Y = 0.047:0.07:0.092;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI222X4 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   and (I0_out, C0, C1);
   and (I1_out, A0, A1);
   and (I3_out, B0, B1);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.072:0.08:0.088,
       tphlh$A0$Y = 0.1:0.13:0.16,
       tplhl$A1$Y = 0.068:0.076:0.084,
       tphlh$A1$Y = 0.092:0.12:0.15,
       tplhl$B0$Y = 0.066:0.07:0.074,
       tphlh$B0$Y = 0.085:0.12:0.15,
       tplhl$B1$Y = 0.061:0.065:0.069,
       tphlh$B1$Y = 0.076:0.1:0.13,
       tplhl$C0$Y = 0.048:0.05:0.053,
       tphlh$C0$Y = 0.056:0.082:0.11,
       tplhl$C1$Y = 0.044:0.046:0.048,
       tphlh$C1$Y = 0.048:0.072:0.096;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI222XL (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, C0, C1);
   and (I3_out, B0, B1);
   or  (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.076:0.085:0.093,
       tphlh$A0$Y = 0.11:0.14:0.17,
       tplhl$A1$Y = 0.073:0.082:0.09,
       tphlh$A1$Y = 0.1:0.13:0.16,
       tplhl$B0$Y = 0.07:0.074:0.078,
       tphlh$B0$Y = 0.093:0.13:0.16,
       tplhl$B1$Y = 0.066:0.07:0.074,
       tphlh$B1$Y = 0.085:0.12:0.15,
       tplhl$C0$Y = 0.052:0.054:0.056,
       tphlh$C0$Y = 0.061:0.088:0.11,
       tplhl$C1$Y = 0.049:0.051:0.054,
       tphlh$C1$Y = 0.055:0.08:0.11;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.058:0.063:0.067,
       tphlh$A0$Y = 0.06:0.069:0.079,
       tplhl$A1$Y = 0.055:0.059:0.063,
       tphlh$A1$Y = 0.054:0.063:0.072,
       tplhl$B0$Y = 0.041:0.043:0.044,
       tphlh$B0$Y = 0.04:0.05:0.06,
       tplhl$B1$Y = 0.038:0.039:0.04,
       tphlh$B1$Y = 0.035:0.044:0.053;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X2 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.059:0.063:0.066,
       tphlh$A0$Y = 0.059:0.069:0.078,
       tplhl$A1$Y = 0.054:0.058:0.062,
       tphlh$A1$Y = 0.053:0.062:0.07,
       tplhl$B0$Y = 0.042:0.043:0.044,
       tphlh$B0$Y = 0.041:0.051:0.061,
       tplhl$B1$Y = 0.038:0.039:0.04,
       tphlh$B1$Y = 0.035:0.044:0.053;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X4 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.059:0.063:0.067,
       tphlh$A0$Y = 0.06:0.069:0.079,
       tplhl$A1$Y = 0.055:0.059:0.063,
       tphlh$A1$Y = 0.053:0.062:0.07,
       tplhl$B0$Y = 0.043:0.044:0.045,
       tphlh$B0$Y = 0.041:0.051:0.062,
       tplhl$B1$Y = 0.039:0.04:0.041,
       tphlh$B1$Y = 0.035:0.045:0.054;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22XL (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0, A1);
   and (I1_out, B0, B1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.06:0.064:0.068,
       tphlh$A0$Y = 0.063:0.072:0.082,
       tplhl$A1$Y = 0.057:0.061:0.065,
       tphlh$A1$Y = 0.057:0.067:0.076,
       tplhl$B0$Y = 0.043:0.044:0.045,
       tphlh$B0$Y = 0.042:0.053:0.063,
       tplhl$B1$Y = 0.04:0.041:0.042,
       tphlh$B1$Y = 0.037:0.047:0.056;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB1X1 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.09:0.09:0.09,
       tphhl$A0N$Y = 0.12:0.12:0.12,
       tpllh$A1N$Y = 0.084:0.084:0.084,
       tphhl$A1N$Y = 0.12:0.12:0.12,
       tplhl$B0$Y = 0.024:0.024:0.024,
       tphlh$B0$Y = 0.049:0.049:0.049;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB1X2 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.11:0.11:0.11,
       tphhl$A0N$Y = 0.17:0.17:0.17,
       tpllh$A1N$Y = 0.11:0.11:0.11,
       tphhl$A1N$Y = 0.17:0.17:0.17,
       tplhl$B0$Y = 0.023:0.023:0.023,
       tphlh$B0$Y = 0.05:0.05:0.05;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB1X4 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.12:0.12:0.12,
       tphhl$A0N$Y = 0.18:0.18:0.18,
       tpllh$A1N$Y = 0.11:0.11:0.11,
       tphhl$A1N$Y = 0.18:0.18:0.18,
       tplhl$B0$Y = 0.023:0.023:0.023,
       tphlh$B0$Y = 0.05:0.05:0.05;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB1XL (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.085:0.085:0.085,
       tphhl$A0N$Y = 0.11:0.11:0.11,
       tpllh$A1N$Y = 0.079:0.079:0.079,
       tphhl$A1N$Y = 0.098:0.098:0.098,
       tplhl$B0$Y = 0.025:0.025:0.025,
       tphlh$B0$Y = 0.051:0.051:0.051;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB2X1 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.11:0.12:0.12,
       tphhl$A0N$Y = 0.11:0.12:0.12,
       tpllh$A1N$Y = 0.1:0.11:0.12,
       tphhl$A1N$Y = 0.11:0.12:0.12,
       tplhl$B0$Y = 0.042:0.042:0.043,
       tphlh$B0$Y = 0.04:0.05:0.059,
       tplhl$B1$Y = 0.038:0.039:0.04,
       tphlh$B1$Y = 0.034:0.043:0.051;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB2X2 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.13:0.14:0.15,
       tphhl$A0N$Y = 0.15:0.15:0.15,
       tpllh$A1N$Y = 0.13:0.14:0.14,
       tphhl$A1N$Y = 0.14:0.14:0.15,
       tplhl$B0$Y = 0.042:0.043:0.044,
       tphlh$B0$Y = 0.041:0.05:0.059,
       tplhl$B1$Y = 0.038:0.039:0.039,
       tphlh$B1$Y = 0.035:0.043:0.051;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB2X4 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.14:0.15:0.16,
       tphhl$A0N$Y = 0.15:0.16:0.16,
       tpllh$A1N$Y = 0.13:0.14:0.15,
       tphhl$A1N$Y = 0.14:0.15:0.15,
       tplhl$B0$Y = 0.043:0.043:0.044,
       tphlh$B0$Y = 0.041:0.05:0.06,
       tplhl$B1$Y = 0.038:0.039:0.04,
       tphlh$B1$Y = 0.035:0.043:0.051;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI2BB2XL (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.099:0.11:0.12,
       tphhl$A0N$Y = 0.1:0.11:0.11,
       tpllh$A1N$Y = 0.098:0.11:0.12,
       tphhl$A1N$Y = 0.1:0.11:0.11,
       tplhl$B0$Y = 0.044:0.045:0.046,
       tphlh$B0$Y = 0.043:0.053:0.063,
       tplhl$B1$Y = 0.041:0.042:0.043,
       tphlh$B1$Y = 0.038:0.048:0.057;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI31X1 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   and (I1_out, A0, A1, A2);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.086:0.086:0.086,
       tphlh$A0$Y = 0.07:0.07:0.07,
       tplhl$A1$Y = 0.084:0.084:0.084,
       tphlh$A1$Y = 0.065:0.065:0.065,
       tplhl$A2$Y = 0.075:0.075:0.075,
       tphlh$A2$Y = 0.057:0.057:0.057,
       tplhl$B0$Y = 0.021:0.021:0.022,
       tphlh$B0$Y = 0.029:0.042:0.055;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI31X2 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   and (I1_out, A0, A1, A2);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.088:0.088:0.088,
       tphlh$A0$Y = 0.071:0.071:0.071,
       tplhl$A1$Y = 0.084:0.084:0.084,
       tphlh$A1$Y = 0.065:0.065:0.065,
       tplhl$A2$Y = 0.074:0.074:0.074,
       tphlh$A2$Y = 0.056:0.056:0.056,
       tplhl$B0$Y = 0.02:0.02:0.021,
       tphlh$B0$Y = 0.027:0.04:0.053;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI31X4 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   and (I1_out, A0, A1, A2);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.089:0.089:0.089,
       tphlh$A0$Y = 0.072:0.072:0.072,
       tplhl$A1$Y = 0.085:0.085:0.085,
       tphlh$A1$Y = 0.066:0.066:0.066,
       tplhl$A2$Y = 0.074:0.074:0.074,
       tphlh$A2$Y = 0.056:0.056:0.056,
       tplhl$B0$Y = 0.02:0.02:0.021,
       tphlh$B0$Y = 0.027:0.041:0.055;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI31XL (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   and (I1_out, A0, A1, A2);
   or  (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.089:0.089:0.089,
       tphlh$A0$Y = 0.074:0.074:0.074,
       tplhl$A1$Y = 0.086:0.086:0.086,
       tphlh$A1$Y = 0.069:0.069:0.069,
       tplhl$A2$Y = 0.077:0.077:0.077,
       tphlh$A2$Y = 0.06:0.06:0.06,
       tplhl$B0$Y = 0.022:0.023:0.023,
       tphlh$B0$Y = 0.032:0.046:0.061;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI32X1 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.098:0.1:0.11,
       tphlh$A0$Y = 0.067:0.077:0.088,
       tplhl$A1$Y = 0.095:0.1:0.11,
       tphlh$A1$Y = 0.063:0.073:0.083,
       tplhl$A2$Y = 0.087:0.093:0.098,
       tphlh$A2$Y = 0.057:0.066:0.075,
       tplhl$B0$Y = 0.042:0.043:0.044,
       tphlh$B0$Y = 0.037:0.052:0.067,
       tplhl$B1$Y = 0.039:0.04:0.041,
       tphlh$B1$Y = 0.033:0.047:0.061;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI32X2 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.1:0.11:0.11,
       tphlh$A0$Y = 0.068:0.079:0.09,
       tplhl$A1$Y = 0.095:0.1:0.11,
       tphlh$A1$Y = 0.063:0.073:0.083,
       tplhl$A2$Y = 0.085:0.091:0.097,
       tphlh$A2$Y = 0.057:0.066:0.074,
       tplhl$B0$Y = 0.042:0.043:0.045,
       tphlh$B0$Y = 0.038:0.053:0.069,
       tplhl$B1$Y = 0.038:0.039:0.041,
       tphlh$B1$Y = 0.032:0.046:0.06;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI32X4 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.1:0.11:0.11,
       tphlh$A0$Y = 0.069:0.08:0.091,
       tplhl$A1$Y = 0.096:0.1:0.11,
       tphlh$A1$Y = 0.064:0.074:0.084,
       tplhl$A2$Y = 0.087:0.093:0.099,
       tphlh$A2$Y = 0.058:0.066:0.075,
       tplhl$B0$Y = 0.043:0.044:0.045,
       tphlh$B0$Y = 0.038:0.054:0.069,
       tplhl$B1$Y = 0.039:0.04:0.041,
       tphlh$B1$Y = 0.033:0.047:0.061;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI32XL (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I2_out, B0, B1);
   or  (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.099:0.1:0.11,
       tphlh$A0$Y = 0.07:0.081:0.092,
       tplhl$A1$Y = 0.097:0.1:0.11,
       tphlh$A1$Y = 0.066:0.076:0.086,
       tplhl$A2$Y = 0.089:0.095:0.1,
       tphlh$A2$Y = 0.06:0.07:0.079,
       tplhl$B0$Y = 0.044:0.045:0.046,
       tphlh$B0$Y = 0.039:0.056:0.072,
       tplhl$B1$Y = 0.042:0.043:0.044,
       tphlh$B1$Y = 0.036:0.051:0.066;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI33X1 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I3_out, B0, B1, B2);
   or  (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.11:0.12:0.13,
       tphlh$A0$Y = 0.071:0.088:0.11,
       tplhl$A1$Y = 0.11:0.12:0.13,
       tphlh$A1$Y = 0.068:0.084:0.1,
       tplhl$A2$Y = 0.098:0.11:0.12,
       tphlh$A2$Y = 0.062:0.076:0.091,
       tplhl$B0$Y = 0.078:0.08:0.082,
       tphlh$B0$Y = 0.047:0.066:0.084,
       tplhl$B1$Y = 0.073:0.076:0.078,
       tphlh$B1$Y = 0.044:0.06:0.077,
       tplhl$B2$Y = 0.063:0.065:0.067,
       tphlh$B2$Y = 0.037:0.052:0.067;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI33X2 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I3_out, B0, B1, B2);
   or  (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.11:0.12:0.13,
       tphlh$A0$Y = 0.072:0.09:0.11,
       tplhl$A1$Y = 0.11:0.12:0.13,
       tphlh$A1$Y = 0.068:0.084:0.1,
       tplhl$A2$Y = 0.097:0.11:0.12,
       tphlh$A2$Y = 0.062:0.076:0.091,
       tplhl$B0$Y = 0.076:0.078:0.08,
       tphlh$B0$Y = 0.046:0.064:0.083,
       tplhl$B1$Y = 0.071:0.073:0.075,
       tphlh$B1$Y = 0.043:0.059:0.075,
       tplhl$B2$Y = 0.061:0.063:0.065,
       tphlh$B2$Y = 0.036:0.051:0.066;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI33X4 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I3_out, B0, B1, B2);
   or  (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.11:0.12:0.14,
       tphlh$A0$Y = 0.073:0.091:0.11,
       tplhl$A1$Y = 0.11:0.12:0.13,
       tphlh$A1$Y = 0.068:0.085:0.1,
       tplhl$A2$Y = 0.099:0.11:0.12,
       tphlh$A2$Y = 0.063:0.078:0.093,
       tplhl$B0$Y = 0.078:0.08:0.082,
       tphlh$B0$Y = 0.048:0.066:0.085,
       tplhl$B1$Y = 0.073:0.075:0.077,
       tphlh$B1$Y = 0.043:0.06:0.076,
       tplhl$B2$Y = 0.063:0.065:0.067,
       tphlh$B2$Y = 0.038:0.053:0.068;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI33XL (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   and (I1_out, A0, A1, A2);
   and (I3_out, B0, B1, B2);
   or  (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.12:0.13:0.14,
       tphlh$A0$Y = 0.075:0.094:0.11,
       tplhl$A1$Y = 0.11:0.12:0.13,
       tphlh$A1$Y = 0.072:0.089:0.11,
       tplhl$A2$Y = 0.1:0.11:0.12,
       tphlh$A2$Y = 0.066:0.082:0.098,
       tplhl$B0$Y = 0.085:0.087:0.089,
       tphlh$B0$Y = 0.053:0.073:0.093,
       tplhl$B1$Y = 0.079:0.081:0.084,
       tphlh$B1$Y = 0.048:0.066:0.084,
       tplhl$B2$Y = 0.069:0.071:0.073,
       tphlh$B2$Y = 0.041:0.057:0.074;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BMXIX2 (A, M0, M1, PPN, S, X2);
input  A ;
input  M0 ;
input  M1 ;
input  S ;
input  X2 ;
output PPN ;

   udp_mux2 (I0_out, S, A, M0);
   udp_mux2 (I1_out, S, A, M1);
   udp_mux2 (PPN, I1_out, I0_out, X2);

   specify
     // delay parameters
     specparam
       tpllh$A$PPN = 0.24:0.24:0.25,
       tphhl$A$PPN = 0.26:0.27:0.28,
       tpllh$M0$PPN = 0.23:0.23:0.23,
       tplhl$M0$PPN = 0.31:0.31:0.31,
       tphlh$M0$PPN = 0.29:0.29:0.29,
       tphhl$M0$PPN = 0.25:0.25:0.25,
       tpllh$M1$PPN = 0.23:0.23:0.23,
       tplhl$M1$PPN = 0.3:0.3:0.3,
       tphlh$M1$PPN = 0.29:0.29:0.29,
       tphhl$M1$PPN = 0.24:0.24:0.24,
       tpllh$S$PPN = 0.25:0.26:0.26,
       tphhl$S$PPN = 0.27:0.27:0.28,
       tpllh$X2$PPN = 0.16:0.16:0.16,
       tplhl$X2$PPN = 0.18:0.18:0.18,
       tphlh$X2$PPN = 0.18:0.18:0.18,
       tphhl$X2$PPN = 0.16:0.16:0.16;

     // path delays
     (A *> PPN) = (tpllh$A$PPN, tphhl$A$PPN);
     (posedge M0 *> (PPN +: X2?S:(M1?A:S))) = (tpllh$M0$PPN, tplhl$M0$PPN);
     (negedge M0 *> (PPN +: X2?S:(M1?A:S))) = (tphlh$M0$PPN, tphhl$M0$PPN);
     (posedge M1 *> (PPN +: X2?(M0?A:S):S)) = (tpllh$M1$PPN, tplhl$M1$PPN);
     (negedge M1 *> (PPN +: X2?(M0?A:S):S)) = (tphlh$M1$PPN, tphhl$M1$PPN);
     (S *> PPN) = (tpllh$S$PPN, tphhl$S$PPN);
     (posedge X2 *> (PPN +: M1?A:S)) = (tpllh$X2$PPN, tplhl$X2$PPN);
     (negedge X2 *> (PPN +: M1?A:S)) = (tphlh$X2$PPN, tphhl$X2$PPN);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BMXIX4 (A, M0, M1, PPN, S, X2);
input  A ;
input  M0 ;
input  M1 ;
input  S ;
input  X2 ;
output PPN ;

   udp_mux2 (I0_out, S, A, M0);
   udp_mux2 (I1_out, S, A, M1);
   udp_mux2 (PPN, I1_out, I0_out, X2);

   specify
     // delay parameters
     specparam
       tpllh$A$PPN = 0.35:0.35:0.36,
       tphhl$A$PPN = 0.39:0.39:0.4,
       tpllh$M0$PPN = 0.34:0.34:0.34,
       tplhl$M0$PPN = 0.43:0.43:0.43,
       tphlh$M0$PPN = 0.4:0.4:0.4,
       tphhl$M0$PPN = 0.37:0.37:0.37,
       tpllh$M1$PPN = 0.34:0.34:0.34,
       tplhl$M1$PPN = 0.41:0.41:0.41,
       tphlh$M1$PPN = 0.39:0.39:0.39,
       tphhl$M1$PPN = 0.38:0.38:0.38,
       tpllh$S$PPN = 0.35:0.36:0.37,
       tphhl$S$PPN = 0.38:0.4:0.41,
       tpllh$X2$PPN = 0.25:0.25:0.25,
       tplhl$X2$PPN = 0.27:0.27:0.27,
       tphlh$X2$PPN = 0.26:0.26:0.26,
       tphhl$X2$PPN = 0.27:0.27:0.27;

     // path delays
     (A *> PPN) = (tpllh$A$PPN, tphhl$A$PPN);
     (posedge M0 *> (PPN +: X2?S:(M1?A:S))) = (tpllh$M0$PPN, tplhl$M0$PPN);
     (negedge M0 *> (PPN +: X2?S:(M1?A:S))) = (tphlh$M0$PPN, tphhl$M0$PPN);
     (posedge M1 *> (PPN +: X2?(M0?A:S):S)) = (tpllh$M1$PPN, tplhl$M1$PPN);
     (negedge M1 *> (PPN +: X2?(M0?A:S):S)) = (tphlh$M1$PPN, tphhl$M1$PPN);
     (S *> PPN) = (tpllh$S$PPN, tphhl$S$PPN);
     (posedge X2 *> (PPN +: M1?A:S)) = (tpllh$X2$PPN, tplhl$X2$PPN);
     (negedge X2 *> (PPN +: M1?A:S)) = (tphlh$X2$PPN, tphhl$X2$PPN);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX12 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.09:0.09:0.09,
       tphhl$A$Y = 0.097:0.097:0.097;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX16 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.14:0.14:0.14,
       tphhl$A$Y = 0.15:0.15:0.15;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.086:0.086:0.086,
       tphhl$A$Y = 0.094:0.094:0.094;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX20 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.09:0.09:0.09,
       tphhl$A$Y = 0.098:0.098:0.098;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.078:0.078:0.078,
       tphhl$A$Y = 0.083:0.083:0.083;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.091:0.091:0.091,
       tphhl$A$Y = 0.098:0.098:0.098;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX6 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.076:0.076:0.076,
       tphhl$A$Y = 0.081:0.081:0.081;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX8 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.089:0.089:0.089,
       tphhl$A$Y = 0.096:0.096:0.096;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X12 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.099:0.099:0.099,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.095:0.095:0.095,
       tphhl$B$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.093:0.093:0.093,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.089:0.089:0.089,
       tphhl$B$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X3 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.085:0.085:0.085,
       tphhl$A$Y = 0.1:0.1:0.1,
       tpllh$B$Y = 0.081:0.081:0.081,
       tphhl$B$Y = 0.091:0.091:0.091;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.098:0.098:0.098,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.093:0.093:0.093,
       tphhl$B$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.086:0.086:0.086,
       tphhl$A$Y = 0.1:0.1:0.1,
       tpllh$B$Y = 0.081:0.081:0.081,
       tphhl$B$Y = 0.092:0.092:0.092;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKAND2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.098:0.098:0.098,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.093:0.093:0.093,
       tphhl$B$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX12 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.09:0.09:0.09,
       tphhl$A$Y = 0.097:0.097:0.097;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX16 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.14:0.14:0.14,
       tphhl$A$Y = 0.15:0.15:0.15;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.086:0.086:0.086,
       tphhl$A$Y = 0.094:0.094:0.094;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX20 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.09:0.09:0.09,
       tphhl$A$Y = 0.098:0.098:0.098;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.078:0.078:0.078,
       tphhl$A$Y = 0.083:0.083:0.083;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.091:0.091:0.091,
       tphhl$A$Y = 0.098:0.098:0.098;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX6 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.076:0.076:0.076,
       tphhl$A$Y = 0.081:0.081:0.081;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX8 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.089:0.089:0.089,
       tphhl$A$Y = 0.096:0.096:0.096;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.019:0.019:0.019,
       tphlh$A$Y = 0.022:0.022:0.022;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX12 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX16 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.057:0.057:0.057,
       tphlh$A$Y = 0.066:0.066:0.066;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.017:0.017:0.017,
       tphlh$A$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX20 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX3 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX4 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX6 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKINVX8 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X12 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.43:0.43:0.43,
       tphhl$A$Y = 0.49:0.49:0.49,
       tpllh$B$Y = 0.43:0.43:0.43,
       tphhl$B$Y = 0.49:0.49:0.49,
       tpllh$S0$Y = 0.4:0.4:0.4,
       tplhl$S0$Y = 0.5:0.5:0.5,
       tphlh$S0$Y = 0.45:0.45:0.45,
       tphhl$S0$Y = 0.46:0.46:0.46;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X2 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.16:0.16:0.16,
       tphhl$A$Y = 0.18:0.18:0.18,
       tpllh$B$Y = 0.17:0.17:0.17,
       tphhl$B$Y = 0.19:0.19:0.19,
       tpllh$S0$Y = 0.13:0.13:0.13,
       tplhl$S0$Y = 0.21:0.21:0.21,
       tphlh$S0$Y = 0.2:0.2:0.2,
       tphhl$S0$Y = 0.15:0.15:0.15;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X3 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.15:0.15:0.15,
       tphhl$A$Y = 0.16:0.16:0.16,
       tpllh$B$Y = 0.15:0.15:0.15,
       tphhl$B$Y = 0.17:0.17:0.17,
       tpllh$S0$Y = 0.12:0.12:0.12,
       tplhl$S0$Y = 0.2:0.2:0.2,
       tphlh$S0$Y = 0.2:0.2:0.2,
       tphhl$S0$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X4 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.2:0.2:0.2,
       tphhl$A$Y = 0.21:0.21:0.21,
       tpllh$B$Y = 0.2:0.2:0.2,
       tphhl$B$Y = 0.22:0.22:0.22,
       tpllh$S0$Y = 0.17:0.17:0.17,
       tplhl$S0$Y = 0.24:0.24:0.24,
       tphlh$S0$Y = 0.24:0.24:0.24,
       tphhl$S0$Y = 0.19:0.19:0.19;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X6 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.26:0.26:0.26,
       tphhl$A$Y = 0.28:0.28:0.28,
       tpllh$B$Y = 0.26:0.26:0.26,
       tphhl$B$Y = 0.29:0.29:0.29,
       tpllh$S0$Y = 0.23:0.23:0.23,
       tplhl$S0$Y = 0.31:0.31:0.31,
       tphlh$S0$Y = 0.29:0.29:0.29,
       tphhl$S0$Y = 0.25:0.25:0.25;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKMX2X8 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.32:0.32:0.32,
       tphhl$A$Y = 0.35:0.35:0.35,
       tpllh$B$Y = 0.31:0.31:0.31,
       tphhl$B$Y = 0.36:0.36:0.36,
       tpllh$S0$Y = 0.29:0.29:0.29,
       tplhl$S0$Y = 0.38:0.38:0.38,
       tphlh$S0$Y = 0.35:0.35:0.35,
       tphhl$S0$Y = 0.32:0.32:0.32;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKXOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.13:0.13:0.13,
       tplhl$A$Y = 0.19:0.19:0.19,
       tphlh$A$Y = 0.18:0.18:0.18,
       tphhl$A$Y = 0.14:0.14:0.14,
       tpllh$B$Y = 0.1:0.1:0.1,
       tplhl$B$Y = 0.16:0.16:0.16,
       tphlh$B$Y = 0.12:0.12:0.12,
       tphhl$B$Y = 0.1:0.1:0.1;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKXOR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.16:0.16:0.16,
       tplhl$A$Y = 0.23:0.23:0.23,
       tphlh$A$Y = 0.21:0.21:0.21,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.14:0.14:0.14,
       tplhl$B$Y = 0.2:0.2:0.2,
       tphlh$B$Y = 0.15:0.15:0.15,
       tphhl$B$Y = 0.14:0.14:0.14;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKXOR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.23:0.23:0.23,
       tplhl$A$Y = 0.27:0.27:0.27,
       tphlh$A$Y = 0.26:0.26:0.26,
       tphhl$A$Y = 0.24:0.24:0.24,
       tpllh$B$Y = 0.18:0.18:0.18,
       tplhl$B$Y = 0.24:0.24:0.24,
       tphlh$B$Y = 0.21:0.21:0.21,
       tphhl$B$Y = 0.19:0.19:0.19;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKXOR2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.35:0.35:0.35,
       tplhl$A$Y = 0.41:0.41:0.41,
       tphlh$A$Y = 0.38:0.38:0.38,
       tphhl$A$Y = 0.37:0.37:0.37,
       tpllh$B$Y = 0.3:0.3:0.3,
       tplhl$B$Y = 0.38:0.38:0.38,
       tphlh$B$Y = 0.32:0.32:0.32,
       tphhl$B$Y = 0.32:0.32:0.32;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFHQX1 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30);
   not (Q, QBINT_2);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tminpwh$CK = 0.15:0.31:0.31,
       tminpwl$CK = 0.16:0.3:0.3,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFHQX2 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_3, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_5, N30_3);
   not (Q, QBINT_5);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tminpwh$CK = 0.15:0.33:0.33,
       tminpwl$CK = 0.16:0.3:0.3,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFHQX4 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_7, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_8, N30_7);
   not (Q, QBINT_8);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tminpwh$CK = 0.18:0.34:0.34,
       tminpwl$CK = 0.17:0.31:0.31,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFHQX8 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_12, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_30, N30_12);
   not (Q, QBINT_30);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tminpwh$CK = 0.21:0.38:0.38,
       tminpwl$CK = 0.16:0.3:0.3,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNSRX1 (CKN, D, Q, QN, RN, SN);
input  CKN ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_5, D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35_5);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.34:0.34:0.34,
       tphhl$CKN$Q = 0.29:0.29:0.29,
       tphlh$CKN$QN = 0.35:0.35:0.35,
       tphhl$CKN$QN = 0.41:0.41:0.41,
       tphhl$RN$Q = 0.38:0.39:0.41,
       tphlh$RN$QN = 0.44:0.45:0.47,
       tplhl$SN$Q = 0.34:0.35:0.36,
       tphlh$SN$Q = 0.26:0.27:0.27,
       tpllh$SN$QN = 0.4:0.41:0.42,
       tphhl$SN$QN = 0.32:0.33:0.33,
       tminpwh$CKN = 0.13:0.32:0.32,
       tminpwl$CKN = 0.14:0.41:0.41,
       tminpwl$RN = 0.14:0.47:0.47,
       tminpwl$SN = 0.054:0.33:0.33,
       tsetup_negedge$D$CKN = 0.28:0.28:0.28,
       thold_negedge$D$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$CKN = 0.19:0.19:0.19,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.19:0.19:0.19,
       trem$RN$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CKN = 0.19:0.19:0.19,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNSRX2 (CKN, D, Q, QN, RN, SN);
input  CKN ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_2, N35_3);
   not (Q, QBINT_2);
   buf (QN, QBINT_2);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.36:0.36:0.36,
       tphhl$CKN$Q = 0.33:0.33:0.33,
       tphlh$CKN$QN = 0.44:0.44:0.44,
       tphhl$CKN$QN = 0.46:0.46:0.46,
       tphhl$RN$Q = 0.41:0.43:0.44,
       tphlh$RN$QN = 0.51:0.53:0.55,
       tplhl$SN$Q = 0.34:0.36:0.37,
       tphlh$SN$Q = 0.27:0.28:0.28,
       tpllh$SN$QN = 0.44:0.46:0.48,
       tphhl$SN$QN = 0.38:0.38:0.39,
       tminpwh$CKN = 0.14:0.34:0.34,
       tminpwl$CKN = 0.17:0.46:0.46,
       tminpwl$RN = 0.16:0.55:0.55,
       tminpwl$SN = 0.059:0.39:0.39,
       tsetup_negedge$D$CKN = 0.28:0.28:0.28,
       thold_negedge$D$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$CKN = 0.19:0.19:0.19,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.19:0.19:0.19,
       trem$RN$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CKN = 0.19:0.19:0.19,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNSRX4 (CKN, D, Q, QN, RN, SN);
input  CKN ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_8, D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_11, N35_8);
   not (Q, QBINT_11);
   buf (QN, QBINT_11);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.39:0.39:0.39,
       tphhl$CKN$Q = 0.37:0.37:0.37,
       tphlh$CKN$QN = 0.48:0.48:0.48,
       tphhl$CKN$QN = 0.5:0.5:0.5,
       tphhl$RN$Q = 0.45:0.46:0.47,
       tphlh$RN$QN = 0.55:0.57:0.58,
       tplhl$SN$Q = 0.39:0.4:0.41,
       tphlh$SN$Q = 0.3:0.31:0.32,
       tpllh$SN$QN = 0.5:0.51:0.52,
       tphhl$SN$QN = 0.41:0.42:0.43,
       tminpwh$CKN = 0.15:0.35:0.35,
       tminpwl$CKN = 0.2:0.5:0.5,
       tminpwl$RN = 0.16:0.58:0.58,
       tminpwl$SN = 0.061:0.43:0.43,
       tsetup_negedge$D$CKN = 0.28:0.28:0.28,
       thold_negedge$D$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$CKN = 0.19:0.19:0.19,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.19:0.19:0.19,
       trem$RN$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$SN = 0.28:0.28:0.28,
       trec$SN$CKN = 0.19:0.19:0.19,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNSRXL (CKN, D, Q, QN, RN, SN);
input  CKN ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_7, D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_7);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.33:0.33:0.33,
       tphhl$CKN$Q = 0.27:0.27:0.27,
       tphlh$CKN$QN = 0.31:0.31:0.31,
       tphhl$CKN$QN = 0.37:0.37:0.37,
       tphhl$RN$Q = 0.35:0.37:0.38,
       tphlh$RN$QN = 0.39:0.41:0.43,
       tplhl$SN$Q = 0.31:0.32:0.33,
       tphlh$SN$Q = 0.24:0.25:0.25,
       tpllh$SN$QN = 0.35:0.36:0.37,
       tphhl$SN$QN = 0.28:0.28:0.29,
       tminpwh$CKN = 0.13:0.32:0.32,
       tminpwl$CKN = 0.14:0.37:0.37,
       tminpwl$RN = 0.14:0.43:0.43,
       tminpwl$SN = 0.055:0.29:0.29,
       tsetup_negedge$D$CKN = 0.28:0.28:0.28,
       thold_negedge$D$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$CKN = 0.19:0.19:0.19,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.19:0.19:0.19,
       trem$RN$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CKN = 0.19:0.19:0.19,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFQX1 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_2, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_2);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tminpwh$CK = 0.14:0.31:0.31,
       tminpwl$CK = 0.15:0.29:0.29,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFQX2 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_4, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_4);
   not (Q, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tminpwh$CK = 0.15:0.32:0.32,
       tminpwl$CK = 0.15:0.29:0.29,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFQX4 (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_7, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_19, N30_7);
   not (Q, QBINT_19);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.3:0.3:0.3,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tminpwh$CK = 0.18:0.34:0.34,
       tminpwl$CK = 0.15:0.29:0.29,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFQXL (CK, D, Q);
input  CK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (N30_4, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_4);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.24:0.24:0.24,
       tplhl$CK$Q = 0.29:0.29:0.29,
       tminpwh$CK = 0.14:0.29:0.29,
       tminpwl$CK = 0.15:0.29:0.29,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRHQX1 (CK, D, Q, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_3, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_3, N30_3);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tphhl$RN$Q = 0.083:0.084:0.084,
       tminpwh$CK = 0.16:0.33:0.33,
       tminpwl$CK = 0.17:0.32:0.32,
       tminpwl$RN = 0.054:0.21:0.21,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRHQX2 (CK, D, Q, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_5, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_4, N30_5);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.33:0.33:0.33,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tphhl$RN$Q = 0.099:0.1:0.1,
       tminpwh$CK = 0.16:0.34:0.34,
       tminpwl$CK = 0.17:0.31:0.31,
       tminpwl$RN = 0.069:0.21:0.21,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRHQX4 (CK, D, Q, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_7, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_9, N30_7);
   not (Q, QBINT_9);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.36:0.36:0.36,
       tphhl$RN$Q = 0.088:0.088:0.088,
       tminpwh$CK = 0.18:0.36:0.36,
       tminpwl$CK = 0.16:0.33:0.33,
       tminpwl$RN = 0.06:0.23:0.23,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRHQX8 (CK, D, Q, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_13, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_40, N30_13);
   not (Q, QBINT_40);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.4:0.4:0.4,
       tplhl$CK$Q = 0.4:0.4:0.4,
       tphhl$RN$Q = 0.087:0.087:0.087,
       tminpwh$CK = 0.21:0.4:0.4,
       tminpwl$CK = 0.16:0.32:0.32,
       tminpwl$RN = 0.056:0.27:0.27,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRX1 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_4, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_6, N30_4);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.33:0.33:0.33,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.39:0.39:0.39,
       tplhl$CK$QN = 0.4:0.4:0.4,
       tphhl$RN$Q = 0.11:0.11:0.11,
       tphlh$RN$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.14:0.4:0.4,
       tminpwl$CK = 0.15:0.29:0.29,
       tminpwl$RN = 0.078:0.22:0.22,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRX2 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_8, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_16, N30_8);
   not (Q, QBINT_16);
   buf (QN, QBINT_16);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tpllh$CK$QN = 0.44:0.44:0.44,
       tplhl$CK$QN = 0.47:0.47:0.47,
       tphhl$RN$Q = 0.11:0.11:0.11,
       tphlh$RN$QN = 0.21:0.21:0.21,
       tminpwh$CK = 0.15:0.47:0.47,
       tminpwl$CK = 0.15:0.29:0.29,
       tminpwl$RN = 0.077:0.23:0.23,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRX4 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_6, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_25, N30_6);
   not (Q, QBINT_25);
   buf (QN, QBINT_25);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.38:0.38:0.38,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.46:0.46:0.46,
       tplhl$CK$QN = 0.51:0.51:0.51,
       tphhl$RN$Q = 0.098:0.099:0.099,
       tphlh$RN$QN = 0.2:0.2:0.2,
       tminpwh$CK = 0.18:0.51:0.51,
       tminpwl$CK = 0.14:0.28:0.28,
       tminpwl$RN = 0.068:0.25:0.25,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFRXL (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   udp_dff (N30_4, D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_4, N30_4);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.36:0.36:0.36,
       tplhl$CK$QN = 0.36:0.36:0.36,
       tphhl$RN$Q = 0.1:0.1:0.1,
       tphlh$RN$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.14:0.36:0.36,
       tminpwl$CK = 0.15:0.29:0.29,
       tminpwl$RN = 0.069:0.21:0.21,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D == 1'b1, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSHQX1 (CK, D, Q, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_3, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_3, N35_3);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tphlh$SN$Q = 0.2:0.2:0.2,
       tminpwh$CK = 0.15:0.33:0.33,
       tminpwl$CK = 0.17:0.34:0.34,
       tminpwl$SN = 0.044:0.2:0.2,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSHQX2 (CK, D, Q, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_3, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35_3);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tphlh$SN$Q = 0.22:0.22:0.22,
       tminpwh$CK = 0.15:0.35:0.35,
       tminpwl$CK = 0.17:0.34:0.34,
       tminpwl$SN = 0.043:0.22:0.22,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSHQX4 (CK, D, Q, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_4, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_6, N35_4);
   not (Q, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.3:0.3:0.3,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tphlh$SN$Q = 0.24:0.25:0.25,
       tminpwh$CK = 0.18:0.38:0.38,
       tminpwl$CK = 0.17:0.34:0.34,
       tminpwl$SN = 0.044:0.25:0.25,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSHQX8 (CK, D, Q, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_12, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_9, N35_12);
   not (Q, QBINT_9);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.42:0.42:0.42,
       tphlh$SN$Q = 0.28:0.29:0.3,
       tminpwh$CK = 0.21:0.42:0.42,
       tminpwl$CK = 0.16:0.33:0.33,
       tminpwl$SN = 0.044:0.3:0.3,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRHQX1 (CK, D, Q, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35);
   not (Q, QBINT_3);
   not (I6_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I6_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.36:0.36:0.36,
       tphhl$RN$Q = 0.35:0.36:0.38,
       tplhl$SN$Q = 0.29:0.3:0.31,
       tphlh$SN$Q = 0.22:0.23:0.23,
       tminpwh$CK = 0.17:0.36:0.36,
       tminpwl$CK = 0.17:0.36:0.36,
       tminpwl$RN = 0.16:0.38:0.38,
       tminpwl$SN = 0.052:0.23:0.23,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRHQX2 (CK, D, Q, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_3);
   not (Q, QBINT_4);
   not (I6_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I6_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tphhl$RN$Q = 0.37:0.39:0.41,
       tplhl$SN$Q = 0.32:0.33:0.34,
       tphlh$SN$Q = 0.24:0.25:0.25,
       tminpwh$CK = 0.17:0.38:0.38,
       tminpwl$CK = 0.17:0.36:0.36,
       tminpwl$RN = 0.16:0.41:0.41,
       tminpwl$SN = 0.053:0.25:0.25,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRHQX4 (CK, D, Q, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_9, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_6, N35_9);
   not (Q, QBINT_6);
   not (I6_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I6_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.39:0.39:0.39,
       tphhl$RN$Q = 0.41:0.42:0.42,
       tplhl$SN$Q = 0.36:0.36:0.36,
       tphlh$SN$Q = 0.26:0.27:0.28,
       tminpwh$CK = 0.21:0.39:0.39,
       tminpwl$CK = 0.17:0.36:0.36,
       tminpwl$RN = 0.15:0.42:0.42,
       tminpwl$SN = 0.052:0.28:0.28,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.28:0.28,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRHQX8 (CK, D, Q, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_10, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_30, N35_10);
   not (Q, QBINT_30);
   not (I6_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I6_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.39:0.39:0.39,
       tplhl$CK$Q = 0.45:0.45:0.45,
       tphhl$RN$Q = 0.47:0.48:0.48,
       tplhl$SN$Q = 0.41:0.41:0.42,
       tphlh$SN$Q = 0.3:0.31:0.33,
       tminpwh$CK = 0.24:0.45:0.45,
       tminpwl$CK = 0.16:0.36:0.36,
       tminpwl$RN = 0.16:0.48:0.48,
       tminpwl$SN = 0.052:0.33:0.33,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.28:0.28:0.28,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRX1 (CK, D, Q, QN, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_4, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35_4);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.37:0.37:0.37,
       tpllh$CK$QN = 0.43:0.43:0.43,
       tplhl$CK$QN = 0.35:0.35:0.35,
       tphhl$RN$Q = 0.38:0.39:0.41,
       tphlh$RN$QN = 0.44:0.46:0.47,
       tplhl$SN$Q = 0.34:0.35:0.37,
       tphlh$SN$Q = 0.27:0.27:0.28,
       tpllh$SN$QN = 0.4:0.42:0.43,
       tphhl$SN$QN = 0.33:0.34:0.34,
       tminpwh$CK = 0.15:0.43:0.43,
       tminpwl$CK = 0.14:0.34:0.34,
       tminpwl$RN = 0.15:0.47:0.47,
       tminpwl$SN = 0.063:0.34:0.34,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRX2 (CK, D, Q, QN, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_6, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT, N35_6);
   not (Q, QBINT);
   buf (QN, QBINT);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.37:0.37:0.37,
       tpllh$CK$QN = 0.47:0.47:0.47,
       tplhl$CK$QN = 0.45:0.45:0.45,
       tphhl$RN$Q = 0.41:0.43:0.44,
       tphlh$RN$QN = 0.51:0.53:0.54,
       tplhl$SN$Q = 0.34:0.36:0.37,
       tphlh$SN$Q = 0.27:0.28:0.28,
       tpllh$SN$QN = 0.44:0.46:0.47,
       tphhl$SN$QN = 0.37:0.38:0.38,
       tminpwh$CK = 0.18:0.47:0.47,
       tminpwl$CK = 0.16:0.33:0.33,
       tminpwl$RN = 0.15:0.54:0.54,
       tminpwl$SN = 0.057:0.38:0.38,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRX4 (CK, D, Q, QN, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_8, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_11, N35_8);
   not (Q, QBINT_11);
   buf (QN, QBINT_11);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.42:0.42:0.42,
       tpllh$CK$QN = 0.52:0.52:0.52,
       tplhl$CK$QN = 0.46:0.46:0.46,
       tphhl$RN$Q = 0.45:0.46:0.48,
       tphlh$RN$QN = 0.55:0.57:0.59,
       tplhl$SN$Q = 0.39:0.4:0.41,
       tphlh$SN$Q = 0.3:0.31:0.32,
       tpllh$SN$QN = 0.5:0.51:0.52,
       tphhl$SN$QN = 0.41:0.42:0.43,
       tminpwh$CK = 0.2:0.52:0.52,
       tminpwl$CK = 0.16:0.34:0.34,
       tminpwl$RN = 0.16:0.59:0.59,
       tminpwl$SN = 0.059:0.43:0.43,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.28:0.28:0.28,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRXL (CK, D, Q, QN, RN, SN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_6, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_6);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.4:0.4:0.4,
       tplhl$CK$QN = 0.31:0.31:0.31,
       tphhl$RN$Q = 0.36:0.37:0.39,
       tphlh$RN$QN = 0.4:0.42:0.43,
       tplhl$SN$Q = 0.32:0.33:0.35,
       tphlh$SN$Q = 0.26:0.26:0.26,
       tpllh$SN$QN = 0.36:0.38:0.4,
       tphhl$SN$QN = 0.29:0.3:0.3,
       tminpwh$CK = 0.15:0.4:0.4,
       tminpwl$CK = 0.14:0.34:0.34,
       tminpwl$RN = 0.14:0.43:0.43,
       tminpwl$SN = 0.063:0.3:0.3,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSX1 (CK, D, Q, QN, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_5, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35_5);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tpllh$CK$QN = 0.4:0.4:0.4,
       tplhl$CK$QN = 0.33:0.33:0.33,
       tphlh$SN$Q = 0.24:0.25:0.25,
       tphhl$SN$QN = 0.3:0.31:0.31,
       tminpwh$CK = 0.14:0.4:0.4,
       tminpwl$CK = 0.15:0.32:0.32,
       tminpwl$SN = 0.047:0.31:0.31,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSX2 (CK, D, Q, QN, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_8, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_3, N35_8);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.46:0.46:0.46,
       tplhl$CK$QN = 0.39:0.39:0.39,
       tphlh$SN$Q = 0.26:0.26:0.27,
       tphhl$SN$QN = 0.36:0.37:0.37,
       tminpwh$CK = 0.15:0.46:0.46,
       tminpwl$CK = 0.16:0.33:0.33,
       tminpwl$SN = 0.048:0.37:0.37,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSX4 (CK, D, Q, QN, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_9, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_22, N35_9);
   not (Q, QBINT_22);
   buf (QN, QBINT_22);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.39:0.39:0.39,
       tpllh$CK$QN = 0.5:0.5:0.5,
       tplhl$CK$QN = 0.42:0.42:0.42,
       tphlh$SN$Q = 0.28:0.29:0.29,
       tphhl$SN$QN = 0.38:0.39:0.4,
       tminpwh$CK = 0.18:0.5:0.5,
       tminpwl$CK = 0.14:0.31:0.31,
       tminpwl$SN = 0.047:0.4:0.4,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSXL (CK, D, Q, QN, SN);
input  CK ;
input  D ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_SET, SN);
   udp_dff (N35_4, D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35_4);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.37:0.37:0.37,
       tplhl$CK$QN = 0.3:0.3:0.3,
       tphlh$SN$Q = 0.23:0.23:0.24,
       tphhl$SN$QN = 0.27:0.27:0.28,
       tminpwh$CK = 0.14:0.37:0.37,
       tminpwl$CK = 0.15:0.32:0.32,
       tminpwl$SN = 0.047:0.28:0.28,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D == 1'b0, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D == 1'b0, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFTRX1 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_D, D, RN);
   udp_dff (N30_4, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_4);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.38:0.38:0.38,
       tplhl$CK$QN = 0.32:0.32:0.32,
       tminpwh$CK = 0.13:0.38:0.38,
       tminpwl$CK = 0.14:0.22:0.22,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: RN&D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFTRX2 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_D, D, RN);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_6);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.42:0.42:0.42,
       tplhl$CK$QN = 0.37:0.37:0.37,
       tminpwh$CK = 0.14:0.42:0.42,
       tminpwl$CK = 0.14:0.22:0.22,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.28:0.28:0.28,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: RN&D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFTRX4 (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_D, D, RN);
   udp_dff (N30_8, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_19, N30_8);
   not (Q, QBINT_19);
   buf (QN, QBINT_19);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.45:0.45:0.45,
       tplhl$CK$QN = 0.42:0.42:0.42,
       tminpwh$CK = 0.17:0.45:0.45,
       tminpwl$CK = 0.14:0.22:0.22,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: RN&D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFTRXL (CK, D, Q, QN, RN);
input  CK ;
input  D ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_D, D, RN);
   udp_dff (N30_4, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_4);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.3:0.3:0.3,
       tpllh$CK$QN = 0.35:0.35:0.35,
       tplhl$CK$QN = 0.29:0.29:0.29,
       tminpwh$CK = 0.13:0.35:0.35,
       tminpwl$CK = 0.14:0.22:0.22,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$RN$CK = 0.095:0.095:0.095,
       thold_negedge$RN$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$RN$CK = 0.19:0.19:0.19,
       thold_posedge$RN$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: RN&D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFX1 (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (N30_4, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_4);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.39:0.39:0.39,
       tplhl$CK$QN = 0.33:0.33:0.33,
       tminpwh$CK = 0.14:0.39:0.39,
       tminpwl$CK = 0.15:0.28:0.28,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFX2 (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (N30_8, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_13, N30_8);
   not (Q, QBINT_13);
   buf (QN, QBINT_13);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.42:0.42:0.42,
       tplhl$CK$QN = 0.38:0.38:0.38,
       tminpwh$CK = 0.14:0.42:0.42,
       tminpwl$CK = 0.14:0.28:0.28,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFX4 (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (N30_9, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_21, N30_9);
   not (Q, QBINT_21);
   buf (QN, QBINT_21);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.45:0.45:0.45,
       tplhl$CK$QN = 0.42:0.42:0.42,
       tminpwh$CK = 0.17:0.45:0.45,
       tminpwl$CK = 0.14:0.28:0.28,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFXL (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (N30_4, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_4);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tpllh$CK$QN = 0.35:0.35:0.35,
       tplhl$CK$QN = 0.3:0.3:0.3,
       tminpwh$CK = 0.14:0.35:0.35,
       tminpwl$CK = 0.15:0.28:0.28,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY1X1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.2:0.2:0.2,
       tphhl$A$Y = 0.2:0.2:0.2;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY1X4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.26:0.26:0.26,
       tphhl$A$Y = 0.26:0.26:0.26;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY2X1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.4:0.4:0.4,
       tphhl$A$Y = 0.4:0.4:0.4;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY2X4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.45:0.45:0.45,
       tphhl$A$Y = 0.45:0.45:0.45;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY3X1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.59:0.59:0.59,
       tphhl$A$Y = 0.59:0.59:0.59;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY3X4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.64:0.64:0.64,
       tphhl$A$Y = 0.64:0.64:0.64;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY4X1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.78:0.78:0.78,
       tphhl$A$Y = 0.77:0.77:0.77;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DLY4X4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.84:0.84:0.84,
       tphhl$A$Y = 0.83:0.83:0.83;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFHQX1 (CK, D, E, Q);
input  CK ;
input  D ;
input  E ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_5);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_5, N30_3);
   not (Q, QBINT_5);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tminpwh$CK = 0.14:0.31:0.31,
       tminpwl$CK = 0.15:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_5)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFHQX2 (CK, D, E, Q);
input  CK ;
input  D ;
input  E ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_5);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_5, N30_3);
   not (Q, QBINT_5);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tminpwh$CK = 0.15:0.32:0.32,
       tminpwl$CK = 0.15:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_5)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFHQX4 (CK, D, E, Q);
input  CK ;
input  D ;
input  E ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_14);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_14, N30);
   not (Q, QBINT_14);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tminpwh$CK = 0.17:0.34:0.34,
       tminpwl$CK = 0.15:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_14)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFHQX8 (CK, D, E, Q);
input  CK ;
input  D ;
input  E ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_17);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_11, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30_11);
   not (Q, QBINT_17);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tminpwh$CK = 0.21:0.38:0.38,
       tminpwl$CK = 0.15:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_17)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFTRX1 (CK, D, E, Q, QN, RN);
input  CK ;
input  D ;
input  E ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_18);
   not (I5_out, I4_out);
   and (I0_D, I2_out, I5_out, RN);
   udp_dff (N30_7, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_18, N30_7);
   not (Q, QBINT_18);
   buf (QN, QBINT_18);
   and (E_EQ_1_AN_RN_EQ_1, E, RN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.38:0.38:0.38,
       tplhl$CK$QN = 0.34:0.34:0.34,
       tminpwh$CK = 0.15:0.38:0.38,
       tminpwl$CK = 0.15:0.28:0.28,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$E$CK = 0.19:0.38:0.38,
       thold_posedge$E$CK = -0.28:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.47:0.47:0.47,
       thold_posedge$RN$CK = -0.28:-0.28:-0.28;

     // path delays
     (posedge CK *> (Q +: RN&(!(QBINT_18&!E)&!(E&!D)))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&(!(QBINT_18&!E)&!(E&!D)))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFTRX2 (CK, D, E, Q, QN, RN);
input  CK ;
input  D ;
input  E ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_11);
   not (I5_out, I4_out);
   and (I0_D, I2_out, I5_out, RN);
   udp_dff (N30_5, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_11, N30_5);
   not (Q, QBINT_11);
   buf (QN, QBINT_11);
   and (E_EQ_1_AN_RN_EQ_1, E, RN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.3:0.3:0.3,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tpllh$CK$QN = 0.43:0.43:0.43,
       tplhl$CK$QN = 0.4:0.4:0.4,
       tminpwh$CK = 0.16:0.43:0.43,
       tminpwl$CK = 0.15:0.29:0.29,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$E$CK = 0.19:0.38:0.38,
       thold_posedge$E$CK = -0.28:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.47:0.47:0.47,
       thold_posedge$RN$CK = -0.28:-0.28:-0.28;

     // path delays
     (posedge CK *> (Q +: RN&(!(QBINT_11&!E)&!(E&!D)))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&(!(QBINT_11&!E)&!(E&!D)))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFTRX4 (CK, D, E, Q, QN, RN);
input  CK ;
input  D ;
input  E ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_7);
   not (I5_out, I4_out);
   and (I0_D, I2_out, I5_out, RN);
   udp_dff (N30_4, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_7, N30_4);
   not (Q, QBINT_7);
   buf (QN, QBINT_7);
   and (E_EQ_1_AN_RN_EQ_1, E, RN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.36:0.36:0.36,
       tpllh$CK$QN = 0.47:0.47:0.47,
       tplhl$CK$QN = 0.45:0.45:0.45,
       tminpwh$CK = 0.19:0.47:0.47,
       tminpwl$CK = 0.16:0.28:0.28,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$E$CK = 0.19:0.38:0.38,
       thold_posedge$E$CK = -0.28:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.38:0.38:0.38,
       thold_posedge$RN$CK = -0.19:-0.19:-0.19;

     // path delays
     (posedge CK *> (Q +: RN&(!(QBINT_7&!E)&!(E&!D)))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&(!(QBINT_7&!E)&!(E&!D)))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFTRXL (CK, D, E, Q, QN, RN);
input  CK ;
input  D ;
input  E ;
input  RN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_17);
   not (I5_out, I4_out);
   and (I0_D, I2_out, I5_out, RN);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30_6);
   not (Q, QBINT_17);
   buf (QN, QBINT_17);
   and (E_EQ_1_AN_RN_EQ_1, E, RN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.36:0.36:0.36,
       tplhl$CK$QN = 0.32:0.32:0.32,
       tminpwh$CK = 0.14:0.36:0.36,
       tminpwl$CK = 0.15:0.27:0.27,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$E$CK = 0.19:0.38:0.38,
       thold_posedge$E$CK = -0.28:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.47:0.47:0.47,
       thold_posedge$RN$CK = -0.28:-0.28:-0.28;

     // path delays
     (posedge CK *> (Q +: RN&(!(QBINT_17&!E)&!(E&!D)))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: RN&(!(QBINT_17&!E)&!(E&!D)))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFX1 (CK, D, E, Q, QN);
input  CK ;
input  D ;
input  E ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_6);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_7, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_7);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.3:0.3:0.3,
       tpllh$CK$QN = 0.36:0.36:0.36,
       tplhl$CK$QN = 0.31:0.31:0.31,
       tminpwh$CK = 0.14:0.36:0.36,
       tminpwl$CK = 0.14:0.25:0.25,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.28:0.28,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_6)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: E?D:!QBINT_6)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFX2 (CK, D, E, Q, QN);
input  CK ;
input  D ;
input  E ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_16);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_16, N30);
   not (Q, QBINT_16);
   buf (QN, QBINT_16);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.41:0.41:0.41,
       tplhl$CK$QN = 0.37:0.37:0.37,
       tminpwh$CK = 0.14:0.41:0.41,
       tminpwl$CK = 0.14:0.25:0.25,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.28:0.28,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_16)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: E?D:!QBINT_16)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFX4 (CK, D, E, Q, QN);
input  CK ;
input  D ;
input  E ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_25);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_25, N30);
   not (Q, QBINT_25);
   buf (QN, QBINT_25);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.45:0.45:0.45,
       tplhl$CK$QN = 0.42:0.42:0.42,
       tminpwh$CK = 0.17:0.45:0.45,
       tminpwl$CK = 0.14:0.25:0.25,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.28:0.28:0.28,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_25)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: E?D:!QBINT_25)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module EDFFXL (CK, D, E, Q, QN);
input  CK ;
input  D ;
input  E ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_6);
   udp_mux2 (I0_D, I0_out, D, E);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_6);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tpllh$CK$QN = 0.36:0.36:0.36,
       tplhl$CK$QN = 0.3:0.3:0.3,
       tminpwh$CK = 0.13:0.36:0.36,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.095:0.19:0.19,
       thold_negedge$E$CK = -0.001:0.093:0.093,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.28:0.28:0.28,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: E?D:!QBINT_6)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: E?D:!QBINT_6)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module HOLDX1 (Y);
inout  Y ;

   buf (weak1, weak0) (Y, Y);


endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.019:0.019:0.019,
       tphlh$A$Y = 0.022:0.022:0.022;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX12 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX16 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.057:0.057:0.057,
       tphlh$A$Y = 0.066:0.066:0.066;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.017:0.017:0.017,
       tphlh$A$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX20 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX3 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX4 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX6 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX8 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.018:0.018:0.018,
       tphlh$A$Y = 0.02:0.02:0.02;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVXL (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.019:0.019:0.019,
       tphlh$A$Y = 0.022:0.022:0.022;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MDFFHQX1 (CK, D0, D1, Q, S0);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D0, D1, S0);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30);
   not (Q, QBINT_2);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tminpwh$CK = 0.15:0.31:0.31,
       tminpwl$CK = 0.16:0.28:0.28,
       tsetup_negedge$D0$CK = 0.19:0.19:0.19,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.19:0.19:0.19,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.28:0.28,
       thold_negedge$S0$CK = -0.095:0.093:0.093,
       tsetup_posedge$D0$CK = 0.28:0.28:0.28,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.19:0.19:0.19,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.19:0.19:0.19,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: S0?D1:D0)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0 == 1'b0, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0 == 1'b0, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MDFFHQX2 (CK, D0, D1, Q, S0);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D0, D1, S0);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tminpwh$CK = 0.14:0.33:0.33,
       tminpwl$CK = 0.16:0.27:0.27,
       tsetup_negedge$D0$CK = 0.19:0.19:0.19,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.19:0.19:0.19,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.28:0.28,
       thold_negedge$S0$CK = -0.095:0.093:0.093,
       tsetup_posedge$D0$CK = 0.19:0.19:0.19,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.19:0.19:0.19,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.19:0.19:0.19,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: S0?D1:D0)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0 == 1'b0, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0 == 1'b0, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MDFFHQX4 (CK, D0, D1, Q, S0);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D0, D1, S0);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_15, N30_6);
   not (Q, QBINT_15);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tminpwh$CK = 0.17:0.34:0.34,
       tminpwl$CK = 0.16:0.28:0.28,
       tsetup_negedge$D0$CK = 0.19:0.19:0.19,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.19:0.19:0.19,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.28:0.28,
       thold_negedge$S0$CK = -0.095:0.093:0.093,
       tsetup_posedge$D0$CK = 0.19:0.19:0.19,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.19:0.19:0.19,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.19:0.19:0.19,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: S0?D1:D0)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0 == 1'b0, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0 == 1'b0, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MDFFHQX8 (CK, D0, D1, Q, S0);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D0, D1, S0);
   udp_dff (N30_11, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_30, N30_11);
   not (Q, QBINT_30);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tminpwh$CK = 0.22:0.38:0.38,
       tminpwl$CK = 0.16:0.27:0.27,
       tsetup_negedge$D0$CK = 0.19:0.19:0.19,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.19:0.19:0.19,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.095:0.28:0.28,
       thold_negedge$S0$CK = -0.095:0.093:0.093,
       tsetup_posedge$D0$CK = 0.19:0.19:0.19,
       thold_posedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D1$CK = 0.19:0.19:0.19,
       thold_posedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$S0$CK = 0.19:0.19:0.19,
       thold_posedge$S0$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: S0?D1:D0)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0 == 1'b0, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0 == 1'b0, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b0, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X1 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.13:0.13:0.13,
       tpllh$B$Y = 0.13:0.13:0.13,
       tphhl$B$Y = 0.14:0.14:0.14,
       tpllh$S0$Y = 0.096:0.096:0.096,
       tplhl$S0$Y = 0.16:0.16:0.16,
       tphlh$S0$Y = 0.16:0.16:0.16,
       tphhl$S0$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X2 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.16:0.16:0.16,
       tphhl$A$Y = 0.18:0.18:0.18,
       tpllh$B$Y = 0.17:0.17:0.17,
       tphhl$B$Y = 0.19:0.19:0.19,
       tpllh$S0$Y = 0.13:0.13:0.13,
       tplhl$S0$Y = 0.21:0.21:0.21,
       tphlh$S0$Y = 0.2:0.2:0.2,
       tphhl$S0$Y = 0.15:0.15:0.15;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X4 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.2:0.2:0.2,
       tphhl$A$Y = 0.21:0.21:0.21,
       tpllh$B$Y = 0.2:0.2:0.2,
       tphhl$B$Y = 0.22:0.22:0.22,
       tpllh$S0$Y = 0.17:0.17:0.17,
       tplhl$S0$Y = 0.24:0.24:0.24,
       tphlh$S0$Y = 0.24:0.24:0.24,
       tphhl$S0$Y = 0.19:0.19:0.19;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X6 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.26:0.26:0.26,
       tphhl$A$Y = 0.28:0.28:0.28,
       tpllh$B$Y = 0.26:0.26:0.26,
       tphhl$B$Y = 0.29:0.29:0.29,
       tpllh$S0$Y = 0.23:0.23:0.23,
       tplhl$S0$Y = 0.31:0.31:0.31,
       tphlh$S0$Y = 0.29:0.29:0.29,
       tphhl$S0$Y = 0.25:0.25:0.25;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X8 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.32:0.32:0.32,
       tphhl$A$Y = 0.35:0.35:0.35,
       tpllh$B$Y = 0.31:0.31:0.31,
       tphhl$B$Y = 0.36:0.36:0.36,
       tpllh$S0$Y = 0.29:0.29:0.29,
       tplhl$S0$Y = 0.38:0.38:0.38,
       tphlh$S0$Y = 0.35:0.35:0.35,
       tphhl$S0$Y = 0.32:0.32:0.32;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2XL (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpllh$B$Y = 0.11:0.11:0.11,
       tphhl$B$Y = 0.12:0.12:0.12,
       tpllh$S0$Y = 0.081:0.081:0.081,
       tplhl$S0$Y = 0.14:0.14:0.14,
       tphlh$S0$Y = 0.15:0.15:0.15,
       tphhl$S0$Y = 0.084:0.084:0.084;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (posedge S0 *> (Y +: A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX3X1 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (Y, I0_out, C, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.2:0.2:0.2,
       tphhl$A$Y = 0.21:0.21:0.21,
       tpllh$B$Y = 0.2:0.2:0.2,
       tphhl$B$Y = 0.22:0.22:0.22,
       tpllh$C$Y = 0.13:0.13:0.13,
       tphhl$C$Y = 0.14:0.14:0.14,
       tpllh$S0$Y = 0.17:0.17:0.17,
       tplhl$S0$Y = 0.24:0.24:0.24,
       tphlh$S0$Y = 0.24:0.24:0.24,
       tphhl$S0$Y = 0.18:0.18:0.18,
       tpllh$S1$Y = 0.096:0.096:0.096,
       tplhl$S1$Y = 0.16:0.16:0.16,
       tphlh$S1$Y = 0.15:0.15:0.15,
       tphhl$S1$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX3X2 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (Y, I0_out, C, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.25:0.25:0.25,
       tphhl$A$Y = 0.26:0.26:0.26,
       tpllh$B$Y = 0.25:0.25:0.25,
       tphhl$B$Y = 0.27:0.27:0.27,
       tpllh$C$Y = 0.17:0.17:0.17,
       tphhl$C$Y = 0.19:0.19:0.19,
       tpllh$S0$Y = 0.22:0.22:0.22,
       tplhl$S0$Y = 0.29:0.29:0.29,
       tphlh$S0$Y = 0.28:0.28:0.28,
       tphhl$S0$Y = 0.24:0.24:0.24,
       tpllh$S1$Y = 0.13:0.13:0.13,
       tplhl$S1$Y = 0.2:0.2:0.2,
       tphlh$S1$Y = 0.19:0.19:0.19,
       tphhl$S1$Y = 0.16:0.16:0.16;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX3X4 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (Y, I0_out, C, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.36:0.36:0.36,
       tphhl$A$Y = 0.39:0.39:0.39,
       tpllh$B$Y = 0.36:0.36:0.36,
       tphhl$B$Y = 0.4:0.4:0.4,
       tpllh$C$Y = 0.17:0.17:0.17,
       tphhl$C$Y = 0.2:0.2:0.2,
       tpllh$S0$Y = 0.33:0.33:0.33,
       tplhl$S0$Y = 0.41:0.41:0.41,
       tphlh$S0$Y = 0.39:0.39:0.39,
       tphhl$S0$Y = 0.36:0.36:0.36,
       tpllh$S1$Y = 0.14:0.14:0.14,
       tplhl$S1$Y = 0.22:0.22:0.22,
       tphlh$S1$Y = 0.29:0.29:0.29,
       tphhl$S1$Y = 0.26:0.26:0.26;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX3XL (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (Y, I0_out, C, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.18:0.18:0.18,
       tphhl$A$Y = 0.18:0.18:0.18,
       tpllh$B$Y = 0.18:0.18:0.18,
       tphhl$B$Y = 0.19:0.19:0.19,
       tpllh$C$Y = 0.11:0.11:0.11,
       tphhl$C$Y = 0.12:0.12:0.12,
       tpllh$S0$Y = 0.15:0.15:0.15,
       tplhl$S0$Y = 0.21:0.21:0.21,
       tphlh$S0$Y = 0.21:0.21:0.21,
       tphhl$S0$Y = 0.15:0.15:0.15,
       tpllh$S1$Y = 0.081:0.081:0.081,
       tplhl$S1$Y = 0.14:0.14:0.14,
       tphlh$S1$Y = 0.13:0.13:0.13,
       tphhl$S1$Y = 0.087:0.088:0.088;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX4X1 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (Y, I1_out, I0_out, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.21:0.21:0.21,
       tphhl$A$Y = 0.22:0.22:0.22,
       tpllh$B$Y = 0.21:0.21:0.21,
       tphhl$B$Y = 0.23:0.23:0.23,
       tpllh$C$Y = 0.2:0.2:0.2,
       tphhl$C$Y = 0.21:0.21:0.21,
       tpllh$D$Y = 0.2:0.2:0.2,
       tphhl$D$Y = 0.22:0.22:0.22,
       tpllh$S0$Y = 0.17:0.18:0.19,
       tplhl$S0$Y = 0.26:0.26:0.26,
       tphlh$S0$Y = 0.25:0.26:0.26,
       tphhl$S0$Y = 0.19:0.19:0.2,
       tpllh$S1$Y = 0.11:0.11:0.11,
       tplhl$S1$Y = 0.14:0.15:0.15,
       tphlh$S1$Y = 0.16:0.16:0.16,
       tphhl$S1$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX4X2 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (Y, I1_out, I0_out, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.25:0.25:0.25,
       tphhl$A$Y = 0.27:0.27:0.27,
       tpllh$B$Y = 0.25:0.25:0.25,
       tphhl$B$Y = 0.27:0.27:0.27,
       tpllh$C$Y = 0.26:0.26:0.26,
       tphhl$C$Y = 0.28:0.28:0.28,
       tpllh$D$Y = 0.26:0.26:0.26,
       tphhl$D$Y = 0.29:0.29:0.29,
       tpllh$S0$Y = 0.23:0.23:0.23,
       tplhl$S0$Y = 0.31:0.32:0.33,
       tphlh$S0$Y = 0.31:0.31:0.32,
       tphhl$S0$Y = 0.24:0.25:0.25,
       tpllh$S1$Y = 0.15:0.15:0.15,
       tplhl$S1$Y = 0.19:0.19:0.19,
       tphlh$S1$Y = 0.19:0.19:0.19,
       tphhl$S1$Y = 0.16:0.16:0.16;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX4X4 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (Y, I1_out, I0_out, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.36:0.36:0.36,
       tphhl$A$Y = 0.39:0.39:0.39,
       tpllh$B$Y = 0.35:0.35:0.35,
       tphhl$B$Y = 0.39:0.39:0.39,
       tpllh$C$Y = 0.37:0.37:0.37,
       tphhl$C$Y = 0.41:0.41:0.41,
       tpllh$D$Y = 0.36:0.36:0.36,
       tphhl$D$Y = 0.41:0.41:0.41,
       tpllh$S0$Y = 0.33:0.34:0.34,
       tplhl$S0$Y = 0.43:0.44:0.45,
       tphlh$S0$Y = 0.41:0.42:0.43,
       tphhl$S0$Y = 0.37:0.37:0.38,
       tpllh$S1$Y = 0.23:0.23:0.23,
       tplhl$S1$Y = 0.29:0.29:0.29,
       tphlh$S1$Y = 0.28:0.28:0.28,
       tphhl$S1$Y = 0.26:0.26:0.26;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX4XL (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (Y, I1_out, I0_out, S1);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.19:0.19:0.19,
       tphhl$A$Y = 0.19:0.19:0.19,
       tpllh$B$Y = 0.19:0.19:0.19,
       tphhl$B$Y = 0.2:0.2:0.2,
       tpllh$C$Y = 0.18:0.18:0.18,
       tphhl$C$Y = 0.19:0.19:0.19,
       tpllh$D$Y = 0.18:0.18:0.18,
       tphhl$D$Y = 0.19:0.19:0.19,
       tpllh$S0$Y = 0.15:0.16:0.16,
       tplhl$S0$Y = 0.23:0.23:0.24,
       tphlh$S0$Y = 0.23:0.24:0.24,
       tphhl$S0$Y = 0.16:0.16:0.17,
       tpllh$S1$Y = 0.085:0.085:0.085,
       tplhl$S1$Y = 0.12:0.12:0.12,
       tphlh$S1$Y = 0.14:0.14:0.14,
       tphhl$S1$Y = 0.088:0.088:0.088;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);
     (posedge S0 *> (Y +: S1?C:A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: S1?C:A)) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: S0?B:A)) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: S0?B:A)) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X1 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.055:0.055:0.055,
       tphlh$A$Y = 0.059:0.059:0.059,
       tplhl$B$Y = 0.049:0.049:0.049,
       tphlh$B$Y = 0.063:0.063:0.063,
       tpllh$S0$Y = 0.094:0.094:0.094,
       tplhl$S0$Y = 0.032:0.032:0.032,
       tphlh$S0$Y = 0.038:0.038:0.038,
       tphhl$S0$Y = 0.097:0.097:0.097;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X2 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.2:0.2:0.2,
       tphlh$A$Y = 0.2:0.2:0.2,
       tplhl$B$Y = 0.2:0.2:0.2,
       tphlh$B$Y = 0.21:0.21:0.21,
       tpllh$S0$Y = 0.22:0.22:0.22,
       tplhl$S0$Y = 0.18:0.18:0.18,
       tphlh$S0$Y = 0.18:0.18:0.18,
       tphhl$S0$Y = 0.23:0.23:0.23;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X4 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.24:0.24:0.24,
       tphlh$A$Y = 0.25:0.25:0.25,
       tplhl$B$Y = 0.24:0.24:0.24,
       tphlh$B$Y = 0.25:0.25:0.25,
       tpllh$S0$Y = 0.27:0.27:0.27,
       tplhl$S0$Y = 0.22:0.22:0.22,
       tphlh$S0$Y = 0.23:0.23:0.23,
       tphhl$S0$Y = 0.26:0.26:0.26;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X6 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.25:0.25:0.25,
       tphlh$A$Y = 0.27:0.27:0.27,
       tplhl$B$Y = 0.26:0.26:0.26,
       tphlh$B$Y = 0.28:0.28:0.28,
       tpllh$S0$Y = 0.3:0.3:0.3,
       tplhl$S0$Y = 0.23:0.23:0.23,
       tphlh$S0$Y = 0.24:0.24:0.24,
       tphhl$S0$Y = 0.29:0.29:0.29;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2X8 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.27:0.27:0.27,
       tphlh$A$Y = 0.29:0.29:0.29,
       tplhl$B$Y = 0.27:0.27:0.27,
       tphlh$B$Y = 0.3:0.3:0.3,
       tpllh$S0$Y = 0.32:0.32:0.32,
       tplhl$S0$Y = 0.24:0.24:0.24,
       tphlh$S0$Y = 0.26:0.26:0.26,
       tphhl$S0$Y = 0.31:0.31:0.31;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI2XL (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.056:0.056:0.056,
       tphlh$A$Y = 0.063:0.063:0.063,
       tplhl$B$Y = 0.051:0.051:0.051,
       tphlh$B$Y = 0.065:0.065:0.065,
       tpllh$S0$Y = 0.098:0.098:0.098,
       tplhl$S0$Y = 0.031:0.031:0.031,
       tphlh$S0$Y = 0.037:0.037:0.037,
       tphhl$S0$Y = 0.097:0.097:0.097;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (posedge S0 *> (Y +: !A)) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !A)) = (tphlh$S0$Y, tphhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI3X1 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (I1_out, I0_out, C, S1);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.23:0.23:0.23,
       tphlh$A$Y = 0.23:0.23:0.23,
       tplhl$B$Y = 0.23:0.23:0.23,
       tphlh$B$Y = 0.24:0.24:0.24,
       tplhl$C$Y = 0.18:0.18:0.18,
       tphlh$C$Y = 0.17:0.17:0.17,
       tpllh$S0$Y = 0.26:0.26:0.26,
       tplhl$S0$Y = 0.2:0.2:0.2,
       tphlh$S0$Y = 0.2:0.2:0.2,
       tphhl$S0$Y = 0.27:0.27:0.27,
       tpllh$S1$Y = 0.1:0.1:0.1,
       tplhl$S1$Y = 0.17:0.17:0.17,
       tphlh$S1$Y = 0.17:0.17:0.17,
       tphhl$S1$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI3X2 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (I1_out, I0_out, C, S1);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.28:0.28:0.28,
       tphlh$A$Y = 0.28:0.28:0.28,
       tplhl$B$Y = 0.28:0.28:0.28,
       tphlh$B$Y = 0.28:0.28:0.28,
       tplhl$C$Y = 0.22:0.22:0.22,
       tphlh$C$Y = 0.2:0.2:0.2,
       tpllh$S0$Y = 0.29:0.29:0.29,
       tplhl$S0$Y = 0.26:0.26:0.26,
       tphlh$S0$Y = 0.25:0.25:0.25,
       tphhl$S0$Y = 0.31:0.31:0.31,
       tpllh$S1$Y = 0.15:0.15:0.15,
       tplhl$S1$Y = 0.2:0.2:0.2,
       tphlh$S1$Y = 0.19:0.19:0.19,
       tphhl$S1$Y = 0.16:0.16:0.16;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI3X4 (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (I1_out, I0_out, C, S1);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.33:0.33:0.33,
       tphlh$A$Y = 0.33:0.33:0.33,
       tplhl$B$Y = 0.33:0.33:0.33,
       tphlh$B$Y = 0.34:0.34:0.34,
       tplhl$C$Y = 0.26:0.26:0.26,
       tphlh$C$Y = 0.25:0.25:0.25,
       tpllh$S0$Y = 0.35:0.35:0.35,
       tplhl$S0$Y = 0.31:0.31:0.31,
       tphlh$S0$Y = 0.31:0.31:0.31,
       tphhl$S0$Y = 0.36:0.36:0.36,
       tpllh$S1$Y = 0.17:0.17:0.17,
       tplhl$S1$Y = 0.24:0.24:0.24,
       tphlh$S1$Y = 0.23:0.23:0.23,
       tphhl$S1$Y = 0.19:0.19:0.19;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI3XL (A, B, C, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, A, B, S0);
   udp_mux2 (I1_out, I0_out, C, S1);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.21:0.21:0.21,
       tphlh$A$Y = 0.21:0.21:0.21,
       tplhl$B$Y = 0.21:0.21:0.21,
       tphlh$B$Y = 0.22:0.22:0.22,
       tplhl$C$Y = 0.15:0.15:0.15,
       tphlh$C$Y = 0.15:0.15:0.15,
       tpllh$S0$Y = 0.24:0.24:0.24,
       tplhl$S0$Y = 0.18:0.18:0.18,
       tphlh$S0$Y = 0.18:0.18:0.18,
       tphhl$S0$Y = 0.24:0.24:0.24,
       tpllh$S1$Y = 0.081:0.081:0.081,
       tplhl$S1$Y = 0.15:0.15:0.15,
       tphlh$S1$Y = 0.15:0.15:0.15,
       tphhl$S1$Y = 0.084:0.084:0.084;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI4X1 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (I2_out, I1_out, I0_out, S1);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.24:0.24:0.24,
       tphlh$A$Y = 0.24:0.24:0.24,
       tplhl$B$Y = 0.23:0.23:0.23,
       tphlh$B$Y = 0.24:0.24:0.24,
       tplhl$C$Y = 0.24:0.24:0.24,
       tphlh$C$Y = 0.23:0.23:0.23,
       tplhl$D$Y = 0.24:0.24:0.24,
       tphlh$D$Y = 0.24:0.24:0.24,
       tpllh$S0$Y = 0.29:0.29:0.29,
       tplhl$S0$Y = 0.21:0.21:0.21,
       tphlh$S0$Y = 0.21:0.21:0.21,
       tphhl$S0$Y = 0.3:0.3:0.3,
       tpllh$S1$Y = 0.1:0.1:0.1,
       tplhl$S1$Y = 0.16:0.16:0.16,
       tphlh$S1$Y = 0.16:0.16:0.16,
       tphhl$S1$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI4X2 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (I2_out, I1_out, I0_out, S1);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.3:0.3:0.3,
       tphlh$A$Y = 0.29:0.29:0.29,
       tplhl$B$Y = 0.3:0.3:0.3,
       tphlh$B$Y = 0.3:0.3:0.3,
       tplhl$C$Y = 0.3:0.3:0.3,
       tphlh$C$Y = 0.29:0.29:0.29,
       tplhl$D$Y = 0.3:0.3:0.3,
       tphlh$D$Y = 0.3:0.3:0.3,
       tpllh$S0$Y = 0.35:0.35:0.35,
       tplhl$S0$Y = 0.27:0.27:0.28,
       tphlh$S0$Y = 0.27:0.27:0.27,
       tphhl$S0$Y = 0.37:0.37:0.37,
       tpllh$S1$Y = 0.14:0.14:0.14,
       tplhl$S1$Y = 0.22:0.22:0.22,
       tphlh$S1$Y = 0.22:0.22:0.22,
       tphhl$S1$Y = 0.16:0.16:0.16;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI4X4 (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (I2_out, I1_out, I0_out, S1);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.34:0.34:0.34,
       tphlh$A$Y = 0.34:0.34:0.34,
       tplhl$B$Y = 0.34:0.34:0.34,
       tphlh$B$Y = 0.34:0.34:0.34,
       tplhl$C$Y = 0.34:0.34:0.34,
       tphlh$C$Y = 0.34:0.34:0.34,
       tplhl$D$Y = 0.34:0.34:0.34,
       tphlh$D$Y = 0.34:0.34:0.34,
       tpllh$S0$Y = 0.38:0.39:0.39,
       tplhl$S0$Y = 0.31:0.32:0.32,
       tphlh$S0$Y = 0.31:0.31:0.31,
       tphhl$S0$Y = 0.4:0.4:0.4,
       tpllh$S1$Y = 0.18:0.18:0.18,
       tplhl$S1$Y = 0.27:0.27:0.27,
       tphlh$S1$Y = 0.26:0.26:0.26,
       tphhl$S1$Y = 0.19:0.19:0.19;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MXI4XL (A, B, C, D, S0, S1, Y);
input  A ;
input  B ;
input  C ;
input  D ;
input  S0 ;
input  S1 ;
output Y ;

   udp_mux2 (I0_out, C, D, S0);
   udp_mux2 (I1_out, A, B, S0);
   udp_mux2 (I2_out, I1_out, I0_out, S1);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.22:0.22:0.22,
       tphlh$A$Y = 0.22:0.22:0.22,
       tplhl$B$Y = 0.21:0.21:0.21,
       tphlh$B$Y = 0.23:0.23:0.23,
       tplhl$C$Y = 0.21:0.21:0.21,
       tphlh$C$Y = 0.22:0.22:0.22,
       tplhl$D$Y = 0.21:0.21:0.21,
       tphlh$D$Y = 0.22:0.22:0.22,
       tpllh$S0$Y = 0.27:0.27:0.27,
       tplhl$S0$Y = 0.19:0.19:0.19,
       tphlh$S0$Y = 0.19:0.19:0.19,
       tphhl$S0$Y = 0.27:0.28:0.28,
       tpllh$S1$Y = 0.085:0.085:0.085,
       tplhl$S1$Y = 0.13:0.13:0.13,
       tphlh$S1$Y = 0.14:0.14:0.14,
       tphhl$S1$Y = 0.089:0.089:0.089;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);
     (posedge S0 *> (Y +: !(S1?C:A))) = (tpllh$S0$Y, tplhl$S0$Y);
     (negedge S0 *> (Y +: !(S1?C:A))) = (tphlh$S0$Y, tphhl$S0$Y);
     (posedge S1 *> (Y +: !(S0?B:A))) = (tpllh$S1$Y, tplhl$S1$Y);
     (negedge S1 *> (Y +: !(S0?B:A))) = (tphlh$S1$Y, tphhl$S1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2BX1 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   and (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.076:0.076:0.076,
       tphhl$AN$Y = 0.091:0.091:0.091,
       tplhl$B$Y = 0.036:0.036:0.036,
       tphlh$B$Y = 0.025:0.025:0.025;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2BX2 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   and (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.1:0.1:0.1,
       tphhl$AN$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.034:0.034:0.034,
       tphlh$B$Y = 0.024:0.024:0.024;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2BX4 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   and (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.11:0.11:0.11,
       tphhl$AN$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.034:0.034:0.034,
       tphlh$B$Y = 0.024:0.024:0.024;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2BXL (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   and (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.064:0.064:0.064,
       tphhl$AN$Y = 0.077:0.077:0.077,
       tplhl$B$Y = 0.036:0.036:0.036,
       tphlh$B$Y = 0.026:0.026:0.026;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.039:0.039:0.039,
       tphlh$A$Y = 0.028:0.028:0.028,
       tplhl$B$Y = 0.036:0.036:0.036,
       tphlh$B$Y = 0.025:0.025:0.025;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.039:0.039:0.039,
       tphlh$A$Y = 0.028:0.028:0.028,
       tplhl$B$Y = 0.034:0.034:0.034,
       tphlh$B$Y = 0.024:0.024:0.024;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.039:0.039:0.039,
       tphlh$A$Y = 0.029:0.029:0.029,
       tplhl$B$Y = 0.035:0.035:0.035,
       tphlh$B$Y = 0.025:0.025:0.025;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.04:0.04:0.04,
       tphlh$A$Y = 0.029:0.029:0.029,
       tplhl$B$Y = 0.035:0.035:0.035,
       tphlh$B$Y = 0.025:0.025:0.025;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.039:0.039:0.039,
       tphlh$A$Y = 0.029:0.029:0.029,
       tplhl$B$Y = 0.035:0.035:0.035,
       tphlh$B$Y = 0.025:0.025:0.025;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.039:0.039:0.039,
       tphlh$A$Y = 0.029:0.029:0.029,
       tplhl$B$Y = 0.037:0.037:0.037,
       tphlh$B$Y = 0.026:0.026:0.026;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3BX1 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   and (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.083:0.083:0.083,
       tphhl$AN$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.068:0.068:0.068,
       tphlh$B$Y = 0.033:0.033:0.033,
       tplhl$C$Y = 0.061:0.061:0.061,
       tphlh$C$Y = 0.03:0.03:0.03;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3BX2 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   and (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.11:0.11:0.11,
       tphhl$AN$Y = 0.15:0.15:0.15,
       tplhl$B$Y = 0.064:0.064:0.064,
       tphlh$B$Y = 0.032:0.032:0.032,
       tplhl$C$Y = 0.055:0.055:0.055,
       tphlh$C$Y = 0.027:0.027:0.027;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3BX4 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   and (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.12:0.12:0.12,
       tphhl$AN$Y = 0.15:0.15:0.15,
       tplhl$B$Y = 0.064:0.064:0.064,
       tphlh$B$Y = 0.032:0.032:0.032,
       tplhl$C$Y = 0.055:0.055:0.055,
       tphlh$C$Y = 0.028:0.028:0.028;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3BXL (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   and (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.072:0.072:0.072,
       tphhl$AN$Y = 0.11:0.11:0.11,
       tplhl$B$Y = 0.069:0.069:0.069,
       tphlh$B$Y = 0.034:0.034:0.034,
       tplhl$C$Y = 0.062:0.062:0.062,
       tphlh$C$Y = 0.031:0.031:0.031;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.071:0.071:0.071,
       tphlh$A$Y = 0.035:0.035:0.035,
       tplhl$B$Y = 0.068:0.068:0.068,
       tphlh$B$Y = 0.033:0.033:0.033,
       tplhl$C$Y = 0.06:0.06:0.06,
       tphlh$C$Y = 0.029:0.029:0.029;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X2 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.07:0.07:0.07,
       tphlh$A$Y = 0.035:0.035:0.035,
       tplhl$B$Y = 0.066:0.066:0.066,
       tphlh$B$Y = 0.032:0.032:0.032,
       tplhl$C$Y = 0.055:0.055:0.055,
       tphlh$C$Y = 0.028:0.028:0.028;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X4 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.071:0.071:0.071,
       tphlh$A$Y = 0.035:0.035:0.035,
       tplhl$B$Y = 0.066:0.066:0.066,
       tphlh$B$Y = 0.032:0.032:0.032,
       tplhl$C$Y = 0.056:0.056:0.056,
       tphlh$C$Y = 0.028:0.028:0.028;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X6 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.072:0.072:0.072,
       tphlh$A$Y = 0.036:0.036:0.036,
       tplhl$B$Y = 0.066:0.066:0.066,
       tphlh$B$Y = 0.033:0.033:0.033,
       tplhl$C$Y = 0.058:0.058:0.058,
       tphlh$C$Y = 0.029:0.029:0.029;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X8 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.071:0.071:0.071,
       tphlh$A$Y = 0.035:0.035:0.035,
       tplhl$B$Y = 0.066:0.066:0.066,
       tphlh$B$Y = 0.032:0.032:0.032,
       tplhl$C$Y = 0.057:0.057:0.057,
       tphlh$C$Y = 0.029:0.029:0.029;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.069:0.069:0.069,
       tphlh$A$Y = 0.035:0.035:0.035,
       tplhl$B$Y = 0.066:0.066:0.066,
       tphlh$B$Y = 0.033:0.033:0.033,
       tplhl$C$Y = 0.058:0.058:0.058,
       tphlh$C$Y = 0.03:0.03:0.03;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BBX1 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   and (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.088:0.088:0.088,
       tphhl$AN$Y = 0.16:0.16:0.16,
       tpllh$BN$Y = 0.09:0.09:0.09,
       tphhl$BN$Y = 0.16:0.16:0.16,
       tplhl$C$Y = 0.099:0.099:0.099,
       tphlh$C$Y = 0.036:0.036:0.036,
       tplhl$D$Y = 0.082:0.082:0.082,
       tphlh$D$Y = 0.031:0.031:0.031;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BBX2 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   and (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.11:0.11:0.11,
       tphhl$AN$Y = 0.19:0.19:0.19,
       tpllh$BN$Y = 0.12:0.12:0.12,
       tphhl$BN$Y = 0.19:0.19:0.19,
       tplhl$C$Y = 0.096:0.096:0.096,
       tphlh$C$Y = 0.035:0.035:0.035,
       tplhl$D$Y = 0.075:0.075:0.075,
       tphlh$D$Y = 0.03:0.03:0.03;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BBX4 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   and (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.12:0.12:0.12,
       tphhl$AN$Y = 0.19:0.19:0.19,
       tpllh$BN$Y = 0.12:0.12:0.12,
       tphhl$BN$Y = 0.18:0.18:0.18,
       tplhl$C$Y = 0.094:0.094:0.094,
       tphlh$C$Y = 0.035:0.035:0.035,
       tplhl$D$Y = 0.075:0.075:0.075,
       tphlh$D$Y = 0.03:0.03:0.03;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BBXL (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   and (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.078:0.078:0.078,
       tphhl$AN$Y = 0.15:0.15:0.15,
       tpllh$BN$Y = 0.08:0.08:0.08,
       tphhl$BN$Y = 0.15:0.15:0.15,
       tplhl$C$Y = 0.1:0.1:0.1,
       tphlh$C$Y = 0.038:0.038:0.038,
       tplhl$D$Y = 0.086:0.086:0.086,
       tphlh$D$Y = 0.033:0.033:0.033;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BX1 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   and (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.088:0.088:0.088,
       tphhl$AN$Y = 0.16:0.16:0.16,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.039:0.039:0.039,
       tplhl$C$Y = 0.098:0.098:0.098,
       tphlh$C$Y = 0.036:0.036:0.036,
       tplhl$D$Y = 0.085:0.085:0.085,
       tphlh$D$Y = 0.032:0.032:0.032;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BX2 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   and (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.11:0.11:0.11,
       tphhl$AN$Y = 0.18:0.18:0.18,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.039:0.039:0.039,
       tplhl$C$Y = 0.099:0.099:0.099,
       tphlh$C$Y = 0.036:0.036:0.036,
       tplhl$D$Y = 0.078:0.078:0.078,
       tphlh$D$Y = 0.031:0.031:0.031;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BX4 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   and (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.12:0.12:0.12,
       tphhl$AN$Y = 0.19:0.19:0.19,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.039:0.039:0.039,
       tplhl$C$Y = 0.1:0.1:0.1,
       tphlh$C$Y = 0.037:0.037:0.037,
       tplhl$D$Y = 0.08:0.08:0.08,
       tphlh$D$Y = 0.031:0.031:0.031;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4BXL (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   and (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.076:0.076:0.076,
       tphhl$AN$Y = 0.15:0.15:0.15,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.039:0.039:0.039,
       tplhl$C$Y = 0.096:0.096:0.096,
       tphlh$C$Y = 0.036:0.036:0.036,
       tplhl$D$Y = 0.085:0.085:0.085,
       tphlh$D$Y = 0.033:0.033:0.033;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.039:0.039:0.039,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.039:0.039:0.039,
       tplhl$C$Y = 0.097:0.097:0.097,
       tphlh$C$Y = 0.036:0.036:0.036,
       tplhl$D$Y = 0.082:0.082:0.082,
       tphlh$D$Y = 0.032:0.032:0.032;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X2 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.041:0.041:0.041,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.038:0.038:0.038,
       tplhl$C$Y = 0.097:0.097:0.097,
       tphlh$C$Y = 0.036:0.036:0.036,
       tplhl$D$Y = 0.079:0.079:0.079,
       tphlh$D$Y = 0.031:0.031:0.031;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X4 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.04:0.04:0.04,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.039:0.039:0.039,
       tplhl$C$Y = 0.1:0.1:0.1,
       tphlh$C$Y = 0.037:0.037:0.037,
       tplhl$D$Y = 0.08:0.08:0.08,
       tphlh$D$Y = 0.032:0.032:0.032;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X6 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.038:0.038:0.038,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.038:0.038:0.038,
       tplhl$C$Y = 0.095:0.095:0.095,
       tphlh$C$Y = 0.035:0.035:0.035,
       tplhl$D$Y = 0.078:0.078:0.078,
       tphlh$D$Y = 0.03:0.03:0.03;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X8 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.038:0.038:0.038,
       tplhl$B$Y = 0.1:0.1:0.1,
       tphlh$B$Y = 0.038:0.038:0.038,
       tplhl$C$Y = 0.095:0.095:0.095,
       tphlh$C$Y = 0.035:0.035:0.035,
       tplhl$D$Y = 0.078:0.078:0.078,
       tphlh$D$Y = 0.03:0.03:0.03;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4XL (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.039:0.039:0.039,
       tplhl$B$Y = 0.1:0.1:0.1,
       tphlh$B$Y = 0.038:0.038:0.038,
       tplhl$C$Y = 0.095:0.095:0.095,
       tphlh$C$Y = 0.036:0.036:0.036,
       tplhl$D$Y = 0.082:0.082:0.082,
       tphlh$D$Y = 0.032:0.032:0.032;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2BX1 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   or  (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.09:0.09:0.09,
       tphhl$AN$Y = 0.078:0.078:0.078,
       tplhl$B$Y = 0.021:0.021:0.021,
       tphlh$B$Y = 0.04:0.04:0.04;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2BX2 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   or  (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.12:0.12:0.12,
       tphhl$AN$Y = 0.11:0.11:0.11,
       tplhl$B$Y = 0.02:0.02:0.02,
       tphlh$B$Y = 0.037:0.037:0.037;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2BX4 (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   or  (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.17:0.17:0.17,
       tphhl$AN$Y = 0.17:0.17:0.17,
       tplhl$B$Y = 0.02:0.02:0.02,
       tphlh$B$Y = 0.037:0.037:0.037;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2BXL (AN, B, Y);
input  AN ;
input  B ;
output Y ;

   not (I0_out, AN);
   or  (I1_out, I0_out, B);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.083:0.083:0.083,
       tphhl$AN$Y = 0.066:0.066:0.066,
       tplhl$B$Y = 0.022:0.022:0.022,
       tphlh$B$Y = 0.044:0.044:0.044;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.024:0.024:0.024,
       tphlh$A$Y = 0.047:0.047:0.047,
       tplhl$B$Y = 0.021:0.021:0.021,
       tphlh$B$Y = 0.04:0.04:0.04;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.025:0.025:0.025,
       tphlh$A$Y = 0.047:0.047:0.047,
       tplhl$B$Y = 0.02:0.02:0.02,
       tphlh$B$Y = 0.039:0.039:0.039;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.025:0.025:0.025,
       tphlh$A$Y = 0.047:0.047:0.047,
       tplhl$B$Y = 0.02:0.02:0.02,
       tphlh$B$Y = 0.039:0.039:0.039;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.025:0.025:0.025,
       tphlh$A$Y = 0.047:0.047:0.047,
       tplhl$B$Y = 0.021:0.021:0.021,
       tphlh$B$Y = 0.039:0.039:0.039;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.024:0.024:0.024,
       tphlh$A$Y = 0.046:0.046:0.046,
       tplhl$B$Y = 0.02:0.02:0.02,
       tphlh$B$Y = 0.039:0.039:0.039;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.024:0.024:0.024,
       tphlh$A$Y = 0.047:0.047:0.047,
       tplhl$B$Y = 0.021:0.021:0.021,
       tphlh$B$Y = 0.041:0.041:0.041;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3BX1 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   or  (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.13:0.13:0.13,
       tphhl$AN$Y = 0.085:0.085:0.085,
       tplhl$B$Y = 0.027:0.027:0.027,
       tphlh$B$Y = 0.078:0.078:0.078,
       tplhl$C$Y = 0.024:0.024:0.024,
       tphlh$C$Y = 0.064:0.064:0.064;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3BX2 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   or  (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.16:0.16:0.16,
       tphhl$AN$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.027:0.027:0.027,
       tphlh$B$Y = 0.077:0.077:0.077,
       tplhl$C$Y = 0.022:0.022:0.022,
       tphlh$C$Y = 0.058:0.058:0.058;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3BX4 (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   or  (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.16:0.16:0.16,
       tphhl$AN$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.027:0.027:0.027,
       tphlh$B$Y = 0.076:0.076:0.076,
       tplhl$C$Y = 0.022:0.022:0.022,
       tphlh$C$Y = 0.058:0.058:0.058;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3BXL (AN, B, C, Y);
input  AN ;
input  B ;
input  C ;
output Y ;

   not (I0_out, AN);
   or  (I2_out, I0_out, B, C);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.12:0.12:0.12,
       tphhl$AN$Y = 0.071:0.071:0.071,
       tplhl$B$Y = 0.029:0.029:0.029,
       tphlh$B$Y = 0.084:0.084:0.084,
       tplhl$C$Y = 0.025:0.025:0.025,
       tphlh$C$Y = 0.071:0.071:0.071;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.028:0.028:0.028,
       tphlh$A$Y = 0.083:0.083:0.083,
       tplhl$B$Y = 0.027:0.027:0.027,
       tphlh$B$Y = 0.078:0.078:0.078,
       tplhl$C$Y = 0.023:0.023:0.023,
       tphlh$C$Y = 0.061:0.061:0.061;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X2 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.028:0.028:0.028,
       tphlh$A$Y = 0.085:0.085:0.085,
       tplhl$B$Y = 0.027:0.027:0.027,
       tphlh$B$Y = 0.078:0.078:0.078,
       tplhl$C$Y = 0.022:0.022:0.022,
       tphlh$C$Y = 0.059:0.059:0.059;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X4 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.028:0.028:0.028,
       tphlh$A$Y = 0.085:0.085:0.085,
       tplhl$B$Y = 0.027:0.027:0.027,
       tphlh$B$Y = 0.078:0.078:0.078,
       tplhl$C$Y = 0.023:0.023:0.023,
       tphlh$C$Y = 0.059:0.059:0.059;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X6 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.029:0.029:0.029,
       tphlh$A$Y = 0.087:0.087:0.087,
       tplhl$B$Y = 0.027:0.027:0.027,
       tphlh$B$Y = 0.078:0.078:0.078,
       tplhl$C$Y = 0.023:0.023:0.023,
       tphlh$C$Y = 0.061:0.061:0.061;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X8 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.029:0.029:0.029,
       tphlh$A$Y = 0.086:0.086:0.086,
       tplhl$B$Y = 0.027:0.027:0.027,
       tphlh$B$Y = 0.078:0.078:0.078,
       tplhl$C$Y = 0.023:0.023:0.023,
       tphlh$C$Y = 0.06:0.06:0.06;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.029:0.029:0.029,
       tphlh$A$Y = 0.088:0.088:0.088,
       tplhl$B$Y = 0.028:0.028:0.028,
       tphlh$B$Y = 0.084:0.084:0.084,
       tplhl$C$Y = 0.025:0.025:0.025,
       tphlh$C$Y = 0.07:0.07:0.07;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BBX1 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   or  (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.18:0.18:0.18,
       tphhl$AN$Y = 0.087:0.087:0.087,
       tpllh$BN$Y = 0.17:0.17:0.17,
       tphhl$BN$Y = 0.087:0.087:0.087,
       tplhl$C$Y = 0.029:0.029:0.029,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.025:0.025:0.025,
       tphlh$D$Y = 0.083:0.083:0.083;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BBX2 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   or  (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.21:0.21:0.21,
       tphhl$AN$Y = 0.11:0.11:0.11,
       tpllh$BN$Y = 0.19:0.19:0.19,
       tphhl$BN$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.028:0.028:0.028,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.023:0.023:0.023,
       tphlh$D$Y = 0.073:0.073:0.073;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BBX4 (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   or  (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.21:0.21:0.21,
       tphhl$AN$Y = 0.12:0.12:0.12,
       tpllh$BN$Y = 0.2:0.2:0.2,
       tphhl$BN$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.028:0.028:0.028,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.023:0.023:0.023,
       tphlh$D$Y = 0.073:0.073:0.073;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BBXL (AN, BN, C, D, Y);
input  AN ;
input  BN ;
input  C ;
input  D ;
output Y ;

   not (I0_out, BN);
   not (I1_out, AN);
   or  (I4_out, I0_out, I1_out, C, D);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.18:0.18:0.18,
       tphhl$AN$Y = 0.076:0.076:0.076,
       tpllh$BN$Y = 0.17:0.17:0.17,
       tphhl$BN$Y = 0.079:0.079:0.079,
       tplhl$C$Y = 0.031:0.031:0.031,
       tphlh$C$Y = 0.12:0.12:0.12,
       tplhl$D$Y = 0.026:0.026:0.026,
       tphlh$D$Y = 0.093:0.093:0.093;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (BN *> Y) = (tpllh$BN$Y, tphhl$BN$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BX1 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   or  (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.17:0.17:0.17,
       tphhl$AN$Y = 0.086:0.086:0.086,
       tplhl$B$Y = 0.03:0.03:0.03,
       tphlh$B$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.029:0.029:0.029,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.025:0.025:0.025,
       tphlh$D$Y = 0.083:0.083:0.083;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BX2 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   or  (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.2:0.2:0.2,
       tphhl$AN$Y = 0.11:0.11:0.11,
       tplhl$B$Y = 0.031:0.031:0.031,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$C$Y = 0.029:0.029:0.029,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.024:0.024:0.024,
       tphlh$D$Y = 0.076:0.076:0.076;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BX4 (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   or  (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.2:0.2:0.2,
       tphhl$AN$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.03:0.03:0.03,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$C$Y = 0.029:0.029:0.029,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.024:0.024:0.024,
       tphlh$D$Y = 0.077:0.077:0.077;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4BXL (AN, B, C, D, Y);
input  AN ;
input  B ;
input  C ;
input  D ;
output Y ;

   not (I0_out, AN);
   or  (I3_out, I0_out, B, C, D);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$AN$Y = 0.17:0.17:0.17,
       tphhl$AN$Y = 0.074:0.074:0.074,
       tplhl$B$Y = 0.032:0.032:0.032,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$C$Y = 0.03:0.03:0.03,
       tphlh$C$Y = 0.12:0.12:0.12,
       tplhl$D$Y = 0.027:0.027:0.027,
       tphlh$D$Y = 0.095:0.095:0.095;

     // path delays
     (AN *> Y) = (tpllh$AN$Y, tphhl$AN$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.029:0.029:0.029,
       tphlh$A$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.03:0.03:0.03,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$C$Y = 0.029:0.029:0.029,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.024:0.024:0.024,
       tphlh$D$Y = 0.081:0.081:0.081;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X2 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.03:0.03:0.03,
       tphlh$A$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.03:0.03:0.03,
       tphlh$B$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.029:0.029:0.029,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.024:0.024:0.024,
       tphlh$D$Y = 0.078:0.078:0.078;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X4 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.029:0.029:0.029,
       tphlh$A$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.03:0.03:0.03,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$C$Y = 0.029:0.029:0.029,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.024:0.024:0.024,
       tphlh$D$Y = 0.077:0.077:0.077;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X6 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.029:0.029:0.029,
       tphlh$A$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.03:0.03:0.03,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$C$Y = 0.029:0.029:0.029,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.024:0.024:0.024,
       tphlh$D$Y = 0.076:0.076:0.076;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X8 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.028:0.028:0.028,
       tphlh$A$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.029:0.029:0.029,
       tphlh$B$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.028:0.028:0.028,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.023:0.023:0.023,
       tphlh$D$Y = 0.073:0.073:0.073;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4XL (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.03:0.03:0.03,
       tphlh$A$Y = 0.14:0.14:0.14,
       tplhl$B$Y = 0.031:0.031:0.031,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$C$Y = 0.03:0.03:0.03,
       tphlh$C$Y = 0.12:0.12:0.12,
       tplhl$D$Y = 0.026:0.026:0.026,
       tphlh$D$Y = 0.09:0.09:0.09;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.12:0.12:0.12,
       tphhl$A0$Y = 0.13:0.13:0.13,
       tpllh$A1$Y = 0.11:0.11:0.11,
       tphhl$A1$Y = 0.13:0.13:0.13,
       tpllh$B0$Y = 0.084:0.099:0.12,
       tphhl$B0$Y = 0.071:0.074:0.076;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA21X2 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.16:0.16:0.16,
       tphhl$A0$Y = 0.18:0.18:0.18,
       tpllh$A1$Y = 0.15:0.15:0.15,
       tphhl$A1$Y = 0.18:0.18:0.18,
       tpllh$B0$Y = 0.11:0.13:0.16,
       tphhl$B0$Y = 0.096:0.099:0.1;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA21X4 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.17:0.17:0.17,
       tphhl$A0$Y = 0.19:0.19:0.19,
       tpllh$A1$Y = 0.16:0.16:0.16,
       tphhl$A1$Y = 0.19:0.19:0.19,
       tpllh$B0$Y = 0.12:0.14:0.17,
       tphhl$B0$Y = 0.1:0.1:0.11;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA21XL (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (Y, I0_out, B0);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.1:0.1:0.1,
       tphhl$A0$Y = 0.11:0.11:0.11,
       tpllh$A1$Y = 0.093:0.093:0.093,
       tphhl$A1$Y = 0.11:0.11:0.11,
       tpllh$B0$Y = 0.071:0.085:0.099,
       tphhl$B0$Y = 0.06:0.062:0.064;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.11:0.13:0.14,
       tphhl$A0$Y = 0.14:0.15:0.15,
       tpllh$A1$Y = 0.1:0.12:0.13,
       tphhl$A1$Y = 0.14:0.14:0.15,
       tpllh$B0$Y = 0.096:0.11:0.13,
       tphhl$B0$Y = 0.13:0.13:0.13,
       tpllh$B1$Y = 0.086:0.1:0.12,
       tphhl$B1$Y = 0.12:0.12:0.13;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA22X2 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.14:0.16:0.18,
       tphhl$A0$Y = 0.19:0.2:0.2,
       tpllh$A1$Y = 0.13:0.15:0.17,
       tphhl$A1$Y = 0.19:0.19:0.19,
       tpllh$B0$Y = 0.13:0.15:0.17,
       tphhl$B0$Y = 0.17:0.18:0.18,
       tpllh$B1$Y = 0.12:0.14:0.16,
       tphhl$B1$Y = 0.17:0.17:0.17;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA22X4 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.15:0.17:0.19,
       tphhl$A0$Y = 0.2:0.2:0.21,
       tpllh$A1$Y = 0.14:0.16:0.18,
       tphhl$A1$Y = 0.19:0.2:0.2,
       tpllh$B0$Y = 0.13:0.16:0.18,
       tphhl$B0$Y = 0.18:0.19:0.19,
       tpllh$B1$Y = 0.12:0.15:0.17,
       tphhl$B1$Y = 0.17:0.18:0.18;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OA22XL (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (Y, I0_out, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A0$Y = 0.097:0.11:0.12,
       tphhl$A0$Y = 0.12:0.13:0.13,
       tpllh$A1$Y = 0.089:0.1:0.11,
       tphhl$A1$Y = 0.12:0.12:0.12,
       tpllh$B0$Y = 0.085:0.1:0.12,
       tphhl$B0$Y = 0.11:0.11:0.11,
       tpllh$B1$Y = 0.075:0.089:0.1,
       tphhl$B1$Y = 0.098:0.1:0.11;

     // path delays
     (A0 *> Y) = (tpllh$A0$Y, tphhl$A0$Y);
     (A1 *> Y) = (tpllh$A1$Y, tphhl$A1$Y);
     (B0 *> Y) = (tpllh$B0$Y, tphhl$B0$Y);
     (B1 *> Y) = (tpllh$B1$Y, tphhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI211X1 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.089:0.089:0.089,
       tphlh$A0$Y = 0.074:0.074:0.074,
       tplhl$A1$Y = 0.076:0.076:0.076,
       tphlh$A1$Y = 0.068:0.068:0.068,
       tplhl$B0$Y = 0.056:0.07:0.084,
       tphlh$B0$Y = 0.032:0.033:0.034,
       tplhl$C0$Y = 0.05:0.063:0.075,
       tphlh$C0$Y = 0.029:0.03:0.031;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI211X2 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.089:0.089:0.089,
       tphlh$A0$Y = 0.073:0.073:0.073,
       tplhl$A1$Y = 0.074:0.074:0.074,
       tphlh$A1$Y = 0.067:0.067:0.067,
       tplhl$B0$Y = 0.057:0.071:0.085,
       tphlh$B0$Y = 0.033:0.034:0.035,
       tplhl$C0$Y = 0.047:0.059:0.071,
       tphlh$C0$Y = 0.028:0.029:0.03;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI211X4 (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.09:0.09:0.09,
       tphlh$A0$Y = 0.074:0.074:0.074,
       tplhl$A1$Y = 0.075:0.075:0.075,
       tphlh$A1$Y = 0.067:0.067:0.067,
       tplhl$B0$Y = 0.056:0.071:0.085,
       tphlh$B0$Y = 0.033:0.034:0.035,
       tplhl$C0$Y = 0.047:0.06:0.073,
       tphlh$C0$Y = 0.028:0.029:0.03;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI211XL (A0, A1, B0, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I2_out, I0_out, B0, C0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.09:0.09:0.09,
       tphlh$A0$Y = 0.078:0.078:0.078,
       tplhl$A1$Y = 0.077:0.077:0.077,
       tphlh$A1$Y = 0.072:0.072:0.072,
       tplhl$B0$Y = 0.056:0.07:0.083,
       tphlh$B0$Y = 0.033:0.034:0.035,
       tplhl$C0$Y = 0.05:0.063:0.076,
       tphlh$C0$Y = 0.03:0.031:0.032;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.052:0.052:0.052,
       tphlh$A0$Y = 0.062:0.062:0.062,
       tplhl$A1$Y = 0.043:0.043:0.043,
       tphlh$A1$Y = 0.056:0.056:0.056,
       tplhl$B0$Y = 0.028:0.037:0.046,
       tphlh$B0$Y = 0.025:0.026:0.027;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X2 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.052:0.052:0.052,
       tphlh$A0$Y = 0.062:0.062:0.062,
       tplhl$A1$Y = 0.043:0.043:0.043,
       tphlh$A1$Y = 0.054:0.054:0.054,
       tplhl$B0$Y = 0.027:0.035:0.044,
       tphlh$B0$Y = 0.024:0.025:0.026;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X4 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.052:0.052:0.052,
       tphlh$A0$Y = 0.062:0.062:0.062,
       tplhl$A1$Y = 0.042:0.042:0.042,
       tphlh$A1$Y = 0.054:0.054:0.054,
       tplhl$B0$Y = 0.027:0.036:0.045,
       tphlh$B0$Y = 0.024:0.025:0.026;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21XL (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.054:0.054:0.054,
       tphlh$A0$Y = 0.066:0.066:0.066,
       tplhl$A1$Y = 0.045:0.045:0.045,
       tphlh$A1$Y = 0.059:0.059:0.059,
       tplhl$B0$Y = 0.028:0.037:0.046,
       tphlh$B0$Y = 0.026:0.027:0.028;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI221X1 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.086:0.1:0.12,
       tphlh$A0$Y = 0.082:0.084:0.087,
       tplhl$A1$Y = 0.075:0.089:0.1,
       tphlh$A1$Y = 0.076:0.079:0.082,
       tplhl$B0$Y = 0.076:0.092:0.11,
       tphlh$B0$Y = 0.073:0.075:0.077,
       tplhl$B1$Y = 0.065:0.08:0.095,
       tphlh$B1$Y = 0.066:0.069:0.071,
       tplhl$C0$Y = 0.042:0.068:0.094,
       tphlh$C0$Y = 0.03:0.032:0.034;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI221X2 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.083:0.097:0.11,
       tphlh$A0$Y = 0.078:0.081:0.083,
       tplhl$A1$Y = 0.071:0.084:0.097,
       tphlh$A1$Y = 0.071:0.074:0.077,
       tplhl$B0$Y = 0.072:0.088:0.1,
       tphlh$B0$Y = 0.068:0.071:0.073,
       tplhl$B1$Y = 0.06:0.074:0.088,
       tphlh$B1$Y = 0.062:0.064:0.066,
       tplhl$C0$Y = 0.038:0.063:0.087,
       tphlh$C0$Y = 0.028:0.029:0.031;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI221X4 (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.083:0.097:0.11,
       tphlh$A0$Y = 0.079:0.081:0.084,
       tplhl$A1$Y = 0.071:0.084:0.097,
       tphlh$A1$Y = 0.072:0.075:0.077,
       tplhl$B0$Y = 0.072:0.088:0.1,
       tphlh$B0$Y = 0.069:0.071:0.073,
       tplhl$B1$Y = 0.06:0.074:0.089,
       tphlh$B1$Y = 0.062:0.064:0.066,
       tplhl$C0$Y = 0.038:0.063:0.088,
       tphlh$C0$Y = 0.028:0.029:0.031;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI221XL (A0, A1, B0, B1, C0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I3_out, I0_out, I1_out, C0);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.088:0.1:0.12,
       tphlh$A0$Y = 0.087:0.089:0.092,
       tplhl$A1$Y = 0.078:0.091:0.1,
       tphlh$A1$Y = 0.082:0.085:0.087,
       tplhl$B0$Y = 0.077:0.094:0.11,
       tphlh$B0$Y = 0.077:0.079:0.082,
       tplhl$B1$Y = 0.067:0.082:0.097,
       tphlh$B1$Y = 0.071:0.073:0.076,
       tplhl$C0$Y = 0.042:0.068:0.094,
       tphlh$C0$Y = 0.031:0.033:0.035;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI222X1 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, C0, C1);
   or  (I3_out, B0, B1);
   and (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.082:0.11:0.14,
       tphlh$A0$Y = 0.088:0.094:0.1,
       tplhl$A1$Y = 0.073:0.1:0.13,
       tphlh$A1$Y = 0.083:0.089:0.095,
       tplhl$B0$Y = 0.072:0.1:0.13,
       tphlh$B0$Y = 0.08:0.085:0.09,
       tplhl$B1$Y = 0.062:0.091:0.12,
       tphlh$B1$Y = 0.073:0.078:0.083,
       tplhl$C0$Y = 0.053:0.082:0.11,
       tphlh$C0$Y = 0.062:0.066:0.07,
       tplhl$C1$Y = 0.045:0.073:0.1,
       tphlh$C1$Y = 0.057:0.061:0.065;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI222X2 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, C0, C1);
   or  (I3_out, B0, B1);
   and (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.079:0.11:0.14,
       tphlh$A0$Y = 0.086:0.092:0.098,
       tplhl$A1$Y = 0.069:0.096:0.12,
       tphlh$A1$Y = 0.079:0.085:0.091,
       tplhl$B0$Y = 0.069:0.1:0.13,
       tphlh$B0$Y = 0.077:0.082:0.086,
       tplhl$B1$Y = 0.059:0.087:0.11,
       tphlh$B1$Y = 0.069:0.074:0.078,
       tplhl$C0$Y = 0.051:0.081:0.11,
       tphlh$C0$Y = 0.06:0.064:0.068,
       tplhl$C1$Y = 0.042:0.068:0.095,
       tphlh$C1$Y = 0.052:0.056:0.06;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI222X4 (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   or  (I0_out, C0, C1);
   or  (I1_out, A0, A1);
   or  (I3_out, B0, B1);
   and (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.079:0.11:0.14,
       tphlh$A0$Y = 0.085:0.091:0.098,
       tplhl$A1$Y = 0.069:0.097:0.12,
       tphlh$A1$Y = 0.079:0.085:0.091,
       tplhl$B0$Y = 0.069:0.1:0.13,
       tphlh$B0$Y = 0.077:0.082:0.086,
       tplhl$B1$Y = 0.059:0.086:0.11,
       tphlh$B1$Y = 0.069:0.073:0.078,
       tplhl$C0$Y = 0.052:0.081:0.11,
       tphlh$C0$Y = 0.06:0.064:0.068,
       tplhl$C1$Y = 0.042:0.069:0.095,
       tphlh$C1$Y = 0.053:0.057:0.061;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI222XL (A0, A1, B0, B1, C0, C1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  C0 ;
input  C1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, C0, C1);
   or  (I3_out, B0, B1);
   and (I4_out, I0_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.086:0.12:0.15,
       tphlh$A0$Y = 0.097:0.1:0.11,
       tplhl$A1$Y = 0.078:0.11:0.14,
       tphlh$A1$Y = 0.092:0.098:0.11,
       tplhl$B0$Y = 0.077:0.11:0.14,
       tphlh$B0$Y = 0.088:0.094:0.099,
       tplhl$B1$Y = 0.067:0.096:0.13,
       tphlh$B1$Y = 0.081:0.086:0.092,
       tplhl$C0$Y = 0.055:0.084:0.11,
       tphlh$C0$Y = 0.067:0.071:0.076,
       tplhl$C1$Y = 0.048:0.076:0.1,
       tphlh$C1$Y = 0.063:0.067:0.071;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (C0 *> Y) = (tphlh$C0$Y, tplhl$C0$Y);
     (C1 *> Y) = (tphlh$C1$Y, tplhl$C1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.048:0.058:0.068,
       tphlh$A0$Y = 0.067:0.071:0.074,
       tplhl$A1$Y = 0.041:0.05:0.059,
       tphlh$A1$Y = 0.062:0.065:0.068,
       tplhl$B0$Y = 0.036:0.047:0.057,
       tphlh$B0$Y = 0.051:0.053:0.055,
       tplhl$B1$Y = 0.03:0.039:0.048,
       tphlh$B1$Y = 0.045:0.047:0.049;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X2 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.048:0.058:0.068,
       tphlh$A0$Y = 0.068:0.071:0.074,
       tplhl$A1$Y = 0.041:0.05:0.058,
       tphlh$A1$Y = 0.061:0.064:0.067,
       tplhl$B0$Y = 0.037:0.047:0.058,
       tphlh$B0$Y = 0.053:0.055:0.057,
       tplhl$B1$Y = 0.03:0.039:0.048,
       tphlh$B1$Y = 0.045:0.047:0.049;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X4 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.048:0.058:0.067,
       tphlh$A0$Y = 0.067:0.07:0.073,
       tplhl$A1$Y = 0.041:0.05:0.058,
       tphlh$A1$Y = 0.061:0.064:0.067,
       tplhl$B0$Y = 0.037:0.048:0.058,
       tphlh$B0$Y = 0.053:0.055:0.057,
       tplhl$B1$Y = 0.03:0.04:0.049,
       tphlh$B1$Y = 0.046:0.047:0.049;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22XL (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, A0, A1);
   or  (I1_out, B0, B1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.049:0.059:0.069,
       tphlh$A0$Y = 0.072:0.075:0.079,
       tplhl$A1$Y = 0.044:0.053:0.061,
       tphlh$A1$Y = 0.067:0.071:0.074,
       tplhl$B0$Y = 0.037:0.048:0.058,
       tphlh$B0$Y = 0.054:0.056:0.059,
       tplhl$B1$Y = 0.031:0.041:0.05,
       tphlh$B1$Y = 0.049:0.051:0.053;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB1X1 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.12:0.12:0.12,
       tphhl$A0N$Y = 0.095:0.095:0.095,
       tpllh$A1N$Y = 0.11:0.11:0.11,
       tphhl$A1N$Y = 0.091:0.091:0.091,
       tplhl$B0$Y = 0.04:0.04:0.04,
       tphlh$B0$Y = 0.028:0.028:0.028;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB1X2 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.16:0.16:0.16,
       tphhl$A0N$Y = 0.12:0.12:0.12,
       tpllh$A1N$Y = 0.15:0.15:0.15,
       tphhl$A1N$Y = 0.12:0.12:0.12,
       tplhl$B0$Y = 0.04:0.04:0.04,
       tphlh$B0$Y = 0.027:0.027:0.027;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB1X4 (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.17:0.17:0.17,
       tphhl$A0N$Y = 0.13:0.13:0.13,
       tpllh$A1N$Y = 0.16:0.16:0.16,
       tphhl$A1N$Y = 0.12:0.12:0.12,
       tplhl$B0$Y = 0.041:0.041:0.041,
       tphlh$B0$Y = 0.027:0.027:0.027;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB1XL (A0N, A1N, B0, Y);
input  A0N ;
input  A1N ;
input  B0 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.097:0.097:0.097,
       tphhl$A0N$Y = 0.084:0.084:0.084,
       tpllh$A1N$Y = 0.094:0.094:0.094,
       tphhl$A1N$Y = 0.08:0.08:0.08,
       tplhl$B0$Y = 0.041:0.041:0.041,
       tphlh$B0$Y = 0.029:0.029:0.029;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB2X1 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.12:0.12:0.12,
       tphhl$A0N$Y = 0.1:0.11:0.12,
       tpllh$A1N$Y = 0.11:0.12:0.12,
       tphhl$A1N$Y = 0.1:0.11:0.12,
       tplhl$B0$Y = 0.037:0.047:0.057,
       tphlh$B0$Y = 0.053:0.054:0.055,
       tplhl$B1$Y = 0.03:0.039:0.047,
       tphlh$B1$Y = 0.046:0.047:0.049;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB2X2 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.15:0.15:0.15,
       tphhl$A0N$Y = 0.13:0.14:0.15,
       tpllh$A1N$Y = 0.13:0.14:0.14,
       tphhl$A1N$Y = 0.13:0.14:0.15,
       tplhl$B0$Y = 0.037:0.047:0.057,
       tphlh$B0$Y = 0.053:0.054:0.055,
       tplhl$B1$Y = 0.03:0.038:0.046,
       tphlh$B1$Y = 0.046:0.047:0.048;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB2X4 (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.16:0.16:0.16,
       tphhl$A0N$Y = 0.14:0.15:0.16,
       tpllh$A1N$Y = 0.14:0.14:0.15,
       tphhl$A1N$Y = 0.13:0.14:0.15,
       tplhl$B0$Y = 0.037:0.047:0.056,
       tphlh$B0$Y = 0.054:0.055:0.056,
       tplhl$B1$Y = 0.03:0.038:0.045,
       tphlh$B1$Y = 0.046:0.047:0.048;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI2BB2XL (A0N, A1N, B0, B1, Y);
input  A0N ;
input  A1N ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, A0N, A1N);
   not (I1_out, I0_out);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tpllh$A0N$Y = 0.11:0.12:0.12,
       tphhl$A0N$Y = 0.093:0.1:0.11,
       tpllh$A1N$Y = 0.11:0.12:0.12,
       tphhl$A1N$Y = 0.095:0.1:0.11,
       tplhl$B0$Y = 0.037:0.047:0.057,
       tphlh$B0$Y = 0.055:0.056:0.058,
       tplhl$B1$Y = 0.031:0.039:0.048,
       tphlh$B1$Y = 0.048:0.05:0.052;

     // path delays
     (A0N *> Y) = (tpllh$A0N$Y, tphhl$A0N$Y);
     (A1N *> Y) = (tpllh$A1N$Y, tphhl$A1N$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI31X1 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.059:0.059:0.059,
       tphlh$A0$Y = 0.1:0.1:0.1,
       tplhl$A1$Y = 0.055:0.055:0.055,
       tphlh$A1$Y = 0.098:0.098:0.098,
       tplhl$A2$Y = 0.045:0.045:0.045,
       tphlh$A2$Y = 0.082:0.082:0.082,
       tplhl$B0$Y = 0.025:0.039:0.052,
       tphlh$B0$Y = 0.025:0.026:0.027;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI31X2 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.06:0.06:0.06,
       tphlh$A0$Y = 0.11:0.11:0.11,
       tplhl$A1$Y = 0.055:0.055:0.055,
       tphlh$A1$Y = 0.099:0.099:0.099,
       tplhl$A2$Y = 0.045:0.045:0.045,
       tphlh$A2$Y = 0.081:0.081:0.081,
       tplhl$B0$Y = 0.025:0.037:0.05,
       tphlh$B0$Y = 0.024:0.025:0.026;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI31X4 (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.062:0.062:0.062,
       tphlh$A0$Y = 0.11:0.11:0.11,
       tplhl$A1$Y = 0.055:0.055:0.055,
       tphlh$A1$Y = 0.099:0.099:0.099,
       tplhl$A2$Y = 0.045:0.045:0.045,
       tphlh$A2$Y = 0.081:0.081:0.081,
       tplhl$B0$Y = 0.025:0.038:0.051,
       tphlh$B0$Y = 0.024:0.025:0.026;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI31XL (A0, A1, A2, B0, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   and (I2_out, I1_out, B0);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.061:0.061:0.061,
       tphlh$A0$Y = 0.11:0.11:0.11,
       tplhl$A1$Y = 0.057:0.057:0.057,
       tphlh$A1$Y = 0.1:0.1:0.1,
       tplhl$A2$Y = 0.047:0.047:0.047,
       tphlh$A2$Y = 0.089:0.089:0.089,
       tplhl$B0$Y = 0.026:0.039:0.052,
       tphlh$B0$Y = 0.026:0.027:0.028;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI32X1 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.053:0.065:0.077,
       tphlh$A0$Y = 0.11:0.12:0.12,
       tplhl$A1$Y = 0.051:0.061:0.071,
       tphlh$A1$Y = 0.11:0.11:0.12,
       tplhl$A2$Y = 0.044:0.053:0.061,
       tphlh$A2$Y = 0.093:0.098:0.1,
       tplhl$B0$Y = 0.033:0.049:0.066,
       tphlh$B0$Y = 0.052:0.054:0.056,
       tplhl$B1$Y = 0.028:0.042:0.056,
       tphlh$B1$Y = 0.046:0.048:0.05;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI32X2 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.055:0.067:0.078,
       tphlh$A0$Y = 0.12:0.12:0.13,
       tplhl$A1$Y = 0.051:0.061:0.072,
       tphlh$A1$Y = 0.11:0.11:0.12,
       tplhl$A2$Y = 0.043:0.052:0.061,
       tphlh$A2$Y = 0.092:0.096:0.1,
       tplhl$B0$Y = 0.034:0.05:0.066,
       tphlh$B0$Y = 0.053:0.055:0.057,
       tplhl$B1$Y = 0.028:0.042:0.055,
       tphlh$B1$Y = 0.046:0.047:0.049;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI32X4 (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.056:0.068:0.08,
       tphlh$A0$Y = 0.12:0.12:0.13,
       tplhl$A1$Y = 0.051:0.061:0.072,
       tphlh$A1$Y = 0.11:0.11:0.12,
       tplhl$A2$Y = 0.044:0.052:0.061,
       tphlh$A2$Y = 0.093:0.097:0.1,
       tplhl$B0$Y = 0.034:0.051:0.067,
       tphlh$B0$Y = 0.054:0.056:0.058,
       tplhl$B1$Y = 0.028:0.042:0.056,
       tphlh$B1$Y = 0.046:0.048:0.05;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI32XL (A0, A1, A2, B0, B1, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I2_out, B0, B1);
   and (I3_out, I1_out, I2_out);
   not (Y, I3_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.055:0.067:0.079,
       tphlh$A0$Y = 0.12:0.13:0.13,
       tplhl$A1$Y = 0.053:0.063:0.074,
       tphlh$A1$Y = 0.12:0.12:0.13,
       tplhl$A2$Y = 0.046:0.055:0.064,
       tphlh$A2$Y = 0.1:0.11:0.11,
       tplhl$B0$Y = 0.033:0.049:0.065,
       tphlh$B0$Y = 0.054:0.056:0.058,
       tplhl$B1$Y = 0.028:0.042:0.055,
       tphlh$B1$Y = 0.047:0.049:0.051;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33X1 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I3_out, B0, B1, B2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.055:0.073:0.091,
       tphlh$A0$Y = 0.12:0.13:0.14,
       tplhl$A1$Y = 0.052:0.068:0.084,
       tphlh$A1$Y = 0.12:0.13:0.14,
       tplhl$A2$Y = 0.045:0.059:0.073,
       tphlh$A2$Y = 0.1:0.11:0.12,
       tplhl$B0$Y = 0.04:0.059:0.079,
       tphlh$B0$Y = 0.095:0.098:0.1,
       tplhl$B1$Y = 0.037:0.054:0.071,
       tphlh$B1$Y = 0.088:0.091:0.095,
       tplhl$B2$Y = 0.03:0.045:0.06,
       tphlh$B2$Y = 0.07:0.074:0.077;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33X2 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I3_out, B0, B1, B2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.059:0.078:0.096,
       tphlh$A0$Y = 0.14:0.15:0.15,
       tplhl$A1$Y = 0.055:0.072:0.088,
       tphlh$A1$Y = 0.13:0.14:0.15,
       tplhl$A2$Y = 0.049:0.063:0.078,
       tphlh$A2$Y = 0.11:0.12:0.13,
       tplhl$B0$Y = 0.042:0.062:0.082,
       tphlh$B0$Y = 0.1:0.11:0.11,
       tplhl$B1$Y = 0.039:0.056:0.074,
       tphlh$B1$Y = 0.094:0.098:0.1,
       tplhl$B2$Y = 0.034:0.049:0.064,
       tphlh$B2$Y = 0.079:0.083:0.087;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33X4 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I3_out, B0, B1, B2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.055:0.075:0.094,
       tphlh$A0$Y = 0.13:0.13:0.14,
       tplhl$A1$Y = 0.052:0.069:0.086,
       tphlh$A1$Y = 0.12:0.13:0.14,
       tplhl$A2$Y = 0.045:0.059:0.074,
       tphlh$A2$Y = 0.1:0.11:0.12,
       tplhl$B0$Y = 0.039:0.06:0.081,
       tphlh$B0$Y = 0.096:0.099:0.1,
       tplhl$B1$Y = 0.037:0.055:0.073,
       tphlh$B1$Y = 0.088:0.092:0.095,
       tplhl$B2$Y = 0.03:0.045:0.06,
       tphlh$B2$Y = 0.068:0.072:0.075;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33XL (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, A0, A1, A2);
   or  (I3_out, B0, B1, B2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.057:0.075:0.094,
       tphlh$A0$Y = 0.13:0.14:0.15,
       tplhl$A1$Y = 0.055:0.072:0.088,
       tphlh$A1$Y = 0.13:0.14:0.15,
       tplhl$A2$Y = 0.048:0.062:0.076,
       tphlh$A2$Y = 0.11:0.12:0.13,
       tplhl$B0$Y = 0.042:0.061:0.081,
       tphlh$B0$Y = 0.1:0.11:0.11,
       tplhl$B1$Y = 0.039:0.056:0.074,
       tphlh$B1$Y = 0.097:0.1:0.1,
       tplhl$B2$Y = 0.032:0.047:0.062,
       tphlh$B2$Y = 0.077:0.08:0.084;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.073:0.073:0.073,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.067:0.067:0.067,
       tphhl$B$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.094:0.094:0.094,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.088:0.088:0.088,
       tphhl$B$Y = 0.16:0.16:0.16;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.098:0.098:0.098,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.092:0.092:0.092,
       tphhl$B$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X6 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.085:0.085:0.085,
       tphhl$A$Y = 0.15:0.15:0.15,
       tpllh$B$Y = 0.079:0.079:0.079,
       tphhl$B$Y = 0.14:0.14:0.14;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X8 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.097:0.097:0.097,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.092:0.092:0.092,
       tphhl$B$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.063:0.063:0.063,
       tphhl$A$Y = 0.098:0.098:0.098,
       tpllh$B$Y = 0.057:0.057:0.057,
       tphhl$B$Y = 0.089:0.089:0.089;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.083:0.083:0.083,
       tphhl$A$Y = 0.19:0.19:0.19,
       tpllh$B$Y = 0.078:0.078:0.078,
       tphhl$B$Y = 0.18:0.18:0.18,
       tpllh$C$Y = 0.072:0.072:0.072,
       tphhl$C$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X2 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.26:0.26:0.26,
       tpllh$B$Y = 0.099:0.099:0.099,
       tphhl$B$Y = 0.25:0.25:0.25,
       tpllh$C$Y = 0.092:0.092:0.092,
       tphhl$C$Y = 0.24:0.24:0.24;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X4 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.27:0.27:0.27,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.26:0.26:0.26,
       tpllh$C$Y = 0.096:0.096:0.096,
       tphhl$C$Y = 0.24:0.24:0.24;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X6 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.092:0.092:0.092,
       tphhl$A$Y = 0.22:0.22:0.22,
       tpllh$B$Y = 0.087:0.087:0.087,
       tphhl$B$Y = 0.21:0.21:0.21,
       tpllh$C$Y = 0.081:0.081:0.081,
       tphhl$C$Y = 0.2:0.2:0.2;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3X8 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.26:0.26:0.26,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.25:0.25:0.25,
       tpllh$C$Y = 0.094:0.094:0.094,
       tphhl$C$Y = 0.24:0.24:0.24;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (Y, A, B, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.072:0.072:0.072,
       tphhl$A$Y = 0.16:0.16:0.16,
       tpllh$B$Y = 0.068:0.068:0.068,
       tphhl$B$Y = 0.15:0.15:0.15,
       tpllh$C$Y = 0.062:0.062:0.062,
       tphhl$C$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.085:0.085:0.085,
       tphhl$A$Y = 0.26:0.26:0.26,
       tpllh$B$Y = 0.083:0.083:0.083,
       tphhl$B$Y = 0.25:0.25:0.25,
       tpllh$C$Y = 0.078:0.078:0.078,
       tphhl$C$Y = 0.23:0.23:0.23,
       tpllh$D$Y = 0.072:0.072:0.072,
       tphhl$D$Y = 0.21:0.21:0.21;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X2 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.36:0.36:0.36,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.35:0.35:0.35,
       tpllh$C$Y = 0.099:0.099:0.099,
       tphhl$C$Y = 0.33:0.33:0.33,
       tpllh$D$Y = 0.092:0.092:0.092,
       tphhl$D$Y = 0.3:0.3:0.3;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X4 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.37:0.37:0.37,
       tpllh$B$Y = 0.11:0.11:0.11,
       tphhl$B$Y = 0.36:0.36:0.36,
       tpllh$C$Y = 0.1:0.1:0.1,
       tphhl$C$Y = 0.34:0.34:0.34,
       tpllh$D$Y = 0.096:0.096:0.096,
       tphhl$D$Y = 0.31:0.31:0.31;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X6 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.097:0.097:0.097,
       tphhl$A$Y = 0.31:0.31:0.31,
       tpllh$B$Y = 0.094:0.094:0.094,
       tphhl$B$Y = 0.3:0.3:0.3,
       tpllh$C$Y = 0.09:0.09:0.09,
       tphhl$C$Y = 0.28:0.28:0.28,
       tpllh$D$Y = 0.083:0.083:0.083,
       tphhl$D$Y = 0.25:0.25:0.25;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X8 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.36:0.36:0.36,
       tpllh$B$Y = 0.11:0.11:0.11,
       tphhl$B$Y = 0.35:0.35:0.35,
       tpllh$C$Y = 0.1:0.1:0.1,
       tphhl$C$Y = 0.34:0.34:0.34,
       tpllh$D$Y = 0.096:0.096:0.096,
       tphhl$D$Y = 0.31:0.31:0.31;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4XL (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.076:0.076:0.076,
       tphhl$A$Y = 0.22:0.22:0.22,
       tpllh$B$Y = 0.075:0.075:0.075,
       tphhl$B$Y = 0.22:0.22:0.22,
       tpllh$C$Y = 0.07:0.07:0.07,
       tphhl$C$Y = 0.2:0.2:0.2,
       tpllh$D$Y = 0.064:0.064:0.064,
       tphhl$D$Y = 0.16:0.16:0.16;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFHQX1 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30);
   not (Q, QBINT_2);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tminpwh$CK = 0.15:0.31:0.31,
       tminpwl$CK = 0.16:0.28:0.28,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFHQX2 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tminpwh$CK = 0.14:0.33:0.33,
       tminpwl$CK = 0.16:0.27:0.27,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFHQX4 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_15, N30_6);
   not (Q, QBINT_15);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tminpwh$CK = 0.17:0.34:0.34,
       tminpwl$CK = 0.16:0.28:0.28,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFHQX8 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_11, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_30, N30_11);
   not (Q, QBINT_30);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tminpwh$CK = 0.22:0.38:0.38,
       tminpwl$CK = 0.16:0.27:0.27,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFNSRX1 (CKN, D, Q, QN, RN, SE, SI, SN);
input  CKN ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_2, I0_D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_2);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I13_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I13_out, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.33:0.33:0.33,
       tphhl$CKN$Q = 0.28:0.28:0.28,
       tphlh$CKN$QN = 0.34:0.34:0.34,
       tphhl$CKN$QN = 0.4:0.4:0.4,
       tphhl$RN$Q = 0.39:0.39:0.4,
       tphlh$RN$QN = 0.45:0.46:0.47,
       tplhl$SN$Q = 0.34:0.34:0.35,
       tphlh$SN$Q = 0.26:0.27:0.27,
       tpllh$SN$QN = 0.4:0.41:0.41,
       tphhl$SN$QN = 0.32:0.33:0.34,
       tminpwh$CKN = 0.13:0.3:0.3,
       tminpwl$CKN = 0.13:0.4:0.4,
       tminpwl$RN = 0.15:0.47:0.47,
       tminpwl$SN = 0.054:0.34:0.34,
       tsetup_negedge$D$CKN = 0.38:0.38:0.38,
       thold_negedge$D$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_negedge$SE$CKN = 0.28:0.38:0.38,
       thold_negedge$SE$CKN = 0:0.00000000000000083:0.00000000000000083,
       tsetup_negedge$SI$CKN = 0.38:0.38:0.38,
       thold_negedge$SI$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$CKN = 0.28:0.28:0.28,
       thold_posedge$D$CKN = 0.00000000074:0.00000000074:0.00000000074,
       tsetup_posedge$SE$CKN = 0.28:0.38:0.38,
       thold_posedge$SE$CKN = -0.094:0.094:0.094,
       tsetup_posedge$SI$CKN = 0.28:0.28:0.28,
       thold_posedge$SI$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$CKN = 0.19:0.19:0.19,
       trem$RN$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CKN = 0.19:0.19:0.19,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: SE?SI:D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: SE?SI:D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(negedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CKN,  NOTIFIER);
     $setup(negedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $setup(posedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CKN,  NOTIFIER);
     $setup(posedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& SN == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& SN == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& RN == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& RN == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFNSRX2 (CKN, D, Q, QN, RN, SE, SI, SN);
input  CKN ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_4, I0_D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_6, N35_4);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I13_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I13_out, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.36:0.36:0.36,
       tphhl$CKN$Q = 0.29:0.29:0.29,
       tphlh$CKN$QN = 0.39:0.39:0.39,
       tphhl$CKN$QN = 0.46:0.46:0.46,
       tphhl$RN$Q = 0.39:0.4:0.42,
       tphlh$RN$QN = 0.49:0.51:0.52,
       tplhl$SN$Q = 0.34:0.35:0.37,
       tphlh$SN$Q = 0.27:0.27:0.28,
       tpllh$SN$QN = 0.44:0.46:0.47,
       tphhl$SN$QN = 0.37:0.38:0.38,
       tminpwh$CKN = 0.13:0.3:0.3,
       tminpwl$CKN = 0.14:0.46:0.46,
       tminpwl$RN = 0.15:0.52:0.52,
       tminpwl$SN = 0.057:0.38:0.38,
       tsetup_negedge$D$CKN = 0.38:0.38:0.38,
       thold_negedge$D$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_negedge$SE$CKN = 0.38:0.38:0.38,
       thold_negedge$SE$CKN = 0:0:0,
       tsetup_negedge$SI$CKN = 0.38:0.38:0.38,
       thold_negedge$SI$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.28:0.28:0.28,
       thold_posedge$D$CKN = 0.00000000074:0.00000000074:0.00000000074,
       tsetup_posedge$SE$CKN = 0.28:0.38:0.38,
       thold_posedge$SE$CKN = -0.094:0.094:0.094,
       tsetup_posedge$SI$CKN = 0.28:0.28:0.28,
       thold_posedge$SI$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$CKN = 0.19:0.19:0.19,
       trem$RN$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$SN = 0.19:0.28:0.28,
       trec$SN$CKN = 0.19:0.19:0.19,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: SE?SI:D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: SE?SI:D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(negedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CKN,  NOTIFIER);
     $setup(negedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $setup(posedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CKN,  NOTIFIER);
     $setup(posedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& SN == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& SN == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& RN == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& RN == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFNSRX4 (CKN, D, Q, QN, RN, SE, SI, SN);
input  CKN ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_12, N35_3);
   not (Q, QBINT_12);
   buf (QN, QBINT_12);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I13_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I13_out, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.4:0.4:0.4,
       tphhl$CKN$Q = 0.38:0.38:0.38,
       tphlh$CKN$QN = 0.49:0.49:0.49,
       tphhl$CKN$QN = 0.51:0.51:0.51,
       tphhl$RN$Q = 0.45:0.46:0.47,
       tphlh$RN$QN = 0.56:0.57:0.58,
       tplhl$SN$Q = 0.39:0.4:0.41,
       tphlh$SN$Q = 0.3:0.31:0.32,
       tpllh$SN$QN = 0.5:0.51:0.52,
       tphhl$SN$QN = 0.41:0.42:0.43,
       tminpwh$CKN = 0.16:0.34:0.34,
       tminpwl$CKN = 0.21:0.51:0.51,
       tminpwl$RN = 0.16:0.58:0.58,
       tminpwl$SN = 0.06:0.43:0.43,
       tsetup_negedge$D$CKN = 0.38:0.38:0.38,
       thold_negedge$D$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_negedge$SE$CKN = 0.28:0.28:0.28,
       thold_negedge$SE$CKN = 0:0.00000000000000083:0.00000000000000083,
       tsetup_negedge$SI$CKN = 0.38:0.38:0.38,
       thold_negedge$SI$CKN = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$CKN = 0.28:0.28:0.28,
       thold_posedge$D$CKN = 0.094:0.094:0.094,
       tsetup_posedge$SE$CKN = 0.28:0.38:0.38,
       thold_posedge$SE$CKN = -0.094:0.094:0.094,
       tsetup_posedge$SI$CKN = 0.28:0.28:0.28,
       thold_posedge$SI$CKN = 0.094:0.094:0.094,
       trec$RN$CKN = 0.19:0.19:0.19,
       trem$RN$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$SN = 0.28:0.28:0.28,
       trec$SN$CKN = 0.19:0.19:0.19,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: SE?SI:D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: SE?SI:D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(negedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CKN,  NOTIFIER);
     $setup(negedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $setup(posedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CKN,  NOTIFIER);
     $setup(posedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& SN == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& SN == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& RN == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& RN == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFNSRXL (CKN, D, Q, QN, RN, SE, SI, SN);
input  CKN ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLOCK, CKN);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, I0_CLOCK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35_3);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I13_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I13_out, SN);

   specify
     // delay parameters
     specparam
       tphlh$CKN$Q = 0.32:0.32:0.32,
       tphhl$CKN$Q = 0.28:0.28:0.28,
       tphlh$CKN$QN = 0.33:0.33:0.33,
       tphhl$CKN$QN = 0.36:0.36:0.36,
       tphhl$RN$Q = 0.36:0.38:0.39,
       tphlh$RN$QN = 0.41:0.42:0.44,
       tplhl$SN$Q = 0.32:0.33:0.34,
       tphlh$SN$Q = 0.25:0.26:0.26,
       tpllh$SN$QN = 0.36:0.37:0.38,
       tphhl$SN$QN = 0.29:0.3:0.3,
       tminpwh$CKN = 0.13:0.3:0.3,
       tminpwl$CKN = 0.14:0.36:0.36,
       tminpwl$RN = 0.14:0.44:0.44,
       tminpwl$SN = 0.054:0.3:0.3,
       tsetup_negedge$D$CKN = 0.38:0.38:0.38,
       thold_negedge$D$CKN = 0:0:0,
       tsetup_negedge$SE$CKN = 0.28:0.38:0.38,
       thold_negedge$SE$CKN = 0:0:0,
       tsetup_negedge$SI$CKN = 0.38:0.38:0.38,
       thold_negedge$SI$CKN = 0:0:0,
       tsetup_posedge$D$CKN = 0.28:0.28:0.28,
       thold_posedge$D$CKN = 0.00000000074:0.00000000074:0.00000000074,
       tsetup_posedge$SE$CKN = 0.28:0.38:0.38,
       thold_posedge$SE$CKN = -0.094:0.094:0.094,
       tsetup_posedge$SI$CKN = 0.28:0.28:0.28,
       thold_posedge$SI$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$CKN = 0.19:0.19:0.19,
       trem$RN$CKN = 0.00000000074:0.00000000074:0.00000000074,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CKN = 0.19:0.19:0.19,
       trem$SN$CKN = 0.094:0.094:0.094;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge CKN *> (Q +: SE?SI:D)) = (tphlh$CKN$Q, tphhl$CKN$Q);
     (negedge CKN *> (QN -: SE?SI:D)) = (tphlh$CKN$QN, tphhl$CKN$QN);
     $setup(negedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CKN,  NOTIFIER);
     $setup(negedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CKN,  NOTIFIER);
     $setup(negedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CKN,  NOTIFIER);
     $setup(posedge D, negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CKN,  NOTIFIER);
     $setup(posedge SE, negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CKN,  NOTIFIER);
     $setup(posedge SI, negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CKN, NOTIFIER);
     $hold (negedge CKN &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CKN,  NOTIFIER);
     $recovery(posedge RN, negedge CKN &&& SN == 1'b1, trec$RN$CKN, NOTIFIER);
     $removal (posedge RN, negedge CKN &&& SN == 1'b1, trem$RN$CKN, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge CKN &&& RN == 1'b1, trec$SN$CKN, NOTIFIER);
     $removal (posedge SN, negedge CKN &&& RN == 1'b1, trem$SN$CKN, NOTIFIER);
     $width(posedge CKN, tminpwh$CKN, 0, NOTIFIER);
     $width(negedge CKN, tminpwl$CKN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFQX1 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_2);
   not (Q, QBINT_3);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.24:0.24:0.24,
       tplhl$CK$Q = 0.29:0.29:0.29,
       tminpwh$CK = 0.13:0.29:0.29,
       tminpwl$CK = 0.14:0.25:0.25,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFQX2 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_2);
   not (Q, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.3:0.3:0.3,
       tminpwh$CK = 0.14:0.3:0.3,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFQX4 (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_6, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_5, N30_6);
   not (Q, QBINT_5);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.3:0.3:0.3,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tminpwh$CK = 0.18:0.34:0.34,
       tminpwl$CK = 0.15:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFQXL (CK, D, Q, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30_2);
   not (Q, QBINT_2);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.23:0.23:0.23,
       tplhl$CK$Q = 0.28:0.28:0.28,
       tminpwh$CK = 0.13:0.28:0.28,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRHQX1 (CK, D, Q, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_3, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_3, N30_3);
   not (Q, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I7_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.3:0.3:0.3,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tphhl$RN$Q = 0.083:0.083:0.084,
       tminpwh$CK = 0.16:0.32:0.32,
       tminpwl$CK = 0.16:0.27:0.27,
       tminpwl$RN = 0.054:0.21:0.21,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRHQX2 (CK, D, Q, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_3, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_3, N30_3);
   not (Q, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I7_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.33:0.33:0.33,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tphhl$RN$Q = 0.1:0.1:0.1,
       tminpwh$CK = 0.15:0.34:0.34,
       tminpwl$CK = 0.16:0.27:0.27,
       tminpwl$RN = 0.07:0.21:0.21,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRHQX4 (CK, D, Q, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_4, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_24, N30_4);
   not (Q, QBINT_24);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I7_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.36:0.36:0.36,
       tphhl$RN$Q = 0.089:0.089:0.089,
       tminpwh$CK = 0.18:0.36:0.36,
       tminpwl$CK = 0.17:0.29:0.29,
       tminpwl$RN = 0.059:0.23:0.23,
       tsetup_negedge$D$CK = 0.095:0.095:0.095,
       thold_negedge$D$CK = 0.093:0.093:0.093,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = 0.093:0.093:0.093,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRHQX8 (CK, D, Q, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_11, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_38, N30_11);
   not (Q, QBINT_38);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I7_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.41:0.41:0.41,
       tplhl$CK$Q = 0.39:0.39:0.39,
       tphhl$RN$Q = 0.088:0.088:0.088,
       tminpwh$CK = 0.22:0.41:0.41,
       tminpwl$CK = 0.16:0.27:0.27,
       tminpwl$RN = 0.057:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.19:0.19:0.19,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRX1 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_2, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_4, N30_2);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I9_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.39:0.39:0.39,
       tplhl$CK$QN = 0.41:0.41:0.41,
       tphhl$RN$Q = 0.11:0.11:0.11,
       tphlh$RN$QN = 0.17:0.17:0.17,
       tminpwh$CK = 0.15:0.41:0.41,
       tminpwl$CK = 0.16:0.26:0.26,
       tminpwl$RN = 0.076:0.21:0.21,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRX2 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT, N30);
   not (Q, QBINT);
   buf (QN, QBINT);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I9_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.42:0.42:0.42,
       tplhl$CK$QN = 0.47:0.47:0.47,
       tphhl$RN$Q = 0.11:0.11:0.11,
       tphlh$RN$QN = 0.2:0.21:0.21,
       tminpwh$CK = 0.15:0.47:0.47,
       tminpwl$CK = 0.15:0.25:0.25,
       tminpwl$RN = 0.076:0.22:0.22,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRX4 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_2, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_19, N30_2);
   not (Q, QBINT_19);
   buf (QN, QBINT_19);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I9_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.38:0.38:0.38,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.45:0.45:0.45,
       tplhl$CK$QN = 0.51:0.51:0.51,
       tphhl$RN$Q = 0.099:0.099:0.099,
       tphlh$RN$QN = 0.2:0.2:0.2,
       tminpwh$CK = 0.18:0.51:0.51,
       tminpwl$CK = 0.15:0.25:0.25,
       tminpwl$RN = 0.068:0.25:0.25,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095,
       trec$RN$CK = -0.093:-0.093:-0.093,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFRXL (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   udp_dff (N30_2, I0_D, CK, I0_CLEAR, 1'B0, NOTIFIER);
   not (QBINT_3, N30_2);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1, RN, SE);
   not (I9_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.32:0.32:0.32,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.36:0.36:0.36,
       tplhl$CK$QN = 0.36:0.36:0.36,
       tphhl$RN$Q = 0.1:0.1:0.1,
       tphlh$RN$QN = 0.14:0.14:0.14,
       tminpwh$CK = 0.14:0.36:0.36,
       tminpwl$CK = 0.15:0.26:0.26,
       tminpwl$RN = 0.069:0.21:0.21,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095,
       trec$RN$CK = 0.001:0.001:0.001,
       trem$RN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK, trem$RN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSHQX1 (CK, D, Q, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_3, N35);
   not (Q, QBINT_3);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I7_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I7_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tphlh$SN$Q = 0.2:0.2:0.2,
       tminpwh$CK = 0.15:0.33:0.33,
       tminpwl$CK = 0.16:0.3:0.3,
       tminpwl$SN = 0.042:0.2:0.2,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSHQX2 (CK, D, Q, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35_3);
   not (Q, QBINT_4);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I7_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I7_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tphlh$SN$Q = 0.22:0.22:0.22,
       tminpwh$CK = 0.15:0.35:0.35,
       tminpwl$CK = 0.16:0.3:0.3,
       tminpwl$SN = 0.043:0.22:0.22,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSHQX4 (CK, D, Q, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_4, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_6, N35_4);
   not (Q, QBINT_6);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I7_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I7_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.37:0.37:0.37,
       tphlh$SN$Q = 0.24:0.24:0.25,
       tminpwh$CK = 0.18:0.37:0.37,
       tminpwl$CK = 0.16:0.31:0.31,
       tminpwl$SN = 0.043:0.25:0.25,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSHQX8 (CK, D, Q, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_6, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_26, N35_6);
   not (Q, QBINT_26);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I7_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I7_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.42:0.42:0.42,
       tphlh$SN$Q = 0.28:0.29:0.3,
       tminpwh$CK = 0.21:0.42:0.42,
       tminpwl$CK = 0.17:0.31:0.31,
       tminpwl$SN = 0.043:0.3:0.3,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRHQX1 (CK, D, Q, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT, N35_3);
   not (Q, QBINT);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I10_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.3:0.3:0.3,
       tplhl$CK$Q = 0.36:0.36:0.36,
       tphhl$RN$Q = 0.36:0.37:0.38,
       tplhl$SN$Q = 0.31:0.31:0.31,
       tphlh$SN$Q = 0.23:0.23:0.24,
       tminpwh$CK = 0.18:0.36:0.36,
       tminpwl$CK = 0.17:0.33:0.33,
       tminpwl$RN = 0.15:0.38:0.38,
       tminpwl$SN = 0.051:0.24:0.24,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRHQX2 (CK, D, Q, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_4, N35_3);
   not (Q, QBINT_4);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I10_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.32:0.32:0.32,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tphhl$RN$Q = 0.38:0.39:0.41,
       tplhl$SN$Q = 0.33:0.34:0.34,
       tphlh$SN$Q = 0.25:0.26:0.26,
       tminpwh$CK = 0.18:0.38:0.38,
       tminpwl$CK = 0.17:0.33:0.33,
       tminpwl$RN = 0.16:0.41:0.41,
       tminpwl$SN = 0.052:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.19:0.19:0.19;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRHQX4 (CK, D, Q, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_10, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_18, N35_10);
   not (Q, QBINT_18);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I10_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tphhl$RN$Q = 0.41:0.42:0.43,
       tplhl$SN$Q = 0.36:0.36:0.36,
       tphlh$SN$Q = 0.26:0.27:0.28,
       tminpwh$CK = 0.21:0.38:0.38,
       tminpwl$CK = 0.17:0.32:0.32,
       tminpwl$RN = 0.16:0.43:0.43,
       tminpwl$SN = 0.053:0.28:0.28,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.28:0.28,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRHQX8 (CK, D, Q, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_12, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_28, N35_12);
   not (Q, QBINT_28);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I10_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.42:0.42:0.42,
       tplhl$CK$Q = 0.45:0.45:0.45,
       tphhl$RN$Q = 0.48:0.48:0.49,
       tplhl$SN$Q = 0.42:0.43:0.43,
       tphlh$SN$Q = 0.31:0.33:0.34,
       tminpwh$CK = 0.27:0.45:0.45,
       tminpwl$CK = 0.17:0.34:0.34,
       tminpwl$RN = 0.16:0.49:0.49,
       tminpwl$SN = 0.052:0.34:0.34,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.19:0.19:0.19,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.28:0.28:0.28,
       trec$SN$CK = 0.001:0.001:0.001,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRX1 (CK, D, Q, QN, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_3, N35_3);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.3:0.3:0.3,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tpllh$CK$QN = 0.41:0.41:0.41,
       tplhl$CK$QN = 0.37:0.37:0.37,
       tphhl$RN$Q = 0.38:0.39:0.4,
       tphlh$RN$QN = 0.44:0.45:0.46,
       tplhl$SN$Q = 0.34:0.34:0.35,
       tphlh$SN$Q = 0.26:0.27:0.27,
       tpllh$SN$QN = 0.4:0.41:0.41,
       tphhl$SN$QN = 0.32:0.33:0.33,
       tminpwh$CK = 0.16:0.41:0.41,
       tminpwl$CK = 0.15:0.31:0.31,
       tminpwl$RN = 0.14:0.46:0.46,
       tminpwl$SN = 0.055:0.33:0.33,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.28:0.28:0.28,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.28:0.38:0.38,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.38:0.38:0.38,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRX2 (CK, D, Q, QN, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_5, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT, N35_5);
   not (Q, QBINT);
   buf (QN, QBINT);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.34:0.34:0.34,
       tplhl$CK$Q = 0.37:0.37:0.37,
       tpllh$CK$QN = 0.47:0.47:0.47,
       tplhl$CK$QN = 0.45:0.45:0.45,
       tphhl$RN$Q = 0.42:0.43:0.43,
       tphlh$RN$QN = 0.51:0.53:0.54,
       tplhl$SN$Q = 0.35:0.36:0.37,
       tphlh$SN$Q = 0.27:0.28:0.28,
       tpllh$SN$QN = 0.45:0.46:0.47,
       tphhl$SN$QN = 0.37:0.38:0.38,
       tminpwh$CK = 0.18:0.47:0.47,
       tminpwl$CK = 0.15:0.32:0.32,
       tminpwl$RN = 0.15:0.54:0.54,
       tminpwl$SN = 0.056:0.38:0.38,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.28:0.28:0.28,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.28:0.38:0.38,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.38:0.38:0.38,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRX4 (CK, D, Q, QN, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_12, N35_3);
   not (Q, QBINT_12);
   buf (QN, QBINT_12);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.42:0.42:0.42,
       tpllh$CK$QN = 0.53:0.53:0.53,
       tplhl$CK$QN = 0.46:0.46:0.46,
       tphhl$RN$Q = 0.45:0.46:0.48,
       tphlh$RN$QN = 0.56:0.57:0.59,
       tplhl$SN$Q = 0.39:0.4:0.41,
       tphlh$SN$Q = 0.3:0.31:0.32,
       tpllh$SN$QN = 0.5:0.51:0.52,
       tphhl$SN$QN = 0.41:0.42:0.43,
       tminpwh$CK = 0.2:0.53:0.53,
       tminpwl$CK = 0.17:0.32:0.32,
       tminpwl$RN = 0.16:0.59:0.59,
       tminpwl$SN = 0.059:0.43:0.43,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.28:0.38:0.38,
       thold_negedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.28:0.28:0.28,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.28:0.38:0.38,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.38:0.38:0.38,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.28:0.28:0.28,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRXL (CK, D, Q, QN, RN, SE, SI, SN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (QBINT_6, N35_3);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.37:0.37:0.37,
       tplhl$CK$QN = 0.33:0.33:0.33,
       tphhl$RN$Q = 0.37:0.37:0.38,
       tphlh$RN$QN = 0.41:0.42:0.43,
       tplhl$SN$Q = 0.32:0.33:0.33,
       tphlh$SN$Q = 0.25:0.25:0.26,
       tpllh$SN$QN = 0.37:0.37:0.38,
       tphhl$SN$QN = 0.29:0.29:0.3,
       tminpwh$CK = 0.16:0.37:0.37,
       tminpwl$CK = 0.15:0.3:0.3,
       tminpwl$RN = 0.14:0.43:0.43,
       tminpwl$SN = 0.055:0.3:0.3,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.28:0.38:0.38,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.28:0.28:0.28,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.28:0.38:0.38,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.38:0.38:0.38,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095,
       trec$RN$CK = 0.28:0.28:0.28,
       trem$RN$CK = -0.001:-0.001:-0.001,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSX1 (CK, D, Q, QN, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_4, N35);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I9_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I9_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tpllh$CK$QN = 0.41:0.41:0.41,
       tplhl$CK$QN = 0.32:0.32:0.32,
       tphlh$SN$Q = 0.23:0.24:0.24,
       tphhl$SN$QN = 0.3:0.3:0.3,
       tminpwh$CK = 0.14:0.41:0.41,
       tminpwl$CK = 0.15:0.29:0.29,
       tminpwl$SN = 0.047:0.3:0.3,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.28:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.28:0.28:0.28,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSX2 (CK, D, Q, QN, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_3, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_9, N35_3);
   not (Q, QBINT_9);
   buf (QN, QBINT_9);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I9_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I9_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.36:0.36:0.36,
       tpllh$CK$QN = 0.45:0.45:0.45,
       tplhl$CK$QN = 0.37:0.37:0.37,
       tphlh$SN$Q = 0.25:0.25:0.25,
       tphhl$SN$QN = 0.34:0.35:0.35,
       tminpwh$CK = 0.15:0.45:0.45,
       tminpwl$CK = 0.16:0.3:0.3,
       tminpwl$SN = 0.047:0.35:0.35,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.28:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.28:0.28:0.28,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSX4 (CK, D, Q, QN, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35_4, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_9, N35_4);
   not (Q, QBINT_9);
   buf (QN, QBINT_9);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I9_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I9_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.32:0.32:0.32,
       tplhl$CK$Q = 0.4:0.4:0.4,
       tpllh$CK$QN = 0.51:0.51:0.51,
       tplhl$CK$QN = 0.43:0.43:0.43,
       tphlh$SN$Q = 0.28:0.29:0.3,
       tphhl$SN$QN = 0.38:0.39:0.4,
       tminpwh$CK = 0.19:0.51:0.51,
       tminpwl$CK = 0.15:0.31:0.31,
       tminpwl$SN = 0.047:0.4:0.4,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.28:0.28:0.28,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSXL (CK, D, Q, QN, SE, SI, SN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_SET, SN);
   udp_dff (N35, I0_D, CK, 1'B0, I0_SET, NOTIFIER);
   not (QBINT_6, N35);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);
   and (SE_EQ_1_AN_SN_EQ_1, SE, SN);
   not (I9_out, SE);
   and (SE_EQ_0_AN_SN_EQ_1, I9_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.38:0.38:0.38,
       tplhl$CK$QN = 0.3:0.3:0.3,
       tphlh$SN$Q = 0.23:0.23:0.23,
       tphhl$SN$QN = 0.28:0.28:0.28,
       tminpwh$CK = 0.14:0.38:0.38,
       tminpwl$CK = 0.15:0.29:0.29,
       tminpwl$SN = 0.047:0.28:0.28,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.28:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.28:0.28:0.28,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001,
       trec$SN$CK = 0.095:0.095:0.095,
       trem$SN$CK = 0.093:0.093:0.093;

     // path delays
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, 0);
     (negedge SN *> (QN -: 1'b1)) = (0, tphhl$SN$QN);
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& SN == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& SN == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& SN == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge SN, posedge CK, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFTRX1 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_out, D, RN);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_2);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   not (I8_out, SE);
   and (D_EQ_1_AN_SE_EQ_0, D, I8_out);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I10_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tpllh$CK$QN = 0.37:0.37:0.37,
       tplhl$CK$QN = 0.32:0.32:0.32,
       tminpwh$CK = 0.13:0.37:0.37,
       tminpwl$CK = 0.14:0.24:0.24,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.38:0.38:0.38,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&D))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&D))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFTRX2 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_out, D, RN);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_2, N30_2);
   not (Q, QBINT_2);
   buf (QN, QBINT_2);
   not (I8_out, SE);
   and (D_EQ_1_AN_SE_EQ_0, D, I8_out);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I10_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.41:0.41:0.41,
       tplhl$CK$QN = 0.37:0.37:0.37,
       tminpwh$CK = 0.14:0.41:0.41,
       tminpwl$CK = 0.14:0.24:0.24,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.38:0.38:0.38,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&D))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&D))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFTRX4 (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_out, D, RN);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30);
   not (Q, QBINT_17);
   buf (QN, QBINT_17);
   not (I8_out, SE);
   and (D_EQ_1_AN_SE_EQ_0, D, I8_out);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I10_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tpllh$CK$QN = 0.45:0.45:0.45,
       tplhl$CK$QN = 0.41:0.41:0.41,
       tminpwh$CK = 0.17:0.45:0.45,
       tminpwl$CK = 0.14:0.24:0.24,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.38:0.38:0.38,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&D))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&D))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFTRXL (CK, D, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_out, D, RN);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_2);
   not (Q, QBINT_3);
   buf (QN, QBINT_3);
   not (I8_out, SE);
   and (D_EQ_1_AN_SE_EQ_0, D, I8_out);
   not (I10_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I10_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.3:0.3:0.3,
       tpllh$CK$QN = 0.34:0.34:0.34,
       tplhl$CK$QN = 0.29:0.29:0.29,
       tminpwh$CK = 0.13:0.34:0.34,
       tminpwl$CK = 0.14:0.24:0.24,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$RN$CK = 0.19:0.19:0.19,
       thold_negedge$RN$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.095:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$RN$CK = 0.38:0.38:0.38,
       thold_posedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&D))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&D))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& D_EQ_1_AN_SE_EQ_0 == 1'b1, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFX1 (CK, D, Q, QN, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_2);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tpllh$CK$QN = 0.37:0.37:0.37,
       tplhl$CK$QN = 0.32:0.32:0.32,
       tminpwh$CK = 0.13:0.37:0.37,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFX2 (CK, D, Q, QN, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_5, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_5);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.42:0.42:0.42,
       tplhl$CK$QN = 0.38:0.38:0.38,
       tminpwh$CK = 0.14:0.42:0.42,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFX4 (CK, D, Q, QN, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_16, N30);
   not (Q, QBINT_16);
   buf (QN, QBINT_16);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.45:0.45:0.45,
       tplhl$CK$QN = 0.41:0.41:0.41,
       tminpwh$CK = 0.17:0.45:0.45,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFXL (CK, D, Q, QN, SE, SI);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_6, N30_2);
   not (Q, QBINT_6);
   buf (QN, QBINT_6);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.31:0.31:0.31,
       tpllh$CK$QN = 0.35:0.35:0.35,
       tplhl$CK$QN = 0.29:0.29:0.29,
       tminpwh$CK = 0.14:0.35:0.35,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:D)) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:D)) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& SE == 1'b0, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& SE == 1'b0, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFHQX1 (CK, D, E, Q, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_10);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_10, N30_3);
   not (Q, QBINT_10);
   not (I7_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tminpwh$CK = 0.14:0.33:0.33,
       tminpwl$CK = 0.15:0.27:0.27,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.28:0.28:0.28,
       thold_posedge$E$CK = -0.19:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_10))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFHQX2 (CK, D, E, Q, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_17);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30_3);
   not (Q, QBINT_17);
   not (I7_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tminpwh$CK = 0.15:0.33:0.33,
       tminpwl$CK = 0.15:0.27:0.27,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.28:0.28:0.28,
       thold_posedge$E$CK = -0.19:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_17))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFHQX4 (CK, D, E, Q, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_23);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_9, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_23, N30_9);
   not (Q, QBINT_23);
   not (I7_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.36:0.36:0.36,
       tminpwh$CK = 0.16:0.36:0.36,
       tminpwl$CK = 0.15:0.27:0.27,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.28:0.28:0.28,
       thold_posedge$E$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_23))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFHQX8 (CK, D, E, Q, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   not (I0_out, QBINT_38);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_7, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_38, N30_7);
   not (Q, QBINT_38);
   not (I7_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I7_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.39:0.39:0.39,
       tminpwh$CK = 0.21:0.39:0.39,
       tminpwl$CK = 0.15:0.26:0.26,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.28:0.28:0.28,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.28:0.28:0.28,
       thold_posedge$E$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_38))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFTRX1 (CK, D, E, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_19);
   not (I5_out, I4_out);
   and (I7_out, I2_out, I5_out, RN);
   udp_mux2 (I0_D, I7_out, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_19, N30);
   not (Q, QBINT_19);
   buf (QN, QBINT_19);
   not (I15_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I15_out);
   not (I18_out, SE);
   and (E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0, E, RN, I18_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tpllh$CK$QN = 0.41:0.41:0.41,
       tplhl$CK$QN = 0.35:0.35:0.35,
       tminpwh$CK = 0.13:0.41:0.41,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.38:0.38:0.38,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.38:0.38:0.38,
       thold_negedge$E$CK = -0.19:-0.19:-0.19,
       tsetup_negedge$RN$CK = 0.38:0.38:0.38,
       thold_negedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.47:0.47:0.47,
       thold_posedge$D$CK = -0.28:-0.28:-0.28,
       tsetup_posedge$E$CK = 0.28:0.56:0.56,
       thold_posedge$E$CK = -0.38:-0.19:-0.19,
       tsetup_posedge$RN$CK = 0.56:0.56:0.56,
       thold_posedge$RN$CK = -0.28:-0.28:-0.28,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&(!(QBINT_19&!E)&!(E&!D))))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&(!(QBINT_19&!E)&!(E&!D))))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& SE == 1'b0, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& SE == 1'b0, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFTRX2 (CK, D, E, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_14);
   not (I5_out, I4_out);
   and (I7_out, I2_out, I5_out, RN);
   udp_mux2 (I0_D, I7_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_14, N30_2);
   not (Q, QBINT_14);
   buf (QN, QBINT_14);
   not (I15_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I15_out);
   not (I18_out, SE);
   and (E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0, E, RN, I18_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.43:0.43:0.43,
       tplhl$CK$QN = 0.39:0.39:0.39,
       tminpwh$CK = 0.15:0.43:0.43,
       tminpwl$CK = 0.15:0.26:0.26,
       tsetup_negedge$D$CK = 0.38:0.38:0.38,
       thold_negedge$D$CK = -0.19:-0.19:-0.19,
       tsetup_negedge$E$CK = 0.38:0.38:0.38,
       thold_negedge$E$CK = -0.28:-0.19:-0.19,
       tsetup_negedge$RN$CK = 0.38:0.38:0.38,
       thold_negedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.56:0.56:0.56,
       thold_posedge$D$CK = -0.28:-0.28:-0.28,
       tsetup_posedge$E$CK = 0.38:0.56:0.56,
       thold_posedge$E$CK = -0.38:-0.19:-0.19,
       tsetup_posedge$RN$CK = 0.56:0.56:0.56,
       thold_posedge$RN$CK = -0.38:-0.38:-0.38,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&(!(QBINT_14&!E)&!(E&!D))))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&(!(QBINT_14&!E)&!(E&!D))))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& SE == 1'b0, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& SE == 1'b0, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFTRX4 (CK, D, E, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_22);
   not (I5_out, I4_out);
   and (I7_out, I2_out, I5_out, RN);
   udp_mux2 (I0_D, I7_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_22, N30_3);
   not (Q, QBINT_22);
   buf (QN, QBINT_22);
   not (I15_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I15_out);
   not (I18_out, SE);
   and (E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0, E, RN, I18_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.33:0.33:0.33,
       tplhl$CK$Q = 0.35:0.35:0.35,
       tpllh$CK$QN = 0.46:0.46:0.46,
       tplhl$CK$QN = 0.44:0.44:0.44,
       tminpwh$CK = 0.18:0.46:0.46,
       tminpwl$CK = 0.15:0.26:0.26,
       tsetup_negedge$D$CK = 0.38:0.38:0.38,
       thold_negedge$D$CK = -0.19:-0.19:-0.19,
       tsetup_negedge$E$CK = 0.38:0.38:0.38,
       thold_negedge$E$CK = -0.28:-0.19:-0.19,
       tsetup_negedge$RN$CK = 0.38:0.38:0.38,
       thold_negedge$RN$CK = -0.19:-0.19:-0.19,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.56:0.56:0.56,
       thold_posedge$D$CK = -0.28:-0.28:-0.28,
       tsetup_posedge$E$CK = 0.38:0.56:0.56,
       thold_posedge$E$CK = -0.38:-0.19:-0.19,
       tsetup_posedge$RN$CK = 0.56:0.56:0.56,
       thold_posedge$RN$CK = -0.38:-0.38:-0.38,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&(!(QBINT_22&!E)&!(E&!D))))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&(!(QBINT_22&!E)&!(E&!D))))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& SE == 1'b0, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& SE == 1'b0, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFTRXL (CK, D, E, Q, QN, RN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  RN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, D);
   and (I1_out, I0_out, E);
   not (I2_out, I1_out);
   not (I3_out, E);
   and (I4_out, I3_out, QBINT_15);
   not (I5_out, I4_out);
   and (I7_out, I2_out, I5_out, RN);
   udp_mux2 (I0_D, I7_out, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_15, N30);
   not (Q, QBINT_15);
   buf (QN, QBINT_15);
   not (I15_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0, RN, I15_out);
   not (I18_out, SE);
   and (E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0, E, RN, I18_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.28:0.28:0.28,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.38:0.38:0.38,
       tplhl$CK$QN = 0.32:0.32:0.32,
       tminpwh$CK = 0.13:0.38:0.38,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.38:0.38:0.38,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.28:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.19:-0.19,
       tsetup_negedge$RN$CK = 0.28:0.28:0.28,
       thold_negedge$RN$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.47:0.47:0.47,
       thold_posedge$D$CK = -0.28:-0.28:-0.28,
       tsetup_posedge$E$CK = 0.28:0.56:0.56,
       thold_posedge$E$CK = -0.38:-0.19:-0.19,
       tsetup_posedge$RN$CK = 0.56:0.56:0.56,
       thold_posedge$RN$CK = -0.28:-0.28:-0.28,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(RN&(!(QBINT_15&!E)&!(E&!D))))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(RN&(!(QBINT_15&!E)&!(E&!D))))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge RN, posedge CK &&& SE == 1'b0, tsetup_negedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge RN, thold_negedge$RN$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0 == 1'b1, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge RN, posedge CK &&& SE == 1'b0, tsetup_posedge$RN$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge RN, thold_posedge$RN$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFX1 (CK, D, E, Q, QN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_14);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_2, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_14, N30_2);
   not (Q, QBINT_14);
   buf (QN, QBINT_14);
   not (I9_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.33:0.33:0.33,
       tpllh$CK$QN = 0.41:0.41:0.41,
       tplhl$CK$QN = 0.35:0.35:0.35,
       tminpwh$CK = 0.13:0.41:0.41,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.38:0.38:0.38,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$E$CK = 0.38:0.38:0.38,
       thold_posedge$E$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_14))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(E?D:!QBINT_14))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFX2 (CK, D, E, Q, QN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_17);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_4, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_17, N30_4);
   not (Q, QBINT_17);
   buf (QN, QBINT_17);
   not (I9_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.27:0.27:0.27,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.45:0.45:0.45,
       tplhl$CK$QN = 0.4:0.4:0.4,
       tminpwh$CK = 0.14:0.45:0.45,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.38:0.38:0.38,
       thold_posedge$E$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_17))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(E?D:!QBINT_17))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFX4 (CK, D, E, Q, QN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_23);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_8, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_23, N30_8);
   not (Q, QBINT_23);
   buf (QN, QBINT_23);
   not (I9_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.31:0.31:0.31,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tpllh$CK$QN = 0.46:0.46:0.46,
       tplhl$CK$QN = 0.42:0.42:0.42,
       tminpwh$CK = 0.17:0.46:0.46,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.28:0.28:0.28,
       thold_negedge$D$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.38:0.38:0.38,
       thold_posedge$E$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$SE$CK = 0.19:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_23))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(E?D:!QBINT_23))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SEDFFXL (CK, D, E, Q, QN, SE, SI);
input  CK ;
input  D ;
input  E ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, QBINT_4);
   udp_mux2 (I1_out, I0_out, D, E);
   udp_mux2 (I0_D, I1_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_4, N30_3);
   not (Q, QBINT_4);
   buf (QN, QBINT_4);
   not (I9_out, SE);
   and (E_EQ_1_AN_SE_EQ_0, E, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tpllh$CK$QN = 0.39:0.39:0.39,
       tplhl$CK$QN = 0.32:0.32:0.32,
       tminpwh$CK = 0.13:0.39:0.39,
       tminpwl$CK = 0.14:0.26:0.26,
       tsetup_negedge$D$CK = 0.38:0.38:0.38,
       thold_negedge$D$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$E$CK = 0.19:0.28:0.28,
       thold_negedge$E$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.38:0.38,
       thold_negedge$SE$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D$CK = 0.38:0.38:0.38,
       thold_posedge$D$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$E$CK = 0.38:0.38:0.38,
       thold_posedge$E$CK = -0.19:-0.19:-0.19,
       tsetup_posedge$SE$CK = 0.28:0.28:0.28,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.28:0.28:0.28,
       thold_posedge$SI$CK = -0.095:-0.095:-0.095;

     // path delays
     (posedge CK *> (Q +: SE?SI:(E?D:!QBINT_4))) = (tpllh$CK$Q, tplhl$CK$Q);
     (posedge CK *> (QN -: SE?SI:(E?D:!QBINT_4))) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& E_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SMDFFHQX1 (CK, D0, D1, Q, S0, SE, SI);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_out, D0, D1, S0);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_3, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30_3);
   not (Q, QBINT_3);
   not (I6_out, SE);
   and (S0_EQ_1_AN_SE_EQ_0, S0, I6_out);
   not (I8_out, S0);
   not (I9_out, SE);
   and (S0_EQ_0_AN_SE_EQ_0, I8_out, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.25:0.25:0.25,
       tplhl$CK$Q = 0.3:0.3:0.3,
       tminpwh$CK = 0.15:0.3:0.3,
       tminpwl$CK = 0.15:0.28:0.28,
       tsetup_negedge$D0$CK = 0.28:0.28:0.28,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.28:0.28:0.28,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.19:0.38:0.38,
       thold_negedge$S0$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D0$CK = 0.28:0.28:0.28,
       thold_posedge$D0$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$D1$CK = 0.28:0.28:0.28,
       thold_posedge$D1$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$S0$CK = 0.28:0.28:0.28,
       thold_posedge$S0$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(S0?D1:D0))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK &&& SE == 1'b0, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK &&& SE == 1'b0, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SMDFFHQX2 (CK, D0, D1, Q, S0, SE, SI);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_out, D0, D1, S0);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_3, N30);
   not (Q, QBINT_3);
   not (I6_out, SE);
   and (S0_EQ_1_AN_SE_EQ_0, S0, I6_out);
   not (I8_out, S0);
   not (I9_out, SE);
   and (S0_EQ_0_AN_SE_EQ_0, I8_out, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.26:0.26:0.26,
       tplhl$CK$Q = 0.32:0.32:0.32,
       tminpwh$CK = 0.16:0.32:0.32,
       tminpwl$CK = 0.16:0.29:0.29,
       tsetup_negedge$D0$CK = 0.28:0.28:0.28,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.28:0.28:0.28,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.19:0.38:0.38,
       thold_negedge$S0$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D0$CK = 0.38:0.38:0.38,
       thold_posedge$D0$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$D1$CK = 0.28:0.28:0.28,
       thold_posedge$D1$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$S0$CK = 0.28:0.28:0.28,
       thold_posedge$S0$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(S0?D1:D0))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK &&& SE == 1'b0, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK &&& SE == 1'b0, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SMDFFHQX4 (CK, D0, D1, Q, S0, SE, SI);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_out, D0, D1, S0);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_8, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_21, N30_8);
   not (Q, QBINT_21);
   not (I6_out, SE);
   and (S0_EQ_1_AN_SE_EQ_0, S0, I6_out);
   not (I8_out, S0);
   not (I9_out, SE);
   and (S0_EQ_0_AN_SE_EQ_0, I8_out, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.34:0.34:0.34,
       tminpwh$CK = 0.18:0.34:0.34,
       tminpwl$CK = 0.16:0.29:0.29,
       tsetup_negedge$D0$CK = 0.28:0.28:0.28,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.28:0.28:0.28,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.19:0.38:0.38,
       thold_negedge$S0$CK = -0.19:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D0$CK = 0.28:0.28:0.28,
       thold_posedge$D0$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$D1$CK = 0.28:0.28:0.28,
       thold_posedge$D1$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$S0$CK = 0.28:0.28:0.28,
       thold_posedge$S0$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(S0?D1:D0))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK &&& SE == 1'b0, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK &&& SE == 1'b0, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SMDFFHQX8 (CK, D0, D1, Q, S0, SE, SI);
input  CK ;
input  D0 ;
input  D1 ;
input  S0 ;
input  SE ;
input  SI ;
output Q ;
reg NOTIFIER ;

   udp_mux2 (I0_out, D0, D1, S0);
   udp_mux2 (I0_D, I0_out, SI, SE);
   udp_dff (N30_7, I0_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (QBINT_30, N30_7);
   not (Q, QBINT_30);
   not (I6_out, SE);
   and (S0_EQ_1_AN_SE_EQ_0, S0, I6_out);
   not (I8_out, S0);
   not (I9_out, SE);
   and (S0_EQ_0_AN_SE_EQ_0, I8_out, I9_out);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.35:0.35:0.35,
       tplhl$CK$Q = 0.38:0.38:0.38,
       tminpwh$CK = 0.22:0.38:0.38,
       tminpwl$CK = 0.16:0.29:0.29,
       tsetup_negedge$D0$CK = 0.28:0.28:0.28,
       thold_negedge$D0$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$D1$CK = 0.28:0.28:0.28,
       thold_negedge$D1$CK = -0.001:-0.001:-0.001,
       tsetup_negedge$S0$CK = 0.19:0.38:0.38,
       thold_negedge$S0$CK = -0.095:-0.001:-0.001,
       tsetup_negedge$SE$CK = 0.19:0.28:0.28,
       thold_negedge$SE$CK = -0.095:0.093:0.093,
       tsetup_negedge$SI$CK = 0.19:0.19:0.19,
       thold_negedge$SI$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$D0$CK = 0.28:0.28:0.28,
       thold_posedge$D0$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$D1$CK = 0.28:0.28:0.28,
       thold_posedge$D1$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$S0$CK = 0.28:0.28:0.28,
       thold_posedge$S0$CK = -0.095:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SI$CK = 0.19:0.19:0.19,
       thold_posedge$SI$CK = -0.001:-0.001:-0.001;

     // path delays
     (posedge CK *> (Q +: SE?SI:(S0?D1:D0))) = (tpllh$CK$Q, tplhl$CK$Q);
     $setup(negedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, negedge D0, thold_negedge$D0$CK,  NOTIFIER);
     $setup(negedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_negedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, negedge D1, thold_negedge$D1$CK,  NOTIFIER);
     $setup(negedge S0, posedge CK &&& SE == 1'b0, tsetup_negedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge S0, thold_negedge$S0$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& SE == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D0, posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D0$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_0_AN_SE_EQ_0 == 1'b1, posedge D0, thold_posedge$D0$CK,  NOTIFIER);
     $setup(posedge D1, posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, tsetup_posedge$D1$CK, NOTIFIER);
     $hold (posedge CK &&& S0_EQ_1_AN_SE_EQ_0 == 1'b1, posedge D1, thold_posedge$D1$CK,  NOTIFIER);
     $setup(posedge S0, posedge CK &&& SE == 1'b0, tsetup_posedge$S0$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge S0, thold_posedge$S0$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& SE == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX1 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.094:0.094:0.094,
       tphhl$A$Y = 0.085:0.085:0.085,
       tpzh$OE$Y = 0.091:0.091:0.091,
       tpzl$OE$Y = 0.11:0.11:0.11,
       tplz$OE$Y = 0.081:0.081:0.081,
       tphz$OE$Y = 0.067:0.067:0.067;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX12 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpzh$OE$Y = 0.11:0.11:0.11,
       tpzl$OE$Y = 0.16:0.16:0.16,
       tplz$OE$Y = 0.14:0.14:0.14,
       tphz$OE$Y = 0.084:0.084:0.084;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX16 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.18:0.18:0.18,
       tphhl$A$Y = 0.16:0.16:0.16,
       tpzh$OE$Y = 0.17:0.17:0.17,
       tpzl$OE$Y = 0.23:0.23:0.23,
       tplz$OE$Y = 0.18:0.18:0.18,
       tphz$OE$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX2 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpzh$OE$Y = 0.11:0.11:0.11,
       tpzl$OE$Y = 0.12:0.12:0.12,
       tplz$OE$Y = 0.093:0.093:0.093,
       tphz$OE$Y = 0.089:0.089:0.089;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX20 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpzh$OE$Y = 0.11:0.11:0.11,
       tpzl$OE$Y = 0.14:0.14:0.14,
       tplz$OE$Y = 0.13:0.13:0.13,
       tphz$OE$Y = 0.085:0.085:0.085;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX3 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.094:0.094:0.094,
       tpzh$OE$Y = 0.098:0.098:0.098,
       tpzl$OE$Y = 0.12:0.12:0.12,
       tplz$OE$Y = 0.1:0.1:0.1,
       tphz$OE$Y = 0.075:0.075:0.075;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX4 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.1:0.1:0.1,
       tpzh$OE$Y = 0.11:0.11:0.11,
       tpzl$OE$Y = 0.13:0.13:0.13,
       tplz$OE$Y = 0.11:0.11:0.11,
       tphz$OE$Y = 0.087:0.087:0.087;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX6 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.097:0.097:0.097,
       tpzh$OE$Y = 0.097:0.097:0.097,
       tpzl$OE$Y = 0.16:0.16:0.16,
       tplz$OE$Y = 0.15:0.15:0.15,
       tphz$OE$Y = 0.075:0.075:0.075;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX8 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.11:0.11:0.11,
       tpzh$OE$Y = 0.11:0.11:0.11,
       tpzl$OE$Y = 0.17:0.17:0.17,
       tplz$OE$Y = 0.15:0.15:0.15,
       tphz$OE$Y = 0.089:0.089:0.089;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFXL (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.085:0.085:0.085,
       tphhl$A$Y = 0.077:0.077:0.077,
       tpzh$OE$Y = 0.078:0.078:0.078,
       tpzl$OE$Y = 0.098:0.098:0.098,
       tplz$OE$Y = 0.074:0.074:0.074,
       tphz$OE$Y = 0.054:0.054:0.054;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TIEHI (Y);
output Y ;

   buf (Y, 'B1);


endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TIELO (Y);
output Y ;

   buf (Y, 'B0);


endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX12 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.45:0.45:0.45,
       tphhl$CK$ECK = 0.38:0.38:0.38,
       tminpwl$CK = 0.31:0.41:0.41,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX16 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_21, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, EINT_21);
   and (ECK, CK, EINT_21);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.48:0.48:0.48,
       tphhl$CK$ECK = 0.42:0.42:0.42,
       tminpwl$CK = 0.39:0.48:0.48,
       tsetup_negedge$E$CK = 0.059:0.059:0.059,
       thold_negedge$E$CK = 0.035:0.035:0.035,
       tsetup_posedge$E$CK = 0.15:0.15:0.15,
       thold_posedge$E$CK = -0.059:-0.059:-0.059;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX2 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_5, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.59:0.59:0.59,
       tphhl$CK$ECK = 0.48:0.48:0.48,
       tminpwl$CK = 0.2:0.48:0.48,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX20 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_27, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_3, EINT_27);
   and (ECK, CK, EINT_27);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.48:0.48:0.48,
       tphhl$CK$ECK = 0.41:0.42:0.42,
       tminpwl$CK = 0.41:0.51:0.51,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX3 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_7, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_5, EINT_7);
   and (ECK, CK, EINT_7);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.49:0.49:0.49,
       tphhl$CK$ECK = 0.4:0.41:0.41,
       tminpwl$CK = 0.22:0.41:0.41,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX4 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.47:0.47:0.47,
       tphhl$CK$ECK = 0.38:0.39:0.39,
       tminpwl$CK = 0.22:0.39:0.39,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX6 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.43:0.43:0.43,
       tphhl$CK$ECK = 0.36:0.36:0.36,
       tminpwl$CK = 0.27:0.36:0.36,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNCAX8 (CK, E, ECK);
input  CK ;
input  E ;
output ECK ;
reg NOTIFIER ;

   not (I0_ENABLE, CK);
   udp_tlat (EINT_14, E, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, EINT_14);
   and (ECK, CK, EINT_14);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.43:0.43:0.43,
       tphhl$CK$ECK = 0.36:0.36:0.37,
       tminpwl$CK = 0.27:0.37:0.37,
       tsetup_negedge$E$CK = 0.095:0.095:0.095,
       thold_negedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(posedge E, posedge CK, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNSRX1 (D, GN, Q, QN, RN, SN);
input  D ;
input  GN ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, GN);
   and (I0_ENABLE, I0_out, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_4, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_6, QINT_4);
   buf (Q, QINT_4);
   not (QN, QINT_4);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.27:0.27:0.27,
       tphhl$D$Q = 0.34:0.34:0.34,
       tplhl$D$QN = 0.22:0.22:0.22,
       tphlh$D$QN = 0.29:0.29:0.29,
       tphlh$GN$Q = 0.44:0.44:0.44,
       tphhl$GN$Q = 0.45:0.45:0.45,
       tphlh$GN$QN = 0.4:0.4:0.4,
       tphhl$GN$QN = 0.4:0.4:0.4,
       tpllh$RN$Q = 0.41:0.41:0.41,
       tphhl$RN$Q = 0.36:0.36:0.36,
       tplhl$RN$QN = 0.37:0.37:0.37,
       tphlh$RN$QN = 0.31:0.31:0.31,
       tplhl$SN$Q = 0.22:0.22:0.22,
       tphlh$SN$Q = 0.16:0.16:0.16,
       tpllh$SN$QN = 0.18:0.18:0.18,
       tphhl$SN$QN = 0.12:0.12:0.12,
       tminpwl$GN = 0.2:0.45:0.45,
       tminpwl$RN = 0.1:0.36:0.36,
       tminpwl$SN = 0.083:0.24:0.24,
       tsetup_negedge$D$GN = 0.19:0.19:0.19,
       thold_negedge$D$GN = -0.094:-0.094:-0.094,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0,
       tsetup_posedge$RN$GN = 0.28:0.28:0.28,
       thold_posedge$RN$GN = -0.094:-0.094:-0.094,
       trec$SN$GN = 0.094:0.094:0.094,
       trem$SN$GN = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0.00000000000000083:0.00000000000000083:0.00000000000000083;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (GN *> Q) = (tphlh$GN$Q, tphhl$GN$Q);
     (GN *> QN) = (tphlh$GN$QN, tphhl$GN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $setup(posedge RN, posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$GN, NOTIFIER);
     $hold (posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$GN,  NOTIFIER);
     $recovery(posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$GN, NOTIFIER);
     $removal (posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$GN, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& GN == 1'b1, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& GN == 1'b1, trem$SN$RN, NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNSRX2 (D, GN, Q, QN, RN, SN);
input  D ;
input  GN ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, GN);
   and (I0_ENABLE, I0_out, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_6, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_5, QINT_6);
   buf (Q, QINT_6);
   not (QN, QINT_6);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.31:0.31:0.31,
       tphhl$D$Q = 0.4:0.4:0.4,
       tplhl$D$QN = 0.26:0.26:0.26,
       tphlh$D$QN = 0.34:0.34:0.34,
       tphlh$GN$Q = 0.49:0.49:0.49,
       tphhl$GN$Q = 0.54:0.54:0.54,
       tphlh$GN$QN = 0.49:0.49:0.49,
       tphhl$GN$QN = 0.45:0.45:0.45,
       tpllh$RN$Q = 0.45:0.45:0.45,
       tphhl$RN$Q = 0.41:0.41:0.41,
       tplhl$RN$QN = 0.4:0.4:0.4,
       tphlh$RN$QN = 0.36:0.36:0.36,
       tplhl$SN$Q = 0.26:0.26:0.26,
       tphlh$SN$Q = 0.18:0.18:0.18,
       tpllh$SN$QN = 0.2:0.2:0.2,
       tphhl$SN$QN = 0.13:0.13:0.13,
       tminpwl$GN = 0.25:0.54:0.54,
       tminpwl$RN = 0.11:0.41:0.41,
       tminpwl$SN = 0.096:0.29:0.29,
       tsetup_negedge$D$GN = 0.19:0.19:0.19,
       thold_negedge$D$GN = -0.094:-0.094:-0.094,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0,
       tsetup_posedge$RN$GN = 0.28:0.28:0.28,
       thold_posedge$RN$GN = -0.19:-0.19:-0.19,
       trec$SN$GN = 0.094:0.094:0.094,
       trem$SN$GN = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0.00000000000000083:0.00000000000000083:0.00000000000000083;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (GN *> Q) = (tphlh$GN$Q, tphhl$GN$Q);
     (GN *> QN) = (tphlh$GN$QN, tphhl$GN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $setup(posedge RN, posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$GN, NOTIFIER);
     $hold (posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$GN,  NOTIFIER);
     $recovery(posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$GN, NOTIFIER);
     $removal (posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$GN, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& GN == 1'b1, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& GN == 1'b1, trem$SN$RN, NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNSRX4 (D, GN, Q, QN, RN, SN);
input  D ;
input  GN ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, GN);
   and (I0_ENABLE, I0_out, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_31, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_7, QINT_31);
   buf (Q, QINT_31);
   not (QN, QINT_31);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.33:0.33:0.33,
       tphhl$D$Q = 0.42:0.42:0.42,
       tplhl$D$QN = 0.28:0.28:0.28,
       tphlh$D$QN = 0.36:0.36:0.36,
       tphlh$GN$Q = 0.51:0.51:0.51,
       tphhl$GN$Q = 0.56:0.56:0.56,
       tphlh$GN$QN = 0.51:0.51:0.51,
       tphhl$GN$QN = 0.46:0.46:0.46,
       tpllh$RN$Q = 0.48:0.48:0.48,
       tphhl$RN$Q = 0.44:0.44:0.44,
       tplhl$RN$QN = 0.43:0.43:0.43,
       tphlh$RN$QN = 0.38:0.38:0.38,
       tplhl$SN$Q = 0.25:0.25:0.25,
       tphlh$SN$Q = 0.17:0.17:0.17,
       tpllh$SN$QN = 0.19:0.19:0.19,
       tphhl$SN$QN = 0.12:0.12:0.12,
       tminpwl$GN = 0.27:0.56:0.56,
       tminpwl$RN = 0.15:0.44:0.44,
       tminpwl$SN = 0.089:0.32:0.32,
       tsetup_negedge$D$GN = 0.19:0.19:0.19,
       thold_negedge$D$GN = -0.094:-0.094:-0.094,
       tsetup_posedge$D$GN = 0.19:0.19:0.19,
       thold_posedge$D$GN = 0:0:0,
       tsetup_posedge$RN$GN = 0.28:0.28:0.28,
       thold_posedge$RN$GN = -0.19:-0.19:-0.19,
       trec$SN$GN = 0:0:0,
       trem$SN$GN = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0.00000000000000083:0.00000000000000083:0.00000000000000083;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (GN *> Q) = (tphlh$GN$Q, tphhl$GN$Q);
     (GN *> QN) = (tphlh$GN$QN, tphhl$GN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $setup(posedge RN, posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$GN, NOTIFIER);
     $hold (posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$GN,  NOTIFIER);
     $recovery(posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$GN, NOTIFIER);
     $removal (posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$GN, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& GN == 1'b1, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& GN == 1'b1, trem$SN$RN, NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNSRXL (D, GN, Q, QN, RN, SN);
input  D ;
input  GN ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_out, GN);
   and (I0_ENABLE, I0_out, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_4, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_4, QINT_4);
   buf (Q, QINT_4);
   not (QN, QINT_4);
   not (I9_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I9_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.24:0.24:0.24,
       tphhl$D$Q = 0.3:0.3:0.3,
       tplhl$D$QN = 0.2:0.2:0.2,
       tphlh$D$QN = 0.26:0.26:0.26,
       tphlh$GN$Q = 0.41:0.41:0.41,
       tphhl$GN$Q = 0.41:0.41:0.41,
       tphlh$GN$QN = 0.37:0.37:0.37,
       tphhl$GN$QN = 0.37:0.37:0.37,
       tpllh$RN$Q = 0.39:0.39:0.39,
       tphhl$RN$Q = 0.32:0.32:0.32,
       tplhl$RN$QN = 0.34:0.34:0.34,
       tphlh$RN$QN = 0.28:0.28:0.28,
       tplhl$SN$Q = 0.19:0.19:0.19,
       tphlh$SN$Q = 0.14:0.14:0.14,
       tpllh$SN$QN = 0.14:0.14:0.14,
       tphhl$SN$QN = 0.094:0.095:0.096,
       tminpwl$GN = 0.2:0.41:0.41,
       tminpwl$RN = 0.1:0.32:0.32,
       tminpwl$SN = 0.064:0.22:0.22,
       tsetup_negedge$D$GN = 0.19:0.19:0.19,
       thold_negedge$D$GN = -0.00000000074:-0.00000000074:-0.00000000074,
       tsetup_posedge$D$GN = 0.094:0.094:0.094,
       thold_posedge$D$GN = 0:0:0,
       tsetup_posedge$RN$GN = 0.19:0.19:0.19,
       thold_posedge$RN$GN = -0.094:-0.094:-0.094,
       trec$SN$GN = 0:0:0,
       trem$SN$GN = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0.094:0.094:0.094;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (GN *> Q) = (tphlh$GN$Q, tphhl$GN$Q);
     (GN *> QN) = (tphlh$GN$QN, tphhl$GN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $setup(posedge RN, posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$GN, NOTIFIER);
     $hold (posedge GN &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$GN,  NOTIFIER);
     $recovery(posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$GN, NOTIFIER);
     $removal (posedge SN, posedge GN &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$GN, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& GN == 1'b1, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& GN == 1'b1, trem$SN$RN, NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX12 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_18, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5, EINT_18);
   and (ECK, CK, EINT_18);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.45:0.45:0.45,
       tphhl$CK$ECK = 0.38:0.38:0.38,
       tminpwl$CK = 0.25:0.38:0.38,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.19:0.19,
       thold_negedge$SE$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX16 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_21, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_8, EINT_21);
   and (ECK, CK, EINT_21);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.46:0.46:0.46,
       tphhl$CK$ECK = 0.4:0.4:0.4,
       tminpwl$CK = 0.29:0.4:0.4,
       tsetup_negedge$E$CK = 0.15:0.15:0.15,
       thold_negedge$E$CK = -0.059:-0.059:-0.059,
       tsetup_negedge$SE$CK = 0.25:0.25:0.25,
       thold_negedge$SE$CK = -0.15:-0.15:-0.15,
       tsetup_posedge$E$CK = 0.15:0.15:0.15,
       thold_posedge$E$CK = -0.059:-0.059:-0.059,
       tsetup_posedge$SE$CK = 0.15:0.15:0.15,
       thold_posedge$SE$CK = -0.059:-0.059:-0.059;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX2 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_8, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_6, EINT_8);
   and (ECK, CK, EINT_8);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.59:0.59:0.59,
       tphhl$CK$ECK = 0.48:0.48:0.48,
       tminpwl$CK = 0.18:0.48:0.48,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.19:0.19,
       thold_negedge$SE$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX20 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_17, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_7, EINT_17);
   and (ECK, CK, EINT_17);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.5:0.5:0.5,
       tphhl$CK$ECK = 0.42:0.42:0.43,
       tminpwl$CK = 0.33:0.44:0.44,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = 0.093:0.093:0.093,
       tsetup_negedge$SE$CK = 0.19:0.19:0.19,
       thold_negedge$SE$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX3 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_7, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_6, EINT_7);
   and (ECK, CK, EINT_7);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.5:0.5:0.5,
       tphhl$CK$ECK = 0.41:0.41:0.41,
       tminpwl$CK = 0.19:0.41:0.41,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.19:0.19,
       thold_negedge$SE$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.095:0.095:0.095,
       thold_posedge$SE$CK = -0.001:-0.001:-0.001;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX4 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_6, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.48:0.48:0.48,
       tphhl$CK$ECK = 0.39:0.39:0.39,
       tminpwl$CK = 0.19:0.39:0.39,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.19:0.19,
       thold_negedge$SE$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.095:0.095:0.095,
       thold_posedge$E$CK = -0.001:-0.001:-0.001,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX6 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_12, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5, EINT_12);
   and (ECK, CK, EINT_12);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.43:0.43:0.43,
       tphhl$CK$ECK = 0.36:0.36:0.36,
       tminpwl$CK = 0.22:0.36:0.36,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.19:0.19,
       thold_negedge$SE$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNTSCAX8 (CK, E, ECK, SE);
input  CK ;
input  E ;
input  SE ;
output ECK ;
reg NOTIFIER ;

   or  (I0_D, E, SE);
   not (I0_ENABLE, CK);
   udp_tlat (EINT_4, I0_D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N5_5, EINT_4);
   and (ECK, CK, EINT_4);

   specify
     // delay parameters
     specparam
       tpllh$CK$ECK = 0.43:0.43:0.43,
       tphhl$CK$ECK = 0.36:0.36:0.36,
       tminpwl$CK = 0.22:0.36:0.36,
       tsetup_negedge$E$CK = 0.19:0.19:0.19,
       thold_negedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_negedge$SE$CK = 0.19:0.19:0.19,
       thold_negedge$SE$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$E$CK = 0.19:0.19:0.19,
       thold_posedge$E$CK = -0.095:-0.095:-0.095,
       tsetup_posedge$SE$CK = 0.19:0.19:0.19,
       thold_posedge$SE$CK = -0.095:-0.095:-0.095;

     // path delays
     (negedge CK *> (ECK -: 1'b1)) = (0, tphhl$CK$ECK);
     (posedge CK *> (ECK +: 1'b1)) = (tpllh$CK$ECK, 0);
     $setup(negedge E, posedge CK &&& SE == 1'b0, tsetup_negedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, negedge E, thold_negedge$E$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& E == 1'b0, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(posedge E, posedge CK &&& SE == 1'b0, tsetup_posedge$E$CK, NOTIFIER);
     $hold (posedge CK &&& SE == 1'b0, posedge E, thold_posedge$E$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& E == 1'b0, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& E == 1'b0, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNX1 (D, GN, Q, QN);
input  D ;
input  GN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_ENABLE, GN);
   udp_tlat (QINT_3, D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_3, QINT_3);
   buf (Q, QINT_3);
   not (QN, QINT_3);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.27:0.27:0.27,
       tphhl$D$Q = 0.27:0.27:0.27,
       tplhl$D$QN = 0.22:0.22:0.22,
       tphlh$D$QN = 0.23:0.23:0.23,
       tphlh$GN$Q = 0.32:0.32:0.32,
       tphhl$GN$Q = 0.35:0.35:0.35,
       tphlh$GN$QN = 0.31:0.31:0.31,
       tphhl$GN$QN = 0.28:0.28:0.28,
       tminpwl$GN = 0.12:0.35:0.35,
       tsetup_negedge$D$GN = 0.19:0.19:0.19,
       thold_negedge$D$GN = -0.00000000074:-0.00000000074:-0.00000000074,
       tsetup_posedge$D$GN = 0.19:0.19:0.19,
       thold_posedge$D$GN = -0.094:-0.094:-0.094;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge GN *> (Q +: D)) = (tphlh$GN$Q, tphhl$GN$Q);
     (negedge GN *> (QN -: D)) = (tphlh$GN$QN, tphhl$GN$QN);
     $setup(negedge D, posedge GN, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNX2 (D, GN, Q, QN);
input  D ;
input  GN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_ENABLE, GN);
   udp_tlat (QINT_19, D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_3, QINT_19);
   buf (Q, QINT_19);
   not (QN, QINT_19);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.29:0.29:0.29,
       tphhl$D$Q = 0.3:0.3:0.3,
       tplhl$D$QN = 0.24:0.24:0.24,
       tphlh$D$QN = 0.25:0.25:0.25,
       tphlh$GN$Q = 0.35:0.35:0.35,
       tphhl$GN$Q = 0.38:0.38:0.38,
       tphlh$GN$QN = 0.33:0.33:0.33,
       tphhl$GN$QN = 0.3:0.3:0.3,
       tminpwl$GN = 0.13:0.38:0.38,
       tsetup_negedge$D$GN = 0.19:0.19:0.19,
       thold_negedge$D$GN = -0.00000000074:-0.00000000074:-0.00000000074,
       tsetup_posedge$D$GN = 0.19:0.19:0.19,
       thold_posedge$D$GN = -0.094:-0.094:-0.094;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge GN *> (Q +: D)) = (tphlh$GN$Q, tphhl$GN$Q);
     (negedge GN *> (QN -: D)) = (tphlh$GN$QN, tphhl$GN$QN);
     $setup(negedge D, posedge GN, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNX4 (D, GN, Q, QN);
input  D ;
input  GN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_ENABLE, GN);
   udp_tlat (QINT_18, D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, QINT_18);
   buf (Q, QINT_18);
   not (QN, QINT_18);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.33:0.33:0.33,
       tphhl$D$Q = 0.34:0.34:0.34,
       tplhl$D$QN = 0.27:0.27:0.27,
       tphlh$D$QN = 0.29:0.29:0.29,
       tphlh$GN$Q = 0.39:0.39:0.39,
       tphhl$GN$Q = 0.43:0.43:0.43,
       tphlh$GN$QN = 0.38:0.38:0.38,
       tphhl$GN$QN = 0.34:0.34:0.34,
       tminpwl$GN = 0.17:0.43:0.43,
       tsetup_negedge$D$GN = 0.19:0.19:0.19,
       thold_negedge$D$GN = -0.094:-0.094:-0.094,
       tsetup_posedge$D$GN = 0.19:0.19:0.19,
       thold_posedge$D$GN = -0.094:-0.094:-0.094;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge GN *> (Q +: D)) = (tphlh$GN$Q, tphhl$GN$Q);
     (negedge GN *> (QN -: D)) = (tphlh$GN$QN, tphhl$GN$QN);
     $setup(negedge D, posedge GN, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATNXL (D, GN, Q, QN);
input  D ;
input  GN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_ENABLE, GN);
   udp_tlat (QINT_3, D, I0_ENABLE, 1'B0, 1'B0, NOTIFIER);
   not (N0_3, QINT_3);
   buf (Q, QINT_3);
   not (QN, QINT_3);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.25:0.25:0.25,
       tphhl$D$Q = 0.25:0.25:0.25,
       tplhl$D$QN = 0.2:0.2:0.2,
       tphlh$D$QN = 0.21:0.21:0.21,
       tphlh$GN$Q = 0.3:0.3:0.3,
       tphhl$GN$Q = 0.33:0.33:0.33,
       tphlh$GN$QN = 0.29:0.29:0.29,
       tphhl$GN$QN = 0.25:0.25:0.25,
       tminpwl$GN = 0.12:0.33:0.33,
       tsetup_negedge$D$GN = 0.094:0.094:0.094,
       thold_negedge$D$GN = -0.00000000074:-0.00000000074:-0.00000000074,
       tsetup_posedge$D$GN = 0.19:0.19:0.19,
       thold_posedge$D$GN = 0:0:0;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge GN *> (Q +: D)) = (tphlh$GN$Q, tphhl$GN$Q);
     (negedge GN *> (QN -: D)) = (tphlh$GN$QN, tphhl$GN$QN);
     $setup(negedge D, posedge GN, tsetup_negedge$D$GN, NOTIFIER);
     $hold (posedge GN, negedge D, thold_negedge$D$GN,  NOTIFIER);
     $setup(posedge D, posedge GN, tsetup_posedge$D$GN, NOTIFIER);
     $hold (posedge GN, posedge D, thold_posedge$D$GN,  NOTIFIER);
     $width(negedge GN, tminpwl$GN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRX1 (D, G, Q, QN, RN, SN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_ENABLE, G, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_12, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_5, QINT_12);
   buf (Q, QINT_12);
   not (QN, QINT_12);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.28:0.28:0.28,
       tphhl$D$Q = 0.35:0.35:0.35,
       tplhl$D$QN = 0.23:0.23:0.23,
       tphlh$D$QN = 0.3:0.3:0.3,
       tpllh$G$Q = 0.4:0.4:0.4,
       tplhl$G$Q = 0.45:0.45:0.45,
       tpllh$G$QN = 0.4:0.4:0.4,
       tplhl$G$QN = 0.36:0.36:0.36,
       tpllh$RN$Q = 0.41:0.41:0.41,
       tphhl$RN$Q = 0.37:0.37:0.37,
       tplhl$RN$QN = 0.36:0.36:0.36,
       tphlh$RN$QN = 0.32:0.32:0.32,
       tplhl$SN$Q = 0.23:0.23:0.23,
       tphlh$SN$Q = 0.17:0.17:0.17,
       tpllh$SN$QN = 0.18:0.18:0.18,
       tphhl$SN$QN = 0.12:0.12:0.12,
       tminpwh$G = 0.18:0.45:0.45,
       tminpwl$RN = 0.11:0.37:0.37,
       tminpwl$SN = 0.087:0.26:0.26,
       tsetup_negedge$D$G = 0.19:0.19:0.19,
       thold_negedge$D$G = -0.094:-0.094:-0.094,
       tsetup_posedge$D$G = 0.19:0.19:0.19,
       thold_posedge$D$G = 0.00000000074:0.00000000074:0.00000000074,
       tsetup_posedge$RN$G = 0.28:0.28:0.28,
       thold_posedge$RN$G = -0.19:-0.19:-0.19,
       trec$SN$G = 0.094:0.094:0.094,
       trem$SN$G = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0.00000000000000083:0.00000000000000083:0.00000000000000083;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $setup(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$G, NOTIFIER);
     $hold (negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$G,  NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& G == 1'b0, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& G == 1'b0, trem$SN$RN, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRX2 (D, G, Q, QN, RN, SN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_ENABLE, G, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_6, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_5, QINT_6);
   buf (Q, QINT_6);
   not (QN, QINT_6);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.31:0.31:0.31,
       tphhl$D$Q = 0.4:0.4:0.4,
       tplhl$D$QN = 0.26:0.26:0.26,
       tphlh$D$QN = 0.34:0.34:0.34,
       tpllh$G$Q = 0.45:0.45:0.45,
       tplhl$G$Q = 0.5:0.5:0.5,
       tpllh$G$QN = 0.45:0.45:0.45,
       tplhl$G$QN = 0.4:0.4:0.4,
       tpllh$RN$Q = 0.45:0.45:0.45,
       tphhl$RN$Q = 0.41:0.41:0.41,
       tplhl$RN$QN = 0.4:0.4:0.4,
       tphlh$RN$QN = 0.36:0.36:0.36,
       tplhl$SN$Q = 0.26:0.26:0.26,
       tphlh$SN$Q = 0.18:0.18:0.18,
       tpllh$SN$QN = 0.21:0.21:0.21,
       tphhl$SN$QN = 0.13:0.13:0.13,
       tminpwh$G = 0.21:0.5:0.5,
       tminpwl$RN = 0.11:0.41:0.41,
       tminpwl$SN = 0.096:0.28:0.28,
       tsetup_negedge$D$G = 0.19:0.19:0.19,
       thold_negedge$D$G = -0.094:-0.094:-0.094,
       tsetup_posedge$D$G = 0.19:0.19:0.19,
       thold_posedge$D$G = 0.00000000074:0.00000000074:0.00000000074,
       tsetup_posedge$RN$G = 0.28:0.28:0.28,
       thold_posedge$RN$G = -0.19:-0.19:-0.19,
       trec$SN$G = 0.094:0.094:0.094,
       trem$SN$G = 0.00000000074:0.00000000074:0.00000000074,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0.00000000000000083:0.00000000000000083:0.00000000000000083;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $setup(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$G, NOTIFIER);
     $hold (negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$G,  NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& G == 1'b0, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& G == 1'b0, trem$SN$RN, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRX4 (D, G, Q, QN, RN, SN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_ENABLE, G, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_32, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_9, QINT_32);
   buf (Q, QINT_32);
   not (QN, QINT_32);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.33:0.33:0.33,
       tphhl$D$Q = 0.42:0.42:0.42,
       tplhl$D$QN = 0.28:0.28:0.28,
       tphlh$D$QN = 0.37:0.37:0.37,
       tpllh$G$Q = 0.5:0.5:0.5,
       tplhl$G$Q = 0.56:0.56:0.56,
       tpllh$G$QN = 0.5:0.5:0.5,
       tplhl$G$QN = 0.44:0.44:0.44,
       tpllh$RN$Q = 0.5:0.5:0.5,
       tphhl$RN$Q = 0.44:0.44:0.44,
       tplhl$RN$QN = 0.45:0.45:0.45,
       tphlh$RN$QN = 0.39:0.39:0.39,
       tplhl$SN$Q = 0.25:0.25:0.25,
       tphlh$SN$Q = 0.17:0.17:0.17,
       tpllh$SN$QN = 0.2:0.2:0.2,
       tphhl$SN$QN = 0.12:0.12:0.12,
       tminpwh$G = 0.26:0.56:0.56,
       tminpwl$RN = 0.15:0.44:0.44,
       tminpwl$SN = 0.087:0.33:0.33,
       tsetup_negedge$D$G = 0.28:0.28:0.28,
       thold_negedge$D$G = -0.094:-0.094:-0.094,
       tsetup_posedge$D$G = 0.19:0.19:0.19,
       thold_posedge$D$G = 0.00000000074:0.00000000074:0.00000000074,
       tsetup_posedge$RN$G = 0.38:0.38:0.38,
       thold_posedge$RN$G = -0.19:-0.19:-0.19,
       trec$SN$G = 0.094:0.094:0.094,
       trem$SN$G = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0.00000000000000083:0.00000000000000083:0.00000000000000083;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $setup(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$G, NOTIFIER);
     $hold (negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$G,  NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& G == 1'b0, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& G == 1'b0, trem$SN$RN, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRXL (D, G, Q, QN, RN, SN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   and (I0_ENABLE, G, RN);
   not (I0_SET, SN);
   udp_tlat (QINT_12, D, I0_ENABLE, 1'B0, I0_SET, NOTIFIER);
   not (N5_5, QINT_12);
   buf (Q, QINT_12);
   not (QN, QINT_12);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.25:0.25:0.25,
       tphhl$D$Q = 0.31:0.31:0.31,
       tplhl$D$QN = 0.21:0.21:0.21,
       tphlh$D$QN = 0.27:0.27:0.27,
       tpllh$G$Q = 0.38:0.38:0.38,
       tplhl$G$Q = 0.41:0.41:0.41,
       tpllh$G$QN = 0.36:0.36:0.36,
       tplhl$G$QN = 0.33:0.33:0.33,
       tpllh$RN$Q = 0.38:0.38:0.38,
       tphhl$RN$Q = 0.33:0.33:0.33,
       tplhl$RN$QN = 0.34:0.34:0.34,
       tphlh$RN$QN = 0.29:0.29:0.29,
       tplhl$SN$Q = 0.19:0.19:0.19,
       tphlh$SN$Q = 0.14:0.14:0.14,
       tpllh$SN$QN = 0.15:0.15:0.15,
       tphhl$SN$QN = 0.099:0.1:0.1,
       tminpwh$G = 0.18:0.41:0.41,
       tminpwl$RN = 0.11:0.33:0.33,
       tminpwl$SN = 0.069:0.23:0.23,
       tsetup_negedge$D$G = 0.19:0.19:0.19,
       thold_negedge$D$G = -0.094:-0.094:-0.094,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0.00000000074:0.00000000074:0.00000000074,
       tsetup_posedge$RN$G = 0.28:0.28:0.28,
       thold_posedge$RN$G = -0.19:-0.19:-0.19,
       trec$SN$G = 0.094:0.094:0.094,
       trem$SN$G = 0.094:0.094:0.094,
       trec$SN$RN = 0.094:0.094:0.094,
       trem$SN$RN = 0.00000000000000083:0.00000000000000083:0.00000000000000083;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (negedge SN *> (Q +: 1'b1)) = (tphlh$SN$Q, tplhl$SN$Q);
     (negedge SN *> (QN -: 1'b1)) = (tpllh$SN$QN, tphhl$SN$QN);
     (negedge RN *> (Q -: 1'b1)) = (0, tphhl$RN$Q);
     (negedge RN *> (QN +: 1'b1)) = (tphlh$RN$QN, 0);
     (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (posedge RN *> (Q +: 1'b1)) = (tpllh$RN$Q, 0);
     (posedge RN *> (QN -: 1'b1)) = (0, tplhl$RN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $setup(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$RN$G, NOTIFIER);
     $hold (negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, posedge RN, thold_posedge$RN$G,  NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $recovery(posedge SN, posedge RN &&& G == 1'b0, trec$SN$RN, NOTIFIER);
     $removal (posedge SN, posedge RN &&& G == 1'b0, trem$SN$RN, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATX1 (D, G, Q, QN);
input  D ;
input  G ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (QINT, D, G, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, QINT);
   buf (Q, QINT);
   not (QN, QINT);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.26:0.26:0.26,
       tphhl$D$Q = 0.27:0.27:0.27,
       tplhl$D$QN = 0.22:0.22:0.22,
       tphlh$D$QN = 0.22:0.22:0.22,
       tpllh$G$Q = 0.35:0.35:0.35,
       tplhl$G$Q = 0.31:0.31:0.31,
       tpllh$G$QN = 0.27:0.27:0.27,
       tplhl$G$QN = 0.3:0.3:0.3,
       tminpwh$G = 0.12:0.35:0.35,
       tsetup_negedge$D$G = 0.19:0.19:0.19,
       thold_negedge$D$G = -0.094:-0.094:-0.094,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0.00000000074:0.00000000074:0.00000000074;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (posedge G *> (Q +: D)) = (tpllh$G$Q, tplhl$G$Q);
     (posedge G *> (QN -: D)) = (tpllh$G$QN, tplhl$G$QN);
     $setup(negedge D, negedge G, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G, posedge D, thold_posedge$D$G,  NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATX2 (D, G, Q, QN);
input  D ;
input  G ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (QINT_18, D, G, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, QINT_18);
   buf (Q, QINT_18);
   not (QN, QINT_18);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.29:0.29:0.29,
       tphhl$D$Q = 0.29:0.29:0.29,
       tplhl$D$QN = 0.24:0.24:0.24,
       tphlh$D$QN = 0.25:0.25:0.25,
       tpllh$G$Q = 0.37:0.37:0.37,
       tplhl$G$Q = 0.33:0.33:0.33,
       tpllh$G$QN = 0.29:0.29:0.29,
       tplhl$G$QN = 0.32:0.32:0.32,
       tminpwh$G = 0.13:0.37:0.37,
       tsetup_negedge$D$G = 0.19:0.19:0.19,
       thold_negedge$D$G = -0.094:-0.094:-0.094,
       tsetup_posedge$D$G = 0.19:0.19:0.19,
       thold_posedge$D$G = 0.00000000074:0.00000000074:0.00000000074;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (posedge G *> (Q +: D)) = (tpllh$G$Q, tplhl$G$Q);
     (posedge G *> (QN -: D)) = (tpllh$G$QN, tplhl$G$QN);
     $setup(negedge D, negedge G, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G, posedge D, thold_posedge$D$G,  NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATX4 (D, G, Q, QN);
input  D ;
input  G ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (QINT_20, D, G, 1'B0, 1'B0, NOTIFIER);
   not (N0_5, QINT_20);
   buf (Q, QINT_20);
   not (QN, QINT_20);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.33:0.33:0.33,
       tphhl$D$Q = 0.34:0.34:0.34,
       tplhl$D$QN = 0.28:0.28:0.28,
       tphlh$D$QN = 0.29:0.29:0.29,
       tpllh$G$Q = 0.43:0.43:0.43,
       tplhl$G$Q = 0.38:0.38:0.38,
       tpllh$G$QN = 0.34:0.34:0.34,
       tplhl$G$QN = 0.38:0.38:0.38,
       tminpwh$G = 0.17:0.43:0.43,
       tsetup_negedge$D$G = 0.19:0.19:0.19,
       thold_negedge$D$G = -0.094:-0.094:-0.094,
       tsetup_posedge$D$G = 0.19:0.19:0.19,
       thold_posedge$D$G = 0.00000000074:0.00000000074:0.00000000074;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (posedge G *> (Q +: D)) = (tpllh$G$Q, tplhl$G$Q);
     (posedge G *> (QN -: D)) = (tpllh$G$QN, tplhl$G$QN);
     $setup(negedge D, negedge G, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G, posedge D, thold_posedge$D$G,  NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATXL (D, G, Q, QN);
input  D ;
input  G ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (QINT, D, G, 1'B0, 1'B0, NOTIFIER);
   not (N0_4, QINT);
   buf (Q, QINT);
   not (QN, QINT);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.24:0.24:0.24,
       tphhl$D$Q = 0.24:0.24:0.24,
       tplhl$D$QN = 0.19:0.19:0.19,
       tphlh$D$QN = 0.2:0.2:0.2,
       tpllh$G$Q = 0.32:0.32:0.32,
       tplhl$G$Q = 0.29:0.29:0.29,
       tpllh$G$QN = 0.24:0.24:0.24,
       tplhl$G$QN = 0.28:0.28:0.28,
       tminpwh$G = 0.12:0.32:0.32,
       tsetup_negedge$D$G = 0.094:0.094:0.094,
       thold_negedge$D$G = 0.00000000000000083:0.00000000000000083:0.00000000000000083,
       tsetup_posedge$D$G = 0.094:0.094:0.094,
       thold_posedge$D$G = 0.00000000074:0.00000000074:0.00000000074;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     (posedge G *> (Q +: D)) = (tpllh$G$Q, tplhl$G$Q);
     (posedge G *> (QN -: D)) = (tpllh$G$QN, tplhl$G$QN);
     $setup(negedge D, negedge G, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G, posedge D, thold_posedge$D$G,  NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tplhl$A$Y = 0.18:0.18:0.18,
       tphlh$A$Y = 0.18:0.18:0.18,
       tphhl$A$Y = 0.13:0.13:0.13,
       tpllh$B$Y = 0.09:0.09:0.09,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.16:0.16:0.16,
       tphhl$B$Y = 0.11:0.11:0.11;

     // path delays
     (posedge A *> (Y +: !B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.15:0.15:0.15,
       tplhl$A$Y = 0.23:0.23:0.23,
       tphlh$A$Y = 0.22:0.22:0.22,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.14:0.14:0.14,
       tphlh$B$Y = 0.2:0.2:0.2,
       tphhl$B$Y = 0.15:0.15:0.15;

     // path delays
     (posedge A *> (Y +: !B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.22:0.22:0.22,
       tplhl$A$Y = 0.25:0.25:0.25,
       tphlh$A$Y = 0.24:0.24:0.24,
       tphhl$A$Y = 0.25:0.25:0.25,
       tpllh$B$Y = 0.17:0.17:0.17,
       tplhl$B$Y = 0.19:0.19:0.19,
       tphlh$B$Y = 0.21:0.21:0.21,
       tphhl$B$Y = 0.16:0.16:0.16;

     // path delays
     (posedge A *> (Y +: !B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tplhl$A$Y = 0.16:0.16:0.16,
       tphlh$A$Y = 0.16:0.16:0.16,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.075:0.075:0.075,
       tplhl$B$Y = 0.099:0.099:0.099,
       tphlh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.087:0.087:0.087;

     // path delays
     (posedge A *> (Y +: !B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   xor (I0_out, A, B);
   xor (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.21:0.21:0.22,
       tplhl$A$Y = 0.31:0.31:0.32,
       tphlh$A$Y = 0.29:0.29:0.29,
       tphhl$A$Y = 0.2:0.2:0.21,
       tpllh$B$Y = 0.16:0.17:0.19,
       tplhl$B$Y = 0.17:0.19:0.2,
       tphlh$B$Y = 0.19:0.2:0.2,
       tphhl$B$Y = 0.16:0.17:0.19,
       tpllh$C$Y = 0.088:0.089:0.09,
       tplhl$C$Y = 0.11:0.12:0.12,
       tphlh$C$Y = 0.12:0.13:0.13,
       tphhl$C$Y = 0.092:0.095:0.098;

     // path delays
     (posedge A *> (Y +: !(C^B))) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !(C^B))) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !(C^A))) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !(C^A))) = (tphlh$B$Y, tphhl$B$Y);
     (posedge C *> (Y +: !(B^A))) = (tpllh$C$Y, tplhl$C$Y);
     (negedge C *> (Y +: !(B^A))) = (tphlh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   xor (I0_out, A, B);
   xor (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.21:0.22:0.22,
       tplhl$A$Y = 0.27:0.28:0.28,
       tphlh$A$Y = 0.31:0.31:0.31,
       tphhl$A$Y = 0.2:0.2:0.2,
       tpllh$B$Y = 0.16:0.18:0.19,
       tplhl$B$Y = 0.16:0.17:0.18,
       tphlh$B$Y = 0.2:0.2:0.2,
       tphhl$B$Y = 0.15:0.15:0.15,
       tpllh$C$Y = 0.092:0.092:0.093,
       tplhl$C$Y = 0.099:0.1:0.1,
       tphlh$C$Y = 0.13:0.13:0.13,
       tphhl$C$Y = 0.077:0.078:0.078;

     // path delays
     (posedge A *> (Y +: !(C^B))) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: !(C^B))) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: !(C^A))) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: !(C^A))) = (tphlh$B$Y, tphhl$B$Y);
     (posedge C *> (Y +: !(B^A))) = (tpllh$C$Y, tplhl$C$Y);
     (negedge C *> (Y +: !(B^A))) = (tphlh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.13:0.13:0.13,
       tplhl$A$Y = 0.19:0.19:0.19,
       tphlh$A$Y = 0.18:0.18:0.18,
       tphhl$A$Y = 0.14:0.14:0.14,
       tpllh$B$Y = 0.1:0.1:0.1,
       tplhl$B$Y = 0.16:0.16:0.16,
       tphlh$B$Y = 0.12:0.12:0.12,
       tphhl$B$Y = 0.1:0.1:0.1;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.16:0.16:0.16,
       tplhl$A$Y = 0.23:0.23:0.23,
       tphlh$A$Y = 0.21:0.21:0.21,
       tphhl$A$Y = 0.17:0.17:0.17,
       tpllh$B$Y = 0.14:0.14:0.14,
       tplhl$B$Y = 0.2:0.2:0.2,
       tphlh$B$Y = 0.15:0.15:0.15,
       tphhl$B$Y = 0.14:0.14:0.14;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X4 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.23:0.23:0.23,
       tplhl$A$Y = 0.25:0.25:0.25,
       tphlh$A$Y = 0.24:0.24:0.24,
       tphhl$A$Y = 0.24:0.24:0.24,
       tpllh$B$Y = 0.15:0.15:0.15,
       tplhl$B$Y = 0.22:0.22:0.22,
       tphlh$B$Y = 0.2:0.2:0.2,
       tphhl$B$Y = 0.18:0.18:0.18;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2XL (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tplhl$A$Y = 0.16:0.16:0.16,
       tphlh$A$Y = 0.16:0.16:0.16,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.087:0.087:0.087,
       tplhl$B$Y = 0.14:0.14:0.14,
       tphlh$B$Y = 0.11:0.11:0.11,
       tphhl$B$Y = 0.084:0.084:0.084;

     // path delays
     (posedge A *> (Y +: B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: A)) = (tphlh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   xor (I0_out, A, B);
   xor (Y, I0_out, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.21:0.21:0.22,
       tplhl$A$Y = 0.31:0.31:0.31,
       tphlh$A$Y = 0.29:0.29:0.29,
       tphhl$A$Y = 0.2:0.2:0.21,
       tpllh$B$Y = 0.17:0.17:0.18,
       tplhl$B$Y = 0.18:0.19:0.19,
       tphlh$B$Y = 0.18:0.19:0.21,
       tphhl$B$Y = 0.15:0.18:0.2,
       tpllh$C$Y = 0.088:0.089:0.09,
       tplhl$C$Y = 0.11:0.12:0.12,
       tphlh$C$Y = 0.12:0.13:0.13,
       tphhl$C$Y = 0.092:0.095:0.098;

     // path delays
     (posedge A *> (Y +: C^B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: C^B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: C^A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: C^A)) = (tphlh$B$Y, tphhl$B$Y);
     (posedge C *> (Y +: B^A)) = (tpllh$C$Y, tplhl$C$Y);
     (negedge C *> (Y +: B^A)) = (tphlh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR3XL (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   xor (I0_out, A, B);
   xor (Y, I0_out, C);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.22:0.22:0.23,
       tplhl$A$Y = 0.28:0.28:0.29,
       tphlh$A$Y = 0.31:0.31:0.31,
       tphhl$A$Y = 0.2:0.2:0.21,
       tpllh$B$Y = 0.18:0.18:0.18,
       tplhl$B$Y = 0.17:0.17:0.17,
       tphlh$B$Y = 0.19:0.2:0.21,
       tphhl$B$Y = 0.15:0.16:0.17,
       tpllh$C$Y = 0.091:0.092:0.092,
       tplhl$C$Y = 0.1:0.1:0.1,
       tphlh$C$Y = 0.13:0.13:0.13,
       tphhl$C$Y = 0.078:0.078:0.079;

     // path delays
     (posedge A *> (Y +: C^B)) = (tpllh$A$Y, tplhl$A$Y);
     (negedge A *> (Y +: C^B)) = (tphlh$A$Y, tphhl$A$Y);
     (posedge B *> (Y +: C^A)) = (tpllh$B$Y, tplhl$B$Y);
     (negedge B *> (Y +: C^A)) = (tphlh$B$Y, tphhl$B$Y);
     (posedge C *> (Y +: B^A)) = (tpllh$C$Y, tplhl$C$Y);
     (negedge C *> (Y +: B^A)) = (tphlh$C$Y, tphhl$C$Y);

   endspecify

endmodule
`endcelldefine

primitive udp_dff (out, in, clk, clr, set, NOTIFIER);
   output out;
   input  in, clk, clr, set, NOTIFIER;
   reg    out;

   table

// in  clk  clr   set  NOT  : Qt : Qt+1
//
   0  r   ?   0   ?   : ?  :  0  ; // clock in 0
   1  r   0   ?   ?   : ?  :  1  ; // clock in 1
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  b   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  x   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  b   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  x   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff

primitive udp_tlat (out, in, enable, clr, set, NOTIFIER);

   output out;
   input  in, enable, clr, set, NOTIFIER;
   reg    out;

   table

// in  enable  clr   set  NOT  : Qt : Qt+1
//
   1  1   0   ?   ?   : ?  :  1  ; //
   0  1   ?   0   ?   : ?  :  0  ; //
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   *  0   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  0   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  ?   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  0   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  ?   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_mux2 (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table

// in0 in1 sel :  out
//
    1  ?  0 :  1 ;
    0  ?  0 :  0 ;
    ?  1  1 :  1 ;
    ?  0  1 :  0 ;
    0  0  x :  0 ;
    1  1  x :  1 ;

   endtable
endprimitive // udp_mux2


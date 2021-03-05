/* SUDOKU, Number Placement Puzzle */

/* Written in GNU MathProg by Andrew Makhorin <mao@gnu.org> */

/* Sudoku, also known as Number Place, is a logic-based placement
   puzzle. The aim of the canonical puzzle is to enter a numerical
   digit from 1 through 9 in each cell of a 9x9 grid made up of 3x3
   subgrids (called "regions"), starting with various digits given in
   some cells (the "givens"). Each row, column, and region must contain
   only one instance of each numeral.

   Example:

   +-------+-------+-------+
   | 5 3 . | . 7 . | . . . |
   | 6 . . | 1 9 5 | . . . |
   | . 9 8 | . . . | . 6 . |
   +-------+-------+-------+
   | 8 . . | . 6 . | . . 3 |
   | 4 . . | 8 . 3 | . . 1 |
   | 7 . . | . 2 . | . . 6 |
   +-------+-------+-------+
   | . 6 . | . . . | 2 8 . |
   | . . . | 4 1 9 | . . 5 |
   | . . . | . 8 . | . 7 9 |
   +-------+-------+-------+

   (From Wikipedia, the free encyclopedia.) */

param givens{1..9, 1..9}, integer, >= 0, <= 9, default 0;
/* the "givens" */

var x{i in 1..9, j in 1..9, k in 1..9}, binary;
/* x[i,j,k] = 1 means cell [i,j] is assigned number k */

s.t. fa{i in 1..9, j in 1..9, k in 1..9: givens[i,j] != 0}:
     x[i,j,k] = (if givens[i,j] = k then 1 else 0);
/* assign pre-defined numbers using the "givens" */

s.t. fb{i in 1..9, j in 1..9}: sum{k in 1..9} x[i,j,k] = 1;
/* each cell must be assigned exactly one number */

s.t. fc{i in 1..9, k in 1..9}: sum{j in 1..9} x[i,j,k] = 1;
/* cells in the same row must be assigned distinct numbers */

s.t. fd{j in 1..9, k in 1..9}: sum{i in 1..9} x[i,j,k] = 1;
/* cells in the same column must be assigned distinct numbers */

s.t. fe{I in 1..9 by 3, J in 1..9 by 3, k in 1..9}:
     sum{i in I..I+2, j in J..J+2} x[i,j,k] = 1;
/* cells in the same region must be assigned distinct numbers */

s.t. cell_a :  +sum{k in 1..9} x[1,1,k]*k +sum{k in 1..9} x[1,2,k]*k +sum{k in 1..9} x[1,3,k]*k +sum{k in 1..9} x[1,4,k]*k = 18 ;
s.t. cell_A :  +sum{k in 1..9} x[9,1,k]*k +sum{k in 1..9} x[9,2,k]*k = 7 ;
s.t. cell_b :  +sum{k in 1..9} x[1,5,k]*k +sum{k in 1..9} x[1,6,k]*k +sum{k in 1..9} x[1,7,k]*k = 17 ;
s.t. cell_B :  +sum{k in 1..9} x[9,3,k]*k +sum{k in 1..9} x[9,4,k]*k +sum{k in 1..9} x[9,5,k]*k = 23 ;
s.t. cell_c :  +sum{k in 1..9} x[1,8,k]*k +sum{k in 1..9} x[1,9,k]*k = 10 ;
s.t. cell_C :  +sum{k in 1..9} x[9,6,k]*k +sum{k in 1..9} x[9,7,k]*k +sum{k in 1..9} x[9,8,k]*k +sum{k in 1..9} x[9,9,k]*k = 15 ;
s.t. cell_d :  +sum{k in 1..9} x[2,1,k]*k +sum{k in 1..9} x[3,1,k]*k +sum{k in 1..9} x[2,2,k]*k = 18 ;
s.t. cell_e :  +sum{k in 1..9} x[2,3,k]*k +sum{k in 1..9} x[3,3,k]*k = 3 ;
s.t. cell_f :  +sum{k in 1..9} x[2,4,k]*k +sum{k in 1..9} x[2,5,k]*k = 13 ;
s.t. cell_g :  +sum{k in 1..9} x[2,6,k]*k +sum{k in 1..9} x[2,7,k]*k = 11 ;
s.t. cell_h :  +sum{k in 1..9} x[2,8,k]*k +sum{k in 1..9} x[3,8,k]*k +sum{k in 1..9} x[2,9,k]*k = 16 ;
s.t. cell_i :  +sum{k in 1..9} x[4,1,k]*k +sum{k in 1..9} x[5,1,k]*k +sum{k in 1..9} x[3,2,k]*k +sum{k in 1..9} x[4,2,k]*k = 30 ;
s.t. cell_j :  +sum{k in 1..9} x[4,3,k]*k +sum{k in 1..9} x[3,4,k]*k +sum{k in 1..9} x[4,4,k]*k = 20 ;
s.t. cell_k :  +sum{k in 1..9} x[3,5,k]*k +sum{k in 1..9} x[4,5,k]*k +sum{k in 1..9} x[5,5,k]*k +sum{k in 1..9} x[6,5,k]*k +sum{k in 1..9} x[7,5,k]*k = 20 ;
s.t. cell_l :  +sum{k in 1..9} x[3,6,k]*k +sum{k in 1..9} x[4,6,k]*k = 3 ;
s.t. cell_m :  +sum{k in 1..9} x[3,7,k]*k +sum{k in 1..9} x[4,7,k]*k = 7 ;
s.t. cell_n :  +sum{k in 1..9} x[4,8,k]*k +sum{k in 1..9} x[3,9,k]*k +sum{k in 1..9} x[4,9,k]*k = 8 ;
s.t. cell_o :  +sum{k in 1..9} x[5,2,k]*k +sum{k in 1..9} x[5,3,k]*k +sum{k in 1..9} x[5,4,k]*k = 13 ;
s.t. cell_p :  +sum{k in 1..9} x[5,6,k]*k +sum{k in 1..9} x[5,7,k]*k +sum{k in 1..9} x[5,8,k]*k = 21 ;
s.t. cell_q :  +sum{k in 1..9} x[6,8,k]*k +sum{k in 1..9} x[7,8,k]*k +sum{k in 1..9} x[5,9,k]*k +sum{k in 1..9} x[6,9,k]*k = 22 ;
s.t. cell_r :  +sum{k in 1..9} x[6,1,k]*k +sum{k in 1..9} x[7,1,k]*k +sum{k in 1..9} x[6,2,k]*k = 7 ;
s.t. cell_s :  +sum{k in 1..9} x[6,3,k]*k +sum{k in 1..9} x[7,3,k]*k = 9 ;
s.t. cell_t :  +sum{k in 1..9} x[6,4,k]*k +sum{k in 1..9} x[7,4,k]*k = 10 ;
s.t. cell_u :  +sum{k in 1..9} x[6,6,k]*k +sum{k in 1..9} x[7,6,k]*k +sum{k in 1..9} x[6,7,k]*k = 22 ;
s.t. cell_v :  +sum{k in 1..9} x[8,1,k]*k +sum{k in 1..9} x[7,2,k]*k +sum{k in 1..9} x[8,2,k]*k = 16 ;
s.t. cell_w :  +sum{k in 1..9} x[7,7,k]*k +sum{k in 1..9} x[8,7,k]*k = 11 ;
s.t. cell_x :  +sum{k in 1..9} x[8,8,k]*k +sum{k in 1..9} x[7,9,k]*k +sum{k in 1..9} x[8,9,k]*k = 14 ;
s.t. cell_y :  +sum{k in 1..9} x[8,3,k]*k +sum{k in 1..9} x[8,4,k]*k = 8 ;
s.t. cell_z :  +sum{k in 1..9} x[8,5,k]*k +sum{k in 1..9} x[8,6,k]*k = 13 ;
s.t. dist_cell_i {k in 1..9} : +x[4,1,k] +x[5,1,k] +x[3,2,k] +x[4,2,k]  <= 1;
s.t. dist_cell_j {k in 1..9} : +x[4,3,k] +x[3,4,k] +x[4,4,k]  <= 1;
s.t. dist_cell_n {k in 1..9} : +x[4,8,k] +x[3,9,k] +x[4,9,k]  <= 1;
s.t. dist_cell_q {k in 1..9} : +x[6,8,k] +x[7,8,k] +x[5,9,k] +x[6,9,k]  <= 1;
s.t. dist_cell_r {k in 1..9} : +x[6,1,k] +x[7,1,k] +x[6,2,k]  <= 1;
s.t. dist_cell_u {k in 1..9} : +x[6,6,k] +x[7,6,k] +x[6,7,k]  <= 1;

/* there is no need for an objective function here */

solve;

for {i in 1..9}
{  for {0..0: i = 1 or i = 4 or i = 7}
      printf " +-------+-------+-------+\n";
   for {j in 1..9}
   {  for {0..0: j = 1 or j = 4 or j = 7} printf(" |");
      printf " %d", sum{k in 1..9} x[i,j,k] * k;
      for {0..0: j = 9} printf(" |\n");
   }
   for {0..0: i = 9}
      printf " +-------+-------+-------+\n";
}

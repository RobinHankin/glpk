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



/* now for the numeric restrictions imposed by the killer cages: */

s.t. nonets{I in 1..9 by 3, J in 1..9 by 3}:
     sum{i in I..I+2, j in J..J+2, k in 1..9} x[i,j,k]*k = 45;

s.t. rows{i in 1..9}: sum{j in 1..9, k in 1..9} x[i,j,k]*k = 45;
s.t. cols{j in 1..9}: sum{i in 1..9, k in 1..9} x[i,j,k]*k = 45;

/* first all two-cell cages */

s.t. cella01: sum{k in 1..9} x[1,1,k]*k + sum{k in 1..9} x[2,1,k]*k = 11;
s.t. cella02: sum{k in 1..9} x[1,3,k]*k + sum{k in 1..9} x[1,4,k]*k = 13;  
s.t. cella03: sum{k in 1..9} x[1,5,k]*k + sum{k in 1..9} x[1,6,k]*k = 04;
s.t. cella04: sum{k in 1..9} x[5,2,k]*k + sum{k in 1..9} x[5,3,k]*k = 16;
s.t. cella05: sum{k in 1..9} x[5,7,k]*k + sum{k in 1..9} x[5,8,k]*k = 08;
s.t. cella06: sum{k in 1..9} x[5,1,k]*k + sum{k in 1..9} x[6,1,k]*k = 06;
s.t. cella07: sum{k in 1..9} x[6,5,k]*k + sum{k in 1..9} x[6,6,k]*k = 15;
s.t. cella08: sum{k in 1..9} x[9,4,k]*k + sum{k in 1..9} x[9,5,k]*k = 08;
s.t. cella09: sum{k in 1..9} x[9,6,k]*k + sum{k in 1..9} x[9,7,k]*k = 04;
s.t. cella10: sum{k in 1..9} x[4,9,k]*k + sum{k in 1..9} x[5,9,k]*k = 08;
s.t. cella11: sum{k in 1..9} x[8,9,k]*k + sum{k in 1..9} x[9,9,k]*k = 16;
s.t. cella12: sum{k in 1..9} x[4,4,k]*k + sum{k in 1..9} x[4,5,k]*k = 12;


/* now all straight three-cell cages:   */
s.t. cellb01: sum{k in 1..9} x[2,3,k]*k + sum{k in 1..9} x[2,4,k]*k + sum{k in 1..9}x[2,5,k]*k  = 13;
s.t. cellb02: sum{k in 1..9} x[3,5,k]*k + sum{k in 1..9} x[3,6,k]*k + sum{k in 1..9}x[3,7,k]*k  = 18;
s.t. cellb03: sum{k in 1..9} x[5,4,k]*k + sum{k in 1..9} x[5,5,k]*k + sum{k in 1..9}x[5,6,k]*k  = 11;
s.t. cellb04: sum{k in 1..9} x[7,3,k]*k + sum{k in 1..9} x[7,4,k]*k + sum{k in 1..9}x[7,5,k]*k  = 18;
s.t. cellb05: sum{k in 1..9} x[8,5,k]*k + sum{k in 1..9} x[8,6,k]*k + sum{k in 1..9}x[8,7,k]*k  = 15;

/* some bent shaped ones */
s.t. cellb06: +sum{k in 1..9} x[1,8,k]*k + sum{k in 1..9} x[1,9,k]*k + sum{k in 1..9}x[2,8,k]*k  = 19;
s.t. cellb07: sum{k in 1..9} x[1,7,k]*k + sum{k in 1..9} x[2,6,k]*k + sum{k in 1..9}x[2,7,k]*k  = 16;
s.t. cellb08: sum{k in 1..9} x[8,2,k]*k + sum{k in 1..9} x[9,1,k]*k + sum{k in 1..9}x[9,2,k]*k  = 15;
s.t. cellb09: sum{k in 1..9} x[8,3,k]*k + sum{k in 1..9} x[8,4,k]*k + sum{k in 1..9}x[9,3,k]*k  = 13;




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

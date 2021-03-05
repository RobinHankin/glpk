 /* SUDOKU, Number Placement Puzzle */

/* Written in GNU MathProg by Andrew Makhorin <mao@gnu.org> */

/* Sudoku, also known as Number Place, is a logic-based placement
   puzzle. The aim of the canonical puzzle is to enter a numerical
   digit from 1 through 9 in each cell of a 9x9 grid made up of 3x3
   subgrids (called "regions"), starting with various digits given in
   some cells (the "givens"). Each row, column, and region must contain
   only one instance of each numeral.

*/


var x{i in 1..9, j in 1..9, k in 1..9}, binary;
/* x[i,j,k] = 1 means cell [i,j] is assigned number k */

s.t. fb{i in 1..9, j in 1..9}: sum{k in 1..9} x[i,j,k] = 1;
/* each cell must be assigned exactly one number */

s.t. fc{i in 1..9, k in 1..9}: sum{j in 1..9} x[i,j,k] = 1;
/* cells in the same row must be assigned distinct numbers */

s.t. fd{j in 1..9, k in 1..9}: sum{i in 1..9} x[i,j,k] = 1;
/* cells in the same column must be assigned distinct numbers */

s.t. fe{I in 1..9 by 3, J in 1..9 by 3, k in 1..9}:
     sum{i in I..I+2, j in J..J+2} x[i,j,k] = 1;
/* cells in the same nonet must be assigned distinct numbers */

s.t. ineq_1178A:  sum{k in 1..9} k*x[1,7,k]>= sum{k in 1..9} k*x[1,8,k];
s.t. ineq_1156B:  sum{k in 1..9} k*x[1,5,k]<= sum{k in 1..9} k*x[1,6,k];
s.t. ineq_2256A:  sum{k in 1..9} k*x[2,5,k]>= sum{k in 1..9} k*x[2,6,k];
s.t. ineq_2289A:  sum{k in 1..9} k*x[2,8,k]>= sum{k in 1..9} k*x[2,9,k];
s.t. ineq_2223B:  sum{k in 1..9} k*x[2,2,k]<= sum{k in 1..9} k*x[2,3,k];
s.t. ineq_2245B:  sum{k in 1..9} k*x[2,4,k]<= sum{k in 1..9} k*x[2,5,k];
s.t. ineq_3323B:  sum{k in 1..9} k*x[3,2,k]<= sum{k in 1..9} k*x[3,3,k];
s.t. ineq_3356B:  sum{k in 1..9} k*x[3,5,k]<= sum{k in 1..9} k*x[3,6,k];
s.t. ineq_4423A:  sum{k in 1..9} k*x[4,2,k]>= sum{k in 1..9} k*x[4,3,k];
s.t. ineq_4489A:  sum{k in 1..9} k*x[4,8,k]>= sum{k in 1..9} k*x[4,9,k];
s.t. ineq_5523A:  sum{k in 1..9} k*x[5,2,k]>= sum{k in 1..9} k*x[5,3,k];
s.t. ineq_5556A:  sum{k in 1..9} k*x[5,5,k]>= sum{k in 1..9} k*x[5,6,k];
s.t. ineq_5578A:  sum{k in 1..9} k*x[5,7,k]>= sum{k in 1..9} k*x[5,8,k];
s.t. ineq_5512B:  sum{k in 1..9} k*x[5,1,k]<= sum{k in 1..9} k*x[5,2,k];
s.t. ineq_6623A:  sum{k in 1..9} k*x[6,2,k]>= sum{k in 1..9} k*x[6,3,k];
s.t. ineq_6678A:  sum{k in 1..9} k*x[6,7,k]>= sum{k in 1..9} k*x[6,8,k];
s.t. ineq_7723A:  sum{k in 1..9} k*x[7,2,k]>= sum{k in 1..9} k*x[7,3,k];
s.t. ineq_7756A:  sum{k in 1..9} k*x[7,5,k]>= sum{k in 1..9} k*x[7,6,k];
s.t. ineq_7778B:  sum{k in 1..9} k*x[7,7,k]<= sum{k in 1..9} k*x[7,8,k];
s.t. ineq_7789B:  sum{k in 1..9} k*x[7,8,k]<= sum{k in 1..9} k*x[7,9,k];
s.t. ineq_8845A:  sum{k in 1..9} k*x[8,4,k]>= sum{k in 1..9} k*x[8,5,k];
s.t. ineq_8878A:  sum{k in 1..9} k*x[8,7,k]>= sum{k in 1..9} k*x[8,8,k];
s.t. ineq_9978A:  sum{k in 1..9} k*x[9,7,k]>= sum{k in 1..9} k*x[9,8,k];
s.t. ineq_2122C:  sum{k in 1..9} k*x[2,2,k]>= sum{k in 1..9} k*x[1,2,k];
s.t. ineq_2177C:  sum{k in 1..9} k*x[2,7,k]>= sum{k in 1..9} k*x[1,7,k];
s.t. ineq_2188C:  sum{k in 1..9} k*x[2,8,k]>= sum{k in 1..9} k*x[1,8,k];
s.t. ineq_2199C:  sum{k in 1..9} k*x[2,9,k]>= sum{k in 1..9} k*x[1,9,k];
s.t. ineq_2133D:  sum{k in 1..9} k*x[2,3,k]<= sum{k in 1..9} k*x[1,3,k];
s.t. ineq_2144D:  sum{k in 1..9} k*x[2,4,k]<= sum{k in 1..9} k*x[1,4,k];
s.t. ineq_2155D:  sum{k in 1..9} k*x[2,5,k]<= sum{k in 1..9} k*x[1,5,k];
s.t. ineq_3255C:  sum{k in 1..9} k*x[3,5,k]>= sum{k in 1..9} k*x[2,5,k];
s.t. ineq_3288C:  sum{k in 1..9} k*x[3,8,k]>= sum{k in 1..9} k*x[2,8,k];
s.t. ineq_3299C:  sum{k in 1..9} k*x[3,9,k]>= sum{k in 1..9} k*x[2,9,k];
s.t. ineq_3244D:  sum{k in 1..9} k*x[3,4,k]<= sum{k in 1..9} k*x[2,4,k];
s.t. ineq_3277D:  sum{k in 1..9} k*x[3,7,k]<= sum{k in 1..9} k*x[2,7,k];
s.t. ineq_5411C:  sum{k in 1..9} k*x[5,1,k]>= sum{k in 1..9} k*x[4,1,k];
s.t. ineq_5499C:  sum{k in 1..9} k*x[5,9,k]>= sum{k in 1..9} k*x[4,9,k];
s.t. ineq_5422D:  sum{k in 1..9} k*x[5,2,k]<= sum{k in 1..9} k*x[4,2,k];
s.t. ineq_5466D:  sum{k in 1..9} k*x[5,6,k]<= sum{k in 1..9} k*x[4,6,k];
s.t. ineq_5488D:  sum{k in 1..9} k*x[5,8,k]<= sum{k in 1..9} k*x[4,8,k];
s.t. ineq_6555C:  sum{k in 1..9} k*x[6,5,k]>= sum{k in 1..9} k*x[5,5,k];
s.t. ineq_6566C:  sum{k in 1..9} k*x[6,6,k]>= sum{k in 1..9} k*x[5,6,k];
s.t. ineq_6577C:  sum{k in 1..9} k*x[6,7,k]>= sum{k in 1..9} k*x[5,7,k];
s.t. ineq_6511D:  sum{k in 1..9} k*x[6,1,k]<= sum{k in 1..9} k*x[5,1,k];
s.t. ineq_6522D:  sum{k in 1..9} k*x[6,2,k]<= sum{k in 1..9} k*x[5,2,k];
s.t. ineq_6533D:  sum{k in 1..9} k*x[6,3,k]<= sum{k in 1..9} k*x[5,3,k];
s.t. ineq_8722C:  sum{k in 1..9} k*x[8,2,k]>= sum{k in 1..9} k*x[7,2,k];
s.t. ineq_8733D:  sum{k in 1..9} k*x[8,3,k]<= sum{k in 1..9} k*x[7,3,k];
s.t. ineq_8777D:  sum{k in 1..9} k*x[8,7,k]<= sum{k in 1..9} k*x[7,7,k];
s.t. ineq_8788D:  sum{k in 1..9} k*x[8,8,k]<= sum{k in 1..9} k*x[7,8,k];
s.t. ineq_9844C:  sum{k in 1..9} k*x[9,4,k]>= sum{k in 1..9} k*x[8,4,k];
s.t. ineq_9866C:  sum{k in 1..9} k*x[9,6,k]>= sum{k in 1..9} k*x[8,6,k];
s.t. ineq_9855D:  sum{k in 1..9} k*x[9,5,k]<= sum{k in 1..9} k*x[8,5,k];

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

end;



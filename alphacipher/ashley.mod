/* alphacipher */

var x{i in 1..26, j in 1..26}, binary;

/* x[i,j]=1 means x[i] = j; x[1] = "A", x[2] = "B" and so on.
So "x[3,4]=1" means "C=4".
*/

s.t. let{j in 1..26}: sum{i in 1..26} x[i,j] = 1;
/* each letter must be assigned exactly one number */

s.t. num{i in 1..26}: sum{j in 1..26} x[i,j] = 1;
/* each letter must be assigned exactly one number */





/* NB  my first idea was to write lines like this:

s.t. ashley: sum{i in (01, 19, 08, 12, 05, 25), j in 1..26} j*x[i,j] = 47
                        a   s   h   l   e   y 


this is OK but only if there is no repeated letter.  EG "coppelia", is
no OK because of the repeated "P"  (the repeats do not have to be
together to cause a problem).  The problem arises because the letters
of coppelia are not a set.

So I have to do something like

s.t. ashley: sum{j in 1..26} j*x[1,j] + sum{j in 1..26} j*x[19,j] + ... = 47


*/
s.t. ashley:  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[8,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[25,j]  =  47 ;
s.t. bjorn:  sum{j in 1..26} j*x[2,j] +  sum{j in 1..26} j*x[10,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[14,j]  =  58 ;
s.t. coppelia:  sum{j in 1..26} j*x[3,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[16,j] +  sum{j in 1..26} j*x[16,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[1,j]  =  63 ;
s.t. coralli:  sum{j in 1..26} j*x[3,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[9,j]  =  50 ;
s.t. dolin:  sum{j in 1..26} j*x[4,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[14,j]  =  31 ;
s.t. dowell:  sum{j in 1..26} j*x[4,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[23,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[12,j]  =  56 ;
s.t. fonteyn:  sum{j in 1..26} j*x[6,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[20,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[25,j] +  sum{j in 1..26} j*x[14,j]  =  62 ;
s.t. giselle:  sum{j in 1..26} j*x[7,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[5,j]  =  40 ;
s.t. gorsky:  sum{j in 1..26} j*x[7,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[11,j] +  sum{j in 1..26} j*x[25,j]  =  58 ;
s.t. grey:  sum{j in 1..26} j*x[7,j] +  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[25,j]  =  39 ;
s.t. ivanov:  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[22,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[22,j]  =  42 ;
s.t. kirsova:  sum{j in 1..26} j*x[11,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[22,j] +  sum{j in 1..26} j*x[1,j]  =  52 ;
s.t. manon:  sum{j in 1..26} j*x[13,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[14,j]  =  29 ;
s.t. massine:  sum{j in 1..26} j*x[13,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[5,j]  =  33 ;
s.t. nerina:  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[1,j]  =  27 ;
s.t. onegin:  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[7,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[14,j]  =  37 ;
s.t. paquita:  sum{j in 1..26} j*x[16,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[17,j] +  sum{j in 1..26} j*x[21,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[20,j] +  sum{j in 1..26} j*x[1,j]  =  75 ;
s.t. petipa:  sum{j in 1..26} j*x[16,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[20,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[16,j] +  sum{j in 1..26} j*x[1,j]  =  44 ;
s.t. rambert:  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[13,j] +  sum{j in 1..26} j*x[2,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[20,j]  =  64 ;
s.t. salome:  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[13,j] +  sum{j in 1..26} j*x[5,j]  =  33 ;
s.t. somes:  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[13,j] +  sum{j in 1..26} j*x[5,j] +  sum{j in 1..26} j*x[19,j]  =  27 ;
s.t. sylvia:  sum{j in 1..26} j*x[19,j] +  sum{j in 1..26} j*x[25,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[22,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[1,j]  =  40 ;
s.t. taglioni:  sum{j in 1..26} j*x[20,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[7,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[9,j]  =  53 ;
s.t. ulanova:  sum{j in 1..26} j*x[21,j] +  sum{j in 1..26} j*x[12,j] +  sum{j in 1..26} j*x[1,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[22,j] +  sum{j in 1..26} j*x[1,j]  =  49 ;
s.t. zorina:  sum{j in 1..26} j*x[26,j] +  sum{j in 1..26} j*x[15,j] +  sum{j in 1..26} j*x[18,j] +  sum{j in 1..26} j*x[9,j] +  sum{j in 1..26} j*x[14,j] +  sum{j in 1..26} j*x[1,j]  =  46 ;
s.t. a: x[1,2] = 0;
s.t. b: x[2,18] = 0;
s.t. c: x[3,17] = 0;
s.t. d: x[4,10] = 0;
s.t. e: x[5,4] = 0;
s.t. f: x[6,24] = 0;
s.t. g: x[7,14] = 0;
s.t. h: x[8,22] = 0;
s.t. ii: x[9,7] = 0;
s.t. jj: x[10,23] = 0;
s.t. k: x[11,16] = 0;
s.t. l: x[12,5] = 0;
s.t. m: x[13,15] = 0;
s.t. n: x[14,3] = 0;
s.t. o: x[15,6] = 0;
s.t. p: x[16,11] = 0;
s.t. q: x[17,25] = 0;
s.t. r: x[18,8] = 0;
s.t. s: x[19,1] = 0;
s.t. t: x[20,9] = 0;
s.t. u: x[21,19] = 0;
s.t. v: x[22,12] = 0;
s.t. w: x[23,26] = 0;
s.t. xx: x[24,21] = 0;
s.t. y: x[25,13] = 0;
s.t. z: x[26,20] = 0;
solve;

for {i in 1..26}
{  
      printf " %d", sum{j in 1..26} j*x[i,j]; 
}
printf(" \n");

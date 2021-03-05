/* n1+n2+n3+n4+n5==30, n1 + 2n2 + 4n3 +5n4 + 17n5 == 2000 in integers */

var n{1..5}, integer, >= 0;

s.t. number: sum{i in 1..5} n[i] = 30;
s.t. money: n[1] + 2*n[2] + 4*n[3] + 5*n[4] + 17*n[5] = 200;



solve;

printf "n1 %d\n", n[1];
printf "n2 %d\n", n[2];
printf "n3 %d\n", n[3];
printf "n4 %d\n", n[4];
printf "n5 %d\n", n[5];

end;

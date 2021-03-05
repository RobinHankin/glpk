/* n1+n2+n3==30, 20n1 + 2n2 + n3 == 200 in integers */

var n{1..3}, integer, >= 0;

s.t. number: sum{i in 1..3} n[i] = 30;
s.t. money: 20*n[1] + 2*n[2] + n[3] = 200;


solve;




printf "adults   %d\n", n[1];
printf "teens    %d\n", n[2];
printf "children %d\n", n[3];

end;

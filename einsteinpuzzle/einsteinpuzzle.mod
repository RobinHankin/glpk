/*
Einstein's puzzle is as follows.

* There are 5 houses in five different colors.
* In each house lives a person with a different nationality.
* These five owners drink a certain type of beverage, smoke a certain brand of cigar and keep a certain pet.
* No owners have the same pet, smoke the same brand of cigar or drink the same beverage.

The question is: Who owns the fish?

Hints

* The Brit lives in the red house
* The Swede keeps dogs as pets
* The Dane drinks tea
* The green house is on the left of the white house
* The green house's owner drinks coffee
* The person who smokes Pall Mall rears birds
* The owner of the yellow house smokes Dunhill
* The man living in the center house drinks milk
* The Norwegian lives in the first house
* The man who smokes blends lives next to the one who keeps cats
* The man who keeps horses lives next to the man who smokes Dunhill
* The owner who smokes BlueMaster drinks beer
* The German smokes Prince
* The Norwegian lives next to the blue house
* The man who smokes blend has a neighbor who drinks water


colour <- c("red","green","white","yellow","blue")               # 1
number <- c("one","two","three","four","five")                   # 2
nationality <- c("Brit","Swede","Dane","Norwegian","German")     # 3
pet <- c("dogs","birds","cats","horses","fish")                  # 4
drink <- c("tea","coffee","milk","beer","water")                 # 5
smoke <- c("Pall Mall","Dunhill","Blends","BlueMaster","Prince") # 6

index <- c(colour=1, number=2, nationality=3,pet=4,drink=5,smoke=6)
*/


var x12{i in 1..6, j in 1..6}, binary;
var x13{i in 1..6, j in 1..6}, binary;
var x14{i in 1..6, j in 1..6}, binary;
var x15{i in 1..6, j in 1..6}, binary;
var x16{i in 1..6, j in 1..6}, binary;
var x23{i in 1..6, j in 1..6}, binary;
var x24{i in 1..6, j in 1..6}, binary;
var x25{i in 1..6, j in 1..6}, binary;
var x26{i in 1..6, j in 1..6}, binary;
var x34{i in 1..6, j in 1..6}, binary;
var x35{i in 1..6, j in 1..6}, binary;
var x36{i in 1..6, j in 1..6}, binary;
var x45{i in 1..6, j in 1..6}, binary;
var x46{i in 1..6, j in 1..6}, binary;
var x56{i in 1..6, j in 1..6}, binary;


maximize neighbours: x34[1,3] * x34[2,3] + x34[4,3] ;

s.t. x12rowlatin{j in 1..6}: sum{i in 1..6} x12[i,j] = 1; s.t. x12collatin{i in 1..6}: sum{j in 1..6} x12[i,j] = 1;
s.t. x13rowlatin{j in 1..6}: sum{i in 1..6} x13[i,j] = 1; s.t. x13collatin{i in 1..6}: sum{j in 1..6} x13[i,j] = 1;
s.t. x14rowlatin{j in 1..6}: sum{i in 1..6} x14[i,j] = 1; s.t. x14collatin{i in 1..6}: sum{j in 1..6} x14[i,j] = 1;
s.t. x15rowlatin{j in 1..6}: sum{i in 1..6} x15[i,j] = 1; s.t. x15collatin{i in 1..6}: sum{j in 1..6} x15[i,j] = 1;
s.t. x16rowlatin{j in 1..6}: sum{i in 1..6} x16[i,j] = 1; s.t. x16collatin{i in 1..6}: sum{j in 1..6} x16[i,j] = 1;
s.t. x23rowlatin{j in 1..6}: sum{i in 1..6} x23[i,j] = 1; s.t. x23collatin{i in 1..6}: sum{j in 1..6} x23[i,j] = 1;
s.t. x24rowlatin{j in 1..6}: sum{i in 1..6} x24[i,j] = 1; s.t. x24collatin{i in 1..6}: sum{j in 1..6} x24[i,j] = 1;
s.t. x25rowlatin{j in 1..6}: sum{i in 1..6} x25[i,j] = 1; s.t. x25collatin{i in 1..6}: sum{j in 1..6} x25[i,j] = 1;
s.t. x26rowlatin{j in 1..6}: sum{i in 1..6} x26[i,j] = 1; s.t. x26collatin{i in 1..6}: sum{j in 1..6} x26[i,j] = 1;
s.t. x34rowlatin{j in 1..6}: sum{i in 1..6} x34[i,j] = 1; s.t. x34collatin{i in 1..6}: sum{j in 1..6} x34[i,j] = 1;
s.t. x35rowlatin{j in 1..6}: sum{i in 1..6} x35[i,j] = 1; s.t. x35collatin{i in 1..6}: sum{j in 1..6} x35[i,j] = 1;
s.t. x36rowlatin{j in 1..6}: sum{i in 1..6} x36[i,j] = 1; s.t. x36collatin{i in 1..6}: sum{j in 1..6} x36[i,j] = 1;
s.t. x45rowlatin{j in 1..6}: sum{i in 1..6} x45[i,j] = 1; s.t. x45collatin{i in 1..6}: sum{j in 1..6} x45[i,j] = 1;
s.t. x46rowlatin{j in 1..6}: sum{i in 1..6} x46[i,j] = 1; s.t. x46collatin{i in 1..6}: sum{j in 1..6} x46[i,j] = 1;
s.t. x56rowlatin{j in 1..6}: sum{i in 1..6} x56[i,j] = 1; s.t. x56collatin{i in 1..6}: sum{j in 1..6} x56[i,j] = 1;



s.t. x1213{i in 1..6, j in 1..6, k in 1..6}: x12[i, j] + x13[i, k] <= x23[j, k] + 1 ;
s.t. x1214{i in 1..6, j in 1..6, k in 1..6}: x12[i, j] + x14[i, k] <= x24[j, k] + 1 ;
s.t. x1215{i in 1..6, j in 1..6, k in 1..6}: x12[i, j] + x15[i, k] <= x15[j, k] + 1 ;
s.t. x1216{i in 1..6, j in 1..6, k in 1..6}: x12[i, j] + x16[i, k] <= x26[j, k] + 1 ;

s.t. x1314{i in 1..6, j in 1..6, k in 1..6}: x13[i, j] + x14[i, k] <= x34[j, k] + 1 ;
s.t. x1315{i in 1..6, j in 1..6, k in 1..6}: x13[i, j] + x15[i, k] <= x35[j, k] + 1 ;
s.t. x1316{i in 1..6, j in 1..6, k in 1..6}: x13[i, j] + x16[i, k] <= x36[j, k] + 1 ;

s.t. x1415{i in 1..6, j in 1..6, k in 1..6}: x14[i, j] + x15[i, k] <= x45[j, k] + 1 ;
s.t. x1416{i in 1..6, j in 1..6, k in 1..6}: x14[i, j] + x16[i, k] <= x46[j, k] + 1 ;

s.t. x1516{i in 1..6, j in 1..6, k in 1..6}: x15[i, j] + x16[i, k] <= x56[j, k] + 1 ;

# ==================

s.t. x2324{i in 1..6, j in 1..6, k in 1..6}: x23[i, j] + x24[i, k] <= x34[j, k] + 1 ;
s.t. x2325{i in 1..6, j in 1..6, k in 1..6}: x23[i, j] + x25[i, k] <= x35[j, k] + 1 ;
s.t. x2326{i in 1..6, j in 1..6, k in 1..6}: x23[i, j] + x26[i, k] <= x36[j, k] + 1 ;

s.t. x2425{i in 1..6, j in 1..6, k in 1..6}: x24[i, j] + x25[i, k] <= x45[j, k] + 1 ;
s.t. x2426{i in 1..6, j in 1..6, k in 1..6}: x24[i, j] + x26[i, k] <= x46[j, k] + 1 ;

s.t. x2526{i in 1..6, j in 1..6, k in 1..6}: x25[i, j] + x26[i, k] <= x56[j, k] + 1 ;

# ==================

s.t. x3435{i in 1..6, j in 1..6, k in 1..6}: x34[i, j] + x35[i, k] <= x45[j, k] + 1 ;
s.t. x3436{i in 1..6, j in 1..6, k in 1..6}: x34[i, j] + x36[i, k] <= x46[j, k] + 1 ;

s.t. x3536{i in 1..6, j in 1..6, k in 1..6}: x35[i, j] + x36[i, k] <= x56[j, k] + 1 ;

# ==================

s.t. x4546{i in 1..6, j in 1..6, k in 1..6}: x45[i, j] + x46[i, k] <= x56[j, k] + 1 ;



# The Brit lives in the red house: colour = #1[red=1], nationality = #3[Brit=1]
s.t. con1: x13[1, 1] == 1 ; 

# The Swede keeps dogs as pets; nationality = #3[swede=2], pet= #4[dog=1]
s.t. con2: x34[2, 1] == 1 ;

# The Dane drinks tea; nationality = #3[Dane=1], drink = #5[tea=1]
s.t. con3:x35[3, 1] == 1;

# The green house is on the left of the white house: colour = #1[green=2, white=3], number = #2
s.t. con4: sum{k in 1..6} x12[2,k]*k  <= sum{k in 1..6} x12[3,k]*k ;

# The green house's owner drinks coffee: colour = #1[green=2], drink = #5[coffee=2]
s.t. con5: x15[2, 2] == 1 ; 

# The person who smokes Pall Mall rears birds: pets = #4[birds=2], smokes = #6[Pall Mall=1]
s.t. con6: x46[2, 1] == 1 ;

# The owner of the yellow house smokes Dunhill:  colour = #1[yellow=4], smokes = #6[Dunhill=3]
s.t. con7: x14[4, 3] == 1 ; 

# The man living in the center house drinks milk: number = #2[three=3], drink = #5[milk=3]
s.t. con8: x25[3, 3] == 1 ;

# The Norwegian lives in the first house: number = #2[first=1], nationality = #3[Norwegian=4]
s.t. con9: x23[1, 4] == 1 ;

# The man who smokes blends lives next to the one who keeps cats:
# number = #2[abs(x-y)==1], pets = #4[cats=3] smokes = #6[blends = 3]

# So it's *either* (cats@no. 1 and blends@no. 2) or (cats@no. 2 and blends@ no. 1) 
#         *or*     (cats@no. 2 and blends@no. 3) or (cats@no. 3 and blends@ no. 2) 
#         *or*     (cats@no. 3 and blends@no. 4) or (cats@no. 4 and blends@ no. 3) 
#         *or*     (cats@no. 4 and blends@no. 5) or (cats@no. 5 and blends@ no. 4) 
#         *or*     (cats@no. 5 and blends@no. 6) or (cats@no. 6 and blends@ no. 5) 



#  add_constraint(
#  x24[1,3]*x26[2,3] + x24[2,3]*x26[1,3] +
#  x24[2,3]*x26[3,3] + x24[3,3]*x26[2,3] +
#  x24[3,3]*x26[4,3] + x24[4,3]*x26[3,3] +
#  x24[4,3]*x26[5,3] + x24[5,3]*x26[4,3] +
#  x24[5,3]*x26[6,3] + x24[6,3]*x26[5,3] >= 1)




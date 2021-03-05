# this creates a file called filename_modfile  which is used as, for example,
# "glpsol --minisat -m killer_mindbending.mod".

# It reads a dataframe from filename_9x9_letters which shows the
# positions of the cages in a literal ascii block.  Note that the
# scheme is capitalization sensitive.

# It also reads a dataframe from filename_cagetotals which has three
# columns: the first is the name of the cage (as above), the second
# column is the total for that cage, and the third is logical with "T"
# meaning that the restriction for different entries is active (and
# not just a consequence of the entire cage being within a single row,
# col, or nonet, in which case it gets an "F").

filename_9x9_letters <- "killer_hardest_ever.txt"
filename_cagetotals  <- "killer_hardest_ever_cage.txt" 

filename_killer_setup <- "killer_setup.txt"
filename_killer_end   <- "killer_end.txt"

filename_modfile      <- "killer_hardest_ever.mod"


jj <- readLines(filename_9x9_letters)

## M is a diagram of the cages in the grid:
M <- do.call("rbind",sapply(jj,function(x){strsplit(x,split='')}))
colnames(M) <- NULL
rownames(M) <- NULL

cagecells <- list()

cagenames <- names(table(M))

for(i in cagenames){
  x <- which(M==i,arr.ind=TRUE)
  out <- list(x)
  names(out) <- i
  cagecells <- c(cagecells,out)
}

# so now cagecells[["t"]] gives the row/col location of the cells in cage 't'





jj <- read.table(filename_cagetotals,header=TRUE)
cagetot <- jj[,2]
names(cagetot) <- jj[,1]

cageextra <- jj[,3]
names(cageextra) <- jj[,1]

# now we have three consistent datasets, cagecells, cagetot and
# cageextra.  cagecells[["t"]], cagetot[["t"]], cageextra[["t"]] give
# cell locations, cage total, and whether extra stuff is needed, all
# for cage 't'


# "s.t. cellb01: sum{k in 1..9} x[2,3,k]*k + sum{k in 1..9} x[2,4,k]*k + sum{k in 1..9}x[2,5,k]*k = 13;"


# and add them to the file one by one.


sum_string <- list()
for(i in cagenames){
  cellstring  <- paste("s.t. cell_",i," : ",sep="")
  xy <- as.data.frame(cagecells[i])
  for(n in seq_len(nrow(xy))){
    fish <- unlist(xy[n,])
    cellstring <- paste(cellstring," +sum{k in 1..9} x[",fish[1],",",fish[2],",k]*k",sep="")
  }
  sum_string[[i]] <- paste(cellstring, "=",cagetot[i],";")
}


# now extra requirement for cells to contain only distinct numbers:
# the idea is that we create lines that look like

# "s.t. distinct_h: {k in 1..9}  x[4,6,k] + x[4,7,k] + x[3,8,k] + x[4,8,k] + x[2,9,k] + x[3,9,k] <= 1"
# (which is to say that no number appears more than once in the cage.



distinct_string <- list()
for(i in names(which(cageextra))){
  cellstring  <- paste("s.t. dist_cell_",i," {k in 1..9} :",sep="")
  xy <- as.data.frame(cagecells[i])
  for(n in seq_len(nrow(xy))){
    fish <- unlist(xy[n,])
    cellstring <- paste(cellstring," +x[",fish[1],",",fish[2],",k]",sep="")
  }
  distinct_string[[i]] <- paste(cellstring, " <= 1;")
}




# add the killer restrictions one by one: the aim is to generate lines
# that look like


# Now read the first bit of killer.mod:
text <- readLines(filename_killer_setup)
tex2 <- readLines(filename_killer_end)

write(text,file=filename_modfile,append=FALSE)
for(i in      sum_string){   write(i,file=filename_modfile,append=TRUE) }
for(i in distinct_string){   write(i,file=filename_modfile,append=TRUE) }
write(tex2,file=filename_modfile,append=TRUE)
write("end;",file=filename_modfile,append=TRUE)


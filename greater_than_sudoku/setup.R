infilename  <- "infile.txt"

a <- readLines(infilename)

stopifnot(length(a) == 19)

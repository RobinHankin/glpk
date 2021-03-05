# this creates a file with filename specified in variable
# filename_modfile.  "ashley.mod" is a good example. This is used as
# "glpsol --minisat -m ashley.mod".

filename_modfile <- "ashley.mod"
header_modfile   <- "header.txt" 
footer_modfile   <- "footer.txt" 
word_file        <- "ashleydata.txt"

lookforanother <- TRUE # set to TRUE if you want to search for another solution

d <- read.table("ashleydata.txt",header=FALSE)
colnames(d) <- c("word","val")

wordlist <- as.character(d$word)


# following R code goes through the rows of d and creates lines like

# s.t. ashley: sum{i in (01, 19, 08, 12, 05, 25)} j*x[i,j] = 47
#/*                       a   s   h   l   e   y
#*/

write(readLines(header_modfile),file=filename_modfile,append=FALSE)

for(i in seq_along(wordlist)){
    word <- wordlist[i]
    text <- paste("s.t. ",word,": ",sep="")
    value <- d$val[i]

    wl <- strsplit(word,"")[[1]]
    for(j in seq_along(wl)){
        num <- which(letters==wl[j])
        text <- paste(text," sum{j in 1..26} j*x[",num,",j]",sep="")
        if(j<length(wl)){
            text <- paste(text," + ",sep="")
        }
    }
    text <- paste(text," = " , d$val[i], ";")
    write(text,file=filename_modfile,append=TRUE)
}




if(lookforanother){   #disallow the solution found with lookforanother=FALSE
    ## write lines like "s.t. a: x[1,2]=0;"
    a <- scan("forbidden.txt")
    for(i in seq_along(a)){
        text <- paste("s.t. ",letters[i],": x[",i,",",a[i],"] = 0;",sep="")
        write(text,file=filename_modfile,append=TRUE)
    }
}

write("solve;",file=filename_modfile,append=TRUE)
write(readLines(footer_modfile),file=filename_modfile,append=TRUE) # footer prints solution to stdout

setwd("C:/Users/Hayden/Documents/GitHub/bootcamp-2016-example")


#Exercise 1

#want something that prints nothing for 8 lines and then prints an asterisk on line 9
#want it to run from 1:9
#so if ii==1:8 then print "", drop a line with the \n thing
#but if (or is it else?) ii==9 then print "*"

for(ii in 1:9){
  if(ii==9){
    cat("*")
  }
  else{
    cat(" \n")
  }
}

#don't use print in these functions it will give you the an output following [] and it does not follow the \n function

#Exercise 2
#Not sure how well I can modify this loop to work this way
#want to print 10 asterisks, each asterisk separted by 1 "&"
#no new spaces or new line characters
#all on one line
#so modify it to work 10 times
#or go whole hog and do the alternating thing with the %% effect, lets go with that
#need to go 19 times, make *'s on odds, &'s on evens
#don't forget the quote marks
for(ii in 1:19){
  if(ii%%2){
    cat("*")
  }
  else{
    cat("&")
  }
}
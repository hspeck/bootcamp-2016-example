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
#it works! yay


#Exercise 3
#dogs variable counts as 10, 5 iterations, will overwrite dog variable to add 1
#at aka start dogs=10
#at i=1 dogs=11
#at i=2 dogs=12
#at i=3 dogs=13
#at i=4 dogs=14
#at i=5 dogs=15 (end)

#meatloaf assigned as 0 to start, 
#for iterations 5-9 meatloaf is subtracting i and adding 1
#afterward it cat (meatloaf) value
#from experimentation there seems to be unstated parantheses around the stuff behind the assigner
#at start meatloaf =0
#at i=5 meatloaf=-4
#at i=6 meatloaf=-9
#at i=7 meatloaf=-15
#at i=8 meatloaf=-22
#at i=9 meatloaf=-30 (end)

#bubbles starts at 12
#it iterates through -1 to -4, going in that direction,
#at each i value it reassigns value of bubbles to i
#at start bubbles=12
#at i=-1 bubbles=-1
#at i=-2 bubbles=-2
#at i=-3 bubbles=-3
#at i=-4 bubbles=-4


#Exercise 4
#want to modify message, says to try with modulus
#want to code so it gives message in presedential and congressional years (presendential years are divisible by 4, congressional ones are divisble by 2)
#will need a separate if statement for presendential years, this should be %%4, the other should be %%2
#only congressional when year divided by 4 has remainder 2 so use that to call it alone, and make separate message when divisible by 4 with r=0 for both of them
years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 4 == 2){
    cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = T)
  }
  if(years[ii]%% 4==0){
    cat(years[ii], "Hooray, presidential and congressional elections!", sep = '\t', fill=T)
  }
}
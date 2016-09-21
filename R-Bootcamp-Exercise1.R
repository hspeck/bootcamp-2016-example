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

#seems to work


#Exercise 5
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
compounded<-c(rep(0,length(bankAccounts) ))
interestRate <- 0.0125;
for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }
#error message this code says "object 'compounded' not found
#seems to mean we should initialize the compounded vector, and second hint seems to mean making a starting vector of 0
#seems to have worked
print(compounded)
#so this is the new account total for the students in order 10.12500, 9.31500, 5.67000, 3.74625, 8.91000, 0.50625


#Exercise 6 

bankAccounts2 <- c(10, 9.2, 5.6); #define bank accounts here
Netbalance<-c(rep(0,length(bankAccounts2)))
compounded2<-c(rep(0,length(bankAccounts2)))
interestRate<- 0.0525
house<-c(4.8, 3.8, 5.7) #deduct
food<-c(3.5, 4.3, 5.0)   #deduct
fun <-c(7.8, 2.1, 10.5) #deduct
#Let's just make one variable for expenses aka all of the abov summed
expenses<- house+food+fun
# expenses is 16.1, 10.2, 21.2, so third TA's growth should be slightly less than compound intrest, or decline somewhat, as they are running a deficit income vs expenses
#2 should be fastests, as will have biggest net income, 1st somewhere in middle

#and incomes (through TAships) of 
income <- c(21, 21, 21) #add this

for(j in  1:5) {
  for (i in 1:length(bankAccounts2)) 
    {
    #step 1 modify bankAccounts so that amounts reflect income and expenses
      #so each year
        #subtract expenses
        #add the income
    Netbalance[i]<-(bankAccounts2[i] -expenses[i] +income[i])
    #step 2 get calculate interest and add to accounts from step 1
    Netbalance[i] <- (interestRate +1 )*Netbalance[i]; }
  print(Netbalance)
  bankAccounts2<-Netbalance
    #printing is a check to see if it works
    #you can actually use the line you have already written if you
    #modify amounts in bankAccounts directly in step 1
  #now we need to modify this so that it performs the inner loop
  #had trouble figuring it out, but relized it was cycling through the loop, just the loop wasn't closed 
  #to close loop had to assign the compounded2 back to the start to feed through the loop
}

  
  
  
#Exercise 7
#expense and income data is same between exercise 7 and 6, so the loop above works ok for that
#want modify loop above so it runs from 2015-2020
  #i.e. for j in 2015-2020
#want on odd numbered years to give students 1 and 3 extra $5000 (aka 5 in the above)
  #odd numbers can be achieved with modulus
  #aka if j %% 2 == 1 the year is odd
  #in this case can add a vector at the end of the year disbursment<-c(5,0,5) to the compounded2 vector

#Define variables
bankAccounts3 <- c(10, 9.2, 5.6); 
Netbalance<-c(rep(0,length(bankAccounts3)))
compounded3<-c(rep(0,length(bankAccounts3)))
interestRate<- 0.0525
house<-c(4.8, 3.8, 5.7) 
food<-c(3.5, 4.3, 5.0)  
fun <-c(7.8, 2.1, 10.5) 
expenses<- house+food+fun
income <- c(21, 21, 21)
disbursments<-c(5,0,5)

for(j in  2015:2020) {
  for (i in 1:length(bankAccounts3)) {
    Netbalance[i]<-(bankAccounts3[i] -expenses[i] +income[i])
 if (j %% 2 == 1) {
    Netbalance<-Netbalance+disbursments
  }
    compounded3[i] <- (interestRate +1 )*Netbalance[i]; }
  bankAccounts3<-compounded3
  print(bankAccounts3)
  print(j)
}
#comparing this to the above shows that for 2015 there is a roughly 5k+intrest increase for students 1 and 3 and can see the 5kish increases on year 2017/2019 by lookin at 3 which has little growth from interest


#Exercise 8
#use while loop to sum all numbers 1:17
#need to use an index as seen in class
#basic structure of while loop
  #while (some condition is True) {thing to do}
  #what condition?
  #can do two variables, one to track, one to calculate
  #==!18? that might work ok, but not general
  #how about while tracker variable<18 tracker+1 and add the new tracker to the calculator
  #should actually only do till tracker<17 as it will become 17 in the function when they add it when it goes through as 16


tracker<-0
calculator<-0
while(tracker<17){
  tracker<-tracker+1
  calculator<-calculator+tracker
}
print(calculator)
#gives same result as sum(1:17)



#Exercise 9
#write a function that takes a number
#prints "small" if lessthan or equla to -1,
#prints "medium" if betwen -1 and +1
#prints "big" if greater than or equal to +1
#using else if statements to state that

sizeteller <-function(x){
  if (x<= (-1)){
    print("small")
  }
  else if (x>=1){
    print("big")
  }
  else{
    print("medium")
  }
}
#testing the three cases
sizeteller(-2)
sizeteller(0)
sizeteller(4)
#works out
sizeteller(0.5)

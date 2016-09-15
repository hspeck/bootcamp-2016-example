setwd("C:/Users/Hayden/Documents/GitHub/bootcamp-2016-example")

#assuming that height normal distribution mean 69, sd of 10

#1
#need a function called get_heights 
#that will use rnorm to get a sample of heihgts
#storing it in variable "Heights"
#make it so that can be used for both 100 and 1000

get_heights<-function(num){
  heights<-rnorm(num, mean=69, sd=10)
}

#calling number from 100 first sample
hist(get_heights(100))

hist(get_heights(1000))
#checking the outputs with hist shows that it has worked yay!
#it works


#2 and #3 (worked for both)
#want to compute average height from heights vector
get_heights<-function(num){
  heights<-rnorm(num, mean=69, sd=10);
  average=mean(heights);
  return(average)
}

x<-get_heights(100)
average_heights

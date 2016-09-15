setwd("C:/Users/Hayden/Documents/GitHub/bootcamp-2016-example")
rm(list=ls())

#I. Use ChickWeight R dataset
#1. plot and examine if there is a stat difference between the weights of chicks 
#assigned different diet treatments on day 1
ChickWeight
names(ChickWeight)
plot(ChickWeight$weight)
#ChickWeight has 4 different diets,
#are assigned different diets at different time scales
#titles are weight, time, chick, Diet, 
#chicks are assigned a number and their times are monitored
#so we want to plot the weight of all time 0s, separating out the different individuals by the diet
#making an object for it?
#pull out the rows associated with Time=0
chkwtdy0<-ChickWeight[ChickWeight$Time==0,]
chkwtdy0
#now we want to plot the weight vs. Diet of them
windows()
plot(chkwtdy0$Diet, chkwtdy0$weight, xlab="Diet", ylab="Weight")
#gives a barplot, based on this it seems like there is little difference between all of them
#to test we will run an anova, we want to examine weight by diet
chkwtdy0aov<-aov(chkwtdy0$Diet ~ chkwtdy0$weight)
class(chkwtdy0$Diet)
help(aov)


#3 
data<-ChickWeight
data<-within(data, {
  Chick<-factor(Chick)
  Diet<-factor(Diet)
  Time<-(Time)
})
aov()
})
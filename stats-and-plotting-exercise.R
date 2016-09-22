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
chkwtdy0<-ChickWeight[ChickWeight$Time==0,]
chkwtdy0
data0<-chkwtdy0
chkwtdy0aov<-aov(chkwtdy0$Diet ~ chkwtdy0$weight)
class(chkwtdy0$Diet)
help(aov)
#Doing actual work now
data0<-chkwtdy0aov
data0<-within(data0, {
  Chick<-factor(Chick)
  Diet<-factor(Diet)
})
summary(aov(weight~Diet, data=data0))
#P value 0.346, not significant



#2 for the next example do the same thing for day21
chkwtdy21<-ChickWeight[ChickWeight$Time==21,]
chkwtdy21

window
plot(chkwtdy21$Diet, chkwtdy21$weight, xlab="Diet", ylab="Weight")
#Not as closely clustered as before. there is some overlap of the box plots, but perhaps it is little enough for there to be some significance 


data21<-chkwtdy21
data<-within(data21, {
  Chick<-factor(Chick)
  Diet<-factor(Diet)
})
summary(aov(weight~Diet, data=data21))
#P value is less than 0.01 so it seems likely to be signficant, depending on what p value we aim for


#3 
#this was given by Bernard
data<-ChickWeight
data<-within(data, {
  Chick<-factor(Chick)
  Diet<-factor(Diet)
  Time<-(Time)
})
summary(aov(weight~Diet*Time+Error(Chick), data=data))
#P value is very low, something is significant
#check with Tukey test
ChickWeightaov<-aov(weight~Diet , data=data)
TukeyHSD(ChickWeightaov)
#some of these are significant compared to others including 3 vs 1,yay


#4 Plot the effects of diet on Chick growth
#so, would like to call out for all chicks whose diet =1 to be the same color, 
#can do a barplot but should be a line plot showing the weight of the chicks in the separate programs as time advances, 
#so scatterplot of points with each color coressponding to one diet, x is time, y is weight

#let's define some colors of the diet types
cols2<-c("blue", "red", "green", "orange")[unclass(ChickWeight$Diet)]
#now we plot it, basing it off the code used in class
windows()
plot(ChickWeight$Time, ChickWeight$weight,main = "Diet effect on Weight of Chick", xlab='Time',ylab='Weight',
     col=cols2, 
     pch=16,las=1,cex.axis=1.5,cex.lab=1.5) 
legend("topleft", legend=unique(ChickWeight$Diet), text.col=c("blue", "red", "green", "orange"),pch=16, col=c("blue", "red", "green", "orange"))
#This is a scatter plot of the dots plotting weight vs Time

help(unclass)
#5
#using a "for" loop plot the weight of each individual chick in a different color all on the same plot

#likely want to make the chick's weight a line to make it easier to see and determine
#for loop likely will use the variable for the chick's individual number as determined by the "Chick" column
  #this can be our "i" variable
#can use plot(NA, xlim, ylim) to set an open active window to plot things in
# xlim should be 0,21, y lim upper bound of data is around 375, could just set it to 400 to be pretty
#colors function can assign color based on R's internal naming scheme, but probably isn't the appropriate function to call right now
#rainbow function creates a contiguous spectrum of colors for n arguements
  #so set up a vector that contains the sequence created by rainbow
  #cycle through this vector using color[i] to access the appropriate color depending on what the Chick column value is
#need to call out all data for which ChickWeight$Chick== i, i.e. all data for which the column Chick has the value i, will cycle through the values and plot them
#need to assign data from row for which chick # is i, make it a variable that gets reassigned depending on the Chick #
#lines function uses x and y values separately, can use the rows we called out as "rows" to plot the points and connect them together


#so first open window
#then create the vacant plot to repeatedly write the line function to, and determine its size
#label the graph and axes
#set the vector of colors with the rainbow function
#create the for loop pulling out all values for which Chick column==i
#assign this matrix to a new variable
#plot it with lines
  #put all values in Time column to x, values in Weight column to Y
  #set color to [i] of the color vector
windows()
plot(NA, xlim=c(0,21), ylim=c(0,400), main = "Individual Weight Gain in Chicks over Time",xlab = "Time", ylab = "Weight")
color<-rainbow(50)
for (i in 1:50){
  rows<-(ChickWeight$Chick== i)
  lines(x=ChickWeight$Time[rows], y=ChickWeight$weight[rows], col=color[i])
}
#yay it worked!

setwd("C:/Users/Hayden/Documents/GitHub/bootcamp-2016-example")
rm(list=ls())
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
}

#3 now return the heights
get_heights<-function(num){
  heights<-rnorm(num, mean=69, sd=10);
  average=mean(heights);
  return(average)
}

get_heights(100)
get_heights(1000)
#both give results around 69

#4
#need to repeat multiple times with for loop, 
#so for 1:1000, get_heights()
#save for each value into the position i of a vector mean_heights_100 
#can use rep function to generate a vector that is certain value long but a repeated number it multiple times

mean_heights_100<-c(rep(0, 1000))
for (i in 1:1000){
  mean_heights_100[i]<-get_heights(100)
}
print(mean_heights_100)
#checking it, and the values are around 69

#5
#doing the same thing but changing the input of get_heights to 1000
mean_heights_1000<-c(rep(0, 1000))
for (i in 1:1000){
  mean_heights_1000[i]<-get_heights(1000)
}
print(mean_heights_1000)


#6
#plot histogram of the distribution of the average heights for sample size of 100 and 1000
#the two sets of data should be plotted on same axes
#add a legend
#label the axes
#plot data from 100 samples in red
#plot data from 1000 samples in blue
#will likely need to set the x value to be big enough
  #can set x axis size with xlim=c(start,stop)
  #can set breaks with breaks=desired break size

bins2<-seq(65, 73, by=0.5)
counts_m_h_100<-hist(mean_heights_100, breaks=bins2)$counts
counts_m_h_1000<-hist(mean_heights_1000, breaks=bins2)$counts
pdf(file="Average_Height_Histogram.pdf", width=6,height=6)
par(mfrow=c(1,1), mar=c(4, 4, 3, 2))
barplot(rbind(counts_m_h_100,counts_m_h_1000), names.arg = c(seq(65,72.5, by=0.5)), col=c(2,4), beside=T, xlab="Average height (inches)", ylab="Count")
legend(6,350,c("n=100","n=1000"),col=c(2,4),lwd=4)
dev.off()
#issue, had to reorder where names.arg went, before col instead of after
#issue names.arg not have incorrect number of names

#basing it on the example in class
#thinking logically
  #there will be one less bin than break
  #therefore need names= one less interval (set by "by=") than the number of breaks
  #set it manually


#finished!!!
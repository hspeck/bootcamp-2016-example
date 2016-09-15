getwd()
setwd("C:/Users/Hayden/Documents/GitHub/bootcamp-2016-example")
?lm
xx<-2
22->yy
grad.school.tips <- c( "use a reference manager", "learn a programming language", "write lots of papers")
?str
cat(grad.school.tips)
ls()
rm(y)
rm(yy)
rm(list=ls())
ls()
library(ape)
list.files()
tt<-read.tree("tree.tre")
str(tt)
attributes(tt)
tt$tip.label[1:10]
pruned.tree<-drop.tip(tt, tt$tip.label[1:7900])
plot(ladderize(pruned.tree))

for(ii in 1:5){
  cat("\nthe number is ", ii)
}

notfish<-c("bat", "dolphin", "toad", "sold")
for(animal in notfish){
  cat(animal, "fish/n", sep="")
}
#that didn't quite work
xx<-1
while (xx<5) {
  xx <- xx+1 ;
  if (xx==3){
    break; }
}

print(xx)
#not working

xx<-"a"
xx=="a"
xx=="ab"
"a"==xx

for(ii in 1:6){
  if (ii %% 2) {
    cat(ii, " is odd\n")
  }
  else{
    cat(ii, " is even\n")
  }
}
#not printing, something else needed
#works now

help(rnorm)






#Day2 stuff
x<-c(1,5,10,45)
mean(x)
length(x)
2*x

x<-seq(1,10, by=0.1)
sample(x, size=2)
sample(x[1:3], size=2, replace = T)

seq(1,4, by=0.1)
x<-c(seq(1,9, by=2))
x
x[3]
x[-2]


x<-seq(1,10)
y=matrix(x,nrow=2,ncol=5)
y
y[2,]
y[,]
y[2,1]

x=c(5,3,4,NA)
mean(x)
mean(x, na.rm=TRUE)


apply(y,1,mean)
apply(y,2,mean)



#Plotting and Stats Noa Pinter-Wollman stuff
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
#not printing something else

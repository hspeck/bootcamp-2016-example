setwd("C:/Users/Hayden/Documents/GitHub/bootcamp-2016-example")
rm(list=ls())

#using same data set as before
#make sure the name of the thing doesn't have extraneous ".txt"s in them
snpsDataFrame<-read.table("hapmap_CEU_r23a_chr2_ld.txt", header=TRUE)
#make it a matrix
snps=as.matrix(snpsDataFrame)
#let's make a testing variable that fails if we don't remove NA's
testSNP=snps["rs6717613_A",]


#1.QQ plots
#a Chi-Square for Hardy-Weinberg as performed previously
compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n
  chisq=sum((obscnts-expcnts)^2/expcnts)
  return(chisq)
}
#so we have that
#want to apply to every row in order to get chi-square of each SNP
chisqs=apply(snps,1,compute_chisquare)
#applying to data snps, 1 is for rows, compute_chisquare is the function, we assign the output to chisqs
#use the pchisq formula to get the p-values
pvals=pchisq(chisqs,1,lower.tail=FALSE)
#we use the pchisq function to the data chisqs, degrees of freedom=1 , turn lower tail false



#b. want the proportion of p values lower than a certain amount, 0.05, 0.01, 0.001
#let's use the mean function
mean(pvals<0.05)
#0.04509218
mean(pvals<0.01)
#0.01021425
mean(pvals<0.001)
#0.00124564, so appears to have some
sum(pvals<0.001)
#there are 5 SNPs with pvalue below 0.001

#seems about what we'd expect


#c How many SNPs were tested for departure from H-W eq. 
#hint How many P-values do you have
#hint try using "length" function
#save in variable "num_pval"

#we tested all the SNPs for departure from H-W, so every p-value in the vector should correspond to a SNP
length(pvals)
#4014 pvalues
num_pval<-length(pvals)


#d you have num_pval total P-values
#if null is true, smallest P-value expected to be 1/num_pval
#second is 2/num_pval
#etc
#calculate vector of expected P-values for chi-square test
#save in vector->exp_pvals
#can try using seq?, will be increments of 1/num_pval, eh, let's go with scalar multiplication

exp_pvals<-c(1:num_pval)*(1/num_pval)

#e observed P-values in pvals vector, need to sort smallest to largest
help(sort)
#sort defaults to sorting in ascended order
sort_pvals<-sort(pvals)


#f to see what happening with small pvalues,
#take -log10(P-value) find for sorted and expected
help(log10)
log_sort_pvals<- -log10(sort_pvals)
log_exp_pvals<- -log10(exp_pvals)


#g want to plot log_sort_pvals, log_exp_pvals, first attempt was inverted y and x, forgot dependent is said first then independent
#pch changes point style, 20 is closed circle
windows()
plot(log_exp_pvals, log_sort_pvals, xlab="-log10(expected P-value)", ylab = "-log(observed P-value)", pch=20)


#h add a diagonal
#abline (intercept, slope, how to change color to red?, col=2, lwd=lineweight, lty= line style)
abline(0,1, col=2, lty=2, lwd=2)
#success, changed the graphics to make it more similar 


#2
#a. load file pheno.sim.2014.txt, 
#store in data frame zz
#second column has the blood glucose measurement
#want to use header=T for read.table
zz<-read.table("pheno.sim.2014.txt", header=T )
#remember the want to use the $ to pull out the data associated with this column


#b. find the value such that 25% of individuals have less than this value
# mean? that will give proportion, can use quartile?
#no its the quantile function

quantile(zz$glucose_mmolperL, 0.25, na.rm=T)
# 25% of individuals have phenotypic value less than 4.78456


#c find such that 25% have more than this, aka the 75% quantile
quantile(zz$glucose_mmolperL, 0.75, na.rm=T)
# 25% of individuals have phenotype higher than 7.354975

#d want density plot of distribution of phenotypes (blood glucose levels)
#add vert lines to plot at 75% and 25% use the ablines
windows()
plot(density(zz$glucose_mmolperL), xlab="mmolperL",ylab="Percent individuals", main="Blood glucose", col=4, lwd=3)
#for abline v=x intercept for vertical lines
abline(v=(quantile(zz$glucose_mmolperL, 0.25)), col=2, lty=2, lwd=1)
abline(v=(quantile(zz$glucose_mmolperL, 0.75)), col=2, lty=2, lwd=1)

#seems like it works


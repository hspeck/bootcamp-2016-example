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


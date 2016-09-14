#Plotting stuff
setwd("C:/Users/Hayden/Documents/GitHub/bootcamp-2016-example")

s1<-rnorm(1000,mean=0, sd=1)
s3<-rnorm(1000, mean=0, sd=3)
pdf("Normal_hist.pdf", width=4, height=7)
par(mfrow=c(2,1), mar=c(4, 4, 3, 2)) 
hist(s1, col=2, xlab="Value", main="Sigma=1")
hist(s3,col = 4, xlab = "Value", main="Sigma3")
dev.off()

pdf("Normal_hist.pdf", width=4, height=7)
par(mfrow=c(2,1), mar=c(4, 4, 3, 2)) 
hist(s1, col=2, xlab="Value", main=expression(paste(sigma,"=1")))
hist(s3,col = 4, xlab = "Value", main=expression(paste(sigma,"=1")))
dev.off()

pdf("Normal_hist.pdf", width=6, height=6)
par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) 
plot(density(s1),col=2, lwd=4, xlab="Value", xlim=c(-15,15), main="Normal Distribution")
lines(density(s3), col=4, lwd=4)
legend(-15,0.4, c("sigma=1", "sigma=3", lwd=4, col=c(2,4),cex=1.5))
abline(v=quantile(s1,0.9),lty=2,lwd=3,col=2)
abline(v=quantile(s3,0.9),lty=2,lwd=3,col=4)
dev.off()
#needs a bit of work
#got it to work

pdf(file="Normal_boxplot.pdf",width=6,height=6)
par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) 
boxplot(cbind(s1,s3),names=c("Sigma=1","Sigma=3"),main="Draws from a normal distribution",col=c(2,4))
dev.off()

hist(s1)
hist(s1)$breaks
hist(s1)$counts
bins<- seq(-10 , 10 ,by=1)
#this is justshowing stuff
hist(s1,breaks=bins)$breaks
#end digression
hist(s1,breaks=bins)
counts_s1<-hist(s1,breaks=bins)$counts
counts_s3<-hist(s3,breaks=bins)$counts
#this is giving me an error saying some of x is not counted

bins<-seq(-15,15,by=1)
hist(s1,breaks=bins)$breaks
hist(s3,breaks=bins)$breaks
#made the bins bigger and it worked

#making the plot
pdf(file="normal_barplot.pdf", width=6,height=6);
par(mfrow=c(1,1), mar=c(4, 4, 3, 2))
barplot(rbind(counts_s1,counts_s3),col=c(2,4),beside=T,names.arg=seq(-10,9.5,by=1),xlab="Value",ylab="Count")
legend(6,350,c(expression(paste(sigma,"=3")),expression(paste(sigma,"=6"))),col=c(2,4),lwd=4)
dev.off()
#not working

mean(s1>1.96)
mean(s1<0)
s1<0



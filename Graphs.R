#install.packages("latex2exp")
#install.packages("scales")

library(latex2exp)
library(scales)

draw_origin <- function(opacity){
  abline(0,0,col=alpha("red",opacity),lty=2)
  abline(v=0,col=alpha("red",opacity),lty=2)
}




linearfunctions <- list(function(x){x}, function(x){2*x+1}, function(x){-3*x+3})

nonlinearfunctions <- list(.Primitive("exp"), .Primitive("log"), .Primitive("tan"))

linearfunctionstring <- c("f(x) = x", "f(x) = 2x+1", "f(x) = -3x+3")

nonlinearfunctionstring <- c("x^2", "log", "tan")



xlim=c(-5,5)
ylim=c(-5,5)

png("images/LinearFunctionsExamples.png",height=346, width=1021)
par(mfrow=c(1,3))
sapply(seq_along(linearfunctions),function(f){plot(linearfunctions[[f]],xlab="x",ylab="y",main=TeX(linearfunctionstring)[f],xlim=xlim,ylim=ylim,lwd=2.5,col=f+1)})
dev.off()

png("images/NonLinearFunctionsExamples.png",height=346, width=1021)
par(mfrow=c(1,3))
sapply(seq_along(nonlinearfunctions),function(f){plot(nonlinearfunctions[[f]],xlab="x",ylab="y",main=TeX(nonlinearfunctionstring[f]),xlim=c(-5,5),ylim=c(-5,5),lwd=2.5,col=f+4)})
dev.off()



xlim <- c(-1,1)
ylim <- c(-1,1)


slope_functions <- list(function(x){x/2},function(x){x},function(x){2*x})
slope_functions2 <- list(function(x){-x/2},function(x){-x},function(x){-2*x})

slope_function_names<-c("slope = 1/2","slope = 1","slope = 2")
slope_function_names2<-c("slope = -1/2","slope = -1","slope = -2")

png("images/SlopeExamples.png",height=655, width=1179)
par(mfrow=c(2,4))
plot(NULL,xlim=xlim,ylim=ylim,main="slope = 0")
abline(h=0,col=2,lwd=2)
draw_origin(0.3)

sapply(seq_along(slope_functions),function(i){
  plot(slope_functions[[i]],col=i+2,main=slope_function_names[i],ylab="y",xlab="x",xlim=xlim,ylim=ylim,lwd=2)
  draw_origin(0.3)
})

plot(NULL,xlim=xlim,ylim=ylim,main="slope = 1")
abline(v=0,col=6,lwd=2)
draw_origin(0.3)


sapply(rev(seq_along(slope_functions2)),function(i){
  plot(slope_functions2[[i]],col=5+i,main=slope_function_names2[i],ylab="y",xlab="x",xlim=xlim,ylim=ylim,lwd=2)
  draw_origin(0.3)
})
dev.off()

png("images/InterceptExamples.png",height=600, width=600)
f1<-function(x){x}
f2<-function(x){x+2}
xlim<-c(-5,5)
ylim<-c(-5,5)
plot(f1,xlim=xlim,ylim=ylim, lwd=1.5,xlab="x",ylab="y")
abline(3,1,lwd=2,col="Red",lty=2)
abline(-3,1,lwd=2,col="blue",lty=2)

legend("topright", c("f(x) = x","f(x) = x + 3","f(x) = x - 3"),
       col = c("black","red","blue"),
       lty = c(1, 2,2), lwd = 2, inset = 0.05
)
dev.off()

png("images/RegressionExample.png",height=800, width=800)
model<-lm(Volume~Girth,data=trees)
plot(Volume~Girth, data=trees,main="Model fit to tree data",pch=19,cex=1.3)
abline(model,lwd=2,col="red")
dev.off()

png("images/trees.png",height=400, width=400)
plot(Volume~Girth, data=trees,main="Trees Data",pch=19,cex=1.3)
dev.off()



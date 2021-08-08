#install.packages(latex2exp)
library(latex2exp)

linearfunctions <- list(function(x){x}, function(x){2*x+1}, function(x){-3*x+3})

nonlinearfunctions <- list(.Primitive("exp"), .Primitive("log"), .Primitive("tan"))

linearfunctionstring <- c("f(x) = x", "f(x) = 2x+1", "f(x) = -3x+3")

nonlinearfunctionstring <- c("x^2", "log", "tan")


xlim=c(-5,5)
ylim=c(-5,5)

#par(mfrow=c(1,3))
#sapply(seq_along(linearfunctions),function(f){plot(linearfunctions[[f]],xlab="x",ylab="y",main=TeX(linearfunctionstring)[f],xlim=xlim,ylim=ylim,lwd=2.5,col=f+1)})

par(mfrow=c(1,3))
sapply(seq_along(nonlinearfunctions),function(f){plot(nonlinearfunctions[[f]],xlab="x",ylab="y",main=TeX(nonlinearfunctionstring[f]),xlim=c(-5,5),ylim=c(-5,5),lwd=2.5,col=f+4)})
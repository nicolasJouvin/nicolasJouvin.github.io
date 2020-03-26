var1<-c(-3.3, -4.4, -1.9, 3.3, 2.5, 3.2, 0.3, 0.1, -0.1, -0.5)
groupe<-c(1, 1, 1, 2, 2, 2, 2, 3, 3, 3)

dat<-data.frame(var1, groupe)

plot(x=var1,y=rep(0, length(var1)), col=groupe, pch = '+')

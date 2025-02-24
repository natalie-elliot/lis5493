myscript <- read.csv("example_data.csv")
plot(myscript$xdata, myscript$ydata, col="red")

# some guesses for the parameters
p1 <- 1
p2 <- 0.2

# do the fit
fit <- nls(ydata ~ p1*cos(p2*xdata) + p2*sin(p1*xdata), 
           data = myscript, start = list(p1=p1, p2=p2))

# plot the fitted line
new <- data.frame(xdata = seq(min(myscript$xdata), max(myscript$xdata), len=200))
lines(new$xdata, predict(fit, newdata=new))

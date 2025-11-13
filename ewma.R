library(astsa)

set.seed(666)
x = arima.sim(list(order = c(0,1,1), ma = -0.8), n = 10000)
(x.ima = HoltWinters(x, beta=FALSE, gamma=FALSE)) # α below is 1−λ
# Smoothing parameter: alpha: 0.1663072
plot(x.ima)
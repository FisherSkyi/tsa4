library(vars)
library(astsa)

x = cbind(cmort, tempr, part)

summary(VAR(x, p=1, type="both"))

VARselect(x, lag.max=10, type="both")
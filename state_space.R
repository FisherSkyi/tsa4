library(vars)
library(astsa)

# plot(blood, type='p', pch=0, xlab='day', main='')

# Ex6.2 global warming example
# note: the name of dataset is changed
# see also: https://cran.r-project.org/web/packages/astsa/astsa.pdf
ts.plot(gtemp_both, gtemp_land, col=c(6,4))
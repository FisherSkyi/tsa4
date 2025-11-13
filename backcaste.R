library(astsa)

set.seed(90210)

n_of_p = 20

x = arima.sim(list(order = c(1,0,1), ar =.9, ma=.5), n = 100)
xr = rev(x) # xr is the reversed data

pxr = predict(arima(xr, order=c(1,0,1)), n_of_p) # predict the reversed data
pxrp = rev(pxr$pred) # reorder the predictors (for plotting)
pxrse = rev(pxr$se) # reorder the SEs

nx = ts(c(pxrp, x), start=-(n_of_p-1)) # attach the backcasts to the data
plot(nx, ylab=expression(X[~t]), main=
       'Backcasting')

U = nx[1:n_of_p] + pxrse; L = nx[1:n_of_p] - pxrse # upper and lower bound

xx = c(-(n_of_p-1):0, 0:-(n_of_p-1)); yy = c(L, rev(U))

polygon(xx, yy, border = 8, col = gray(0.6, alpha = 0.2))
lines(-(n_of_p-1):0, nx[1:n_of_p], col=2, type='o')
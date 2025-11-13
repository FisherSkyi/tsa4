library(astsa)

x = AirPassengers
lx = log(x); 
dlx = diff(lx); 
ddlx = diff(dlx, 12)

sarima.for(lx, 36, 0, 1, 1, 0, 1, 1, 12)
# paras: 0,1,1, 0,1,1, 12
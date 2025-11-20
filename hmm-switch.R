library(MSwM)
library(astsa)
set.seed(90210)

dflu = diff(flu)
model = lm(dflu~ 1)

mod = msmFit(model, k=2, p=2, sw=rep(TRUE,4)) # 2 regimes, AR(2)s

summary(mod)
# 1. Close any existing devices (do this a few times until you see "null device")
while (!is.null(dev.list())) dev.off()

# 2. (On macOS terminal, open a fresh Quartz window)
if (Sys.info()[["sysname"]] == "Darwin") {
  quartz()
}

# 3. Reset plotting parameters
par(mfrow = c(1, 1))
par(mar = c(5, 4, 4, 2) + 0.1)

# 4. Now try plotting the regime probabilities again
plotProb(mod, which = 3)
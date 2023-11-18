
# ##############################################################################
# Načtení dat
# ##############################################################################
photoperiod <- read.table("Lecture 2.1/Data/photoperiod.txt", sep="\t", header=TRUE)
attach(photoperiod)

# Sumarizace dat.
summary(photoperiod)

# ##############################################################################
# Lineární model: testujeme genotyp vs růst
# ##############################################################################

model <- lm(Growth ~ Genotype * Photoperiod)

# Sumarizace modelu.
summary(model)

# Testujeme jestli sklon pro jednotlivé fotoperiody se liší
# Musím ese naučit číst F-statistiku.
# Silně
# Intercept pro genotyp A, který je první v abecedě


# ANOVA
# - https://bookdown.org/ndphillips/YaRrr/comparing-regression-models-with-anova.html

modelAOV <- aov(Growth ~ Genotype * Photoperiod)
summary(modelAOV)

# Interakce

model2  <- update(model, ~.-Genotype:Photoperiod)
model2b <- lm(Growth~genotype + Photoperiod)

anova(model, model2, test="F")

# nebo zjednodušení

drop1(model, test="F")

# Df jsou stupně volnosti
# Signifikance: Pr (>F)
# RSS: Reziduální suma čtverců stoupne/klesne
# Tato sumarizce ukazuje co by se stalo, kdybych vyhodil jednu interakci.
# Obecne se dá rozhodnout podle AIC nebo Pr...

# Shapiro test, normality reziduálů.
res <- resid(model)
shapiro.test(res)

# ##############################################################################
#  Poissonova distribuce a model
# ##############################################################################

clusters <- read.table("MSM II-1/clusters.txt", sep="\t", header=TRUE)
attach(clusters)

summary(clusters)

# Poisson model.
model <- glm(Cancers~Distance, family=poisson)
summary(model)

# Kvazi-Poisson model.

model2 <- glm(Cancers~Distance, family=quasipoisson)
summary(model2)


# ##############################################################################
# Binomické rozložení
# ##############################################################################

# Souvisí podíl semen, ketré si ptáci vzaly, s tím kolik jsme jich nabídly?
size  <- c(4, 6, 10, 40, 60, 100) # počet nabízených semen
taken <- c(3, 3,  6, 16, 26,  39) # kolik si jich ptáci vzaly

# Density size dependece.

ls <- log(size)
left <- size - taken
model <- glm(cbind(taken, left) ~ls, family=binomial)
summary(model)


## Logistická ANCOVA

logistic <- read.table("MSM II-1/logistic.txt", sep="\t", header=TRUE)
attach(logistic)
summary(logistic)
logistic

model <- glm(cbind(dead, n-dead) ~product * logdose, binomial)

summary(model)

# zjednodušení
drop1(model, test="Chi") # deviance se zvýší => nemůžeme odstranit

# LRT Likelihood Ratio test

p <- dead/n

plot(logdose, p, type="n")

points(logdose[product=="A"], p[product=="A"], pch=16, col="red")
points(logdose[product=="B"], p[product=="B"], pch=16, col="green")
points(logdose[product=="C"], p[product=="C"], pch=16, col="blue")

# ##############################################################################
# Bernouliho
# ##############################################################################
# ostrov izolace

islands <- read.table("MSM II-1/isolation.txt", sep="\t", header=TRUE)
attach(islands)
model <- glm(incidence~area * isolation, binomial)
model2 <- glm(incidence~area + isolation, binomial)

summary(model)
summary(model2)

# drop1(model, test="Chi")

model_a = glm(incidence~area, binomial)
model_b = glm(incidence~isolation, binomial)

par(mfrow=c(2, 2))

xs <- seq(0, 9, 0.1)
ys <- predict(model_a, list(area=xs), type="response")

plot(area, incidence)
lines(xs, ys)

xs2 <- seq(0, 9, 0.1)
ys2 <- predict(model_b, list(area=xs2), type="response")


plot(isolation, incidence)
lines(xs2, ys2)

################################################################################
# Statistické metody I (2b. èást) -- Regrese
################################################################################

 data <- read.csv("data/tannin.txt", sep="\t") # data obsah tanninu v listu a váhy housenky.
 
 summary(data)
 
 model <- lm(formula=data$growth ~ data$tannin)
 
 summary(model)
 
 # Residuals
 # Coefficients
 # Signif. codes
 # Residual standard error
 # Multiple R-squared
 # F-statistics
 
 plot(data$tannin, data$growth, pch=16, ylim=c(0, 15))
 
 xv <- seq(0, 8, 0.1)
 yv <- predict(model, list(tannin=xv), list="c")
 
 matlines(xv, yv, lty=c(1, 2, 2), col="black")
 
 # Vykreslí konfidenèní interval.
 
 plot(model)
 
 
 
 #################################
 
 
data <- read.csv("data/decay.txt", sep="\t")

summary(data)

plot(data$time, data$amount, pch=16)

# Lineární model

lmodel <- lm(data$amount ~ data$time)

summary(lmodel)

shapiro.test(residl(model))

# Nelineární model

nmodel <- lm(data$amount ~ poly(data$time, 2))

### Vysvìtlí 90% variability v datech viz Adjusted R-squared:  0.9014

summary(nmodel)

anova(lmodel, nmodel, test="F")

# Nelineární model je mnohem lepší.


# nulový model


nullmodel <- lm(data$amount ~ 1)

anova(nullmodel, nmodel, test="F")


# Multiple regression

data <- read.csv("data/ozone.data.txt", sep="\t")

model <- lm(data$ozone ~ data$rad * data$temp * data$wind)

nullmodel <- lm(data$ozone ~ 1)

anova(nullmodel, model, test="F")

# POøedpokládám trojnou interakci, tzn. že vše souvisí se vším...
# Zkusíme odstranit trojnou interakci.


model2 <- update(model, ~ . - data$rad : data$wind : data$temp)

anova(model, model2, test="F")

# Dva moedly jsou stejnì, rozdíl není signifikantní.

# Mùžeme odstranit trojnou interakci.

drop1(model, test="F")

drop1(model2, test="F")

model3 <- update(model2, ~.-data$rad:data$wind)

drop1(model3, test="F")

summary(model3)

shapiro.test(resid(model3)) # nic moc, nereflektovali jsme nelinearní závislost mezi promìnnými.

################################################################################
# ANOVA
################################################################################S

## ANOVA one-way (jednocestná)

# Model rùstu kytky za rùzného osvìtlení 
data <- read.csv("data/photoperiod.txt", sep="\t")
names(data)
summary(data)

attach(data)

model <- lm(Growth ~ Photoperiod)

summary(model)

nullmodel <- lm(Growth ~ 1)

shapiro.test(resid(model))

# Dávejete pøednost `lm` pøed `aov`, u které záleží na poøadí.

model <- aov(Growth ~ Photoperiod)
summary(model)


# ANOVA two-way  (dvoucestná) ANOVA nedìláme, ale lze...


## ANOVA (factorial(ní))


data <- read.csv("data/factorial.txt", sep="\t")
names(data)
summary(data)
attach(data)

model <- lm(growth ~ diet * coat)
summary(model)


model2 <- update(model, ~.-diet:coat)
summary(model2)


drop1(model2, test="F")

#

fungi <- read.csv("data/fungi.txt", sep="\t")
names(fungi)
summary(fungi)
attach(fungi)
plot(fungi$Habitat, fungi$Fugus.yield)
model <- aov(Fugus.yield ~ Habitat)

# Tukey vícenásobné porovnání prùmìrù ... pokud ANOVA vyjde prùkaznì

TukeyHSD(model)

plot(TukeyHSD(model))

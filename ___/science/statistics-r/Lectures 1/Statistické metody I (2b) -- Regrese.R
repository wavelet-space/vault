################################################################################
# Statistick� metody I (2b. ��st) -- Regrese
################################################################################

 data <- read.csv("data/tannin.txt", sep="\t") # data obsah tanninu v listu a v�hy housenky.
 
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
 
 # Vykresl� konfiden�n� interval.
 
 plot(model)
 
 
 
 #################################
 
 
data <- read.csv("data/decay.txt", sep="\t")

summary(data)

plot(data$time, data$amount, pch=16)

# Line�rn� model

lmodel <- lm(data$amount ~ data$time)

summary(lmodel)

shapiro.test(residl(model))

# Neline�rn� model

nmodel <- lm(data$amount ~ poly(data$time, 2))

### Vysv�tl� 90% variability v datech viz Adjusted R-squared:  0.9014

summary(nmodel)

anova(lmodel, nmodel, test="F")

# Neline�rn� model je mnohem lep��.


# nulov� model


nullmodel <- lm(data$amount ~ 1)

anova(nullmodel, nmodel, test="F")


# Multiple regression

data <- read.csv("data/ozone.data.txt", sep="\t")

model <- lm(data$ozone ~ data$rad * data$temp * data$wind)

nullmodel <- lm(data$ozone ~ 1)

anova(nullmodel, model, test="F")

# PO�edpokl�d�m trojnou interakci, tzn. �e v�e souvis� se v��m...
# Zkus�me odstranit trojnou interakci.


model2 <- update(model, ~ . - data$rad : data$wind : data$temp)

anova(model, model2, test="F")

# Dva moedly jsou stejn�, rozd�l nen� signifikantn�.

# M��eme odstranit trojnou interakci.

drop1(model, test="F")

drop1(model2, test="F")

model3 <- update(model2, ~.-data$rad:data$wind)

drop1(model3, test="F")

summary(model3)

shapiro.test(resid(model3)) # nic moc, nereflektovali jsme nelinearn� z�vislost mezi prom�nn�mi.

################################################################################
# ANOVA
################################################################################S

## ANOVA one-way (jednocestn�)

# Model r�stu kytky za r�zn�ho osv�tlen� 
data <- read.csv("data/photoperiod.txt", sep="\t")
names(data)
summary(data)

attach(data)

model <- lm(Growth ~ Photoperiod)

summary(model)

nullmodel <- lm(Growth ~ 1)

shapiro.test(resid(model))

# D�vejete p�ednost `lm` p�ed `aov`, u kter� z�le�� na po�ad�.

model <- aov(Growth ~ Photoperiod)
summary(model)


# ANOVA two-way  (dvoucestn�) ANOVA ned�l�me, ale lze...


## ANOVA (factorial(n�))


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

# Tukey v�cen�sobn� porovn�n� pr�m�r� ... pokud ANOVA vyjde pr�kazn�

TukeyHSD(model)

plot(TukeyHSD(model))

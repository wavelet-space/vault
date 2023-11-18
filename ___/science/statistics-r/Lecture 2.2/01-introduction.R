#ANOVA
data("npk")
#(vynosy na 6ti experimentalnich polich)
npk.aov <- lm(yield ~ block, npk)
summary(npk.aov)


#ANCOVA
data("iris")
#delka vs sirka kalisnich listku u kosatcu
library(ggplot2)
g <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=factor(Species), shape=factor(Species)))
g1 <- g + geom_point()
g2 <- g1 + geom_smooth(method=lm, aes(fill=factor(Species))) + xlim(0, 8)
g2

model1 <- lm(Sepal.Width ~ Species*Sepal.Length, data=iris)
summary(model1)


#ta sama analyza, ale pro centrovanou a standardizovanou promennou
iris$Sepal.Length.m<-iris$Sepal.Length-mean(iris$Sepal.Length)
model1b <- lm(Sepal.Width ~ Species*Sepal.Length.m, data=iris)
summary(model1b)

g <- ggplot(iris, aes(x=Sepal.Length.m, y=Sepal.Width, color=factor(Species), shape=factor(Species)))
g1b <- g + geom_point()
g2b <- g1b + geom_smooth(method=lm, aes(fill=factor(Species))) + xlim(-3, 3)
g2b


#Vyber modelu (backward step-wise selekce)
model1 <- lm(Sepal.Width ~ Species*Sepal.Length, data=iris)
model2 <- lm(Sepal.Width ~ Species+Sepal.Length, data=iris)
anova(model1,model2)
summary(model2)

#Vyber modelu (AIC)
library(MuMIn)
modelF <- lm(Sepal.Width ~ Species*Sepal.Length.m, data=iris)
options(na.action=na.fail)
DD<-dredge(modelF)
DD

#Kontrola modelu
par(mfrow=c(2,2))
model1 <- lm(Sepal.Width ~ Species*Sepal.Length, data=iris)
plot(model1)
par(mfrow=c(1,1))
hist(resid(model1))
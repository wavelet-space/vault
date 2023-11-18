#########################
#analyza prezivani#######
#########################

library(survival)

PATH="/media/kreising/DATA/Documents/prezentace/vyuka/Statisticke_Metody/2020_2021/Vse/data/"

#zajima nas vliv hmotnosti (kontinualni) a skupiny (kategorialni) na prezivani
#budeme porovnavat neparametricky (coxph) a parametricky pristup
#(minimalni) delka zivota v promenne "death", pokud skutecne doslo ke smrti znacime jako status = 1, v opacnem pripade 0

insects<-read.table(paste(PATH,"roaches.txt",sep=""), header = T)
insects
tapply(insects$death, insects$group, mean)

#vizualicace pomoci survfit
plot(survfit(Surv(insects$death,insects$status)~insects$group),lty=c(1,3,5),ylab="Survivorship",xlab="Time")
Surv(insects$death,insects$status)

######################
#PARAMETRICKA ANALYZA#
######################

#parametricky model, exponencialni distribuce, tj konstnantni prezivni v case
model1<-survreg(Surv(insects$death,insects$status)~insects$weight*insects$group,dist="exponential")
summary(model1)
#parametricky model, Weilbull distribuce, tj mortalita roste s vekem
model2<-survreg(Surv(insects$death,insects$status)~insects$weight*insects$group,dist="weibull")
summary(model2)
#porovanni modelu, druhy je vyrazne lepsi
AIC(model1, model2)
anova(model1, model2)

#na zaklade modelu 2 neni signifikantni interakce
model2b<-survreg(Surv(insects$death,insects$status)~insects$weight+insects$group,dist="weibull")
anova(model2,model2b)

#na zaklade modelu 2b neni efekt hmotnosti
summary(model2b)
model2c<-survreg(Surv(insects$death,insects$status)~insects$group,dist="weibull")
anova(model2b,model2c)
summary(model2c)

#odhady pro prumerne doziti zjistime pomoci funkce predict
predict(model2c)
tapply(predict(model2c),insects$group,mean)

#tyto odhady jsou pro A a B vyssi nez realne zaznamene delky zivota (coz je dobre protoze pro nektere jedince nemame sledovani az do jejich smrti)
tapply(insects$death,insects$group,mean)

####################################
#NEPARAMETRICKA ANALYZA#############
####################################

model.COX<-coxph(Surv(insects$death,insects$status)~insects$weight*insects$group)
summary(model.COX)

#zjednoduseni modelu
model.COX.2<-coxph(Surv(insects$death,insects$status)~insects$weight+insects$group)
model.COX.3<-coxph(Surv(insects$death,insects$status)~insects$group)

AIC(model.COX,model.COX.2,model.COX.3)
anova(model.COX.2,model.COX.3)

par(mfrow=c(1,2))
plot(survfit(model.COX.3))
legend(35,0.8,c("Group A","Group B","Group C"),lty=c(2,1,2))

#interpretace koeficinetu ve vysledne tabulce
summary(model.COX.3)



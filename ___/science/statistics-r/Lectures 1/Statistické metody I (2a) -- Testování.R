################################################################################
# Statistick� metody I (2a. ��st) -- Testov�n�
################################################################################

AB <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

var(AB)


################################################################################
# SE Standard Error
################################################################################


se <- function(x) {
    sqrt(var(x)/length(x))
}

se(AB)


################################################################################
# Confidence interval
################################################################################

ci95 <- function(x) {
    t.value <- qt(0.0975, length(x) - 1)
    standard.error <- se(x)
    
    ci <- t.value * standard.error
    
    cat("95% confidence interval =", mean(x) - ci, "to", mean(x)+ci, "\n")
  
}

ci95(AB)


################################################################################
# Test norm�lnosti distribuce
################################################################################

x1 <- exp(rnorm(100))
mean(x1)
shapiro.test(x1)
hist(x1)


x2 <- rnorm(100)
mean(x2)
shapiro.test(x2)
hist(x2)

## Test variance

data <- read.csv("data_crawley/f.testt.data.txt", sep="\t")
# attach(data)
names(data)
var(gardenB)

data

## Porovn�n� dvou pr�m�r�


# Student�v t-test (W.S. Gosset, 1908) dvouv�b�rov� -- 

# Wilcoxon�v rank-test dvouv�b�rov� -- m��eme testovat i v p��pad� nenorm�ln�ho rozd�len�


# t statistika
# t = rozd�l mezi dv�ma pr�m�ry / SE rozd�lu

# SE_{diff} = \sqrt 


# P�rov� t-test, dvou ocase rozlo�en�

t.test.data <- read.csv("data_crawley/t.test.data.txt", sep="")
summary(t.test.data)

# Welch Two sample t-test

# t.test(A, B)
# wilcox.test(garden)



# L�� se biodiverzita na horn�m vs spodn�m toku?
# Sb�r�me naho�e a dole => nejde o nez�visl� pozorov�n�
# nelze pou��vat t-test
data <- read.csv("data_crawley/stream.txt", sep="\t") 
names(data)
summary(data)
t.test(data)

# P�rov� t-test
t.test(data$down, data$up, paired=T)


# Alternativn� m��eme ode��st a pot� testovat norm�ln�.
diff <- data$up - data$down

t.test(diff)

# Znam�nkov� (pozor: nen� to binomick� i kdy� v R se tak funkce jmenuje) test

binom.test(1, 9) # exacr binomial test

# propor�n� test

prop.test(c(4, 192), c(40, 3200))

# Chi kvadr�t test nebo-li kontigen�n� tests (viz kontingen�n� tabulka)

count <- matrix( c(38, 14, 11, 51), nrow=2 )
count
result = chisq.test(count, correct=F)
# Pravd�podobnost ud�l�n� chyby typu 1 je p-value = 2.8e-9, co� je tedy velmi mal�

result$expected


# Korela�n� koeficient: Pearson, Spearman

x <- c(1, 3, 4)
y <- c(1, 2, 3)

plot(x, y)


var(x)
var(y)

var(x, y) # covariance

cov(x, y) # covariance

# Pearson

r = var(x, y) / sqrt(var(x) * var(y))
r

cor.test(x, y)


# Korela�n� matice

data <- read.csv("data_crawley/Pollute.txt", sep="\t")
names(data)

cor(data)

# Vid�me �e nap�. prom�nn� Industry a Population jsou siln� korelovan�, co� bychom o�ek�vali.


## Line�rn� model -- line�rn� regrese


## Anal�za variance










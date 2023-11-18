################################################################################
# Statistické metody I (2a. èást) -- Testování
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
# Test normálnosti distribuce
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

## Porovnání dvou prùmìrù


# Studentùv t-test (W.S. Gosset, 1908) dvouvýbìrový -- 

# Wilcoxonùv rank-test dvouvýbìrový -- mùžeme testovat i v pøípadì nenormálního rozdìlení


# t statistika
# t = rozdíl mezi dvìma prùmìry / SE rozdílu

# SE_{diff} = \sqrt 


# Párový t-test, dvou ocase rozložení

t.test.data <- read.csv("data_crawley/t.test.data.txt", sep="")
summary(t.test.data)

# Welch Two sample t-test

# t.test(A, B)
# wilcox.test(garden)



# Líší se biodiverzita na horním vs spodním toku?
# Sbíráme nahoøe a dole => nejde o nezávislé pozorování
# nelze používat t-test
data <- read.csv("data_crawley/stream.txt", sep="\t") 
names(data)
summary(data)
t.test(data)

# Párový t-test
t.test(data$down, data$up, paired=T)


# Alternativnì mùžeme odeèíst a poté testovat normálnì.
diff <- data$up - data$down

t.test(diff)

# Znaménkový (pozor: není to binomický i když v R se tak funkce jmenuje) test

binom.test(1, 9) # exacr binomial test

# proporèní test

prop.test(c(4, 192), c(40, 3200))

# Chi kvadrát test nebo-li kontigenèní tests (viz kontingenšní tabulka)

count <- matrix( c(38, 14, 11, 51), nrow=2 )
count
result = chisq.test(count, correct=F)
# Pravdìpodobnost udìlání chyby typu 1 je p-value = 2.8e-9, což je tedy velmi malé

result$expected


# Korelaèní koeficient: Pearson, Spearman

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


# Korelaèní matice

data <- read.csv("data_crawley/Pollute.txt", sep="\t")
names(data)

cor(data)

# Vidíme že napø. promìnné Industry a Population jsou silnì korelovaná, což bychom oèekávali.


## Lineární model -- lineární regrese


## Analýza variance










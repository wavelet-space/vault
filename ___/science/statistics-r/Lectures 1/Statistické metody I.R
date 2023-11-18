# ##############################################################################
# # Kurz R 16.05.2021
# ##############################################################################

# Zdroje
# https://www.root.cz/clanky/programovaci-jazyk-r-vektory-ve-funkci-zakladniho-datoveho-typu-jazyka/
# 

# napiš help(FUN) pro vyvolání dokumentace napø. help(sum)

help(sum)

# Pro tento kurz budeme potøebovat balíèky

s#install.packages("scales")
#install.packages("vioplot")
#install.packages("sciplot")
#install.packages("ggplot2")
#install.packages("png")

# Pøed použitím knihovny musíme knihovnu naèíst.
library(ggplot2)

# Než zaèneme pracovat zkontrolujeme si v jaké složce se nacházíme.

getwd()
setwd("C:/Users/Student18/Desktop")
getwd()

# Poté co máme nastavenu cestu mùžeme realtivnì k nastavenému adresáøi najít požadovaný adresáø s daty

list.files("data")

# Pro zaèátek mùžeme R otestovat na jednoduchých výpoètech.
# Výpoèty budou ihned zobrazeny v konzoli a nikam je neukládáme.

# Aritmetika

5 * 5
5 ^ 2
9 ^ 0.5
9 ^ (1/2) # proè nefunguj 9 ^ 1/2 tak jak pøedpokládáme?
sqrt(9)

# Pokud chceme hodnoty ukládat a dále s nimi pracovat, využijeme promìnou, kterou pojmenujeme
# a pøiøadíme ji hodnotu pomocí operátoru pøiøazení `<-`.

a <- 5
a * a 
a ^ 2

# Historicky a dnes spíše nedoporuèuji, lze vidìt i operátor `=` namísto `<-`, avšak má to nìjaká omezení.
# napø. pokud máme funkci f(), pak f(x <- 2) funguje jinak než f(x = 2).
# viz https://blog.revolutionanalytics.com/2008/12/use-equals-or-arrow-for-assignment.html

square <- function(x) { return x * x }

# ##############################################################################

class(a) # Vypíše typ promìnné
ls()     # Vypíše promìnné

a <- 6
b <- 12

c <- sqrt(a^2 + b^2)
print(c)

# nebo 
c <- sqrt(a * a + b * b)
print(c)

# nebo 
c <- (a * a + b * b) ^ 0.5
print(c)

# Definice jednoduché funkce pro výpoèet pøepony pravoúhlého trojúhelníku.

hypotenuse <- function(a, b) { sqrt(a^2 + b^2) }

hypotenuse(6, 12)

# ##############################################################################
# ## Array neboli pole
# ##############################################################################


arr <- array(c(1, 2, 3), dim=c(6))
arr

# ##############################################################################
# ## Vektor
# ##############################################################################

# Pro jednoduchost budeme v následujících ukázkách pracovat z numerickými vektory tj. 
# s vektory obsahujícími numerické hodnoty v našem pøípadì si vystaèíe s celými èísly.

x <- c(1, 2, 3)
y <- c(1, 2, 3)

vec <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
print(vec)

class(vec)
length(vec)
summary(vec)

# Spojení vektorù
x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(x, y)

print(z)

# Aritmetika se provádí tzv. po porvcích (element wise) napø. seètìní pomocí operátoru `+`
x + y
# obdobnì
x - y
x * y
x / y

# Pokud chceme ve vektoru oznaèit chybìjící hodnotu, vložíme speciální hodnotu NA (not avalaible)

x <- c(1, 2, NA)
mean(x)

# Úloha: vektory a, b obsahují délky odvìsen.
# Spoètìte jedntolivé pøepony trojúhelníkù
# a celkovou plochu tìchto trojúhelník.

a <- c(1, 2, 3, 4, 5, 6, 7, 3, 1, 4, 5)
b <- c(5, 4, 3, 7, 3, 4, 2, 1, 5, 2, 3)
# obsah
s <- sum(a * b / 2)
print(s)

# pøepony
c <- sqrt(a^2 + b^2)
print(c)


# Generování vektorù pomocí funkcí `seq` a `rev` a `_:_`.

seq(from=0, to=9, by=1) # což je to samé jako prosté seq(0, 9)
seq(from=0, to=9, by=2) 

# nebo použijeme 

a <- 0:9
a
b <- 9:0
b

# Filtrování vektorù a podvýbìry.

a <- seq(0, 9); a
b <- seq(9, 0); b

# Vybereme v Rku jsou sekvence èíslovány od 1
a <- c(1, 2, 3, 4, 5)

# Výber prvkù pomocí operátoru `[]`

a[1] # první prvek
a[2] # druhý prvek
a[3] # tøetí prvek
a[4] # ètvrtý prvek
a[5] # pátý prvek

# V Rku je rozsah vždy vèetnì posledního daného prvku.
# napø. a[i:j] vybere prvky vektoru a s indexem i až j a to vèetnì j.
# tzn že jde o inkluzivní interval `[i až j]`. V nìkterých jazycích napø. Python 
# je takový podvýìr exkluzivní tj. `[i až j)`. Dejte si na to pozor, pokud tedy støídáte rùzné jazyky.

a[1:5] # první až pátý prvek (vèetnì)
a[5:1] # pátý až první prvek (vèetnì)
a[2:4] # druhý až ètvrtý prvek


# Podvýbìry vracejí vektor s hodnotami `TRUE` nebo `FALSE` podle toho, jestli prvek
# splòuje podmínku.

a <- 1:10

a
a[(length(a) - 2) : length(a)]

a[1:3]

tail(a, 3)
head(a, 3)

a[a %% 2 == 0]

# Pro výber prvních nebo posledních N prvkù mùžeme využít funkce `head()` a `tail()`.


#
# Øazení prvkù pomocí funkce `sort()` a `rev()`.
# 

v <- 10:1  ; v
s = sort(v); s
r = rev(v) ; r
rank(v)


#
# Zaokrouhlení
#
v <- c(1.51, 1.50, 1.49)
ceiling(v)
floor(v)

# ##############################################################################
# ## Faktor
# ##############################################################################

obdobi <- as.factor(rep(c("jaro", "léto"), 8))
obdobi
class(obdobi)
summary(obdobi)
levels(obdobi)

obdobi <- as.character(rep(c("jaro", "léto"), 8))
obdobi
class(obdobi)
summary(obdobi)
levels(obdobi)

# Úrovnì zjistíme pomocí funkce `levels`.
# Mùžeme sluèovat úrovnì.

# Funkce `rep()` slouží k opakování hodnot.

rep(c(1, 2, 3), 3)

# ##############################################################################
# ## Matice
# ##############################################################################

# Vytvoøení matice z øádkù.
mat <- rbind(c(1, 2, 3), c(4, 5, 6))
mat

# Vytvoøení matice ze sloupcù.
mat <- cbind(c(1, 2, 3), c(4, 5, 6))
mat

# Dimezi matice, tj. poèet øádkù a sloupcù zjistíme pomocí funkce `dim()`
dim(mat)


# Rádkùm mùžeme pøiøadit jména.

rownames(mat) <- c("r1", "r2", "r3")
mat

# Sloupcùm mùžeme pøiøadit jména.

colnames(mat) <- c("c1", "c2")
mat

# Výber øádkù matice pomocí indexù.

mat[1,] # vybere první øádek
mat[,1] # vybere první sloupec

# Výber øádkù pomocí názvù.

mat["r1",]
mat[c("r1", "r2"),] # na poøadí záleží!

#  Výber sloupcù pomocí názvù.

mat[,"c1"]
mat[, c("c2", "c1")] # na poøadí záleží!


m1 = mat[,] # vybere vše
m1

m1[1,1] = 99
m1

# ##############################################################################
# Úloha: Mìjme ètvercovou matici, vyberte levý horní kvadrant a spoètìte sumu prvkù.
# ##############################################################################

# DataFrame je jedna z nejpoužívanìjších datových struktur v R. Vìtšina funkcí 
# umí naèítat a vrací `data.frame`.

square_matrix <- matrix(1:100, ncol=10)
square_matrix

# Poèet øádkù a sloupcù pro kvadrant.
row_count <- dim(square_matrix)[1] / 2
col_count <- dim(square_matrix)[1] / 2

# Výbìr kvadrantu matice.
quadrant  <- square_matrix[1:row_count, 1:col_count]

# A koneènì souèet prvkù kvadrantu.
sum(quadrant)

# ##############################################################################
# ## DataFrame
# ##############################################################################

# Naètení tabulky ze souboru TSV tj. tabulka, kde je oddìlovaèem tabulátor.
worms <- read.table("data/worms.txt", sep="\t", header=T)

class(worms) # > data.frame

# Jak se vyznat v tabulce?

names(worms)

# Summary je vždy výhodné použít a obléhnout tabulku, napø. jestli hodnota byla naètena jako numerická.
summary(worms) 

head(worms, n=3) # Ukaž první tøi øádky.
tail(worms, n=3) # Ukaž první tøi sloupce.

# k jednotlivým promìnným se dostaneme pomocí znaku `$` dolar.
worms$Area
is.factor(worms$Area)   # F
is.numeric(worms$Area)  # T

# Podvýbìry se provádí stejnì jakou u matic.

worms[,1:2]
worms[1:2,]

# Vezmi pozorování (øádky), kde pH > 5.
worms_pH_gt5 <- worms[worms$Soil.pH > 5, ]
worms_pH_gt5 

worms_pH_gt5 <- subset(worms, worms$Soil.pH > 5)
worms_pH_gt5 


# Pomocí `tapply` mùžeme symarizovat kontinuální promìnnou pøes úrovnì kategoriální promìnné.
tapply(worms$Soil.pH, worms$Vegetation, mean)

#
# Seøazení tabulky
#

order(worms)

worms[order( worms$Slope ),]                    # seøazeno podle sklonitosti vzestupnì
worms[order( worms$Slope,  decreasing = TRUE),] # seøazeno podle sklonitosti sestupnì

# Práce s chybìjícími hodnotami

worms.missing <- read.table("data/worms.missing.txt", sep="\t", header=TRUE)

summary(worms.missing)

head(worms.missing)

is.na(worms.missing$Area)
is.na(worms.missing$Slope)

# 
# Spojení datasetù pomocí funkce `merge`.
#

seeds <- read.table("data/seeds.txt", header=T, sep="\t")
flowers <- read.table("data/fltimes.txt", header=T, sep="\t")

seeds
flowers

merge(seeds, flowers)

# ##############################################################################
# ## Seznam
# ##############################################################################

# Použijeme t.test testuje jestli se liší nìjaká hodnota významnì od prùmìru mezi dvema soubory.

require(graphics)
head(sleep)

tapply(sleep$extra, sleep$group, mean)
# zdá se, že druhý preparát funguje lépe...
# máme dvì skupiny a zajímá nás rodíl v pùmìru

result <- t.test(sleep$extra ~ sleep$group)

str(result)   # List of 10 ... seznam deseti prvkù
class(result) # htest

# Zajímá nás napø. p hodnota `p.value`.
result$p.value

# ##############################################################################
# ## Randomizace
# ##############################################################################

# Bootrapy ve fylogenetické stromu.
#
# [T|C|G|A|A|...|T]
# [ | |A| | |...|T] randomizace s opakováním
# 

# nastavení seedu
set.seed(123)

# Znáhodnìní poøadí bez opakování.
sample(1:10)

# Znáhodnìní poøadí s opakováním.
sample(1:10, replace=T)

# Jsou vìtší klucy nebo holky?
df <- data.frame(pohlavi=c(rep("M", 10), rep("F", 10)), height=c(
	14, 13, 11, 10, 12, 19, 16, 14, 15, 13,
	14, 13, 12, 11, 12, 19, 17, 18, 15, 13
))

tapply(df$height, df$pohlavi, mean)

# Metoda znáhodnìní.

df.rand <- df 
df.rand$pohlavi <- sample(df.rand$pohlavi)

df
result <- tapply(df.rand$height, df.rand$pohlavi, mean)

result[1] - result[2]

# ##############################################################################
# ## Flow control: if, ifelse, while, for
# ##############################################################################

## ifelse

gender <- sample(rep(0:1, 20))

gender_recoded <- ifelse(gender==1, "M", "F")
gender_recoded

month <- sample(rep(1:12, 20))[1]
print(month)

if (month %in% c(1, 2, 3)) {
    print("winter")
}
 
if (month %in% c(4, 5, 6)) {
	print("spring")
} 

if (month %in% c(7, 8, 9)) {
	print("summer")
} else {
      print("autum")
}

## For cyklus

for (i in 1:10) {
    print(i)
}

# Naètení souborù s pøíponou ".txt".

txt_files = NULL
for (file in list.files("data")) {
	if (endsWith(file, ".txt")) {
		txt_files <- c(txt_files, file)		
	}
}

head(txt_files)


# ##############################################################################
# ## Funkce (vlastní)
# ##############################################################################


pythagoras <- function(a, b) {
	sqrt(a ^ 2 + b ^ 2)
}

class(pythagoras) # function

pythagoras(1, 2)

# Return není povinný, vrací se poslední výraz, navíc pokud ho chceme explicitnì uvést, musíme ho uzávorkovat.
pythagoras <- function(a, b) {
	c <- sqrt(a ^ 2 + b ^ 2)	
	return(c)
}

pythagoras(1, 2)

# ##############################################################################
# ## Volání externího programu.
# ##############################################################################

# Pokud máme externí program, mùžeme ho zavolat z R.

system("vlc sound.mp3")

# Nastavení seed 

set.seed(123)
sample(1:10)

# Pro neznámý dataset použít read.delim(), nebo read.lines().


# ##############################################################################
# ## Grafy a ploty.
# ##############################################################################

# Na `x` umístíme nezávislo a na `y` závislou promìnnou, jinak øeèeno na `y` jde co chceme
# vysvìtli a na `x` èím chceme vysvìtlit.

# poèasí vs nehodovost, je to jasné x=poèasí a y nehodovost, obrácenì to nedává smysl.
# výška vs barva vlasù, co dáme na x a co na y?

data1 <- read.table("data/scatter1.txt", sep="\t", header=T)
# head(data1)
plot(data1$xv, data1$ys, pch = 1, cex=0.5, main="Scatterplot", xlab="Nezávislá", ylab="Závislá", col="red")
abline(lm(data1$ys ~ data1$xv), col="red", lwd="2")

data2 <- read.table("data/scatter2.txt", sep="\t", header=T)
# head(data2)
points(data2$xv, data2$ys, pch = 1, cex=0.5, main="Scatterplot", xlab="Nezávislá", ylab="Závislá", col="blue")
abline(lm(data2$ys ~ data2$xv), col="blue", lwd="2")


# ozone

ozone <- read.table("data/ozone.data.txt", header=T, sep="\t")
head(ozone)
pairs(ozone)
pairs(ozone, panel = panel.smooth)

# Histogram 
set.seet(123)
hist(rnorm(10000000, mean=0, sd=10), breaks=10)
hist(rnorm(10000000, mean=0, sd=100), breaks=50)

# weather

# weather <- read.table("data/oxford weather.txt", header=T, sep="\t")
# head(weather)
# plot(factor(weather$month), weather$upper)

# Violin plot

# ##############################################################################
# ### Knihovna ggplot v2
# ##############################################################################

library(ggplot2)

# Knihovna ggplot je založena na grammar of graphics a dovoluje naprostou kontrolu na vzhledem grafu.

data <- read.table("data/daphnia.txt", header=T)
head(data)

p <- ggplot(data=data, aes(y=Growth.rate, x=Water)) + 
	geom_boxplot() + 
	geom_jitter()+ 
	facet_grid(~Detergent) +
	theme_bw()

p
# ##############################################################################
# # Kurz R 16.05.2021
# ##############################################################################

# Zdroje
# https://www.root.cz/clanky/programovaci-jazyk-r-vektory-ve-funkci-zakladniho-datoveho-typu-jazyka/
# 

# napi� help(FUN) pro vyvol�n� dokumentace nap�. help(sum)

help(sum)

# Pro tento kurz budeme pot�ebovat bal��ky

s#install.packages("scales")
#install.packages("vioplot")
#install.packages("sciplot")
#install.packages("ggplot2")
#install.packages("png")

# P�ed pou�it�m knihovny mus�me knihovnu na��st.
library(ggplot2)

# Ne� za�neme pracovat zkontrolujeme si v jak� slo�ce se nach�z�me.

getwd()
setwd("C:/Users/Student18/Desktop")
getwd()

# Pot� co m�me nastavenu cestu m��eme realtivn� k nastaven�mu adres��i naj�t po�adovan� adres�� s daty

list.files("data")

# Pro za��tek m��eme R otestovat na jednoduch�ch v�po�tech.
# V�po�ty budou ihned zobrazeny v konzoli a nikam je neukl�d�me.

# Aritmetika

5 * 5
5 ^ 2
9 ^ 0.5
9 ^ (1/2) # pro� nefunguj 9 ^ 1/2 tak jak p�edpokl�d�me?
sqrt(9)

# Pokud chceme hodnoty ukl�dat a d�le s nimi pracovat, vyu�ijeme prom�nou, kterou pojmenujeme
# a p�i�ad�me ji hodnotu pomoc� oper�toru p�i�azen� `<-`.

a <- 5
a * a 
a ^ 2

# Historicky a dnes sp�e nedoporu�uji, lze vid�t i oper�tor `=` nam�sto `<-`, av�ak m� to n�jak� omezen�.
# nap�. pokud m�me funkci f(), pak f(x <- 2) funguje jinak ne� f(x = 2).
# viz https://blog.revolutionanalytics.com/2008/12/use-equals-or-arrow-for-assignment.html

square <- function(x) { return x * x }

# ##############################################################################

class(a) # Vyp�e typ prom�nn�
ls()     # Vyp�e prom�nn�

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

# Definice jednoduch� funkce pro v�po�et p�epony pravo�hl�ho troj�heln�ku.

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

# Pro jednoduchost budeme v n�sleduj�c�ch uk�zk�ch pracovat z numerick�mi vektory tj. 
# s vektory obsahuj�c�mi numerick� hodnoty v na�em p��pad� si vysta��e s cel�mi ��sly.

x <- c(1, 2, 3)
y <- c(1, 2, 3)

vec <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
print(vec)

class(vec)
length(vec)
summary(vec)

# Spojen� vektor�
x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(x, y)

print(z)

# Aritmetika se prov�d� tzv. po porvc�ch (element wise) nap�. se�t�n� pomoc� oper�toru `+`
x + y
# obdobn�
x - y
x * y
x / y

# Pokud chceme ve vektoru ozna�it chyb�j�c� hodnotu, vlo��me speci�ln� hodnotu NA (not avalaible)

x <- c(1, 2, NA)
mean(x)

# �loha: vektory a, b obsahuj� d�lky odv�sen.
# Spo�t�te jedntoliv� p�epony troj�heln�k�
# a celkovou plochu t�chto troj�heln�k.

a <- c(1, 2, 3, 4, 5, 6, 7, 3, 1, 4, 5)
b <- c(5, 4, 3, 7, 3, 4, 2, 1, 5, 2, 3)
# obsah
s <- sum(a * b / 2)
print(s)

# p�epony
c <- sqrt(a^2 + b^2)
print(c)


# Generov�n� vektor� pomoc� funkc� `seq` a `rev` a `_:_`.

seq(from=0, to=9, by=1) # co� je to sam� jako prost� seq(0, 9)
seq(from=0, to=9, by=2) 

# nebo pou�ijeme 

a <- 0:9
a
b <- 9:0
b

# Filtrov�n� vektor� a podv�b�ry.

a <- seq(0, 9); a
b <- seq(9, 0); b

# Vybereme v Rku jsou sekvence ��slov�ny od 1
a <- c(1, 2, 3, 4, 5)

# V�ber prvk� pomoc� oper�toru `[]`

a[1] # prvn� prvek
a[2] # druh� prvek
a[3] # t�et� prvek
a[4] # �tvrt� prvek
a[5] # p�t� prvek

# V Rku je rozsah v�dy v�etn� posledn�ho dan�ho prvku.
# nap�. a[i:j] vybere prvky vektoru a s indexem i a� j a to v�etn� j.
# tzn �e jde o inkluzivn� interval `[i a� j]`. V n�kter�ch jazyc�ch nap�. Python 
# je takov� podv��r exkluzivn� tj. `[i a� j)`. Dejte si na to pozor, pokud tedy st��d�te r�zn� jazyky.

a[1:5] # prvn� a� p�t� prvek (v�etn�)
a[5:1] # p�t� a� prvn� prvek (v�etn�)
a[2:4] # druh� a� �tvrt� prvek


# Podv�b�ry vracej� vektor s hodnotami `TRUE` nebo `FALSE` podle toho, jestli prvek
# spl�uje podm�nku.

a <- 1:10

a
a[(length(a) - 2) : length(a)]

a[1:3]

tail(a, 3)
head(a, 3)

a[a %% 2 == 0]

# Pro v�ber prvn�ch nebo posledn�ch N prvk� m��eme vyu��t funkce `head()` a `tail()`.


#
# �azen� prvk� pomoc� funkce `sort()` a `rev()`.
# 

v <- 10:1  ; v
s = sort(v); s
r = rev(v) ; r
rank(v)


#
# Zaokrouhlen�
#
v <- c(1.51, 1.50, 1.49)
ceiling(v)
floor(v)

# ##############################################################################
# ## Faktor
# ##############################################################################

obdobi <- as.factor(rep(c("jaro", "l�to"), 8))
obdobi
class(obdobi)
summary(obdobi)
levels(obdobi)

obdobi <- as.character(rep(c("jaro", "l�to"), 8))
obdobi
class(obdobi)
summary(obdobi)
levels(obdobi)

# �rovn� zjist�me pomoc� funkce `levels`.
# M��eme slu�ovat �rovn�.

# Funkce `rep()` slou�� k opakov�n� hodnot.

rep(c(1, 2, 3), 3)

# ##############################################################################
# ## Matice
# ##############################################################################

# Vytvo�en� matice z ��dk�.
mat <- rbind(c(1, 2, 3), c(4, 5, 6))
mat

# Vytvo�en� matice ze sloupc�.
mat <- cbind(c(1, 2, 3), c(4, 5, 6))
mat

# Dimezi matice, tj. po�et ��dk� a sloupc� zjist�me pomoc� funkce `dim()`
dim(mat)


# R�dk�m m��eme p�i�adit jm�na.

rownames(mat) <- c("r1", "r2", "r3")
mat

# Sloupc�m m��eme p�i�adit jm�na.

colnames(mat) <- c("c1", "c2")
mat

# V�ber ��dk� matice pomoc� index�.

mat[1,] # vybere prvn� ��dek
mat[,1] # vybere prvn� sloupec

# V�ber ��dk� pomoc� n�zv�.

mat["r1",]
mat[c("r1", "r2"),] # na po�ad� z�le��!

#  V�ber sloupc� pomoc� n�zv�.

mat[,"c1"]
mat[, c("c2", "c1")] # na po�ad� z�le��!


m1 = mat[,] # vybere v�e
m1

m1[1,1] = 99
m1

# ##############################################################################
# �loha: M�jme �tvercovou matici, vyberte lev� horn� kvadrant a spo�t�te sumu prvk�.
# ##############################################################################

# DataFrame je jedna z nejpou��van�j��ch datov�ch struktur v R. V�t�ina funkc� 
# um� na��tat a vrac� `data.frame`.

square_matrix <- matrix(1:100, ncol=10)
square_matrix

# Po�et ��dk� a sloupc� pro kvadrant.
row_count <- dim(square_matrix)[1] / 2
col_count <- dim(square_matrix)[1] / 2

# V�b�r kvadrantu matice.
quadrant  <- square_matrix[1:row_count, 1:col_count]

# A kone�n� sou�et prvk� kvadrantu.
sum(quadrant)

# ##############################################################################
# ## DataFrame
# ##############################################################################

# Na�ten� tabulky ze souboru TSV tj. tabulka, kde je odd�lova�em tabul�tor.
worms <- read.table("data/worms.txt", sep="\t", header=T)

class(worms) # > data.frame

# Jak se vyznat v tabulce?

names(worms)

# Summary je v�dy v�hodn� pou��t a obl�hnout tabulku, nap�. jestli hodnota byla na�tena jako numerick�.
summary(worms) 

head(worms, n=3) # Uka� prvn� t�i ��dky.
tail(worms, n=3) # Uka� prvn� t�i sloupce.

# k jednotliv�m prom�nn�m se dostaneme pomoc� znaku `$` dolar.
worms$Area
is.factor(worms$Area)   # F
is.numeric(worms$Area)  # T

# Podv�b�ry se prov�d� stejn� jakou u matic.

worms[,1:2]
worms[1:2,]

# Vezmi pozorov�n� (��dky), kde pH > 5.
worms_pH_gt5 <- worms[worms$Soil.pH > 5, ]
worms_pH_gt5 

worms_pH_gt5 <- subset(worms, worms$Soil.pH > 5)
worms_pH_gt5 


# Pomoc� `tapply` m��eme symarizovat kontinu�ln� prom�nnou p�es �rovn� kategori�ln� prom�nn�.
tapply(worms$Soil.pH, worms$Vegetation, mean)

#
# Se�azen� tabulky
#

order(worms)

worms[order( worms$Slope ),]                    # se�azeno podle sklonitosti vzestupn�
worms[order( worms$Slope,  decreasing = TRUE),] # se�azeno podle sklonitosti sestupn�

# Pr�ce s chyb�j�c�mi hodnotami

worms.missing <- read.table("data/worms.missing.txt", sep="\t", header=TRUE)

summary(worms.missing)

head(worms.missing)

is.na(worms.missing$Area)
is.na(worms.missing$Slope)

# 
# Spojen� dataset� pomoc� funkce `merge`.
#

seeds <- read.table("data/seeds.txt", header=T, sep="\t")
flowers <- read.table("data/fltimes.txt", header=T, sep="\t")

seeds
flowers

merge(seeds, flowers)

# ##############################################################################
# ## Seznam
# ##############################################################################

# Pou�ijeme t.test testuje jestli se li�� n�jak� hodnota v�znamn� od pr�m�ru mezi dvema soubory.

require(graphics)
head(sleep)

tapply(sleep$extra, sleep$group, mean)
# zd� se, �e druh� prepar�t funguje l�pe...
# m�me dv� skupiny a zaj�m� n�s rod�l v p�m�ru

result <- t.test(sleep$extra ~ sleep$group)

str(result)   # List of 10 ... seznam deseti prvk�
class(result) # htest

# Zaj�m� n�s nap�. p hodnota `p.value`.
result$p.value

# ##############################################################################
# ## Randomizace
# ##############################################################################

# Bootrapy ve fylogenetick� stromu.
#
# [T|C|G|A|A|...|T]
# [ | |A| | |...|T] randomizace s opakov�n�m
# 

# nastaven� seedu
set.seed(123)

# Zn�hodn�n� po�ad� bez opakov�n�.
sample(1:10)

# Zn�hodn�n� po�ad� s opakov�n�m.
sample(1:10, replace=T)

# Jsou v�t�� klucy nebo holky?
df <- data.frame(pohlavi=c(rep("M", 10), rep("F", 10)), height=c(
	14, 13, 11, 10, 12, 19, 16, 14, 15, 13,
	14, 13, 12, 11, 12, 19, 17, 18, 15, 13
))

tapply(df$height, df$pohlavi, mean)

# Metoda zn�hodn�n�.

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

# Na�ten� soubor� s p��ponou ".txt".

txt_files = NULL
for (file in list.files("data")) {
	if (endsWith(file, ".txt")) {
		txt_files <- c(txt_files, file)		
	}
}

head(txt_files)


# ##############################################################################
# ## Funkce (vlastn�)
# ##############################################################################


pythagoras <- function(a, b) {
	sqrt(a ^ 2 + b ^ 2)
}

class(pythagoras) # function

pythagoras(1, 2)

# Return nen� povinn�, vrac� se posledn� v�raz, nav�c pokud ho chceme explicitn� uv�st, mus�me ho uz�vorkovat.
pythagoras <- function(a, b) {
	c <- sqrt(a ^ 2 + b ^ 2)	
	return(c)
}

pythagoras(1, 2)

# ##############################################################################
# ## Vol�n� extern�ho programu.
# ##############################################################################

# Pokud m�me extern� program, m��eme ho zavolat z R.

system("vlc sound.mp3")

# Nastaven� seed 

set.seed(123)
sample(1:10)

# Pro nezn�m� dataset pou��t read.delim(), nebo read.lines().


# ##############################################################################
# ## Grafy a ploty.
# ##############################################################################

# Na `x` um�st�me nez�vislo a na `y` z�vislou prom�nnou, jinak �e�eno na `y` jde co chceme
# vysv�tli a na `x` ��m chceme vysv�tlit.

# po�as� vs nehodovost, je to jasn� x=po�as� a y nehodovost, obr�cen� to ned�v� smysl.
# v��ka vs barva vlas�, co d�me na x a co na y?

data1 <- read.table("data/scatter1.txt", sep="\t", header=T)
# head(data1)
plot(data1$xv, data1$ys, pch = 1, cex=0.5, main="Scatterplot", xlab="Nez�visl�", ylab="Z�visl�", col="red")
abline(lm(data1$ys ~ data1$xv), col="red", lwd="2")

data2 <- read.table("data/scatter2.txt", sep="\t", header=T)
# head(data2)
points(data2$xv, data2$ys, pch = 1, cex=0.5, main="Scatterplot", xlab="Nez�visl�", ylab="Z�visl�", col="blue")
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

# Knihovna ggplot je zalo�ena na grammar of graphics a dovoluje naprostou kontrolu na vzhledem grafu.

data <- read.table("data/daphnia.txt", header=T)
head(data)

p <- ggplot(data=data, aes(y=Growth.rate, x=Water)) + 
	geom_boxplot() + 
	geom_jitter()+ 
	facet_grid(~Detergent) +
	theme_bw()

p
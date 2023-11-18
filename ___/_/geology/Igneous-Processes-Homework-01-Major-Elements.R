#
# Igneous Processes: Homework 01
# David Landa
#


# #############################################################################
# Exercise 8.5 Generalized mixing
# #############################################################################
dataset <- "
        wt,    Pl      Ol,    Di
        SiO2,  50.54,  39.19, 55.49
        Al2O3, 31.70,  0.00,  0.00
        FeOt,  0.00,   18.75, 0.00
        MgO,   0.00,   42.06, 18.61
        CaO,   14.36,  0.00,  25.90
        Na2O,  3.40,   0.00,  0.00"

oxides <- as.matrix(read.csv(text=dataset, header = TRUE, sep = ","))

minerals <- c(0.5, 0.3, 0.2)

# SiO2    Al203  FeOt   MgO    CaO    Na2O
# 48.125  15.85  5.625  16.34  12.36  1.7
result <- minerals %*% t(oxides)
print(result)


# #############################################################################
# Exercise 8.2 Fractional crystallization
# #############################################################################
dataset <- "
        tonalite,	Pl,      Bt,	 Amp
SiO2,   55.09,      53.41,   35.32,  45.35
TiO2,   0.75,       0.00,    2.11,   1.39
Al2O3,  17.59,      29.48,   15.31,  9.47
FeOt,   7.73,       0.09,    23.56,  18.57
MgO,    3.52,       0.00,    9.05,   9.82
CaO,    8.20,       11.27,   0.01,   11.92
Na2O,   2.83,       5.05,    0.10,   1.08
K2O,    2.04,       0.12,    9.81,   1.02"

oxides <- as.matrix(read.csv(text=dataset, header = TRUE, sep = ","))

minerals <- c(0.5, 0.3, 0.2)

fc <- 0.2  # fractional crystalization

# RESULT
# SiO2    TiO2   Al2O3   FeOt    MgO    CaO    Na2O   K2O
# 46.371  0.911  21.227  10.827  4.679  8.022  2.771  3.207
cumulate <- minerals %*% t(oxides[, -1])

tonalite <- oxides[,1]

# RESULT
# SiO2      TiO2     Al2O3     FeOt     MgO      CaO     Na2O     K2O
# 57.26975  0.70975  16.68075  6.95575  3.23025  8.2445  2.84475  1.74825
CL <- (tonalite - (cumulate * fc) ) / (1 - fc)
print(CL)

# #############################################################################
# Exercise 9.4 Normative calculation
# #############################################################################

dataset <- "
       gabbro,   Pl,      Ol,      Di
SiO2,  48.125,   50.540,  39.190,  55.490
Al2O3, 15.850,   31.700,  0.000,   0.000
FeO,   5.625,    0.000,   18.750,  0.000
MgO,   16.340,   0.000,   42.060,  18.610
CaO,   12.360,   14.360,  0.000,   25.900
Na2O,  1.700,    3.400,   0.000,   0.000
"

oxides <- as.matrix(read.csv(text=dataset, header = TRUE, sep = ","))
gabbro <- oxides[,1]


# RESULT
# (Intercept)  Pl   Ol   Di
#  0.0         0.5  0.3  0.2
minerals <- lm(gabbro ~ oxides[, -1])

print(minerals) # result


# #############################################################################
# Exercise 9.1 Fractional crystallization (mjr) (reversed 8.2)
# #############################################################################

dataset <- "
            tonalite,  magma,   Pl,      Bt,      Amp
    SiO2,   55.090,    57.270,  53.410,  35.320,  45.350
    TiO2,	0.750,     0.710,	0.000,   2.110,   1.390
    Al2O3	17.590,    16.681,  29.480,  15.310,  9.470
    FeOt,	7.730,     6.956,	0.090,   23.560,  18.570
    MgO,    3.520,     3.230,	0.000,   9.050,   9.820
    CaO,    8.200,     8.245,	11.270,  0.010,   11.920
    Na2O,	2.830,     2.845,   5.050,   0.100,   1.080
    K2O,    2.040,     1.748,   0.120,   9.810,	  1.020"


oxides <- as.matrix(read.csv(text=dataset, header = TRUE, sep = ","))
tonalite <- oxides[,1]

# (Intercept)  oxides[, -1]magma     oxides[, -1]Pl     oxides[, -1]Bt    oxides[, -1]Amp
semiresult <- lm(tonalite ~ oxides[, -1])

Fm <- semiresult$coefficients[2] # fraction magma

Pl <- semiresult$coefficients[3]
Bt <- semiresult$coefficients[4]
Amp <- semiresult$coefficients[5]

plagioclase <- (Pl / (1 -Fm)) * 100
amphibole <- (Amp / (1-Fm)) * 100
biotite <- (Bt / (1-Fm)) * 100
Fc <- (1 - Fm) * 100

result <- c(plagioclase, amphibole, biotite, Fc)
print(result)

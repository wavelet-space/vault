################################################################################
# David Landa
# Igneous processes: Homework 2 (Trace Elements)
################################################################################

library(GCDkit)

################################################################################
# 14.2
################################################################################

# Read the data files.
ttg1 <- read.csv("ttg1.data", sep='\t')

# Convert to matrix.
matrix <- data.matrix(ttg1)

# Select minerals.
minerals <- matrix[,-1]
print(minerals)

# Select magma.
magma <- matrix[,1]
print(magma)

fraction <- 0.3
fraction_melt <- (1 - fraction)

cumulate <- c(0.49, 0.49, 0.02)

bulk_coeff <- minerals %*% cumulate

melt <- magma * (fraction_melt ^ (bulk_coeff - 1))

solidus <- magma * (1 - fraction_melt ^ bulk_coeff) / (1 - fraction_melt)

result <- cbind(solidus, melt, magma)

colnames(result) <- c("solidus", "melt", "magma")
result <- t(result[, c("solidus", "melt", "magma")])
print(result)

# PLOT RESULT
# ------------------------------------------------------------------------------
spider(result,"Boynton", 0.1, 1000, pch=c(15 ,1, 16), col=c("red","green","blue"))
# ------------------------------------------------------------------------------


################################################################################
# 15.1
################################################################################

# Read data form CSV to data frame
ttg2 <- read.csv("ttg2.data", sep='\t')

# Convert data frame to matrix.
matrix <- data.matrix(ttg2)

# Select last three columns of minerals.
# Subtract -1 from all matrix values.
minerals <- matrix[,-(1:2)] - 1
print(minerals)

# Select 1 (primitive) and 2 (differentiated) column of (tonalite) magma.
WR1 <- matrix[,1]; print(WR1)
WR2 <- matrix[,2]; print(WR2)

magma_diff <- log(WR2 / WR1)
print(magma_diff)


mineral_coeffs <- lsfit(minerals, magma_diff, intercept=FALSE)$coeff
print(mineral_coeffs)


F_ <- exp(sum(mineral_coeffs))

# ------------------------------------------------------------------------------
# RESULT
# ------------------------------------------------------------------------------
degree_of_frac_cryst <- (1 - F_) * 100
print(degree_of_frac_cryst)
# ------------------------------------------------------------------------------
cumulate <- mineral_coeffs / log(F_) * 100
print(cumulate)
# ------------------------------------------------------------------------------

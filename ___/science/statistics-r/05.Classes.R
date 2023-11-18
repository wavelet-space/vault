# The R is a programming language for statistical   modeling and analysis.
# One can say that it a domain specific language (in opposite to general purpouse)
# because it was intended and inveted by statisticians and for statisticians.
# R language is a open-source successor of closed-source system S. These days R
# can be used not only for commmon statistical tasks, but for machine learning
# esepcialy deep learning and even a interactove web dashboards (see Shiny).
# In the hearth R is synamicaly typed functioanl language.


# Objects in R





# Functional programming in R


set.seed(123)

df <- data.frame(
  replicate(
    6, sample(c (1:10, -99), 6, rep = TRUE)
  )
)

# Function replicate()?
# Function sample()?

df

names(df)

?replicate
?lapply
?sapply

lapply(X = c(1:10), FUN = )

?list
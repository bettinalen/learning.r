source(here::here("R/package-loading.R"))
#find R project file and source the library loading script, all relative to project


## option + minus produces <-

#object asssignment
weight_in_kilos <- 100

# vector
c("a", "b")
c(1,2)
1:10

#get overview of dataset

head(iris)
colnames(iris)
str(iris)
str(weight_in_kilos)
summary(iris)

#create new script if script gets too long

lm  ## without brackets it shows the function

# Code/ Insert Section (Up+Cmd+R)

# Ex: make code readable --------------------------------------------------
# Object names
day_one

T <- FALSE

#avoid replacing existing functions/variables with

meaningful_name <- 9
sum_data <- function(x)
  sum(x)

# Spacing
x[,1]

mean(x, na.rm = TRUE)

function(x) {}


height <- feet * 12 + inches

mean(x, na.rm = 10)
#spaces before and after =

sqrt(x ^ 2 + y ^ 2)
df$z

x <- 1:10

# Indenting
if (y < 0 && debug) {
  message("Y is negative")
}

#control + Shift + A --> reformat code accodring to style guide

# `+` shows what + does

summing <- function(a,b) {
  add_numbers <- a + b
  return(add_numbers)
}

summing(2,2)

write_csv(iris, here::here("data/iris.csv"))
##write data to data folder in project

iris_data <- write_csv(here::here("data/iris.csv"))
##output as tibble format

#don't touch raw data, only handle them with R
##session and restart R, to solve problems

# Data Wrangling ----------------------------------------------------------



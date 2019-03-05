source(here::here("R/package-loading.R"))
NHANES <- NHANES
# Exercise 1 --------------------------------------------------------------

# Take the time to get familiar with the NHANES dataset.
# Create a new R script by typing in the console usethis::use_r("exercises-wrangling").
# Then copy the code below into the file and replace the ___ with the NHANES dataset.
# Run each line of code by typing Ctrl-Enter.
# NHANES <- NHANES

#glimpse is summary and overview of data
?NHANES

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES


# Exercise 2 --------------------------------------------------------------

# Create a new variable called “UrineVolAverage” by calculating the average urine volumne (from “UrineVol1” and “UrineVol2”).
# Modify/replace the “Pulse” variable to beats per second (currently is beats per minute).
# Create a new variable called “YoungChild” when age is less than 6 years.

# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
  mutate(UrineVolAverage = (UrineVol1 + UrineVol2)/2,
         Pulse = Pulse/60,
         YoungChild = if_else(Age < 6, TRUE, FALSE))


# Exercise 3: Filtering and logic, arranging, and selecting ----------------

## Filter so only those with BMI more than 20 and less than 40 and keep only those with diabetes.
## Filter to keep those who are working (“Work”) or those who are renting (“HomeOwn”)
# and those who do not have diabetes. Select the variables age, gender, work status,
# home ownership, and diabetes status.
## Using sorting and selecting, find out who has had the most number of babies and how old they are.

# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  filter(BMI >= 25 & BMI<= 40 & Diabetes == "Yes")


# 2. Working or renting, and not diabetes
NHANES %>%
  filter(Work == "Yes" | HomeOwn == "Rent" & Diabetes == "No") %>%
  select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
  select(Age, nBabies) %>%
  arrange(desc(nBabies))


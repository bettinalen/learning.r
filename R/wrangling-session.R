source(here::here("R/package-loading.R"))

glimpse(NHANES)


NHANES <- NHANES

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

NHANES %>% colnames()

#standard R way of chaining functions together

glimpse(head(NHANES))

NHANES %>%
  head() %>%
  glimpse()


# Mutate() function -------------------------------------------------------

NHANES_changed <- NHANES %>%
  mutate(Height_meters = Height/100)

#conditional new variable
NHANES_changed <- NHANES_changed %>%
  mutate(HighlyActive = if_else(PhysActiveDays >5 & PhysActiveDays <3, "yes", "no"))

# create multiple new variables
NHANES_changed <- NHANES_changed %>%
  mutate(new_column = "only one variable", Height = Height/100,
         UrineVolAverage = (UrineVol1 + UrineVol2)/2)


# Select() Function -------------------------------------------------------
# select columns by name
NHANES_char <- NHANES %>% select(Age, Gender, BMI)

#exclude columns
NHANES_char <- NHANES %>% select(-HeadCirc)

# exclude several columns with similar names with matching functions
NHANES_char <- NHANES %>% select(starts_with("BP"), contains("Vol"))
# case sensitive?

?select_helpers


# Rename() function -------------------------------------------------------

NHANES %>%
  rename(NumberBabies = nBabies, Gender = Sex)


# filter(): Filtering/subsetting the data by row --------------------------

NHANES %>%
  filter(Gender == "female")

#select if it is not

NHANES %>%
  filter(Gender != "female")

# when BMI is equal to or more than
NHANES %>%
  filter(BMI >= 25)

# when BMI is 25 *and* Gender is female
NHANES %>%
  filter(BMI == 25 & Gender == "female")


# when BMI is 25 *or* gender is female
NHANES %>%
  filter(BMI == 25 | Gender == "female")


#  arrange(): Sorting/(re)arranging your data by column --------------------

# ascending order by age
NHANES %>%
  arrange(Age) %>%
  select(Age)

# descending order by rate
NHANES %>%
  arrange(desc(Age)) %>%
  select(Age)

# ascending order by Age and Gender
NHANES %>%
  arrange(Age, Gender) %>%
  select(Age, Gender)




# Group_by() and summarise() ----------------------------------------------

  NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))

# Grouped by gender
NHANES %>%
  group_by(Gender) %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))

NHANES %>%
  group_by(Gender, Diabetes) %>%
  summarise(MeanAge = mean(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))


# gather(): Converting from wide to long form -----------------------------

table4b %>%
  gather(year, population, -country)

table4b %>%
  gather(year, population, `1999`, `2000`)

nhanes_chars <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)
nhanes_chars

nhanes_long <- nhanes_chars %>%
  gather(Measure, Value, -SurveyYr, -Gender)
nhanes_long

nhanes_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValue = mean(Value, na.rm = TRUE))


# spread(): (If time) Converting from long to wide form -------------------

table2 %>%
  spread(key = type, value = count)





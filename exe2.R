library(readxl,quietly = TRUE)
library(dplyr,quietly = TRUE)

#Remove any pre-existing data-frame objects
if (!is.null(titanic)){
  remove(titanic)
}
# LOAD Titanic data
titanic <- read_xls("titanic3.xls")

# Convert missing 'embarked' values to 'S'
#titanic %>% group_by(embarked) %>% tally()
titanic$embarked <- ifelse(is.na(titanic$embarked), 'S',titanic$embarked)
#titanic %>% group_by(embarked) %>% tally()

# Populating the median age values for NA
titanic$age <- ifelse (titanic$age == "",NA,titanic$age)
age_mean <- mean(abc,na.rm = TRUE)
titanic$age <- ifelse(is.na(titanic$age),age_mean, titanic$age)


#Replace Boat missing values as NA
titanic$boat <- ifelse (titanic$boat == "",NA,titanic$boat)

#Create new binary column 'has_cabin_number' to denote whether cabin was allocated or not 
titanic <- cbind(titanic,"has_cabin_number" = ifelse(!is.na(titanic$cabin),1,0))

#Writing to csv file
write_csv(titanic,"titanic_clean.csv")

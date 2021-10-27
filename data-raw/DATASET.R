library(COVID19)
library(magrittr)
library(dplyr)
library(utils)
library(plyr)


# import selected data from COVID 19 package
init_data <- covid19(country = "USA", level = 2, start = "2021-10-01", end = "2021-10-01")

# select specific data from COVID 19 data set
sel_data <- init_data %>% select(id, administrative_area_level_2, date, vaccines, icu, hosp, confirmed, population, deaths)

# omit empty variable
del_data <- na.omit(sel_data)

# filter out US territories
state_data <- subset(del_data, administrative_area_level_2 != "Guam" & administrative_area_level_2 != "Virgin Islands" & administrative_area_level_2 != "District of Columbia" & administrative_area_level_2 != "American Samoa" & administrative_area_level_2 != "Puerto Rico" & administrative_area_level_2 != "Northern Mariana Islands")

# divide vaccine numbers by two given reported totals and most individuals receive two vaccines
truvac_data <- state_data %>% mutate(truvac = vaccines / 2)

# adjust data by ratio to population to make comparison of states more equal
adj_data <- truvac_data %>% mutate(icupop = icu / population, vacpop = truvac / population, hosppop = hosp / population, confpop = confirmed / population, deathpop = deaths / population)

# arrange data by highest vaccine rates to lowest
arr_data <- arrange(adj_data, desc(vacpop))

# select top five states
h <- head(arr_data, n = 5)

# select bottom five states
t <- tail(arr_data, n = 5)

# show top five states
print("The top five states for vaccination rates: ")
print(h)

# show bottom five states
print("The bottom states five for vaccination rates: ")
print(t)

# create combined global data set to be used in future functions
comb_data <- rbind(h, t)
print("The combined dataset is comb_data use this for other functions")
return(comb_data)


usethis::use_data(comb_data, overwrite = TRUE)

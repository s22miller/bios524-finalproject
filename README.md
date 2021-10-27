# millerfinalproject


Package Overview:

This package is created as the final project for bios524 R section. It is an R package aimed at looking at covid19 data based on US state data specifically vaccination rates comparison of top vs bottom five vaccinated states on certain variables. 

The library is millerfinalproject

data set - comb_data (described below) used for all functions

Functions:
sum_data() - summarizes comb_data set. Example use sum_data(comb_data)

stat_data() - statistical analysis using t test. Example use stat_data(comb_data)

regress_data() - regression analysis with visualization of data. Example use regress_data(comb_data)

vis_data() - ggplot bar graph plots of data. Example use vis_data(comb_data)


Background:

Dataset:  COVID-19 Data Hub data set cited by Enanuele Guidotti and David Ardia from University of Neuchatel, Switzerland and HEC Montreal, Canada. This is a daily updated time series of vaccines, testing, cases, deaths, hospitalizations, etc... across governmental sources at the national, regional, and city levels. The goal of the data set is to provide the research community with a unified dataset to hopefully better understand COVID-19. This is implemented as an extendable R package (R Core Team, 2020) aggregated from several sources. 

Covid 19 data set information see https://covid19datahub.io. Package is covid19 in R. 

 The millerfinalproject library was created to look at the association between vaccination rates of the top five  compared to the bottom five US states. A statistical analysis is performed looking at the impact on confirmed covid-19 cases, hospitalizations, ICU admits and deaths across US states that are top five highest vaccinated states vs the five lowest vaccinated states. 
 
The library pulls in and creates the data set comb_data which is the main data for analysis. The library has four functions for summarizing, analyzing, and visualizing the data. (sum_data, stat_data, regress_data, and vis_data)

The day October 1st, 2021 was selected for analysis. The main data set captures daily covid 19 data, most of which is cumulative, and I wanted to capture vaccination rates close enough to project due date but also as the vaccine has widespread availability. This selection was necessary but brings on limitations described below. 



# Data

The data is pulled from the R library COVID19. This pulls in daily data on covid 19 rates from all over the world with multiple variables including population, vaccinations, dates, confirmed cases, ICU admits, etc....

The library pulls from this covid19 and selects out the key areas of need for this project. These include pulling on US state data, only complete data *, variables of state (labeled administrative_area_level_2), population, vaccines, death, ICU, hospitalization, confirmed, and date. Then the data is filtered for top and bottom five states based on vaccination rates per population. 

Variable specifics:
Date - the covid19 library data is updated daily and started collection in January of 2020. The library does a static analysis of all collected variable data up to the date of October 1st, 2021. This would allow for imporved covid 19 case reporting, vaccination prevelence to help in comparison, and all US states having faced the Delta variant of the disease which is import to research question of vaccination rates impact on key clinical variables. 

Population- is the total US state population reported on that date.

Vaccine - is total cumulative vaccination doses. Discussed more in the limitations but this does not factor that the two most popular vaccines currently (Moderna and Pfizer) require two doses per person. Because these are the most popular vaccines currently the library filters the vaccine variable into a new variable called truvac that divides vaccine variable by 2. * This form of data manipulation can lead to errors in the analysis but from a clinical stand point made the most sense. For analysis truvac variable was further adjusted for population by the new variable vacpop which is the ratio of vaccines to state population. 

Hospital - this is the total number of covid 19 patients reported to be hospitalized on the date. This variable was used in the analysis as per population given states having different sizes, and is put in as the new variable hosppop. 

ICU - this is the total number of covid 19 patients reported to be admitted to a ICU on that date. This was adjusted for population under the new variable ICUpop.

Death - this is the total cumulative number of deaths from start of data collection to the date. This is adjusted by state population with the new variable deathpop. 

Confirmed- this is the cumulative number of confirmed cases from data collection to the date. Given this is a total amount this was included in the analysis under the new variable confpop adjusting for state population but because this is an ongoing total number since the start of the date collection this has limitation when trying to factor the impact vaccination has on this number.

References
Guidotti, E., Ardia, D., (2020), "COVID-19 Data Hub", Journal of Open Source Software 5(51):2376, doi: 10.21105/joss.02376.

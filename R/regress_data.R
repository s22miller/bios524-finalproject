#' @title regress_data
#'
#' @description This function will perform regression analysis of top five and bottom five states, use comb_data for data.
#'
#' @param data (data set we imported with import_data function called comb_data)
#'
#' @return lm for regression analysis
#'
#'
#' @examples
#' regress_data(comb_data)
#'
#' @import graphics
#' @importFrom stats lm qqnorm qqline
#'
#'
#' @export

regress_data <- function(data){

  # make a top and bottom five state data sets
  top_five <- head(data, n = 5)
  bottom_five <- tail(data, n = 5)

  # perform regression analysis for bottom five states on vaccine rates to ICU stays
  icu_fit <- lm(bottom_five$icupop ~ bottom_five$vacpop, data = bottom_five)
  print("Summary of ICU regression")
  print(summary(icu_fit))

  # perform regression analysis for bottom five states on vaccine rates to hospitalizations
  hosp_fit <- lm(bottom_five$hosppop ~ bottom_five$vacpop, data = bottom_five)
  print("Summary of hospitalization regression")
  print(summary(hosp_fit))

  # perform regression analysis for bottom five states on vaccine rates to death rates
  death_fit <- lm(bottom_five$deathpop ~ bottom_five$vacpop, data = bottom_five)
  print("Summary of deaths regression")
  print(summary(death_fit))

  # perform regression analysis for bottom five states on vaccine rates to confirmed rates
  confirmed_fit <- lm(bottom_five$confpop ~ bottom_five$vacpop, data = bottom_five)
  print("Summary of confirmed cases regression")
  print(summary(confirmed_fit))


  # change view to get show all graphs
  par(mfrow = c(5, 2))

  # perform regression analysis for bottom five states on vaccine rates to ICU stays
  icu_fit <- lm(bottom_five$icupop ~ bottom_five$vacpop, data = bottom_five)

  #Plot Vaccine vs ICU rate Residuals
  plot(icu_fit$resid ~ bottom_five$vacpop[order(bottom_five$vacpop)],
       main = "Vaccine rates vs \nICU Residuals", xlab = "Vaccine Rates",
       ylab = "Residuals")
  abline(h = 0, lty = 2)

  #Q-Q Plot ICU
  qqnorm(icu_fit$resid)
  qqline(icu_fit$resid)

  # perform regression analysis for bottom five states on vaccine rates to hospitalizations
  hosp_fit <- lm(bottom_five$hosppop ~ bottom_five$vacpop, data = bottom_five)

  #Plot Vaccine vs hospital rate Residuals
  plot(hosp_fit$resid ~ bottom_five$vacpop[order(bottom_five$vacpop)],
       main = "Vaccine rates vs \nHospital Residuals", xlab = "Vaccine Rates",
       ylab = "Residuals")
  abline(h = 0, lty = 2)

  #Q-Q Plot Hospital
  qqnorm(hosp_fit$resid)
  qqline(hosp_fit$resid)

  # perform regression analysis for bottom five states on vaccine rates to death rates
  death_fit <- lm(bottom_five$deathpop ~ bottom_five$vacpop, data = bottom_five)

  #Plot Vaccine vs death rate Residuals
  plot(death_fit$resid ~ bottom_five$vacpop[order(bottom_five$vacpop)],
       main = "Vaccine rates vs \nDeath Residuals", xlab = "Vaccine Rates",
       ylab = "Residuals")
  abline(h = 0, lty = 2)

  #Q-Q Plot Death Rates
  qqnorm(death_fit$resid)
  qqline(death_fit$resid)


  # perform regression analysis for bottom five states on vaccine rates to confirmed rates
  confirmed_fit <- lm(bottom_five$confpop ~ bottom_five$vacpop, data = bottom_five)

  #Plot Vaccine vs ICU rate Residuals
  plot(confirmed_fit$resid ~ bottom_five$vacpop[order(bottom_five$vacpop)],
       main = "Vaccine rates vs \nConfirmed Residuals", xlab = "Vaccine Rates",
       ylab = "Residuals")
  abline(h = 0, lty = 2)

  #Q-Q Plot ICU
  qqnorm(confirmed_fit$resid)
  qqline(confirmed_fit$resid)


  #Plot Vaccine vs ICU rate Residuals
  plot(icu_fit$resid ~ bottom_five$vacpop[order(bottom_five$vacpop)],
       main = "Vaccine rates vs \nICU Residuals", xlab = "Vaccine Rates",
       ylab = "Residuals")
  abline(h = 0, lty = 2)

  #Q-Q Plot
  qqnorm(icu_fit$resid)
  qqline(icu_fit$resid)


}

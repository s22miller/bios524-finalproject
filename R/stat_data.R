#' @title stat_data
#'
#' @description This function will perform statistical analysis of top five and bottom five states, use comb_data for data.
#'
#' @param data (data set we imported with import_data function called comb_data)
#'
#' @return t.test for statistical analysis
#'
#'
#' @examples
#' stat_data(comb_data)
#' @importFrom stats t.test
#'
#'
#' @export


stat_data <- function(data) {

  # make a top and bottom five state data sets
  top_five <- head(data, n = 5)
  bottom_five <- tail(data, n = 5)

  # run t.test on comparison of top and bottom state in selected variables
  t <- t.test(top_five$icupop, bottom_five$icupop)
  v <- t.test(top_five$vacpop, bottom_five$vacpop)
  h <- t.test(top_five$hosppop, bottom_five$hosppop)
  d <- t.test(top_five$deathpop, bottom_five$deathpop)
  c <- t.test(top_five$confpop, bottom_five$confpop)

  print("Comparison of icu")
  print(t)

  print("Comparison of vaccinations")
  print(v)

  print("Comparison of hospitalization")
  print(h)

  print("Comparison of deaths")
  print(d)

  print("Comparison of confirmed cases")
  print(c)
}

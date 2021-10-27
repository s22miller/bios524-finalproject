#' @title sum_data
#'
#' @description This function will summarize the imported covid 19 data, use comb_data for data.
#'
#' @param data (data set we imported with import_data function called comb_data)
#'
#' @return summary top and bottom five states
#'
#'
#' @examples
#' sum_data(comb_data)
#' @import utils
#'
#'
#' @export


sum_data <- function(data) {


  # make a top and bottom five state data sets
  top_five <- head(data, n = 5)
  bottom_five <- tail(data, n = 5)

  # show data
  print("These are the top five vaccinated US states")
  print(top_five)
  print("These are the bottom five vaccinated US states")
  print(bottom_five)
  print("This is the combined data of both top and bottom states")
  print(data)
  # show summary of top and bottom five state data
  print("Summary of top five states: ")
  print(summary(top_five))


  print("Summary of bottom five states: ")
  print(summary(bottom_five))
}

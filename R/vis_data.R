#' vis_data
#'
#' @description This function will visualize data and analysis, use comb_data as data
#'
#' @param data (data to graph, use comb_data)
#'
#'
#'
#'
#'
#' @examples
#' vis_data(comb_data)
#'
#' @import ggplot2 dplyr ggpubr
#' @importFrom stats reorder
#'
#'
#' @export

vis_data <- function(data){


  # make a top and bottom five state data sets
  top_five <- head(data, n = 5)
  bottom_five <- tail(data, n = 5)


  #ggplot bar graph comparing vaccination rates of top five states vs bottom five
  p1 <- ggplot(top_five, aes(reorder(top_five$administrative_area_level_2, -top_five$vacpop), top_five$vacpop, fill = top_five$administrative_area_level_2)) +
    geom_bar(stat = "identity", show.legend = FALSE) + ggtitle("Top Five \nVaccinated US States") +
    xlab("US States") + ylab("Vaccination/Population Rates") + ylim(0, 1)

  #ggplot bar graph comparing vaccination rates of top five states vs bottom five
  p2 <- ggplot(bottom_five, aes(reorder(bottom_five$administrative_area_level_2, -bottom_five$vacpop), bottom_five$vacpop, fill = bottom_five$administrative_area_level_2)) +
    geom_bar(stat = "identity", show.legend = FALSE) + ggtitle("Bottom Five \nVaccinated US States") +
    xlab("US States") + ylab("Vaccination/Population Rates") + ylim(0, 1)

  #ggplot bar graph comparing vaccination rates of bottom five states vs bottom five
  p3 <- ggplot(data, aes(reorder(data$administrative_area_level_2, -data$icupop), data$icupop, fill = data$administrative_area_level_2)) +
    geom_bar(stat = "identity", show.legend = FALSE) + ggtitle("Top vs Bottom Five \nICU Rates US States") +
    xlab("US States") + ylab("ICU/Population Rates")

  #ggplot bar graph comparing vaccination rates of bottom five states vs bottom five
  p4 <- ggplot(data, aes(reorder(data$administrative_area_level_2, -data$hosppop), data$hosppop, fill = data$administrative_area_level_2)) +
    geom_bar(stat = "identity", show.legend = FALSE) + ggtitle("Top vs Bottom Five \nHospital Rates US States") +
    xlab("US States") + ylab("Hospital/Population Rates")

  #ggplot bar graph comparing vaccination rates of bottom five states vs bottom five
  p5 <- ggplot(data, aes(reorder(data$administrative_area_level_2, -data$deathpop), data$deathpop, fill = data$administrative_area_level_2)) +
    geom_bar(stat = "identity", show.legend = FALSE) + ggtitle("Top vs Bottom Five \nDeath Rates US States") +
    xlab("US States") + ylab("Death Rates/Population Rates")

  #ggplot bar graph comparing vaccination rates of bottom five states vs bottom five
  p6 <- ggplot(data, aes(reorder(data$administrative_area_level_2, -data$confpop), data$confpop, fill = data$administrative_area_level_2)) +
    geom_bar(stat = "identity", show.legend = FALSE) + ggtitle("Top vs Bottom Five \nConfirmed Rates US States") +
    xlab("US States") + ylab("Confirmed Cases/Population Rates")



  # arrange plots on single grid
  figure <- ggarrange(p1, p2, p3, p4, p5, p6, labels = c("A", "B", "C", "D", "E"), ncol = 2, nrow = 3)
  figure


}

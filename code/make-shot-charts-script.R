######################################
## Project: GSW Shot Charts
## Script Purpose: Generate Shot Charts for 5 GSW players
## Inputs: shots-data.csv
## Outputs: Shot charts
##Date: 3/5/2019
## Author: Jacob Fajnor
######################################

# Preliminary matters
setwd("C:/Users/Fajnor/Desktop/workout01")
library(ggplot2)
library(dplyr)
library(jpeg)
library(grid)
# load data into enviornment
data <- read.csv("./data/shots-data.csv", stringsAsFactors = FALSE)

# Stephen Curry shot-chart
curry <- filter(data, name == "Stephen Curry")
ggplot(data = curry, aes(x = x, y = y)) + geom_point(aes(x = x, y = y, color = shot_made_flag))

# court background image
court_file <- "./images/half-court.JPG"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))
curry_shot_chart <- ggplot(data = curry, aes(x = x, y = y)) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  annotation_custom(court_image, -250, 250, -5, 420) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
curry_shot_chart
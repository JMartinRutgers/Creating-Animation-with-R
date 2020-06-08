library(tidyverse)
library(hrbrthemes)
library(plotly)
library(patchwork)
library(babynames)
library(viridis)
library(ggplot2)
library(dplyr)
library(gganimate)

# Load dataset from github
data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/3_TwoNumOrdered.csv", header=T)
str(data)
data$date <- as.Date(data$date)
str(data)

# plot
data %>%
  ggplot( aes(x=date, y=value)) +
  geom_line(color="#69b3a2") +
  ggtitle("Evolution of Bitcoin price") +
  ylab("bitcoin price ($)") +
  theme_ipsum()+
  transition_reveal(date)
anim_save("jorg.gif")
animate(p, fps=5,renderer = gifski_renderer("virusevolution.gif"))

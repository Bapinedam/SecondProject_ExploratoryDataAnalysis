## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2

## Question:
## Of the four types of sources indicated by the type (point, nonpoint, 
## onroad, nonroad) variable, which of these four sources have seen decreases in emissions 
## from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

str(NEI)

library(ggplot2)
library(dplyr)

data <- NEI %>% group_by(year, type) %>% summarise(Emissions = sum(Emissions))

ggplot(data = data, aes(x = year, y = Emissions)) +
  geom_point(show.legend = TRUE, color = "5dc1b9", size = 3) + 
  geom_line(color = "5dc1b9", size = 1.5) + facet_grid(.~type) +
  theme_minimal()

dev.copy(png, "plot3.png")
dev.off()
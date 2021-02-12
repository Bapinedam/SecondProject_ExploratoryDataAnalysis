## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2

## Question:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.


NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

bxp <- boxplot(Emissions ~ year, maryland, xlab = "Year", ylab = "PM2.5 (tons)", ylim = c(0, 3))
bxp$stats
title(main = "Maryland")

sapply(1:ncol(bxp$stats), function(x) {
  text(x = x + 0.2, 
       labels = format(bxp$stats[c(3,4), x], digits = 2), 
       y = bxp$stats[c(3,4), x] + 0.2, 
       cex = 0.8, 
       col = "blue", 
       font = 2)
})

dev.copy(png, "plot2.png")
dev.off()
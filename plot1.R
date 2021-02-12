## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2

## Question:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission
## from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

bxp <- boxplot(Emissions ~ year, NEI, xlab = "Year", ylab = "PM2.5 (tons)", ylim = c(0, 0.3))
bxp$stats

sapply(1:ncol(bxp$stats), function(x) {
  text(x = x + 0.2, 
       labels = format(bxp$stats[c(3,4), x], digits = 2), 
       y = bxp$stats[c(3,4), x] + 0.01, 
       cex = 0.8, 
       col = "blue", 
       font = 2)
})

dev.copy(png, "plot1.png")
dev.off()
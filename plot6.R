## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2

## Question:
## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

sub4 <- subset(NEI, fips == "06037" & type=="ON-ROAD")
lamot.sources <- aggregate(sub4[c("Emissions")], list(type = sub4$type, year = sub4$year, zip = sub4$fips), sum)
comp.mv <- rbind(baltmot.sources, lamot.sources)
qplot(year, Emissions, data = comp.mv, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels") 

dev.copy(png, "plot6.png")
dev.off()
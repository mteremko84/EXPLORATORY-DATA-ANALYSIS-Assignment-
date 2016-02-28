
#make sure that you are in the curent working directory
#which should contain data to be loaded
setwd("C:/Users/JOHN/Desktop/PROJECT 2 exploratory data science")

#Loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# 24510 is Baltimore, 06037 is LA CA
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotalYearlybyFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalYearlybyFips$fips[aggregatedTotalYearlybyFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalYearlybyFips$fips[aggregatedTotalYearlybyFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(aggregatedTotalYearlybyFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()

#make sure that you are in the curent working directory
setwd("C:/Users/JOHN/Desktop/PROJECT 2 exploratory data science")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in #Baltimore City?

# 24510 is Baltimore
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC #only gave a subset (non-cars)
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalYearly <- aggregate(Emissions ~ year, subsetNEI, sum)

#Plotting
library(ggplot2)
png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalYearly, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()



# Plot 3.R code for assignment 2
> setwd("C:/Users/JOHN/Desktop/PROJECT 2 exploratory data science")
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
# 24510 is Baltimore
> subsetNEI  <- NEI[NEI$fips=="24510", ]

> aggregatedTotalYearlyByType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

> library(ggplot2)

> png("plot3.png", width=640, height=480)
> g <- ggplot(aggregatedTotalYearlyByType, aes(year, Emissions, color = type))
> g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
> print(g)
> dev.off()
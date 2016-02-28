#Plot1.R code for assignment 2
setwd("C:/Users/JOHN/Desktop/PROJECT 2 exploratory data science")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
aggregatedTotalYearly <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(aggregatedTotalYearly$Emissions, xlab="years", ylab = expression('total PM'[2.5]*' emission'), main = expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
#First make sure that you are in the directory you are working from
#then type this code

#Plot2.R code for assignment 2
setwd("C:/Users/JOHN/Desktop/PROJECT 2 exploratory data science")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]
 aggregatedTotalYearly <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')

barplot(aggregatedTotalYearly$Emissions, xlab="years", ylab = expression('total PM'[2.5]*' emission'), main = expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()

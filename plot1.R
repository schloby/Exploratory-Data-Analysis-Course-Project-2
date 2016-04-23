#Question 1:

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.


#Read in the data every time per the instructions
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Get the total PM2.5 emissions per year
yearly_sum<-with(NEI, tapply(Emissions, year, sum))

#Plot this in base plotting system using barplot and save to .png

png('plot1.png')
barplot(yearly_sum, xlab="Year", ylab= "Total PM2.5 Emissions", main="Total PM2.5 emissions from all sources")
dev.off()

#Yes, it looks like total emissions have decreased.
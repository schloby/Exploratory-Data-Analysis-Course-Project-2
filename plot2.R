#Question 2: 

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.


#Read in the data every time per the instructions
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Subset the data for Baltimore City, Maryland (fips == "24510")
baltimore<-subset(NEI, fips == "24510")

#Get the total PM2.5 emissions per year for baltimore
yearly_sum<-with(baltimore, tapply(Emissions, year, sum))

#Plot this in base plotting system using barplot and save to .png
png('plot2.png')
barplot(yearly_sum, xlab="Year", ylab= "Total PM2.5 Emissions", main="Total PM2.5 emissions for Baltimore City, Maryland")
dev.off()

#Total emissions have decreased since 1999, but they increased in 2005 first. 
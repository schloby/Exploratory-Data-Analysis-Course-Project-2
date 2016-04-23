#Question 5:

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#No plotting system is specified in the question.
#Load ggplot2 since we will be using it
library(ggplot2)

#Read in the data every time per the instructions
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data for Baltimore City, Maryland (fips == "24510")
baltimore<-subset(NEI, fips == "24510")

#Get the vehicle sources
vehicle_list<-grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicle<-SCC[vehicle_list,]

#Merge them to get vehicles in Baltimore
vehicle_baltimore<- merge(baltimore, vehicle, by="SCC")


#plot and save to png
png('plot5.png')
g<-ggplot(data=vehicle_baltimore, aes(factor(year), Emissions))+geom_bar(stat="identity")+labs(title="Emissions from vehicles in Baltimore City", y="Emissions", x="Year")+theme_bw()
print(g)
dev.off()

#Emissions from motor vehicle sources in Baltimore City dropped heavily from 1999 to 2002
#and continued to decrease up to 2008. 
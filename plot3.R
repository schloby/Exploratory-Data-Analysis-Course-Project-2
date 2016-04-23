#Question 3:

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#Make sure the ggplot2 package is loaded, since we will be using it.
library(ggplot2)

#Read in the data every time per the instructions
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data for Baltimore City, Maryland (fips == "24510")
baltimore<-subset(NEI, fips == "24510")

#Add up by year and source type
yearly_sum_source<- aggregate(Emissions ~ year + type, baltimore, sum)

#Use qplot to quickly plot the results and save to png
#(This could be prettier, but it answers the question. )
png('plot3.png')
q<-qplot(year, Emissions, data=yearly_sum_source, color=type, geom="line", main="Emissions in Baltimore City, Marlyand")
print(q)
dev.off()

#Non points and non road have had decreases. On-road is flatter, but also decreased since 1999. 
#Point seems to have increased slightly, coming down after really increasing in 2005. 
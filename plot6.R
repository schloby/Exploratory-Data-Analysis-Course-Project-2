#Question 6:

#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

#No plotting system is specified in the question.

#Read in the data every time per the instructions
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Get the vehicle sources
vehicle_list<-grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicle<-SCC[vehicle_list,]

#Subset the data for Baltimore City, Maryland (fips == "24510")  and Los Angeles County, California (fips =="06037")
#Merge with vehicles
cities<-subset(NEI, fips == "24510" | fips == "06037")
cities_vehicle<-merge(cities, vehicle, by="SCC")

#plot and save to png
png('plot6.png')
g<-ggplot(data=cities_vehicle, aes(factor(year), Emissions))+facet_grid(fips~., scales="free")+geom_bar(stat="identity")+theme_bw() +labs(title="Emissions from vehicles in LA and Baltimore", y="Emissions", x="Year")
print(g)
dev.off()

#LA (top) has seen more change over time
#Baltimore was relatively low and decreased a bit over time
#LA started high, got higher, and then decreased again, but not to previous levels
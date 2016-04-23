#Question 4:

#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#No plotting system is specified in the question.
#Load ggplot2 since we will be using it
library(ggplot2)

#Read in the data every time per the instructions
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge them to get the source names
NEISCC<- merge(NEI, SCC, by="SCC")

#Find the ones with coal
coal<-grep("coal", NEISCC$SCC.Level.Three, ignore.case  =TRUE)

#Find the ones with combustion
combust<-grep("combustion", NEISCC$SCC.Level.One, ignore.case  =TRUE)

#Get the subset with both coal and combustion
cc<-intersect(coal,combust)
NEI.cc<-NEISCC[cc,]

#Plot and save to png
png('plot4.png')
g<-ggplot(data=NEI.cc, aes(factor(year), Emissions))+geom_bar(stat="identity")+labs(title="Emissions from Coal and Combustion Sources in the US", y="Emissions", x="Year")+theme_bw()
print(g)
dev.off()

#Overall, emissions in the US from coal and combustion sources have gone down since 1999.



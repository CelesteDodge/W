#Date: April 12th 2018
#Purpose: join surveys table with surveySummaryTable to create box plots
#box  plots will display a transect's average and sd of preliminary infiltration (a length of water over time)
#Author: Celeste Dodge
#dependencies: need to update survey summary and transect summary before running 

rm(list=ls())

#__Step 1_______Read in the data files
setwd("C:/Users/cdodge/Desktop/GIT/W/PMD")
surveys <- read.csv("surveys.csv")
setwd("C:/Users/cdodge/Desktop/GIT/W/PMD/summaries")
surveyResults <- read.csv("surveySummaryTable.csv")
str(surveyResults)
#____Step 2_______ create box plots for avg infiltration results at transects
#merge surveySummaryTable and surveys

#Trim out rows not at GLM transects (transect = NA)
glmSurveys <-surveys[! surveys$grasslandTransect %in% NA,]
results <- merge(glmSurveys, surveyResults, by="survey_id")
#Format date field so x axis displays data chronologically
results$Date <- as.Date(results$Date, "%m/%d/%Y")
str(results)
#Note the number of rows dropped from 97 to 91 (imperfect match on one survey id - maybe these are surveys I have, but don;t have obs data
#*********************
#QC issue check for unmatched pairs etc

#rename the column  "LM_LengthOverTime_prelimC1" to "C1" for readability
#It has the results we are interested in
colnames(results)[19]
colnames(results)[19] <-"C1"
str(results)

#____Step 3__________Build box plots for each transect's unique survey dates

#HAR01
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_HAR01.jpg') 
HAR01 <- results[results$grasslandTransect == "HAR01",]
boxplot(C1~Date,data=HAR01, main="HAR01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average cm of Water Divided by Minutes",
        ylim = c(0, 1.2))
dev.off()

#MED01        
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MED01.jpg') 
MED01 <- results[results$grasslandTransect == "MED01",]
boxplot(C1~Date,data=MED01, main="MIX01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average cm of Water Divided by Minutes",
        ylim = c(0, 1.2))
dev.off()

#MED02        
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MED02.jpg') 
MED02 <- results[results$grasslandTransect == "MED02",]
boxplot(C1~Date,data=MED02, main="MIX01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average cm of Water Divided by Minutes",
        ylim = c(0, 1.2))
dev.off()

#MIX01        
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MIX01.jpg') 
MIX01 <- results[results$grasslandTransect == "MIX01",]
boxplot(C1~Date,data=MIX01, main="MIX01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average cm of Water Divided by Minutes",
        ylim = c(0, 1.2))
dev.off()

#MIX03
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MIX03.jpg') 
MIX03 <- results[results$grasslandTransect == "MIX03",]
boxplot(C1~Date,data=MIX03, main="MIX03: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average cm of Water Divided by Minutes",
        ylim = c(0, 1.2))
dev.off()

#MIX05
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MIX05.jpg') 
MIX05 <- results[results$grasslandTransect == "MIX05",]
boxplot(C1~Date,data=MIX05, main="MIX05: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average cm of Water Divided by Minutes",
        ylim = c(0, 1.2))
dev.off()

#NAT01
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_NAT01.jpg') 
NAT01 <- results[results$grasslandTransect == "NAT01",]
boxplot(C1~Date,data=NAT01, main="NAT01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average cm of Water Divided by Minutes",
        ylim = c(0, 1.2))
dev.off()

#NAT02
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_NAT02.jpg') 
NAT02 <- results[results$grasslandTransect == "NAT02",]
boxplot(C1~Date,data=NAT02, main="NAT02: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average cm of Water Divided by Minutes",
        ylim = c(0, 1.2))
dev.off()

#____Step 4_______Account for suction with boxplots
#Note: transect data loaded while making splots above
library(ggplot2)

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/boxplot_3factors_HAR01.jpg') 
ggplot(HAR01, aes(x = Date,  y = C1))+
  geom_boxplot(aes(fill = suctionSetting,
                   group = interaction(factor(Date), suctionSetting)))+
  ggtitle("HAR01 Preliminary Average Infiltration") + theme(plot.title = element_text(hjust = 0.5))+
  ylab("~ C1 (cm per minute)")+
  geom_jitter(shape = 1)
dev.off()

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/boxplot_3factors_MED01.jpg') 
ggplot(MED01, aes(x = Date,  y = C1))+
  geom_boxplot(aes(fill = suctionSetting,
                   group = interaction(factor(Date), suctionSetting)))+
  ggtitle("MED01 Preliminary Average Infiltration") + theme(plot.title = element_text(hjust = 0.5))+
  ylab("~ C1 (cm per minute)")
geom_jitter(shape = 1)
dev.off()

#Need to ignore dates where fewer than 4 surveys done
unique(MED02$Date)
MED02_fullDates <- MED02[which(MED02$Date == "2016-02-26"| MED02$Date == "2018-03-23"),]
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/boxplot_3factors_MED02.jpg') 
ggplot(MED02_fullDates, aes(x = Date,  y = C1))+
  geom_boxplot(aes(fill = suctionSetting,
        group = interaction(factor(Date), suctionSetting)))+
  ggtitle("MED02 Preliminary Average Infiltration") + theme(plot.title = element_text(hjust = 0.5))+
  ylab("~ C1 (cm per minute)")
geom_jitter(shape = 1)
dev.off()

#Need to ignore dates where fewer than 4 surveys done
unique(MIX01$Date)
MIX01_fullDates <- MIX01[which(MIX01$Date == "2016-02-05"| MIX01$Date == "2018-03-07"),]
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/boxplot_3factors_MIX01.jpg') 
ggplot(MIX01_fullDates, aes(x = Date,  y = C1))+
  geom_boxplot(aes(fill = suctionSetting,
                   group = interaction(factor(Date), suctionSetting)))+
  ggtitle("MIX01 Preliminary Average Infiltration") + theme(plot.title = element_text(hjust = 0.5))+
  ylab("~ C1 (cm per minute)")
geom_jitter(shape = 1)
dev.off()

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/boxplot_3factors_MIX03.jpg') 
ggplot(MIX03, aes(x = Date,  y = C1))+
  geom_boxplot(aes(fill = suctionSetting,
                   group = interaction(factor(Date), suctionSetting)))+
  ggtitle("MIX03 Preliminary Average Infiltration") + theme(plot.title = element_text(hjust = 0.5))+
  ylab("~ C1 (cm per minute)")
geom_jitter(shape = 1)
dev.off()

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/boxplot_3factors_MIX05.jpg') 
ggplot(MIX05, aes(x = Date,  y = C1))+
  geom_boxplot(aes(fill = suctionSetting,
                   group = interaction(factor(Date), suctionSetting)))+
  ggtitle("MIX05 Preliminary Average Infiltration") + theme(plot.title = element_text(hjust = 0.5))+
  ylab("~ C1 (cm per minute)")
geom_jitter(shape = 1)
dev.off()

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/boxplot_3factors_NAT01.jpg') 
ggplot(NAT01, aes(x = Date,  y = C1))+
  geom_boxplot(aes(fill = suctionSetting,
                   group = interaction(factor(Date), suctionSetting)))+
  ggtitle("NAT01 Preliminary Average Infiltration") + theme(plot.title = element_text(hjust = 0.5))+
  ylab("~ C1 (cm per minute)")
geom_jitter(shape = 1)
dev.off()

#Need to ignore dates where fewer than 4 surveys done
unique(NAT02$Date)
NAT02_fullDates <- NAT02[which(NAT02$Date == "2016-02-13" | NAT02$Date == "2018-03-23"),]
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/boxplot_3factors_NAT02.jpg') 
ggplot(NAT02_fullDates, aes(x = Date,  y = C1))+
  geom_boxplot(aes(fill = suctionSetting,
                   group = interaction(factor(Date), suctionSetting)))+
  ggtitle("NAT02 Preliminary Average Infiltration") + theme(plot.title = element_text(hjust = 0.5))+
  ylab("~ C1 (cm per minute)")
geom_jitter(shape = 1)
dev.off()

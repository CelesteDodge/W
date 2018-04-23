#Date: March 29th 2018
#Purpose: Visualize minidisk observations at each site over time 
  #graph curve of infiltration versus square root of time
  #colorize lines based on suction setting
#Author: Celeste Dodge

#Required Libraries: ggplot2
#load the requisite library for plots
library("ggplot2")

rm(list=ls())
#__Step 1_______Setup
#Read in the data and look at it with head() and str()
setwd("C:/Users/cdodge/Desktop/GIT/W/PMD")
obs <- read.csv("miniDiskObservations.csv")
#change infiltration from factor to numeric #view issue with str(obs) 
obs$infiltration <- as.numeric(levels(obs$infiltration)[obs$infiltration])

#__Step 2_______build a ggplot for a single site (HAR01_01)
#__Step 2.1_______get unique survey_id at HAR01_01
siteObs <- obs[grep("HAR01_01", obs$survey_id),]
unique(siteObs$survey_id,)
#subset obs data into plot data for only this site's observations
plotData <- obs[which(obs$survey_id =='PMDHAR01_01_18-03-07'),]
plotData2 <- obs[which(obs$survey_id =='HAR01_01_15-11-17'),]

#__Step 2.2_______set up filename for plot
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/HAR01_01_minidisk_observations.jpg')

#__Step 2.4_______build ggplot
ggplot()+
  geom_point(aes(x = plotData$squarerootTime, y = plotData$infiltration),
    color = 'black')+
  geom_point(aes(x = plotData2$squarerootTime, y = plotData2$infiltration),
    color = 'blue')+
  geom_line(aes(x = plotData2$squarerootTime, y = plotData2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_01')+
  theme(plot.title = element_text(hjust = 0.5))+   
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
#save plot file
dev.off()

#__Step 3 ______build ggplots for additional points/sites at same transect
#get survey_id at HAR01_02
siteObs <- obs[grep("HAR01_02", obs$survey_id),]
unique(siteObs$survey_id,)                  
plot2Data <- obs[which(obs$survey_id =='PMDHAR01_02_18-03-07'),]
plot2Data2 <- obs[which(obs$survey_id =='HAR01_02_15-11-17'),]
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/HAR01_02_minidisk_observations.jpg') 
ggplot()+
  geom_point(aes(x = plot2Data$squarerootTime, y = plot2Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot2Data2$squarerootTime, y = plot2Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot2Data2$squarerootTime, y = plot2Data2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_02')+
  theme(plot.title = element_text(hjust = 0.5))+   
  xlim(0,50)+   
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get survey_id at HAR01_03
#this one has 3, one of which is suction setting 2 (in red)
siteObs <- obs[grep("HAR01_03", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot3Data <- obs[which(obs$survey_id =='PMDHAR01_03_18-03-07-2'),]
plot3DataFirstAttempt <- obs[which(obs$survey_id =='PMDHAR01_03_18-03-07'),]
plot3Data2 <- obs[which(obs$survey_id =='HAR01_03_15-11-17'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/HAR01_03_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot3Data$squarerootTime, y = plot3Data$infiltration),
             color = 'red')+
  geom_point(aes(x = plot3DataFirstAttempt$squarerootTime, y = plot3DataFirstAttempt$infiltration),
             color = 'black')+
  geom_point(aes(x = plot3Data2$squarerootTime, y = plot3Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot3Data2$squarerootTime, y = plot3Data2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_03')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at HAR01_04
siteObs <- obs[grep("HAR01_04", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot4Data <- obs[which(obs$survey_id =='PMDHAR01_04_18-03-07'),]
plot4Data2 <- obs[which(obs$survey_id =='HAR01_04_15-11-17'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/HAR01_04_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot4Data$squarerootTime, y = plot4Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot4Data2$squarerootTime, y = plot4Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot4Data2$squarerootTime, y = plot4Data2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_04')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at HAR01_05
siteObs <- obs[grep("HAR01_05", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot5Data <- obs[which(obs$survey_id =='PMDHAR01_05_18-03-07'),]
plot5Data2 <- obs[which(obs$survey_id =='HAR01_05_15-11-17'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/HAR01_05_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot5Data$squarerootTime, y = plot5Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot5Data2$squarerootTime, y = plot5Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot5Data2$squarerootTime, y = plot5Data2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_05')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#__Step 4_______build plots for NAT01

#get surveys_id at NAT01_01
siteObs <- obs[grep("NAT01_01", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot6Data <- obs[which(obs$survey_id =='PMDNAT01_01_18-03-06'),]
plot6Data2 <- obs[which(obs$survey_id =='NAT01_01_15-10-29'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT01_01_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot6Data$squarerootTime, y = plot6Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot6Data2$squarerootTime, y = plot6Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot6Data2$squarerootTime, y = plot6Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_01')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#NAT01_02

siteObs <- obs[grep("NAT01_02", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot7Data <- obs[which(obs$survey_id =='PMDNAT01_02_18-03-06'),]
plot7Data2 <- obs[which(obs$survey_id =='NAT01_02_15-10-29'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT01_02_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot7Data$squarerootTime, y = plot7Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot7Data2$squarerootTime, y = plot7Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot7Data2$squarerootTime, y = plot7Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_02')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#NAT01_03

siteObs <- obs[grep("NAT01_03", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot8Data <- obs[which(obs$survey_id =='PMDNAT01_03_18-03-06'),]
plot8Data2 <- obs[which(obs$survey_id =='NAT01_03_15-10-29'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT01_03_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot8Data$squarerootTime, y = plot8Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot8Data2$squarerootTime, y = plot8Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot8Data2$squarerootTime, y = plot8Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_03')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#NAT01_04

siteObs <- obs[grep("NAT01_04", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot9Data <- obs[which(obs$survey_id =='PMDNAT01_04_18-03-06'),]
plot9Data1 <- obs[which(obs$survey_id =='PMDNAT01_04_18-03-06-2'),]
plot9Data2 <- obs[which(obs$survey_id =='NAT01_04_15-10-29'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT01_04_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot9Data$squarerootTime, y = plot9Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot9Data1$squarerootTime, y = plot9Data1$infiltration),
             color = 'red')+
  geom_point(aes(x = plot9Data2$squarerootTime, y = plot9Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot9Data2$squarerootTime, y = plot9Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_04')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#NAT01_05

siteObs <- obs[grep("NAT01_05", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot10Data <- obs[which(obs$survey_id =='PMDNAT01_05_18-03-06'),]
plot10Data2 <- obs[which(obs$survey_id =='NAT01_05_15-10-29'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT01_05_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot10Data$squarerootTime, y = plot10Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot10Data2$squarerootTime, y = plot10Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot10Data2$squarerootTime, y = plot10Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_05')+
  theme(plot.title = element_text(hjust = 0.5))+   
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#__Step 5_______build plots for MIX05 (a transect where suction 2 was used in 2015 and suctions3 in 2018)

#get surveys_id at MIX05_01
siteObs <- obs[grep("MIX05_01", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot11Data <- obs[which(obs$survey_id =='PMDMIX05_01_18-04-09'),]
plot11Data2 <- obs[which(obs$survey_id =='MIX05_01_16-04-08'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX05_01_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot11Data$squarerootTime, y = plot11Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot11Data2$squarerootTime, y = plot11Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot11Data2$squarerootTime, y = plot11Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MIX05_01')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+   
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX05_02
siteObs <- obs[grep("MIX05_02", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot12Data <- obs[which(obs$survey_id =='PMDMIX05_02_18-04-09'),]
plot12Data1 <- obs[which(obs$survey_id =='PMDMIX05_02_18-04-09-2'),]
plot12Data2 <- obs[which(obs$survey_id =='MIX05_02_16-04-08'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX05_02_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot12Data$squarerootTime, y = plot12Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot12Data1$squarerootTime, y = plot12Data1$infiltration),
             color = 'red')+
  geom_point(aes(x = plot12Data2$squarerootTime, y = plot12Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot12Data2$squarerootTime, y = plot12Data2$infiltration),
            color = 'blue')+
  ggtitle('MIX05_02')+
  theme(plot.title = element_text(hjust = 0.5))+ 
  xlim(0,50)+   
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX05_03
siteObs <- obs[grep("MIX05_03", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot13Data <- obs[which(obs$survey_id =='PMDMIX05_03_18-04-09'),]
plot13Data2 <- obs[which(obs$survey_id =='MIX05_03_16-04-08'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX05_03_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot13Data$squarerootTime, y = plot13Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot13Data2$squarerootTime, y = plot13Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot13Data2$squarerootTime, y = plot13Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MIX05_03')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+  
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX05_04
siteObs <- obs[grep("MIX05_04", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot14Data <- obs[which(obs$survey_id =='PMDMIX05_04_18-04-09'),]
plot14Data1 <- obs[which(obs$survey_id =='PMDMIX05_04_18-04-09-2'),]
plot14Data3 <- obs[which(obs$survey_id =='PMDMIX05_04_18-04-09-3'),]
plot14Data2 <- obs[which(obs$survey_id =='MIX05_04_16-04-08'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX05_04_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot14Data$squarerootTime, y = plot14Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot14Data1$squarerootTime, y = plot14Data1$infiltration),
             color = 'red')+
  geom_point(aes(x = plot14Data3$squarerootTime, y = plot14Data3$infiltration),
             color = 'orange')+
  geom_point(aes(x = plot14Data2$squarerootTime, y = plot14Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot14Data2$squarerootTime, y = plot14Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MIX05_04')+
  theme(plot.title = element_text(hjust = 0.5))+  
  xlim(0,50)+   
  ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX05_05
siteObs <- obs[grep("MIX05_05", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot15Data <- obs[which(obs$survey_id =='PMDMIX05_05_18-04-09'),]
plot15Data2 <- obs[which(obs$survey_id =='MIX05_05_16-04-08'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX05_05_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot15Data$squarerootTime, y = plot15Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot15Data2$squarerootTime, y = plot15Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot15Data2$squarerootTime, y = plot15Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MIX05_05')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#__Step 6_______build plots for MED01

#get surveys_id at MED01_01
siteObs <- obs[grep("MED01_01", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot16Data <- obs[which(obs$survey_id =='PMDMED01_01_18-03-14'),]
plot16Data2 <- obs[which(obs$survey_id =='MED01_01_15-12-15'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED01_01_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot16Data$squarerootTime, y = plot16Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot16Data2$squarerootTime, y = plot16Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot16Data2$squarerootTime, y = plot16Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MED01_01')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MED01_02
siteObs <- obs[grep("MED01_02", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot17Data <- obs[which(obs$survey_id =='PMDMED01_02_18-03-14'),]
plot17Data2 <- obs[which(obs$survey_id =='MED01_02_15-12-15'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED01_02_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot17Data$squarerootTime, y = plot17Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot17Data2$squarerootTime, y = plot17Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot17Data2$squarerootTime, y = plot17Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MED01_02')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MED01_03
siteObs <- obs[grep("MED01_03", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot18Data <- obs[which(obs$survey_id =='PMDMED01_03_18-03-14'),]
plot18Data2 <- obs[which(obs$survey_id =='MED01_03_15-12-15'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED01_03_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot18Data$squarerootTime, y = plot18Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot18Data2$squarerootTime, y = plot18Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot18Data2$squarerootTime, y = plot18Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MED01_03')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MED01_04
siteObs <- obs[grep("MED01_04", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot19Data <- obs[which(obs$survey_id =='PMDMED01_04_18-03-14'),]
plot19Data2 <- obs[which(obs$survey_id =='MED01_04_15-12-15'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED01_04_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot19Data$squarerootTime, y = plot19Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot19Data2$squarerootTime, y = plot19Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot19Data2$squarerootTime, y = plot19Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MED01_04')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MED01_05
siteObs <- obs[grep("MED01_05", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot20Data <- obs[which(obs$survey_id =='PMDMED01_05_18-03-14'),]
plot20Data2 <- obs[which(obs$survey_id =='MED01_05_15-12-15'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED01_05_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot20Data$squarerootTime, y = plot20Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot20Data2$squarerootTime, y = plot20Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot20Data2$squarerootTime, y = plot20Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MED01_05')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#__Step 7_______build plots for MED02

#get surveys_id at MED02_01
siteObs <- obs[grep("MED02_01", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot21Data <- obs[which(obs$survey_id =='PMDMED02_01_18-03-23'),]
plot21Data2 <- obs[which(obs$survey_id =='MED02_01_16-02-26'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED02_01_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot21Data$squarerootTime, y = plot21Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot21Data2$squarerootTime, y = plot21Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot21Data2$squarerootTime, y = plot21Data2$infiltration),
            color = 'blue')+
  ggtitle('MED02_01')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MED02_02
siteObs <- obs[grep("MED02_02", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot22Data <- obs[which(obs$survey_id =='PMDMED02_02_18-03-23'),]
plot22Data2 <- obs[which(obs$survey_id =='MED02_02_16-02-26'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED02_02_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot22Data$squarerootTime, y = plot22Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot22Data2$squarerootTime, y = plot22Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot22Data2$squarerootTime, y = plot22Data2$infiltration),
            color = 'blue')+
  ggtitle('MED02_02')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MED02_03
siteObs <- obs[grep("MED02_03", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot23Data <- obs[which(obs$survey_id =='PMDMED02_03_18-03-23'),]
plot23Data1 <- obs[which(obs$survey_id =='PMDMED02_03_18-03-23-2'),]
plot23Data2 <- obs[which(obs$survey_id =='MED02_03_16-02-26'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED02_03_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot23Data$squarerootTime, y = plot23Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot23Data1$squarerootTime, y = plot23Data1$infiltration),
             color = 'red')+
  geom_point(aes(x = plot23Data2$squarerootTime, y = plot23Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot23Data2$squarerootTime, y = plot23Data2$infiltration),
            color = 'blue')+
  ggtitle('MED02_03')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MED02_04
siteObs <- obs[grep("MED02_04", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot24Data <- obs[which(obs$survey_id =='PMDMED02_04_18-03-23'),]
plot24Data2 <- obs[which(obs$survey_id =='MED02_04_16-02-26'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED02_04_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot24Data$squarerootTime, y = plot24Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot24Data2$squarerootTime, y = plot24Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot24Data2$squarerootTime, y = plot24Data2$infiltration),
            color = 'blue')+
  ggtitle('MED02_04')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MED02_05
siteObs <- obs[grep("MED02_05", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot25Data <- obs[which(obs$survey_id =='PMDMED02_05_18-03-23'),]
plot25Data2 <- obs[which(obs$survey_id =='MED02_05_16-02-26'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MED02_05_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot25Data$squarerootTime, y = plot25Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot25Data2$squarerootTime, y = plot25Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot25Data2$squarerootTime, y = plot25Data2$infiltration),
            color = 'blue')+
  ggtitle('MED02_05')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#__Step 8_______build plots for MIX01

#get surveys_id at MIX01_01
siteObs <- obs[grep("MIX01_01", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot26Data <- obs[which(obs$survey_id =='PMDMIX01_01_18-03-07'),]
plot26Data2 <- obs[which(obs$survey_id =='MIX01_01_16-02-05'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX01_01_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot26Data$squarerootTime, y = plot26Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot26Data2$squarerootTime, y = plot26Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot26Data2$squarerootTime, y = plot26Data2$infiltration),
            color = 'blue')+
  ggtitle('MIX01_01')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX01_02
siteObs <- obs[grep("MIX01_02", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot27Data <- obs[which(obs$survey_id =='PMDMIX01_02_18-03-30'),]
plot27Data2 <- obs[which(obs$survey_id =='MIX01_02_16-02-05'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX01_02_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot27Data$squarerootTime, y = plot27Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot27Data2$squarerootTime, y = plot27Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot27Data2$squarerootTime, y = plot27Data2$infiltration),
            color = 'blue')+
  ggtitle('MIX01_02')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX01_03
siteObs <- obs[grep("MIX01_03", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot28Data <- obs[which(obs$survey_id =='PMDMIX01_03_18-03-07'),]
plot28Data2 <- obs[which(obs$survey_id =='MIX01_03_16-02-05'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX01_03_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot28Data$squarerootTime, y = plot28Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot28Data2$squarerootTime, y = plot28Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot28Data2$squarerootTime, y = plot28Data2$infiltration),
            color = 'blue')+
  ggtitle('MIX01_03')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX01_04
siteObs <- obs[grep("MIX01_04", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot29Data <- obs[which(obs$survey_id =='PMDMIX01_04_18-03-07'),]
plot29Data2 <- obs[which(obs$survey_id =='MIX01_04_16-02-05'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX01_04_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot29Data$squarerootTime, y = plot29Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot29Data2$squarerootTime, y = plot29Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot29Data2$squarerootTime, y = plot29Data2$infiltration),
            color = 'blue')+
  ggtitle('MIX01_04')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX01_05
siteObs <- obs[grep("MIX01_05", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot30Data <- obs[which(obs$survey_id =='PMDMIX01_05_18-03-07'),]
plot30Data1 <- obs[which(obs$survey_id =='PMDMIX01_05_18-03-07-2'),]
plot30Data2 <- obs[which(obs$survey_id =='MIX01_05_16-02-05'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX01_05_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot30Data$squarerootTime, y = plot30Data$infiltration),
             color = 'gray')+
  geom_point(aes(x = plot30Data1$squarerootTime, y = plot30Data1$infiltration),
             color = 'black')+
  geom_point(aes(x = plot30Data2$squarerootTime, y = plot30Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot30Data2$squarerootTime, y = plot30Data2$infiltration),
            color = 'blue')+
  ggtitle('MIX01_05')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#__Step 9_______build plots for MIX03

#get surveys_id at MIX03_01
siteObs <- obs[grep("MIX03_01", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot31Data <- obs[which(obs$survey_id =='PMDMIX03_01_18-03-30'),]
plot31Data2 <- obs[which(obs$survey_id =='MIX03_01_16-04-01'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX03_01_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot31Data$squarerootTime, y = plot31Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot31Data2$squarerootTime, y = plot31Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot31Data2$squarerootTime, y = plot31Data2$infiltration),
            color = 'blue')+
  ggtitle('MIX03_01')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX03_02
siteObs <- obs[grep("MIX03_02", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot32Data <- obs[which(obs$survey_id =='PMDMIX03_02_18-03-30'),]
plot32Data2 <- obs[which(obs$survey_id =='MIX03_02_16-04-01'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX03_02_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot32Data$squarerootTime, y = plot32Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot32Data2$squarerootTime, y = plot32Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot32Data2$squarerootTime, y = plot32Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MIX03_02')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX03_03
siteObs <- obs[grep("MIX03_03", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot33Data <- obs[which(obs$survey_id =='PMDMIX03_03_18-03-30'),]
plot33Data2 <- obs[which(obs$survey_id =='MIX03_03_16-04-01'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX03_03_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot33Data$squarerootTime, y = plot33Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot33Data2$squarerootTime, y = plot33Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot33Data2$squarerootTime, y = plot33Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MIX03_03')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX03_04
siteObs <- obs[grep("MIX03_04", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot34Data <- obs[which(obs$survey_id =='PMDMIX03_04_18-03-30'),]
plot34Data2 <- obs[which(obs$survey_id =='MIX03_04_16-04-01'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX03_04_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot34Data$squarerootTime, y = plot34Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot34Data2$squarerootTime, y = plot34Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot34Data2$squarerootTime, y = plot34Data2$infiltration),
            color = 'sky blue')+
  ggtitle('MIX03_04')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at MIX03_05
siteObs <- obs[grep("MIX03_05", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot35Data <- obs[which(obs$survey_id =='PMDMIX03_05_18-03-30'),]
plot35Data2 <- obs[which(obs$survey_id =='MIX03_05_16-04-01'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/MIX03_05_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot35Data$squarerootTime, y = plot35Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot35Data2$squarerootTime, y = plot35Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot35Data2$squarerootTime, y = plot35Data2$infiltration),
            color = 'blue')+
  ggtitle('MIX03_05')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#__Step 10_______build plots for NAT02

#get surveys_id at NAT02_01
siteObs <- obs[grep("NAT02_01", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot36Data <- obs[which(obs$survey_id =='PMDNAT02_01_18-03-23'),]
plot36Data1 <- obs[which(obs$survey_id =='PMDNAT02_01_18-03-23-2'),]
plot36Data2 <- obs[which(obs$survey_id =='NAT02_01_16-02-13'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT02_01_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot36Data$squarerootTime, y = plot36Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot36Data1$squarerootTime, y = plot36Data1$infiltration),
             color = 'red')+
  geom_point(aes(x = plot36Data2$squarerootTime, y = plot36Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot36Data2$squarerootTime, y = plot36Data2$infiltration),
            color = 'sky blue')+
  ggtitle('NAT02_01')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at NAT02_02
siteObs <- obs[grep("NAT02_02", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot37Data <- obs[which(obs$survey_id =='PMDNAT02_02_18-03-23'),]
plot37Data2 <- obs[which(obs$survey_id =='NAT02_02_16-02-13'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT02_02_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot37Data$squarerootTime, y = plot37Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot37Data2$squarerootTime, y = plot37Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot37Data2$squarerootTime, y = plot37Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT02_02')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at NAT02_03
siteObs <- obs[grep("NAT02_03", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot38Data <- obs[which(obs$survey_id =='PMDNAT02_03_18-03-23'),]
plot38Data2 <- obs[which(obs$survey_id =='NAT02_03_16-02-13'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT02_03_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot38Data$squarerootTime, y = plot38Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot38Data2$squarerootTime, y = plot38Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot38Data2$squarerootTime, y = plot38Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT02_03')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at NAT02_04
siteObs <- obs[grep("NAT02_04", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot39Data <- obs[which(obs$survey_id =='PMDNAT02_04_18-03-23'),]
plot39Data2 <- obs[which(obs$survey_id =='NAT02_04_16-02-13'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT02_04_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot39Data$squarerootTime, y = plot39Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot39Data2$squarerootTime, y = plot39Data2$infiltration),
             color = 'sky blue')+
  geom_line(aes(x = plot39Data2$squarerootTime, y = plot39Data2$infiltration),
            color = 'sky blue')+
  ggtitle('NAT02_04')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()

#get surveys_id at NAT02_05
siteObs <- obs[grep("NAT02_05", obs$survey_id),] 
unique(siteObs$survey_id,)                   
plot40Data <- obs[which(obs$survey_id =='PMDNAT02_05_18-03-23'),]
plot40Data2 <- obs[which(obs$survey_id =='NAT02_05_16-02-13'),]

jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/NAT02_05_minidisk_observations.jpg')

ggplot()+
  geom_point(aes(x = plot40Data$squarerootTime, y = plot40Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot40Data2$squarerootTime, y = plot40Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot40Data2$squarerootTime, y = plot40Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT02_05')+
  theme(plot.title = element_text(hjust = 0.5))+   xlim(0,50)+   ylim(0,6)+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
dev.off()



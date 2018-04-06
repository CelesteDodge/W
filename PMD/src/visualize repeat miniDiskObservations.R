#Date: March 29th 2018
#Purpose: Visualize minidisk observations at each site over time 
  #graph curve of infiltration versus square root of time
  #colorize lines based on suction setting
#Author: Celeste Dodge

#Required Libraries: ggplot2

rm(list=ls())
#__Step 1_______Read in the data and look at it
setwd("C:/Users/cdodge/Desktop/GIT/W/PMD")
obs <- read.csv("miniDiskObservations.csv")
head(obs)
str(obs)
#change infiltration from factor to numeric
obs$infiltration <- as.numeric(levels(obs$infiltration)[obs$infiltration])
surveys <- read.csv("surveys.csv")
head(surveys)


#__Step 2_______build a ggplot for a site (HAR01)
plotData <- obs[which(obs$survey_id =='PMDHAR01_01_18-03-07'),]
plotData2 <- obs[which(obs$survey_id =='HAR01_01_15-11-17'),]
library("ggplot2")
ggplot()+
  geom_point(aes(x = plotData$squarerootTime, y = plotData$infiltration),
    color = 'black')+
  geom_point(aes(x = plotData2$squarerootTime, y = plotData2$infiltration),
    color = 'blue')+
  geom_line(aes(x = plotData2$squarerootTime, y = plotData2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_01')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
  
#__Step 3 ______Set up for additional points at site
#get survey_id at HAR01_02
siteObs <- obs[grep("HAR01_02", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot2Data <- obs[which(obs$survey_id =='PMDHAR01_02_18-03-07'),]
plot2Data2 <- obs[which(obs$survey_id =='HAR01_02_15-11-17'),]

ggplot()+
  geom_point(aes(x = plot2Data$squarerootTime, y = plot2Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot2Data2$squarerootTime, y = plot2Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot2Data2$squarerootTime, y = plot2Data2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_02')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

#get survey_id at HAR01_03
#this one has 3, one of which is suction setting 2 (in red)
siteObs <- obs[grep("HAR01_03", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot3Data <- obs[which(obs$survey_id =='PMDHAR01_03_18-03-07-2'),]
plot3DataFirstAttempt <- obs[which(obs$survey_id =='PMDHAR01_03_18-03-07'),]
plot3Data2 <- obs[which(obs$survey_id =='HAR01_03_15-11-17'),]

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
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

#get surveys_id at HAR01_04
siteObs <- obs[grep("HAR01_04", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot4Data <- obs[which(obs$survey_id =='PMDHAR01_04_18-03-07'),]
plot4Data2 <- obs[which(obs$survey_id =='HAR01_04_15-11-17'),]

ggplot()+
  geom_point(aes(x = plot4Data$squarerootTime, y = plot4Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot4Data2$squarerootTime, y = plot4Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot4Data2$squarerootTime, y = plot4Data2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_04')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

#get surveys_id at HAR01_05
siteObs <- obs[grep("HAR01_05", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot5Data <- obs[which(obs$survey_id =='PMDHAR01_05_18-03-07'),]
plot5Data2 <- obs[which(obs$survey_id =='HAR01_05_15-11-17'),]

ggplot()+
  geom_point(aes(x = plot5Data$squarerootTime, y = plot5Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot5Data2$squarerootTime, y = plot5Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot5Data2$squarerootTime, y = plot5Data2$infiltration),
            color = 'blue')+
  ggtitle('HAR01_05')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

#__Step 3_______build plots for NAT01

#get surveys_id at NAT01_01 (theres only 1 in records QC issue with 2016 data)
siteObs <- obs[grep("NAT01_01", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot6Data <- obs[which(obs$survey_id =='PMDNAT01_01_18-03-06'),]


ggplot()+
  geom_point(aes(x = plot6Data$squarerootTime, y = plot6Data$infiltration),
             color = 'black')+
  ggtitle('NAT01_01')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')


#NAT01_02

siteObs <- obs[grep("NAT01_02", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot7Data <- obs[which(obs$survey_id =='PMDNAT01_02_18-03-06'),]
plot7Data2 <- obs[which(obs$survey_id =='NAT01_02_15-10-29'),]

ggplot()+
  geom_point(aes(x = plot7Data$squarerootTime, y = plot7Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot7Data2$squarerootTime, y = plot7Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot7Data2$squarerootTime, y = plot7Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_02')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

#NAT01_03

siteObs <- obs[grep("NAT01_03", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot8Data <- obs[which(obs$survey_id =='PMDNAT01_03_18-03-06'),]
plot8Data2 <- obs[which(obs$survey_id =='NAT01_03_15-10-29'),]

ggplot()+
  geom_point(aes(x = plot8Data$squarerootTime, y = plot8Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot8Data2$squarerootTime, y = plot8Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot8Data2$squarerootTime, y = plot8Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_03')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')
               
#NAT01_04

siteObs <- obs[grep("NAT01_04", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot9Data <- obs[which(obs$survey_id =='PMDNAT01_04_18-03-06'),]
plot9Data1 <- obs[which(obs$survey_id =='PMDNAT01_04_18-03-06-2'),]
plot9Data2 <- obs[which(obs$survey_id =='NAT01_04_15-10-29'),]

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
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

#NAT01_05

siteObs <- obs[grep("NAT01_05", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot10Data <- obs[which(obs$survey_id =='PMDNAT01_05_18-03-06'),]
plot10Data2 <- obs[which(obs$survey_id =='NAT01_05_15-10-29'),]

ggplot()+
  geom_point(aes(x = plot10Data$squarerootTime, y = plot10Data$infiltration),
             color = 'black')+
  geom_point(aes(x = plot10Data2$squarerootTime, y = plot10Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot10Data2$squarerootTime, y = plot10Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_05')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

#NAT01_06 ??? What is going on? All 2015 data may have incorrect site attributed to it.

siteObs <- obs[grep("NAT01_06", obs$survey_id),]
unique(siteObs$survey_id,)                   
plot11Data2 <- obs[which(obs$survey_id =='NAT01_06_15-10-29'),]

ggplot()+
  geom_point(aes(x = plot11Data2$squarerootTime, y = plot11Data2$infiltration),
             color = 'blue')+
  geom_line(aes(x = plot11Data2$squarerootTime, y = plot11Data2$infiltration),
            color = 'blue')+
  ggtitle('NAT01_06??')+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

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
surveys <- read.csv("surveys.csv")
head(surveys)

#__Step 2_______build a ggplot for a site
plotData <- obs[which(obs$survey_id =='PMDHAR01_01_18-03-07'),]
plotData2 <- obs[which(obs$survey_id =='HAR01_01_15-11-17'),]
library("ggplot2")
ggplot()+
  geom_point(aes(x = plotData$squarerootTime, y = plotData$infiltration),
    color = 'black')+
  geom_point(aes(x = plotData2$squarerootTime, y = plotData2$infiltration),
             color = 'blue')+
  ggtitle("Test Plot HAR01_01")+
  xlab('Square Root of Time (Seconds)')+
  ylab('Cummulative Infiltration')

#the geom line function is not working for me today
ggplot()+
geom_line(aes(x = plotData$squarerootTime, y = plotData$infiltration),
          color = 'blue')
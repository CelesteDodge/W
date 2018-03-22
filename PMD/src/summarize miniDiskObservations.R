#Date: March 15th 2018
#Purpose: summarize minidisk observations for PMD project 
  #observations per survey
  #total minutes of surveys
  #total volume (mL) infiltrated
#Author: Celeste Dodge

#__Step 1_______Read in the data and look at it
rm(list=ls())

setwd("C:/Users/cdodge/Documents/R/PMD")
getwd()

obs <- read.csv("miniDiskObs.csv")
head(obs)

#__Step 2_______Crunch basic stats about the survey observations
#how many surveys are in the DB?
length(unique(obs$survey_id))

#get number observations per survey
totals <- data.frame(unique(obs$survey_id))
totals$countObs <- table(obs$survey_id)
head(totals)

#Get delta Volume and integrate
#Get cummulative infiltration per survey and merge with number observations
maxVolume <- aggregate(volume ~ survey_id, obs, max)
minVolume <- aggregate(volume ~ survey_id, obs, min)
head(maxVolume)
#calculate delta Volume
vols <- merge(maxVolume, minVolume, by.x="survey_id", by.y="survey_id")
vols$deltaVolume <- vols$volume.x - vols$volume.y
head(vols)
volumeInfiltrated <-
#remove 'start and end volumes (x,y) column
keep <- c("survey_id", "deltaVolume")
delta <- vols[keep]
#merge delta volume and count of observations
summary <- merge(delta, totals, by.x ="survey_id", by.y = "unique.obs.survey_id.")
head(summary)

#get survey length and merge to get full summary of surveys
surveyLength <- aggregate(time ~survey_id, obs, max)
head(surveyLength)
surveyLength$minutes <- surveyLength$time/60
#remove 'time' column that's in seconds
keep <- c("survey_id", "minutes")
minutes <- surveyLength[keep]
head(minutes)
#merge with the other survey sumary data 
fullSummary <- merge(minutes, summary, by.x="survey_id", by.y="survey_id")
head(fullSummary)

#Write the data as a summary file
write.csv(fullSummary, file = "surveySummary3_March2018.csv")


#Date: April 10th 2018
#Purpose: summarize minidisk surveys for PMD project 
  #observations per survey
  #total minutes of surveys
  #total volume (mL) infiltrated
  #length of water infiltrated and length over time (preliminary infiltration rate)
#Author: Celeste Dodge

rm(list=ls())

#__Step 1_______Read in the data, sort by the survey id and examine (sorting ensures table() function works properly)
setwd("C:/Users/cdodge/Desktop/GIT/W/PMD")
obs <- read.csv("miniDiskObservations.csv")

#reorder obs in ascending order of survey_id
order.survey_id <- order(obs$survey_id)
obs <- obs[order.survey_id,]

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

#Create columns similar to C1 factor (a length over time) to summarize infiltration for each survey
fullSummary$LM_LengthOfWater <- fullSummary$deltaVolume/(pi*2.25^2)
fullSummary$LM_LengthOverTime_prelimC1 <-fullSummary$LM_LengthOfWater/surveyLength$time
head(fullSummary)

#Write the data as a summary file
setwd("C:/Users/cdodge/Desktop/GIT/W/PMD/summaries")
write.csv(fullSummary, file = "surveySummaryTable.csv")


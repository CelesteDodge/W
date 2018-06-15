#Data: June 13, 2018
#Purpose: Check and Process ibutton data
#Author: Celeste Dodge
#Dependencies: reshape2, lubridate libraries

rm(list=ls())

##___STEP 1_____read in data and format time column, examine data
ibuttons <- read.csv("C:/Users/cdodge/Desktop/GIT/W/SFM/Headwaters Flow Onset/ibutton_pipe_temperature_observations.csv") 
str(ibuttons)
ibuttons$TS <- as.POSIXct(ibuttons$Date.Time,format="%m/%d/%Y %H:%M")

#Check on overall temperature value range (it is -3.94 to 67.4)
max(ibuttons$Value)
min(ibuttons$Value)

#___STEP 2_____prep data to compare sensors that are co-located (changing to wide format is the goal)
#We will use reshape, but to avoid aggregation, drop extra columns and duplicate rows
drops <- c("Unit","Date.Time")
ib <- ibuttons[ , !(names(ibuttons) %in% drops)]
#are there duplicate rows, yes there are 7. remove dulicate rows
duplicates <- ib[duplicated(ib),]
View(duplicates,)
ib_nodups <- ib[!duplicated(ib),]

#remove dulicate rows for individual sensors
#look at rows of duplicates to get sensors with duplicates


#uh oh there will be lots of blanks in wide foramt because the clocks were set at differing times
library(lubridate)
#round time to nearest half hour by using the 30 minute unit to round to nearest half hour
#this re introduces duplicates, because some ibuttons were set to record every 15 min (i.e. 9:26 and 9:41 are both rounded to 9:30)
ib_nodups$RTS <- round_date(ib_nodups$TS, unit = "30 minutes")
head(ib_nodups)
#remove TS columns
ib_nodups_rounded <- ib_nodups[,-3]
head(ib_nodups_rounded)
#Load library to create wideform data
#need to add aggregation statistic because there are duplicate time x site x sensor values after rounding
library(reshape2)
wideform <- dcast(ib_nodups_rounded, fun.aggregate = mean, RTS ~ Sensor, value.var = "Value")

#write a file to examine outside R
setwd("C:/Users/cdodge/Desktop/GIT/W/SFM/Headwaters Flow Onset")
write.csv(ib_nodups, file = "nodups_long.csv")

#now compare two co-located sensors MC1H/MC1Hb and MC1L/MC1Lb
MC1H_compare <- wideform[wideform$MC1H!="NaN" & wideform$MC1Hb!="NaN",]
MC1H_compare<- MC1H_compare[,c(1,2,3)]
MC1H_compare$diff <- abs(MC1H_compare$MC1H - MC1H_compare$MC1Hb)

MC1L_compare <- wideform[wideform$MC1L!="NaN" & wideform$MC1Lb!="NaN",]
MC1L_compare <- MC1L_compare[,c(1,4,5)]
MC1L_compare$diff <- abs(MC1L_compare$MC1L - MC1L_compare$MC1Lb)
max(MC1H_compare$diff) 
max(MC1L_compare$diff)
#maximum difference is less than degrees (not concerning)

#Get daily max min
#create date column
install.packages('xts')
library(xts)
sum.dat <- ib_nodups[,-4]
apply.daily(as.xts(sum.dat), mean)
  
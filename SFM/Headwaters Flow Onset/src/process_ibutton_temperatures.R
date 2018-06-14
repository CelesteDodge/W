#Data: June 13, 2018
#Purpose: Check and Process ibutton data
#Author: Celeste


##___STEP 1_____read in data and format time column, examine data
ibuttons <- read.csv("C:/Users/cdodge/Desktop/GIT/W/SFM/Headwaters Flow Onset/ibutton_pipe_temperature_observations.csv") 
str(ibuttons)
ibuttons$TS <- as.POSIXct(ibuttons$Date.Time,format="%m/%d/%Y %H:%M")

#Check on overall temperature value range (it is -3.94 to 67.4)
max(ibuttons$Value)
min(ibuttons$Value)

#___STEP 2_____prep data to compare sensors that are co-located
library(reshape2)
#We will use reshape, but to avoid aggregation, drop extra columns and duplicate rows
drops <- c("Unit","Date.Time")
ib <- ibuttons[ , !(names(ibuttons) %in% drops)]
#are there duplicate rows, yes there are 6. remove dulicate rows
duplicates <- ib[duplicated(ib),]
ib_nodups <- ib[!duplicated(ib),]

#remove dulicate rows for individual sensors
#subset data by sensor and removes a row with duplicate TS column of subset
MC1H <- ib_nodups[ib_nodups$Sensor =="MC1H",]
MC1H_noDups <- MC1H[!duplicated(MC1H$TS),]
RC1H <- ib_nodups[ib_nodups$Sensor =="RC1H",]
RC1H_noDups <- RC1H[!duplicated(RC1H$TS),]
RC1L <- ib_nodups[ib_nodups$Sensor =="RC1L",]
RC1L_noDups <- RC1L[!duplicated(RC1L$TS),]

remaining_sensors <- c("MC1L", "WC1L", "WC1H", "MC1Hb", "MC1Lb")
rs_data <- ib_nodups[ib_nodups$Sensor %in% remaining_sensors,]
ib_nodups3 <- do.call("rbind", list(RC1L_noDups, RC1H_noDups, MC1H_noDups, rs_data))
wideform <- dcast(ib_nodups3, TS ~ Sensor, value.var = "Value")

#uh oh there are lots of balnks because the clocks were set at differing times

head(wideform)
library(lubridate)
ib_nodups3$RTS <- round_date(ib_nodups3$TS, unit = "30 minutes")
head(ib_nodups3)
#remove TS columns
ib_nodups3_rounded <- ib_nodups3[,-3]
head(ib_nodups3_rounded)
unique(ib_nodups3_rounded$RTS)
wideform2 <- dcast(ib)
grep()

#now compare co-located sensors
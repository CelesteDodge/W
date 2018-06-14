

#source functions locally (not working to source from github as demo'd on hobo_examples.R
source("C:/Users/cdodge/Desktop/WFH/hobo_functions.R")
location <- "github"

hobos.temp <- HOBO.getFromRaw(plots=c(1301:1350), sensorType="AirTemp", location=location)
head(hobos.temp)

#____Step 1______get and repair raw data for units and timestamps issues
#get the temperature data (integrates raw hobo files,transforms daylight savings to standard)
#flags all sensor_data with U falg indicating data is unflagged
#reads in related tables(lists) and creates blank then creates a list of them including, sensor_data, tests_run, flag_definitions, deployment_log, incident_reports
hobos.temp <-HOBO.getFromRaw(sensorType = "airTemp")
#repair temperature timestamps based on incident_reports
hobos.temp <- HOBO.repairTimestamps(hobos.temp)
#explore structure and flags
str(hobos.temp)
unique(hobos.temp$sensor_data$flags)

#____Step 1______flag the data
#flag temperature data based on tests listed in flag_definitions table
hobos.temp <- HOBO.flagData(hobos.temp, c("VB","VE","P4","S"))
#take a look at the flags applied

unique(hobos.temp$sensor_data$flags)

#RH
hobos.rh <- HOBO.getFromRaw(plots=c(1301:1350), sensorType = "RH", location=location)

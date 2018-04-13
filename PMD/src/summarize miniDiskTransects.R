#Date: April 10th 2018
#Purpose: summarize minidisk surveys for PMD project 
  #observations per survey
  #total minutes of surveys
  #total volume (mL) infiltrated
  #length of water infiltrated and length over time (preliminary infiltration rate)
#Author: Celeste Dodge

#******
#REQUIREMENTS: run "summarize miniDiskObservation.R" to updated values on new surveys before running this

rm(list=ls())

#__Step 1_______Read in the survey summary data, 

setwd("C:/Users/cdodge/Desktop/GIT/W/PMD/summaries")
surveys <- read.csv("surveySummaryTable.csv")
str(surveys)
head(surveys)
#Build empty data frame into which you will paste results for 8 GLM transects
TransectSummaryTable <- data.frame(survey_date=as.Date(character()),
                                   AVG_LengthOverTime=character(), 
                                   SD_LengthOverTime=character(),
                                   transect_id=character()
                                    ) 



#__Step 2_______Calculate mean and SD of preliminary infiltration rate at MIX05 transect
#get survey_id and view unique surveys at selected site
transectSurveys <- surveys[grep("MIX05", surveys$survey_id),] 
unique(transectSurveys$survey_id,)  

#select out all points at the transect for each survey date
surveyOne <- transectSurveys[grep("16-04-08",transectSurveys$survey_id),]
#if different suction settings were used, keep only the highest suction settings at each point
surveyTwo_all <- transectSurveys[grep("18-04-09",transectSurveys$survey_id),]
unique(surveyTwo_all$survey_id)
surveyTwo <- surveyTwo_all[surveyTwo_all$survey_id %in% c("PMDMIX05_01_18-04-09", 
                                                           "PMDMIX05_02_18-04-09-2", 
                                                           "PMDMIX05_03_18-04-09", 
                                                           "PMDMIX05_04_18-04-09-3", 
                                                           "PMDMIX05_05_18-04-09"), ]

#Build columns for transect summary table via calculating statistics and binding rows
AVG_LengthOverTime <- rbind(mean(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyTwo[["LM_LengthOverTime_prelimC1"]]))
SD_LengthOverTime <- rbind(sd(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            sd(surveyTwo[["LM_LengthOverTime_prelimC1"]]))
Survey_date <- rbind("16-04-10", "18-04-09")

#build a dataframe from columns
transectAverage <- cbind.data.frame(Survey_date, AVG_LengthOverTime, SD_LengthOverTime)
transectAverage$Transect_id <- "MIX05"
head(transectAverage)
#add these rows to the summary table
TransectSummaryTable <- rbind(TransectSummaryTable, transectAverage)


#__Step 3_______Calculate mean and variation of preliminary infiltration rate at HAR01 transect
#get survey_id and view unique surveys at selected site
transectSurveys <- surveys[grep("HAR01", surveys$survey_id),] 
unique(transectSurveys$survey_id,)  

#select out all points at the transect for each survey date
surveyOne <- transectSurveys[grep("15-11-17",transectSurveys$survey_id),]
surveyTwo <- transectSurveys[grep("18-03-07",transectSurveys$survey_id),]


#Build columns for transect summary table via calculating statistics and binding rows
AVG_LengthOverTime <- rbind(mean(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyTwo[["LM_LengthOverTime_prelimC1"]]))
SD_LengthOverTime <- rbind(sd(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                           sd(surveyTwo[["LM_LengthOverTime_prelimC1"]]))
Survey_date <- rbind("15-11-17", "18-03-07")

#build a dataframe from columns
transectAverage <- cbind.data.frame(Survey_date, AVG_LengthOverTime, SD_LengthOverTime)
transectAverage$Transect_id <- "HAR01"
head(transectAverage)
#add these rows to the summary table
TransectSummaryTable <- rbind(TransectSummaryTable, transectAverage)


#__Step 4_______Calculate mean and variation of preliminary infiltration rate at MED02 transect
#get survey_id and view unique surveys at selected site
transectSurveys <- surveys[grep("MED02", surveys$survey_id),] 
unique(transectSurveys$survey_id,)  

#select out all points at the transect for each survey date
surveyOne <- transectSurveys[grep("16-02-26",transectSurveys$survey_id),]
surveyTwo <- transectSurveys[grep("18-02-21",transectSurveys$survey_id),]
surveyThree <- transectSurveys[grep("18-03-23",transectSurveys$survey_id),]


#Build columns for transect summary table via calculating statistics and binding rows
AVG_LengthOverTime <- rbind(mean(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyTwo[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyThree[["LM_LengthOverTime_prelimC1"]])
                            )
SD_LengthOverTime <- rbind(sd(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                           "NA",
                           sd(surveyThree[["LM_LengthOverTime_prelimC1"]])
                           )
Survey_date <- rbind("16-02-26", "18-02-21", "18-03-23")

#build a dataframe from columns
transectAverage <- cbind.data.frame(Survey_date, AVG_LengthOverTime, SD_LengthOverTime)
transectAverage$Transect_id <- "MED02"
head(transectAverage)
#add these rows to the summary table
TransectSummaryTable <- rbind(TransectSummaryTable, transectAverage)

#__Step 5_______Calculate mean and variation of preliminary infiltration rate at MED01 transect
#get survey_id and view unique surveys at selected site
transectSurveys <- surveys[grep("MED01", surveys$survey_id),] 
unique(transectSurveys$survey_id,)  

#select out all points at the transect for each survey date
surveyOne <- transectSurveys[grep("15-12-15",transectSurveys$survey_id),]
surveyTwo <- transectSurveys[grep("18-03-14",transectSurveys$survey_id),]


#Build columns for transect summary table via calculating statistics and binding rows
AVG_LengthOverTime <- rbind(mean(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyTwo[["LM_LengthOverTime_prelimC1"]])
                            )

SD_LengthOverTime <- rbind(sd(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                           sd(surveyTwo[["LM_LengthOverTime_prelimC1"]])
                            )

Survey_date <- rbind("15-12-15", "18-03-14")

#build a dataframe from columns
transectAverage <- cbind.data.frame(Survey_date, AVG_LengthOverTime, SD_LengthOverTime)
transectAverage$Transect_id <- "MED01"
head(transectAverage)
#add these rows to the summary table
TransectSummaryTable <- rbind(TransectSummaryTable, transectAverage)

#__Step 6_______Calculate mean and variation of preliminary infiltration rate at MIX01 transect
#get survey_id and view unique surveys at selected site
transectSurveys <- surveys[grep("MIX01", surveys$survey_id),] 
unique(transectSurveys$survey_id,)  

#select out all points at the transect for each survey date
surveyOne <- transectSurveys[grep("16-02-05",transectSurveys$survey_id),]
surveyTwo_all <- transectSurveys[grep("18-03-07",transectSurveys$survey_id),]
#Note there was no data captured for PMDMIX01_02_18-03-07 (only 4/5 points were captured that day)
surveyTwo <- surveyTwo_all[surveyTwo_all$survey_id %in% c("PMDMIX01_01_18-03-07", 
                                                          "PMDMIX01_03_18-03-07", 
                                                          "PMDMIX01_04_18-03-07", 
                                                          "PMDMIX01_05_18-03-07-2"), ]

#Build columns for transect summary table via calculating statistics and binding rows
AVG_LengthOverTime <- rbind(mean(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyTwo[["LM_LengthOverTime_prelimC1"]])
)

SD_LengthOverTime <- rbind(sd(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                           sd(surveyTwo[["LM_LengthOverTime_prelimC1"]])
)

Survey_date <- rbind("16-02-01", "18-03-07")

#build a dataframe from columns
transectAverage <- cbind.data.frame(Survey_date, AVG_LengthOverTime, SD_LengthOverTime)
transectAverage$Transect_id <- "MIX01"
head(transectAverage)
#add these rows to the summary table
TransectSummaryTable <- rbind(TransectSummaryTable, transectAverage)

#__Step 7_______Calculate mean and variation of preliminary infiltration rate at MIX03 transect
#get survey_id and view unique surveys at selected site
transectSurveys <- surveys[grep("MIX03", surveys$survey_id),] 
unique(transectSurveys$survey_id,)  

#select out all points at the transect for each survey date
surveyOne <- transectSurveys[grep("16-04-01",transectSurveys$survey_id),]
surveyTwo <- transectSurveys[grep("18-03-30",transectSurveys$survey_id),]

#Build columns for transect summary table via calculating statistics and binding rows
AVG_LengthOverTime <- rbind(mean(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyTwo[["LM_LengthOverTime_prelimC1"]])
)

SD_LengthOverTime <- rbind(sd(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                           sd(surveyTwo[["LM_LengthOverTime_prelimC1"]])
)

Survey_date <- rbind("16-04-01", "18-03-30")

#build a dataframe from columns
transectAverage <- cbind.data.frame(Survey_date, AVG_LengthOverTime, SD_LengthOverTime)
transectAverage$Transect_id <- "MIX03"
head(transectAverage)
#add these rows to the summary table
TransectSummaryTable <- rbind(TransectSummaryTable, transectAverage)

#__Step 8_______Calculate mean and variation of preliminary infiltration rate at NAT01 transect
#get survey_id and view unique surveys at selected site
transectSurveys <- surveys[grep("NAT01", surveys$survey_id),] 
unique(transectSurveys$survey_id,)  

#select out all points at the transect for each survey date
surveyOne <- transectSurveys[grep("15-10-29",transectSurveys$survey_id),]
surveyTwo_all <- transectSurveys[grep("18-03-06",transectSurveys$survey_id),]
surveyTwo <- surveyTwo_all[surveyTwo_all$survey_id %in% c("PMDNAT01_01_18-03-06",
                                                          "PMDNAT01_02_18-03-06",
                                                          "PMDNAT01_03_18-03-06", 
                                                          "PMDNAT01_04_18-03-06-2", 
                                                          "PMDNAT01_05_18-03-06"), ]

#Build columns for transect summary table via calculating statistics and binding rows
AVG_LengthOverTime <- rbind(mean(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyTwo[["LM_LengthOverTime_prelimC1"]])
)

SD_LengthOverTime <- rbind(sd(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                           sd(surveyTwo[["LM_LengthOverTime_prelimC1"]])
)

Survey_date <- rbind("15-10-29", "18-03-06")

#build a dataframe from columns
transectAverage <- cbind.data.frame(Survey_date, AVG_LengthOverTime, SD_LengthOverTime)
transectAverage$Transect_id <- "NAT01"
head(transectAverage)
#add these rows to the summary table
TransectSummaryTable <- rbind(TransectSummaryTable, transectAverage)

#__Step 9_______Calculate mean and variation of preliminary infiltration rate at NAT02 transect
#get survey_id and view unique surveys at selected site
transectSurveys <- surveys[grep("NAT02", surveys$survey_id),] 
unique(transectSurveys$survey_id,)  

#select out all points at the transect for each survey date
surveyOne <- transectSurveys[grep("16-02-13",transectSurveys$survey_id),]
surveyTwo <- transectSurveys[grep("18-02-21",transectSurveys$survey_id),]
surveyThree_all <- transectSurveys[grep("18-03-23",transectSurveys$survey_id),]
surveyThree <- surveyThree_all[surveyThree_all$survey_id %in% c("PMDNAT02_01_18-03-23-2",
                                                          "PMDNAT02_02_18-03-23",
                                                          "PMDNAT02_03_18-03-23", 
                                                          "PMDNAT02_04_18-03-23", 
                                                          "PMDNAT02_05_18-03-23"), ]


#Build columns for transect summary table via calculating statistics and binding rows
AVG_LengthOverTime <- rbind(mean(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyTwo[["LM_LengthOverTime_prelimC1"]]),
                            mean(surveyThree[["LM_LengthOverTime_prelimC1"]])
)

SD_LengthOverTime <- rbind(sd(surveyOne[["LM_LengthOverTime_prelimC1"]]),
                           sd(surveyTwo[["LM_LengthOverTime_prelimC1"]]),
                           sd(surveyThree[["LM_LengthOverTime_prelimC1"]])
)

Survey_date <- rbind("16-02-13", "18-02-21", "18-03-23")

#build a dataframe from columns
transectAverage <- cbind.data.frame(Survey_date, AVG_LengthOverTime, SD_LengthOverTime)
transectAverage$Transect_id <- "NAT02"
head(transectAverage)
#add these rows to the summary table
TransectSummaryTable <- rbind(TransectSummaryTable, transectAverage)

#____Step 10______Format and save transect summary results
#Reorder columns by column index so transect ID is at front then save your work
TransectSummaryTable <- TransectSummaryTable[c(4,1,2,3)]
head(TransectSummaryTable)
#Write the data as a summary file
write.csv(TransectSummaryTable, file = "transectSummaryTable.csv")


 

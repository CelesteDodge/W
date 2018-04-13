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
#Note the number of rows dropped from 93 to 91 (imperfect match on one survey id)
#*********************
#QC issue to fix unmatched pair

#rename the column  "LM_LengthOverTime_prelimC1" to "C1" for readability
#It has the results we are interested in
colnames(results)[19]
colnames(results)[19] <-"C1"

#Build box plots for each transect's unique survey dates

#HAR01
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_HAR01.jpg') 
HAR01 <- results[results$grasslandTransect == "HAR01",]
boxplot(C1~Date,data=HAR01, main="HAR01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average Length of Water Divided by Time")
dev.off()

#MED01        
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MED01.jpg') 
MED01 <- results[results$grasslandTransect == "MED01",]
boxplot(C1~Date,data=MED01, main="MIX01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average Length of Water Divided by Time")
dev.off()

#MED02        
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MED02.jpg') 
MED02 <- results[results$grasslandTransect == "MED02",]
boxplot(C1~Date,data=MED02, main="MIX01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average Length of Water Divided by Time")
dev.off()

#MIX01        
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MIX01.jpg') 
MIX01 <- results[results$grasslandTransect == "MIX01",]
boxplot(C1~Date,data=MIX01, main="MIX01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average Length of Water Divided by Time")
dev.off()

#MIX03
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MIX03.jpg') 
MIX03 <- results[results$grasslandTransect == "MIX03",]
boxplot(C1~Date,data=MIX03, main="MIX03: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average Length of Water Divided by Time")
dev.off()

#MIX05
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_MIX05.jpg') 
MIX05 <- results[results$grasslandTransect == "MIX05",]
boxplot(C1~Date,data=MIX05, main="MIX05: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average Length of Water Divided by Time")
dev.off()

#NAT01
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_NAT01.jpg') 
NAT01 <- results[results$grasslandTransect == "NAT01",]
boxplot(C1~Date,data=NAT01, main="NAT01: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average Length of Water Divided by Time")
dev.off()

#NAT02
jpeg(filename = 'C:/Users/cdodge/Desktop/GIT/W/PMD/summaries/plots/rplot_boxplot_NAT02.jpg') 
NAT02 <- results[results$grasslandTransect == "NAT02",]
boxplot(C1~Date,data=NAT02, main="NAT02: Preliminary Infiltration *suction not accounted for*", 
        xlab="Survey Date", ylab="Average Length of Water Divided by Time")
dev.off()

#**********************
#ISSUE: Not completed - single plot with all transects
#***********************

boxplot(C1~grasslandTransect*Date,data=results,
        col=(c("gold","darkgreen", "pink", "red", "purple","cyan","white", "blue", "sky blue")),
        main="Preliminary Infiltration *note suction not accounted for*", 
        xlab="Survey Date", ylab="Length of Water Over Time")
#not clear which is which, what is happening with colors in combined graph

#try Violin Plots
install.packages("vioplot")
library(vioplot)

#**** example
# box- vs violin-plot
par(mfrow=c(2,1))
mu<-2
si<-0.6
bimodal<-c(rnorm(1000,-mu,si),rnorm(1000,mu,si))
uniform<-runif(2000,-4,4)
normal<-rnorm(2000,0,3)
vioplot(bimodal,uniform,normal)
boxplot(bimodal,uniform,normal)

mydata$bimodel <- bimodal

x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3, names=c("4 cyl", "6 cyl", "8 cyl"), 
        col="gold")
title("Violin Plots of Miles Per Gallon")
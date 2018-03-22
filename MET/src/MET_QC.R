#Author: Celeste Dodge
#purpose: MET Data Quality check and quality control
#install.packages ("ggplot2, dplyr")
#Date: 7/28/2017

data <- read.csv("C:/Users/cdodge/Desktop/WORK FROM HOME/17-07-28 ESIP/data2.csv")
str(data)
#Format timeStamp field into time series formatted data
data$timeStampFT<- as.POSIXct(data$timeStamp,format="%m/%d/%Y %H:%M")

#____RangeTests
summary(data$RH)
#Set upper limit to given field
data$RH[data$RH>100] <-NA
summary(data$RH)

summary(data$rainInch15min)
summary(data$rainInch15minDavis)

#____Visualexamination 


#time series line graph
#Rain data
library(ggplot2)
ggplot(data=data, aes(timeStampFT,rainYear)) + geom_line()
ggplot(data=data, aes(timeStampFT,rainInchYearDavis)) + geom_line()
#Both Gauges
ggplot(data=data, aes(timeStampFT,rainYear)) + 
  geom_line() +
  geom_line(data=data, aes(timeStampFT,rainInchYearDavis), color= 'red', size=2) + 
  geom_line()

#Rain data - Check math on 15minute sum and waterYear sum

#difference between inches and hundredths calcs 
  #for TE 525
data$rainInch15minx100 <- data$rainInch15min * 100
data$TE525Diff <- data$rainInch15minx100 - data$rainHun15min
summary(data$TE525Diff)
badRain <-data[data$TE525Diff>0,]
summary(badRain)
str(badRain)


newVars <- c(data$timeStampFT, data$TE525Diff)
TE525Deviations <-data[,newVars]
write.csv(TE525Deviations, "C:/Users/cdodge/Desktop/WORK FROM HOME/17-07-28 ESIP/TE525Deviations.csv")


write.csv(badRain, "C:/Users/cdodge/Desktop/WORK FROM HOME/17-07-28 ESIP/dataOut2.csv")

wy2010-2011 <- data[data$timeStampFT] data$TE525Diff <- data$rainYear - data$rain15min



#Create Same plot, but limit the range of values visualized
#not working %>%
library(dplyr)
install.packages("magrittr")
data %>% filter(timeStampFT < 1/1/2013) %>% ggplot(aes(timeStampFT,rainYear)) + geom_line()

#examine narrower band (under 300 mV only)
LWS %>% filter(oak < 300) %>% ggplot(aes(TSFMT,oak)) + geom_line()
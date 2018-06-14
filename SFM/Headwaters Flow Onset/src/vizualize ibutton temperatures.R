#Visualize SFMiButton data to date


#read in and format time column
ibuttons <- read.csv("W:/4 SFM Stream Flow Data/iButton flow data/ibutton_pipe_temperature_observations.csv") 
str(ibuttons)
ibuttons$TS <- as.POSIXct(ibuttons$Date.Time,format="%m/%d/%Y %H:%M")

library(ggplot2)

#______Build a ggplot
#####################################
levels(ibuttons$Sensor)

#subset data into plot data for only this site's observations
MC1H <- ibuttons[which(ibuttons$Sensor =='MC1H'),]
MC1L <- ibuttons[which(ibuttons$Sensor =='MC1L'),]
MC1Hb <- ibuttons[which(ibuttons$Sensor =='MC1Hb'),]
MC1Lb <- ibuttons[which(ibuttons$Sensor =='MC1Lb'),]

RC1H <- ibuttons[which(ibuttons$Sensor =='RC1H'),]
RC1L <- ibuttons[which(ibuttons$Sensor =='RC1L'),]

WC1H <- ibuttons[which(ibuttons$Sensor =='WC1H'),]
WC1L <- ibuttons[which(ibuttons$Sensor =='WC1L'),]

#jpeg(filename= "W:/4 SFM Stream Flow Data/iButton flow data/Summaries/test_Rplot1.jpeg") with ##dev.off() at end did not work to write file
ggplot()+
  geom_line(aes(x = MC1H$TS, y = MC1H$Value),
            color= 'violet')+
  geom_line(aes(x = MC1L$TS, y = MC1L$Value),
            color= 'purple')

ggplot()+
  geom_line(aes(x = MC1Hb$TS, y = MC1Hb$Value),
            color= 'violet')+
  geom_line(aes(x = MC1Lb$TS, y = MC1Lb$Value),
            color= 'purple')

#Site 2 Rogers Creek
ggplot()+
  geom_line(aes(x = RC1H$TS, y = RC1H$Value),
            color= 'black')+
  geom_line(aes(x = RC1L$TS, y = RC1L$Value),
            color= 'red', alpha = 0.4)

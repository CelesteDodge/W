#EMLasseblyline templates
#April 20, 2018

#___Step 1_____setup
#load library and set working directory
library(EMLassemblyline)
setwd("C:/Users/cdodge/Desktop/GIT/W/MET/EML")
#You can examine library functions by typing"EMLassemblyline::"

#___Step 2_____generate templates
import_templates("C:/Users/cdodge/Desktop/GIT/W/MET/EML", 
                 "CCBY", 
                 data.files = c("fifteenMinute_workingMaster.csv",
                                "monthly_MetValues"))

#___Step (not in R)_____populate those templates!
  
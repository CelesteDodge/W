#Date: March 15th 2018
#Purpose: summarize minidisk observations for PMD project 
  #observations per survey
  #total minutes of surveys
  #total volume (mL) infiltrated
#Author: Celeste Dodge

#__Step 1_______load libraries
library(devtools)
# Install and load EMLassemblyline
install_github("EDIorg/EMLassemblyline")
library(EMLassemblyline)

#__Step 2_______setup and create templates
setwd("C:/Users/cdodge/Desktop/GIT/W/PMD")
import_templates("C:/Users/cdodge/Desktop/GIT/W/PMD", "CCBY", data.files = c("miniDiskObservations","siteAttributes", "surveys"))

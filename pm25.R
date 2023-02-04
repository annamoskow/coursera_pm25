#create empty directory to load data into
if(!file.exists("./coursera_pm25")){
  dir.create("./coursera_pm25")
}
#download file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "./coursera_pm25/pm25.zip", method = "curl")
unzip(zipfile="./coursera_pm25/pm25.zip", exdir="./coursera_pm25")

#read in relevant data sets
NEI <- readRDS("./coursera_pm25/summarySCC_PM25.rds")
SCC <- readRDS("./coursera_pm25/Source_Classification_Code.rds")

#load packages for data tidying
library(dplyr)
library(ggplot2)
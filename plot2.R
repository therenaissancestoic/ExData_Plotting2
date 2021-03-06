## Question 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == "24510") from 1999 to 2008? Use the base 
#plotting system to make a plot answering this question.

## Need to extract and unzip files
library(plyr)
file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(file, destfile = "C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Exploratory Data Analysis/Course Project 2/NEI_data.zip"
              ,method = "curl")

## Unzip the file
unzip(zipfile = "C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Exploratory Data Analysis/Course Project 2/NEI_data.zip"
      ,exdir = "C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Exploratory Data Analysis/Course Project 2")

## Check to see that the files were unzipped into the correctly
list.files("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Exploratory Data Analysis/Course Project 2")


## Read in emissions data and classification codes 
emissions <- readRDS("summarySCC_PM25.rds")
classcodes <- readRDS("Source_Classification_Code.rds")

library(tidyverse)
##Verify that all data emissions data is only for the years 1999, 2002, 2005, 2008
emissions %>% 
  distinct(year)

## summarize the PM25 emissions data by year
summary_by_year <- emissions %>% 
  filter(Pollutant == "PM25-PRI") %>% 
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(sum = sum(Emissions))

##Create plot2
par("mar"= c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(summary_by_year, type = "l", xlab = "Year",
     ylab ="Total PM2.5 Emissions",
     main = "Total Emissions of PM2.5 in Baltimore City from 1999 to 2008")
dev.off()


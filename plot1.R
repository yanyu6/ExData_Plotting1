##----------------------------------------------------------
##reading data for plot 1

setwd("C:/Users/Bell/Desktop/coursera/exploratory data analysis")
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", dec =".",
                   colClasses = c("character", "character", "numeric", "numeric", 
                   "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?")
summary(data)
class(data)
names(data)
library(dplyr)
library(plyr)

subdata <- subset(data, data$Date  == "2007-02-01"| data$Date  == "2007-02-02")
names(subdata)
##------------------------------------------------------------
##plot in png file 1
png(filename = "plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     breaks = 12, ylim = c(0, 1200))
dev.off()
##----------------------------------------------------------
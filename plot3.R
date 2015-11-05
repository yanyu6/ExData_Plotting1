##----------------------------------------------------------
##reading data for plot 3

setwd("C:/Users/Bell/Desktop/coursera/exploratory data analysis")
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", dec =".",
                   colClasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?")

library(dplyr)
library(plyr)

subdata <- subset(data, data$Date  == "2007-02-01"| data$Date  == "2007-02-02")
tempdata <- paste(subdata$Date, subdata$Time)
subdata <- mutate(subdata, DateTime = strptime(tempdata, "%d/%m/%Y %H:%M:%S"))
names(subdata)
##------------------------------------------------------------
png(filename = "plot3.png", width = 480, height = 480)
plot(subdata$DateTime, subdata$Sub_metering_1, type ="l",
     xlab = "", 
     ylab = "Energy sub metering", col = "black")
lines(subdata$DateTime, subdata$Sub_metering_2, col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()
##------------------------------------------------------------
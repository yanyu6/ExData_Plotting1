##----------------------------------------------------------
##reading data for plot 4

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
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(4, 4, 2, 1))
with(subdata, {
  #top left
  plot(DateTime, Global_active_power, type = "l",
       xlab = "",
       ylab = "Global Active Power")
  #bottom left
  plot(DateTime, Sub_metering_1, type ="l",
       xlab = "", 
       ylab = "Energy sub metering", col = "black")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "blue", "red"), bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lwd = 1)
  #top right
  plot(DateTime, Voltage, type = "l", col = "black",
       xlab = "datetime", ylab = "Voltage")
  #bottom right
  plot(DateTime, Global_reactive_power, type = "l", col = "black",
       xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()
##------------------------------------------------------------
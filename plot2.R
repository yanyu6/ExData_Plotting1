##----------------------------------------------------------
##reading data for plot 2

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
## plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(subdata$DateTime, subdata$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power(kilowatts)")
dev.off()
##----------------------------------------------------------
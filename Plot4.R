## Load the Dataset - Electric Power Consumption

library(tidyverse)

setwd("~/R scripts/Coursera---Exploratory-Data-Analysis/ExData_Plotting1")

raw_data = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

glimpse(raw_data)

##Convert date and time variables to Date/Time class

raw_data$Time <- strptime(paste(raw_data$Date, raw_data$Time), "%d/%m/%Y %H:%M:%S")

raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")

glimpse(raw_data)

Final_data <- subset(raw_data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot the graph

par(mfrow = c(2,2))

## 1st graph
with(Final_data,
     plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

## 2nd graph
with(Final_data,
     plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))

## 3rd graph
with(Final_data, plot(Time, Sub_metering_1,type="l", ylab="Energy Sub metering", xlab=""))
lines(Final_data$Time,Final_data$Sub_metering_2,col = "red")
lines(Final_data$Time, Final_data$Sub_metering_3,col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=c(1,1,1),
       col = c("black","red", "blue"))

## 4th Graph

with(Final_data,
     plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

##Copy the plot
dev.copy(png, file = "plot4.png", width=480, height=480)

dev.off()

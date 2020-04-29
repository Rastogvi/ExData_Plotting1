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

with(Final_data,
     plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

##Copy the plot
dev.copy(png, file = "plot2.png", width=480, height=480)

dev.off()

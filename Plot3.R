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

glimpse(Final_data)

## Plot the graph

par(mfrow = c(1,1))

plot(Final_data$Time, Final_data$Sub_metering_1, type = "l",col="black",
     ylab="Energy Sub metering", xlab="")
lines(Final_data$Time, Final_data$Sub_metering_2, col="red")
lines(Final_data$Time, Final_data$Sub_metering_3, col="blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=labels, col=columnlines, lty="solid")


##Copy the plot
dev.copy(png, file = "plot3.png", width=480, height=480)

dev.off()

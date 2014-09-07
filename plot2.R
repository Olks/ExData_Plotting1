## Exploratory Data Analysis, Coursera
## Course Project 1
## Plot 2
## Author: Aleksandra Kocot (Olks)


## importing data to R
power.data <- read.table("household_power_consumption.txt",
                         header=TRUE,sep=";",nrows=2075259,
                         stringsAsFactors=FALSE)

## connecting date and time columns into one
power.data[,1] <- paste(power.data[,1], power.data[,2])

## converting first column to date/time class
power.data[,1] <- strptime(power.data[,1], "%d/%m/%Y %H:%M:%S")


## OK!!!
strptime(power.data[55,1], "%d/%m/%Y %H:%M:%S")

## converting data to numeric class
power.data[,3] <- as.numeric(power.data[,3])

## creating PNG file
png("plot1.png", width=480, height=480)
plot(power.data[power.data$Date=="2007-02-01" | power.data$Date=="2007-02-02",]$Global_active_power, type="l")
dev.off()

## Exploratory Data Analysis, Coursera
## Course Project 1
## Plot 1
## Author: Aleksandra Kocot (Olks)


## importing data to R
power.data <- read.table("household_power_consumption.txt",
                         header=TRUE,sep=";",nrows=2075259,
                         stringsAsFactors=FALSE)

## converting date column to "Date" class
power.data[,1] <- as.Date(power.data[,1], "%d/%m/%Y")

## converting data to numeric class
power.data[,3] <- as.numeric(power.data[,3])

## creating PNG file
png("plot1.png", width=480, height=480)
hist(power.data[power.data$Date=="2007-02-01" | power.data$Date=="2007-02-02",]$Global_active_power,
     col="red", breaks=13,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()

## Exploratory Data Analysis, Coursera
## Course Project 1
## Plot 2
## Author: Aleksandra Kocot (Olks)


## importing data to R
power.data <- read.table("household_power_consumption.txt",
                         header=TRUE,sep=";",nrows=2075259,
                         stringsAsFactors=FALSE)

## selecting data for day 1/2/2007 and 2/2/2007
data.selected <- power.data[power.data$Date=="1/2/2007" | power.data$Date=="2/2/2007",]

## connecting date and time columns into one
timeANDdate <- paste(data.selected[,1], data.selected[,2])

## converting first column to date/time class
time.conv <- strptime(timeANDdate, "%d/%m/%Y %H:%M:%S")

## converting data to numeric class
global.power <- as.numeric(data.selected[,3])

## creating PNG file
png("plot2.png", width=480, height=480)
Sys.setlocale("LC_TIME", "English")
plot(time.conv,global.power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()
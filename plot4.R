## Exploratory Data Analysis, Coursera
## Course Project 1
## Plot 4
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
sub1 <- as.numeric(data.selected[,7])
sub2 <- as.numeric(data.selected[,8])
sub3 <- as.numeric(data.selected[,9])
voltage <- as.numeric(data.selected[,5])
reactive <- as.numeric(data.selected[,4])
global.power <- as.numeric(data.selected[,3])

## creating PNG file
png("plot4.png", width=480, height=480)
Sys.setlocale("LC_TIME", "English")
par(mfrow=c(2,2))

plot(time.conv,global.power,
     type="l",
     ylab="Global Active Power",
     xlab="")

plot(time.conv,voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

plot(time.conv,sub1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(time.conv,sub2,col="red")
lines(time.conv,sub3,col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       cex=0.75, lty=1)

plot(time.conv,reactive,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off()
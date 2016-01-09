############################################################################
## Plot 2
############################################################################
## read a file from the current directory
wholeData <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, 
                        na.strings=c("?"),
                        colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## extract only Date is whether "1/2/2007" or "2/2/2007"
targetData <- subset(wholeData, Date=="1/2/2007"|Date=="2/2/2007")

## add DateTime column
targetData$DateTime <- strptime(paste(targetData$Date, targetData$Time), format="%d/%m/%Y %H:%M:%S", tz="")

## open a PNG graphics device
png(filename="plot2.png", width=480, height=480)

## change the date label into English
Sys.setlocale(category="LC_ALL", locale="english")

## plot a line graph
plot(targetData$DateTime, targetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## close the PNG device
dev.off()

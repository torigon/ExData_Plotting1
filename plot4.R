############################################################################
## Plot 4
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
png(filename="plot4.png", width=480, height=480)

## change the date label into English
Sys.setlocale(category="LC_ALL", locale="english")

## set layout
par(mfrow = c(2, 2), mar = c(5, 5, 2, 1))

## draw Graph 1 ################################################
## plot a line graph
plot(targetData$DateTime, targetData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## draw Graph 2 ################################################
## plot a line graph
plot(targetData$DateTime, targetData$Voltage, type="l", xlab="datetime", ylab="Voltage")

## draw Graph 3 ################################################
## plot a line graph
plot(targetData$DateTime, targetData$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")

## add graphs
lines(targetData$DateTime, targetData$Sub_metering_2,col="red")
lines(targetData$DateTime, targetData$Sub_metering_3,col="blue")

## add a legend without a box
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

## draw Graph 4 ################################################
## plot a line graph
plot(targetData$DateTime, targetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## close the PNG device
dev.off()

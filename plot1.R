############################################################################
## Plot 1
############################################################################
## read a file from the current directory
wholeData <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, 
    na.strings=c("?"),
    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## extract only Date is whether "1/2/2007" or "2/2/2007"
targetData <- subset(wholeData, Date=="1/2/2007"|Date=="2/2/2007")

## open a PNG graphics device
png(filename="plot1.png", width=480, height=480)

## draw a histgram
hist(targetData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## close the PNG device
dev.off()

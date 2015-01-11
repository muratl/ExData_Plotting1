## Reading full data
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

## Formatting dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting
plot(x=data$Datetime, y=data[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=data$Datetime, y=data[,"Sub_metering_2"], col="red")
lines(x=data$Datetime, y=data[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

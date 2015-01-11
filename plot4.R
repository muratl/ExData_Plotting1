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
par(mfrow = c(2, 2))

# Plot 1 - global active power: upper left

plot(x=data$Datetime, y=data[,"Global_active_power"], type="l",ylab="Global Active Power", main="", xlab="")

# Plot 2 - voltage: upper right
plot(x=data$Datetime, y=data[,"Voltage"], type="l",ylab="Voltage", main="", xlab="datetime")

# Plot 3 - sub metering: lower left
plot(x=data$Datetime, y=data[,"Sub_metering_1"], type="l", ylab="Energy sub metering", main="", xlab="")
lines(x=data$Datetime, y=data[,"Sub_metering_2"], col="red")
lines(x=data$Datetime, y=data[,"Sub_metering_3"], col="blue")

##legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",text.width = strwidth("1,000,000"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4 - global reactive power: lower right

plot(x=data$Datetime, y=data[,"Global_reactive_power"], type="l",ylab="Global_reactive_power", main="", xlab="datetime")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

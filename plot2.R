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
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active data (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

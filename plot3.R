data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get February data
FebData <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# Convert power data to numeric data type
FebData$Global_active_power <- as.numeric(FebData$Global_active_power)

# Convert submetering data to numeric as well
FebData$Sub_metering_1 <- as.numeric(FebData$Sub_metering_1)
FebData$Sub_metering_2 <- as.numeric(FebData$Sub_metering_2)
FebData$Sub_metering_3 <- as.numeric(FebData$Sub_metering_3)

# Combine date and time 
FebData$DateTime <- strptime(paste(FebData$Date, FebData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

# Plot the data
png("plot3.png", width=480, height=480)

# Draw plot. Set type to 'l'
plot(FebData$DateTime, FebData$Sub_metering_1, type='l', ylab="Energy Submetering", xlab="")

# Add additional graphs
lines(FebData$DateTime, FebData$Sub_metering_2, type="l", col="red")
lines(FebData$DateTime, FebData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Close the PNG device
dev.off()



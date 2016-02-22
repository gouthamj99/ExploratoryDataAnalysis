data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get February data
FebData <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# Convert power data to numeric data type
FebData$Global_active_power <- as.numeric(FebData$Global_active_power)
FebData$Global_reactive_power <- as.numeric(FebData$Global_reactive_power)
FebData$Voltage <- as.numeric(FebData$Voltage)

# Convert submetering data to numeric as well
FebData$Sub_metering_1 <- as.numeric(FebData$Sub_metering_1)
FebData$Sub_metering_2 <- as.numeric(FebData$Sub_metering_2)
FebData$Sub_metering_3 <- as.numeric(FebData$Sub_metering_3)

# Combine date and time 
FebData$DateTime <- strptime(paste(FebData$Date, FebData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

# Plot the data
png("plot4.png", width=480, height=480)

# We need 4 graphs. 2 rows and 2 columns. 
par(mfrow=c(2, 2))

# Draw plot. Set type to 'l'

# Plot 1
plot(FebData$DateTime, FebData$Global_active_power, type='l', ylab="Global Active Power", cex=0.2, xlab="")

# Plot 2
plot(FebData$DateTime, FebData$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(FebData$DateTime, FebData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(FebData$DateTime, FebData$Sub_metering_2, type="l", col="red")
lines(FebData$DateTime, FebData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Plot 4
plot(FebData$DateTime, FebData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Close the PNG device
dev.off()



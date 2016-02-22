data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get February data
FebData <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# Convert power data to numeric data type
FebData$Global_active_power <- as.numeric(FebData$Global_active_power)

# Combine date and time 
FebData$DateTime <- strptime(paste(FebData$Date, FebData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

# Plot the data
png("plot2.png", width=480, height=480)

# Draw plot. Set type to 'l'
plot(FebData$DateTime, FebData$Global_active_power, type='l', ylab="Global Active Power (kilowatts)")

#Close the PNG device
dev.off()



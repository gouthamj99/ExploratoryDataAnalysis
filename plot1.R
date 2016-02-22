data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get February data
FebData <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# Convert power data to numeric data type
FebData$Global_active_power <- as.numeric(FebData$Global_active_power)

# Plot the data
png("plot1.png", width=480, height=480)

# Draw histogram
hist(FebData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

#Close the PNG device
dev.off()



# Develop four plots - plot 2, plot 3, a line chart of voltage over time and
#       Global active power over time
#       The plot should be 480 by 480 pixels

raw_table <- read.table("household_power_consumption.txt", header = T, sep =";", na.strings ="?", stringsAsFactors = F, dec = ".")
# We will only be using data from the dates 2007-02-01 and 2007-02-02.
subset_table <- raw_table[raw_table$Date %in% c("1/2/2007", "2/2/2007"),]

# Check out str(subset_table), note the capitalization of dates and times matters
# Look at the help page for strptime for more info
date_time <- strptime(paste(subset_table$Date, subset_table$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
global_active_power <- subset_table[,"Global_active_power"]

png("plot4.png", width = 480, height = 480)
# Note - the ordering goes left-right, top-down
par(mfrow = c(2,2))
# Creates plot 2
plot(date_time, global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# Plot of voltage
plot(date_time, subset_table$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

# Creates plot 3
plot(date_time, subset_table$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(date_time, subset_table$Sub_metering_2, type = "l", col = "red")
lines(date_time, subset_table$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

# Plot of Global_reactive_power
plot(date_time, subset_table$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
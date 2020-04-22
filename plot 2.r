# Construct a line plot of the Global Active Power in kw from Thurs to Sat 
#       The plot should be 480 by 480 pixels

raw_table <- read.table("household_power_consumption.txt", header = T, sep =";", na.strings ="?", stringsAsFactors = F, dec = ".")
# We will only be using data from the dates 2007-02-01 and 2007-02-02.
subset_table <- raw_table[raw_table$Date %in% c("1/2/2007", "2/2/2007"),]

# Check out str(subset_table), note the capitalization of dates and times matters
# Look at the help page for strptime for more info
date_time <- strptime(paste(subset_table$Date, subset_table$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
global_active_power <- subset_table[,"Global_active_power"]

# Creates a line plot
png("plot2.png", width = 480, height = 480)
plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
# Construct a histogram of the Global Active Power in kw by frequency 
#       The plot should be 480 by 480 pixels

raw_table <- read.table("household_power_consumption.txt", header = T, sep =";", na.strings ="?", stringsAsFactors = F, dec = ".")
# We will only be using data from the dates 2007-02-01 and 2007-02-02.
subset_table <- raw_table[raw_table$Date %in% c("1/2/2007", "2/2/2007"),]

# Check out str(subset_table) to make sure Global active power is numerical
global_active_power <- subset_table[,"Global_active_power"]
png("plot1.png", width = 480, height = 480)
hist(global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
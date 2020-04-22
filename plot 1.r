# Construct a plot of the Global Active Power in kw by frequency 
#       The plot should be 480 by 480 pixels
# Name each of the plot files as \color{red}{\verb|plot1.png|}plot1.png, 
#        \color{red}{\verb|plot2.png|}plot2.png, etc.
# Create a separate R code file (\color{red}{\verb|plot1.R|}plot1.R, 
#        \color{red}{\verb|plot2.R|}plot2.R, etc.) that constructs the 
#        corresponding plot, i.e. code in \color{red}{\verb|plot1.R|}plot1.R 
#        constructs the \color{red}{\verb|plot1.png|}plot1.png plot. Your code 
#        file should include code for reading the data so that the plot can be 
#        fully reproduced. You must also include the code that creates the PNG file.

raw_table <- read.table("household_power_consumption.txt", header = T, sep =";", na.strings ="?", stringsAsFactors = F, dec = ".")
# We will only be using data from the dates 2007-02-01 and 2007-02-02.
subset_table <- raw_table[raw_table$Date %in% c("1/2/2007", "2/2/2007"),]

# Check out str(subset_table) to make sure Global active power is numerical
global_active_power <- subset_table[,"Global_active_power"]
png("plot1.png", width = 480, height = 480)
hist(global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
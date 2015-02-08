# Load data
epc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

# Pick out the two days:
epc <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]

# Plot a png histogram of global active power
png(
  filename = "plot1.png"
  )
  hist(epc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
# Load data
epc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

# Pick out the two days:
epc <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]

# Load lubridate library
library(lubridate)

# Pick out dates and times
dates <- epc$Date
times <- epc$Time

# Make lubridates out of date/time sets
dt <- sapply(mapply(paste, dates, times), dmy_hms)


# Plot a png plot of global active power
png(filename = "plot2.png")
  plot(as.POSIXct(dt, origin = "1970-01-01"), epc$Global_active_power, type = "l", xlab = "", ylab ="Global Active Power (kilowatts)")
dev.off()
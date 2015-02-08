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


# Plot a png plot of sub metering (1-3)
png(filename = "plot3.png")
  plot(as.POSIXct(dt, origin = "1970-01-01"), epc$Sub_metering_1,
       type = "l", xlab = "", ylab ="Sub metering")
  lines(as.POSIXct(dt, origin = "1970-01-01"), epc$Sub_metering_2,
        type = "l",col = "red")
  lines(as.POSIXct(dt, origin = "1970-01-01"), epc$Sub_metering_3,
        type = "l", col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"), lwd = 0.75)
dev.off()
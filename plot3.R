library(data.table)
#get input data from the txt file
input <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

input[, dateAndTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

input[, Sub_metering_1 := lapply(.SD, as.numeric), .SDcols = "Sub_metering_1"]
input[, Sub_metering_2 := lapply(.SD, as.numeric), .SDcols = "Sub_metering_2"]
input[, Sub_metering_3 := lapply(.SD, as.numeric), .SDcols = "Sub_metering_3"]

inp <- input[(dateAndTime >= "2007-02-01") & (dateAndTime < "2007-02-03")]
png("plot3.png", width = 480, height = 480)
plot(x = inp[, dateAndTime], y = inp[, Sub_metering_1], type = "l", xlab = "", ylab = "Energy sub metering")
lines(inp[, dateAndTime], inp[, Sub_metering_2], col = "Red")
lines(inp[, dateAndTime], inp[, Sub_metering_3], col = "Blue")

legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1))
dev.off()
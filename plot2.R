library(data.table)
#get input data from the txt file
input <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
input[, dateAndTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
input[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
#take data for two days
inp <- input[(dateAndTime >= "2007-02-01") & (dateAndTime < "2007-02-03")]
#initialize png
png("plot2.png", width = 480, height = 480)
plot(x = inp[, dateAndTime], y = inp[, Global_active_power], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


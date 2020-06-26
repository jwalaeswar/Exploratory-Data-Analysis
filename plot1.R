library(data.table)
#get input data from the txt file
input <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
input[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
input[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
#take data for two days
inp <- input[(Date == "2007-02-01") | (Date == "2007-02-02")]
#initialize png
png("plot1.png", width = 480, height = 480)
#plot histogram
hist(inp[, Global_active_power], main = "Global Active Power", xlab = "Global_active_power (kilowatts", ylab = "Frequency", col = "Red")

dev.off()


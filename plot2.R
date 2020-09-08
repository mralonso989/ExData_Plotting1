
# I already have the unzip file in my directory

library(data.table)
library(dplyr)

# read data
hpc <- data.table::fread("household_power_consumption.txt",
                         na.strings = "?")
# POSIXct
hpc[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


# Subset dates
hpc <- hpc[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# PLOT 2
png("plot2.png")
plot(x = hpc[, dateTime]
     , y = hpc[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

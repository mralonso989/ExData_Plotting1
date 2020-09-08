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

png("plot4.png")
par(mfrow=c(2,2))
# PLOT 1

plot(x = hpc[, dateTime]
     , y = hpc[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power")

# PLOT 2

plot(x=hpc[,dateTime],y=hpc[,Voltage],type="l",xlab = "dateTime",ylab = "Voltaje")

# PLOT 3

plot(x= hpc[,dateTime],y=hpc[,Sub_metering_1],type="l",xlab = "",ylab = "Energy sub metering")
lines(x= hpc[,dateTime],y=hpc[,Sub_metering_2],col="red")
lines(x= hpc[,dateTime],y=hpc[,Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1), bty="n",cex=.5)

# PLOT 4

plot(x=hpc[,dateTime],y=hpc[,Global_reactive_power],type="l",xlab = "dateTime",ylab = "Global_reactive_power")

dev.off()

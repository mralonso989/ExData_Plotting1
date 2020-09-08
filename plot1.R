
# I already have the unzip file in my directory

library(data.table)
library(dplyr)

# read data
hpc <- data.table::fread("household_power_consumption.txt",
                         na.strings = "?")
# convert to Date
hpc[,Date:=lapply(.SD,as.Date,"%d/%m/%Y"),.SDcols=c("Date")]

# Subset dates
hpc <- hpc[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# PLOT 1
png("plot1.png")
hpc$Global_active_power %>% 
    hist(main="Global Active Power",col="Red"
         ,xlab = "Global Active Power (kilowatts)"
         ,ylab = "Frecuency")
dev.off()

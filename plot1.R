#READ FILE AND SUBSET FOR DATE RANGE 2007-02-01 and 2007-02-02

dat <- read.table("household_power_consumption.txt", sep = ";", skip = 1, na.strings = "?", 
                  stringsAsFactors = F)
names(dat) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

sel_dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))
sel_dat$Date = as.Date(sel_dat$Date, "%d/%m/%Y")

#CREATE HISTOGRAM PLOT 1
#png("plot1.png", width = 480, height = 480, units = "px")

hist(sel_dat$Global_active_power, col = "red", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#dev.off()
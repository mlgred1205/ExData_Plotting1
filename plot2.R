#READ FILE AND SUBSET FOR DATE RANGE 2007-02-01 and 2007-02-02

dat <- read.table("household_power_consumption.txt", sep = ";", skip = 1, na.strings = "?", 
                  stringsAsFactors = F)
names(dat) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

sel_dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))

#COMBINE DATE AND TIME TO VARIABLE FOR PLOTTING
datetime <- strptime(paste(sel_dat$Date, sel_dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


#CREATE PLOT
#png("plot2.png", width = 480, height = 480, units = "px")

with(sel_dat, plot(datetime, sel_dat$Global_active_power, type = "l", xlab = "", 
                   ylab = "Global Active Power (kilowatts)")
)
     

#dev.off()
#READ FILE AND SUBSET FOR DATE RANGE 2007-02-01 and 2007-02-02

dat <- read.table("household_power_consumption.txt", sep = ";", skip = 1, na.strings = "?", 
                  stringsAsFactors = F)
names(dat) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

sel_dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))

#COMBINE DATE AND TIME TO VARIABLE FOR PLOTTING
datetime <- strptime(paste(sel_dat$Date, sel_dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#BUILD PLOT WITH 3 SEPARATE LINE CALLS
png("plot3.png", width = 480, height = 480, units = "px")

plot(datetime, sel_dat$Sub_metering_1, type = "l", xlab = "", ylim = c(0, 40), 
     ylab = "Energy sub metering", col = "black")
par(new = TRUE)

plot(datetime, sel_dat$Sub_metering_2, type = "l", xlab = "", ylim = c(0, 40), 
     ylab = "", col = "red")
par(new = TRUE)

plot(datetime, sel_dat$Sub_metering_3, type = "l", xlab = "", ylim = c(0, 40), 
     ylab = "", col = "blue")

legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
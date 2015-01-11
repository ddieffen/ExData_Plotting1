#Reads the data file assuming to be in the working directory
dat <- read.csv("household_power_consumption.txt", sep=";")

#subsetting for the desired dates
dat$Date <- as.Date(strptime(dat$Date, format="%d/%m/%Y"))
sub <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#extracting the global power consumption of the household
dates <- sub$Date
times <- sub$Time
posix <- as.POSIXct(paste(dates, times), format="%Y-%m-%d %H:%M:%S")
acpwr <- as.numeric(as.character(sub$Global_active_power))
voltage <- as.numeric(as.character(sub$Voltage))
grp <- as.numeric(as.character(sub$Global_reactive_power))
Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(sub$Sub_metering_3))

#plotting
attach(mtcars)
par(mfrow=c(2,2))
plot(posix, acpwr, type="l", ylab="Global Active Power (kilowatts)")
plot(posix, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(posix, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(posix, Sub_metering_2, lwd=2, col="red")
lines(posix, Sub_metering_3, lwd=3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("black","red","blue"), pch=0.1, cex=0.3)
plot(posix, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

#saving as png image file
dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()

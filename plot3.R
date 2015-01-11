#Reads the data file assuming to be in the working directory
dat <- read.csv("household_power_consumption.txt", sep=";")

#subsetting for the desired dates
dat$Date <- as.Date(strptime(dat$Date, format="%d/%m/%Y"))
sub <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Reads the data file assuming to be in the working directory
dat <- read.csv("household_power_consumption.txt", sep=";")

#subsetting for the desired dates
dat$Date <- as.Date(strptime(dat$Date, format="%d/%m/%Y"))
sub <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#extracting the global power consumption of the household
dates <- sub$Date
times <- sub$Time
posix <- as.POSIXct(paste(dates, times), format="%Y-%m-%d %H:%M:%S")
Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(sub$Sub_metering_3))

#plotting
plot(posix, Sub_metering_1, pch=NULL, type="l", ylab="Energy sub metering", xlab="")
lines(posix, Sub_metering_2, pch=NULL, lwd=2, col="red")
lines(posix, Sub_metering_3, pch=NULL, lwd=3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("black","red","blue"), pch=1, cex=0.8)

#saving as png image file
dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()
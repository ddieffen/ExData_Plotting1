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

#plotting
plot(posix, acpwr, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#saving as png image file
dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()

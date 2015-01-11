#Reads the data file assuming to be in the working directory
dat <- read.csv("household_power_consumption.txt", sep=";")

#subsetting for the desired dates
dat$Date <- as.Date(strptime(dat$Date, format="%d/%m/%Y"))
sub <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#extracting the global power consumption of the household
acpwr <- as.numeric(as.character(sub$Global_active_power))

#creating histrogram plot
hist(acpwr, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#saving as png image file
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()

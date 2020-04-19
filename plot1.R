# Assumes that the dataset is already present in a folder named Data in the working directory
power_consumption <- read.csv(file = "./Data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption$Time <- strptime(power_consumption$Time, format = "%H:%M:%S")
data_subsetted <- subset(power_consumption, (Date == as.Date("2007-02-02")) | (Date == as.Date("2007-02-01")))

png(file = "plot1.png", width = 480, height = 480 )
hist(data_subsetted$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()


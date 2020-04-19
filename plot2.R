# Assumes that the dataset is already present in a folder named Data in the working directory
power_consumption <- read.csv(file = "./Data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
power_consumption$Time <- with(power_consumption, paste0(Date, Time))
power_consumption$Time <- strptime(power_consumption$Time, format = "%d/%m/%Y%H:%M:%S")
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
data_subsetted <- subset(power_consumption, 
                         (Date == as.Date("2007-02-02")) | (Date == as.Date("2007-02-01")))

png(file = "plot2.png", bg = "transparent")
plot(data_subsetted$Time, data_subsetted$Global_active_power, 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480 )
dev.off()

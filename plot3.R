# Assumes that the dataset is already present in a folder named Data in the working directory
power_consumption <- read.csv(file = "./Data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
power_consumption$Time <- with(power_consumption, paste0(Date, Time))
power_consumption$Time <- strptime(power_consumption$Time, format = "%d/%m/%Y%H:%M:%S")
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
data_subsetted <- subset(power_consumption, 
                         (Date == as.Date("2007-02-02")) | (Date == as.Date("2007-02-01")))

png(file = "plot3.png")
plot(data_subsetted$Time, data_subsetted$Sub_metering_1, 
     type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(data_subsetted$Time, data_subsetted$Sub_metering_2, col = "red")
lines(data_subsetted$Time, data_subsetted$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480 )
dev.off()


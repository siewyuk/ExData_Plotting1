#plot4.R

#Read in txt data. Use colClasses to characters and numerics.
#Loading will take some time for all 2,075,259 rows of data.
dat <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = T, 
                  na.strings = "?", 
                  stringsAsFactor = FALSE, 
                  colClasses = c("character",
                                 "character",
                                 "numeric",
                                 "numeric",
                                 "numeric",
                                 "numeric",
                                 "numeric",
                                 "numeric",
                                 "numeric"))

#Subset data as only using data from the dates 2007-02-01 and 2007-02-02.
data <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

#Format date, paste with time and perform POSIXct date-time conversion
data$Date <- as.Date(data$Date, format = "%d/ %m/ %Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

#Subset data as only using data from the dates 2007-02-01 and 2007-02-02.
data <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

#Format date, paste with time and perform POSIXct date-time conversion
data$Date <- as.Date(data$Date, format = "%d/ %m/ %Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

#Create partition for 2x2 plots
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#Plot 1: x-axis = datetime, y-axis = Global_active_power
plot(data$datetime, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot 2: x-axis = datetime, y-axis = Voltage
plot(data$datetime, data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage (volt)")

#Plot 3: x-axis = datetime, y-axis = Sub_metering 1, 2 & 3.
plot(data$datetime, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

#Add legend on topright
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, bty = "n")

#Plot 4: x-axis = datetime, y-axis = Global_reactive_power
plot(data$datetime, data$Global_reactive_power, type = "l", 
     xlab= "datetime", ylab = "Global Rective Power (kilowatts)")

#Save to plot according to specified width and height
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()


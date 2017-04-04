#plot1.R
#Read in txt data. Use colClasses to characters and numerics.
#Loading will take some time for all 2,075,259 rows of data.
dat <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE, 
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

#Create histogram: x-axis = Global active power & y-axis = Frequency.
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")

#Save to histogram according to specified width and height
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()


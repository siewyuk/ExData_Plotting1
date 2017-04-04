#plot2.R

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

#Format date, paste with time and perform POSIXct date-time conversion
data$Date <- as.Date(data$Date, format = "%d/ %m/ %Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

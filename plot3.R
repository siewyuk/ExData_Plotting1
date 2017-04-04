#plot3.R

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

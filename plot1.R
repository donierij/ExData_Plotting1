library(tidyverse)
library(lubridate)

#---Read data
usage <- read.table("./data/household_power_consumption.txt", sep = ";",
                    na.strings = "?", header = TRUE)
usage[,"Date"] <- dmy(usage[,"Date"])
usage[,"Time"] <- hms(usage[,"Time"])

#---Subset 2-day period in February, 2007

febdays <- filter(usage, Date == "2007-02-01" | Date == "2007-02-02")

#---Plot 1
png("plot1.png", width = 480, height = 480)

hist(febdays$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()

library(tidyverse)
library(lubridate)

#---Read data
usage <- read.table("./data/household_power_consumption.txt", sep = ";",
                    na.strings = "?", header = TRUE)
usage <- mutate(usage, datetime = paste(Date, Time))
usage[,"Date"] <- dmy(usage[,"Date"])
usage[,"Time"] <- hms(usage[,"Time"])
usage[,"datetime"] <- dmy_hms(usage[,"datetime"])

#---Subset 2-day period in February, 2007

febdays <- filter(usage, Date == "2007-02-01" | Date == "2007-02-02")

#---Plot 2
png("plot2.png", width = 480, height = 480)

plot(febdays$datetime,febdays$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()

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

#---Plot 3
png("plot3.png", width = 480, height = 480)

plot(febdays$datetime,febdays$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "l")
points(febdays$datetime,febdays$Sub_metering_2,type = "l", col = "red")
points(febdays$datetime,febdays$Sub_metering_3,type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1 )

dev.off()

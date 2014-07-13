#Load Library
library("data.table")

#Filter and Format Data
dt <- fread("household_power_consumption.txt",na.strings="?")
dt$Date <- as.Date(dt$Date ,"%d/%m/%Y")
dt <- dt[dt$Date <= "2007-02-02" & dt$Date >= "2007-02-01"]
dt$Global_active_power <- as.numeric(dt$Global_active_power)

#Draw Plot
png(file="plot1.png",width=480,height=480)
hist(dt$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
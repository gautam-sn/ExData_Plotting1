#Load Library
library("data.table")

#Filter and Format Data
dt <- fread("household_power_consumption.txt",na.strings="?")
dt$Date <- as.Date(dt$Date ,"%d/%m/%Y")
dt <- dt[dt$Date <= "2007-02-02" & dt$Date >= "2007-02-01"]
dt$Global_active_power <- as.numeric(dt$Global_active_power)

#Draw Plot
png(file="plot2.png",width=480,height=480)
plot(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Global_active_power, type="n", ylab="Global Active Power (kilowatts)",xlab="")
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Global_active_power)
dev.off()


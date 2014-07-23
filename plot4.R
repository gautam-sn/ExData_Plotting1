#Load Library
library("data.table")

#Filter and Format Data
dt <- fread("household_power_consumption.txt",na.strings="?")
dt$Date <- as.Date(dt$Date ,"%d/%m/%Y")
dt <- dt[dt$Date <= "2007-02-02" & dt$Date >= "2007-02-01"]

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#Part1
plot(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Global_active_power, type="n", ylab="Global Active Power",xlab="")
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Global_active_power)

#Part2
dt$Voltage <- as.numeric(dt$Voltage)
plot(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Voltage, type="n", ylab="Voltage",xlab="datetime")
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Voltage)
#Part3
dt$Sub_metering_1 <- as.integer(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.integer(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.integer(dt$Sub_metering_3)
plot(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Sub_metering_1,type="n", ylab="Energy sub metering",xlab="")
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Sub_metering_1)
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Sub_metering_2,col="red")
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1), col=c("black","red","blue"),bty = "n")
#Part4
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
plot(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Global_reactive_power, type="n", ylab="Global_reactive_power",xlab="datetime")
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Global_reactive_power)
dev.off()

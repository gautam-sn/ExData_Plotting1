#Load Library
library("data.table")

#Filter and Format Data
dt <- fread("household_power_consumption.txt",na.strings="?")
dt$Date <- as.Date(dt$Date ,"%d/%m/%Y")
dt <- dt[dt$Date <= "2007-02-02" & dt$Date >= "2007-02-01"]
dt$Sub_metering_1 <- as.integer(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.integer(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.integer(dt$Sub_metering_3)

png(file="plot3.png",width=480,height=480)
plot(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Sub_metering_1,type="n", ylab="Energy sub metering",xlab="")
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Sub_metering_1)
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Sub_metering_2,col="red")
lines(strptime(paste(dt$Date,dt$Time),"%Y-%m-%d %H:%M:%S"),dt$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1), col=c("black","red","blue"))
dev.off()




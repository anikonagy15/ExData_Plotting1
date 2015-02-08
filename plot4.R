housedata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
housedata <-na.omit(housedata)
housedata2 <- housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]
housedata2$Date<- strptime(paste(housedata2$Date,housedata2$Time), "%d/%m/%Y %H:%M:%S")
x <- housedata2$Sub_metering_1
z <- housedata2$Sub_metering_2
w <- housedata2$Sub_metering_3
png("plot4.png")
par(mfrow=c(2,2))
plot(housedata2$Date, housedata2$Global_active_power, type="l", xlab="", ylab="Global Active Power" )
plot(housedata2$Date, housedata2$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(housedata2$Date, x, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(housedata2$Date, z, col="red")
lines(housedata2$Date, w, col="blue")
legend("topright", lty=c(1,1,1), bty="n", cex=0.9, col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(housedata2$Date, housedata2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
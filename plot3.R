housedata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
housedata <-na.omit(housedata)
housedata2 <- housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]
housedata2$Date<- strptime(paste(housedata2$Date,housedata2$Time), "%d/%m/%Y %H:%M:%S")
x <- housedata2$Sub_metering_1
z <- housedata2$Sub_metering_2
w <- housedata2$Sub_metering_3
png("plot3.png")
plot(housedata2$Date, x, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(housedata2$Date, z, col="red")
lines(housedata2$Date, w, col="blue")
legend("topright", lty=1, col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
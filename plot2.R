housedata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
housedata <-na.omit(housedata)
housedata2 <- housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]
housedata2$Date<- strptime(paste(housedata2$Date,housedata2$Time), "%d/%m/%Y %H:%M:%S")
x <- housedata2$Global_active_power
png("plot2.png")
par(mar=c(4,4,2,2))
plot(housedata2$Date, x, type="l", xlab="", ylab="Global Active Power (kilowatts)" )
dev.off()
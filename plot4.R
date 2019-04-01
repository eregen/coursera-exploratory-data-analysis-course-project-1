location <- "~/Desktop/data_sci/Hopk_coursera/Exploratorydata/"
setwd(location)

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                   stringsAsFactors = FALSE, dec=".", skip = 66637, nrows=2880)
#skip also excludes headers
colnames(data) <- c("Date", "Time", "Global_active_power", 
                    "Global_reactive_power", "Voltage", "Global_intensity", 
                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##rows making up period from 2007-02-01 to 2007-02-02
datetime <- strptime(paste(data$Date, data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data$Global_active_power)
GRP <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)


png("plot4.png", width=480, height=480)
attach(data)
par(mfrow=c(2,2))
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power",
     cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.off()
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
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

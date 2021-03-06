plot3 <- function(){
  ## reading data from file
  data.f <- read.table("household_power_consumption.txt", header=TRUE, sep=";", as.is=TRUE, nrows=2880, skip=66636)
  ## Renaming variables
  names(data.f) <- c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3")
  ## Adding timestamp
  data.f$Timestamp <- paste(data.f$Date, data.f$Time)
  data.f$Timestamp <- strptime(data.f$Timestamp,"%d/%m/%Y %H:%M:%S")
  
  ## Saving file
  png(filename="plot3.png")
  
  ##ploting graph
  par(mfrow=c(1,1))
  r1 <- range(data.f$Sub_metering_1, na.rm=TRUE)
  r2 <- range(data.f$Sub_metering_2, na.rm=TRUE)
  r3 <- range(data.f$Sub_metering_3, na.rm=TRUE)
  y.rng <-c(min(r1, r2,r3), max(r1,r2,r3))
  plot(data.f$Timestamp, data.f$Sub_metering_1, type="l",col="black", ylab="Energy sub metering", xlab="", ylim=y.rng)
  lines(data.f$Timestamp, data.f$Sub_metering_2, col="red", type="l")
  lines(data.f$Timestamp, data.f$Sub_metering_3, col="blue", type="l")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue"), ncol = 1, lwd = 1)
  
  
  dev.off()
}
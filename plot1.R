plot1 <- function(){
  ## reading data from file
  data.f <- read.table("household_power_consumption.txt", header=TRUE, sep=";", as.is=TRUE, nrows=2880, skip=66636)
  ## Renaming variables
  names(data.f) <- c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3")
  ## Adding timestamp
  data.f$Timestamp <- paste(data.f$Date, data.f$Time)
  data.f$Timestamp <- strptime(data.f$Timestamp,"%d/%m/%Y %H:%M:%S")
  
  ## Saving file
  
  png(filename="plot1.png")
  
  ##ploting graph
  par(mfrow=c(1,1))
  hist(data.f$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",  ylab="Frequency", col="red")
  dev.off()
}
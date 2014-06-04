dataRaw <- read.csv('./EDA_PA1_data/household_power_consumption_short.txt', 
                    header=TRUE,
                    stringsAsFactors = FALSE,
                    sep = ";")

data <- subset(dataRaw, dataRaw$Date %in% c("1/2/2007","2/2/2007"))
dateTime <- strptime(paste(data[,1]," ",data[,2]),"%d/%m/%Y %H:%M:%S")
dataShort <- data.frame(Global_active_power = data$Global_active_power,
                        Global_reactive_power = data$Global_reactive_power,
                        Voltage = data$Voltage,
                        Sub_metering_1 = data$Sub_metering_1,
                        Sub_metering_2 = data$Sub_metering_2,
                        Sub_metering_3 = data$Sub_metering_3,
                        Date_Time=dateTime)

## Plot data
par(mfrow = c(2, 2))

## Plot 1,1

with(dataShort,
     plot(Date_Time, Global_active_power, 
          xlab="", ylab = "Global Active Power", 
          type="l"))

## Plot 1,2

with(dataShort,
     plot(Date_Time, Voltage, 
          xlab="datetime", ylab = "Voltage", 
          type="l"))

## Plot 2,1

plot(dataShort$Date_Time, dataShort$Sub_metering_1,
     xlab="", ylab = "Energy sub metering",
     type="l",
     col = "black")
lines(dataShort$Date_Time, dataShort$Sub_metering_2,
      col = "red")
lines(dataShort$Date_Time, dataShort$Sub_metering_3,
      col = "blue")

legend("topright", 
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1),
       bty="n",
       cex=0.5)

## Plot 2,2

with(dataShort,
     plot(Date_Time, Global_reactive_power, 
          xlab="datetime", ylab = "Global_reactive_power", 
          type="l"))

## Save to PNG
dev.copy(png, file = "./ExData_Plotting1/plot4.png",
         width=480, height=480)
dev.off()
setwd('/Users/fernando_perez/Documents/workspace_R/coursera/ExploratoryDataAnalysis')

dataRaw <- read.csv('./EDA_PA1_data/household_power_consumption_short.txt', 
                    header=TRUE,
                    stringsAsFactors = FALSE,
                    sep = ";")

data <- subset(dataRaw, dataRaw$Date %in% c("1/2/2007","2/2/2007"))
dateTime <- strptime(paste(data[,1]," ",data[,2]),"%d/%m/%Y %H:%M:%S")
dataShort <- data.frame(Sub_metering_1 = data$Sub_metering_1,
                        Sub_metering_2 = data$Sub_metering_2,
                        Sub_metering_3 = data$Sub_metering_3,
                        Date_Time=dateTime)

## Plot data
par(mfrow = c(1, 1))
plot(dataShort$Date_Time, dataShort$Sub_metering_1,
     xlab="", ylab = "Energy sub metering",
     type="l",
     col = "black")
lines(dataShort$Date_Time, dataShort$Sub_metering_2,
      col = "red")
lines(dataShort$Date_Time, dataShort$Sub_metering_3,
      col = "blue")

legend("topright",
       col      = c("black", "red", "blue"), 
       legend   = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1))

## Save to PNG
dev.copy(png, file = "./ExData_Plotting1/plot3.png",
         width=480, height=480)
dev.off()
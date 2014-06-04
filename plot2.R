dataRaw <- read.csv('./EDA_PA1_data/household_power_consumption_short.txt', 
                    header=TRUE,
                    stringsAsFactors = FALSE,
                    sep = ";")

data <- subset(dataRaw, dataRaw$Date %in% c("1/2/2007","2/2/2007"))
dateTime <- strptime(paste(data[,1]," ",data[,2]),"%d/%m/%Y %H:%M:%S")
dataShort <- data.frame(Global_active_power = data$Global_active_power,
                        Date_Time=dateTime)

## Plot data
with(dataShort,
     plot(Date_Time, Global_active_power, 
          xlab="", ylab = "Global Active Power (kilowatts)", 
          type="l"))


## Save to PNG
dev.copy(png, file = "./ExData_Plotting1/plot2.png",
         width=480, height=480)
dev.off()
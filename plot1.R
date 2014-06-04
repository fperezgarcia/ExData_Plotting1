setwd('/Users/fernando_perez/Documents/workspace_R/coursera/ExploratoryDataAnalysis')

dataRaw <- read.csv('./EDA_PA1_data/household_power_consumption_short.txt', 
                      header=TRUE, 
                      sep = ";")
data <- subset(dataRaw, dataRaw$Date %in% c("1/2/2007","2/2/2007"))


with(data, hist(Global_active_power, 
                col = "red",
                main = "Global Active Power",
                xlab = "Global Active Power (kilowatts)"))

## Save to PNG
dev.copy(png, file = "./ExData_Plotting1/plot1.png",
         width=480, height=480)
dev.off()
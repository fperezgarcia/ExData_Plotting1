setwd('/Users/fernando_perez/Documents/workspace_R/coursera/ExploratoryDataAnalysis')

dataRaw <- read.csv('./EDA_PA1_data/household_power_consumption_short.txt', 
                      header=TRUE, 
                      sep = ";")
data <- dataRaw[dataRaw$Date == '1/2/2007' | dataRaw$Date == '2/2/2007' , ]


with(data, hist(Global_active_power, 
                col = "red",
                main = "Global Active Power",
                xlab = "Global Active Power (kilowatts)"))

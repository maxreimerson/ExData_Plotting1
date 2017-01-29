setwd("~/coursera/data/")


df.raw <- read.csv("household_power_consumption.txt", 
               header = TRUE, sep = ';', 
               colClasses = c('character','character', 'numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
               na.strings = c('?'))


df <-data.frame(datetime=strptime(paste(df.raw$Date, df.raw$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),  Global_active_power=df.raw$Global_active_power) 

df <- subset(df, df$datetime >= "2007-02-01 00:00:00" & df$datetime < "2007-02-03")

setwd("~/coursera/repos/ExData_Plotting1")


plot(df$datetime, df$Global_active_power, type="n", ylab = "Global Active Power(kilowatts)", xlab = "")
lines(df$datetime, df$Global_active_power)
dev.copy(png, "plot2.png")
dev.off()

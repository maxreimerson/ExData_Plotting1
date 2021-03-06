setwd("~/coursera/data/")


df.raw <- read.csv("household_power_consumption.txt", 
                   header = TRUE, sep = ';', 
                   colClasses = c('character','character', 'numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings = c('?'))

df <-data.frame(datetime=strptime(paste(df.raw$Date, df.raw$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),  
                Global_active_power=df.raw$Global_active_power,
                Global_reactive_power=df.raw$Global_reactive_power,
                Voltage=df.raw$Voltage,
                Global_intensity=df.raw$Global_intensity,
                Sub_metering_1=df.raw$Sub_metering_1,
                Sub_metering_2=df.raw$Sub_metering_2,
                Sub_metering_3=df.raw$Sub_metering_3) 

df <- subset(df, df$datetime >= "2007-02-01 00:00:00" & df$datetime < "2007-02-03")

setwd("~/coursera/repos/ExData_Plotting1")


png(filename = "plot4.png", width = 800, height = 600)
par(mar=c(5,5,2,2), mfcol=c(2,2))

plot(df$datetime, df$Global_active_power, type="n", ylab = "Global Active Power(kilowatts)", xlab = "")
lines(df$datetime, df$Global_active_power)

plot(df$datetime, df$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"), lty = 1)
lines(df$datetime, df$Sub_metering_1, col="black")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue")

plot(df$datetime, df$Voltage, type="n", ylab = "Voltage", xlab = "datetime")
lines(df$datetime, df$Voltage)

plot(df$datetime, df$Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab = "datetime")
lines(df$datetime, df$Global_reactive_power)

dev.off()


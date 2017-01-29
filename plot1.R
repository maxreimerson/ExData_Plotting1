setwd("~/coursera/data/")

setClass('myDate')
setAs("character","myDate", function(from) { as.Date(from, format="%d/%m/%Y") } )


df <- read.csv("household_power_consumption.txt", 
               header = TRUE, sep = ';', 
               colClasses = c('myDate','character', 'numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
               na.strings = c('?'))

df <- subset(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")

setwd("~/coursera/repos/ExData_Plotting1")
hist(df$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.copy(png, "plot1.png")
dev.off()

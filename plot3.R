###Plot 3###

#Prepare Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"),] #subset dataset

data$datetime <- with(data, paste(Date, Time, sep = " ")) #combine date and time
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S") #convert to POSIXlt
data[, 3:9] <- sapply(data[, 3:9], as.numeric) #convert other columns to numeric

#Generate Plot
png("plot3.png", width = 480, height = 480)
with(data, {
        plot(datetime, Sub_metering_1, type = "n",
                xlab = "",
                ylab = "Energy sub metering")
        lines(datetime, Sub_metering_1, col = "black")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()



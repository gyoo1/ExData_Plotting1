###Plot 2###

#Prepare Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"),] #subset dataset

data$datetime <- with(data, paste(Date, Time, sep = " ")) #combine date and time
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S") #convert to POSIXlt
data[, 3:9] <- sapply(data[, 3:9], as.numeric) #convert other columns to numeric

#Generate Plot
png("plot2.png", width = 480, height = 480)
with(data, plot(datetime, Global_active_power,
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)"))
dev.off()

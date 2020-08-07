###Plot 1###

#Prepare Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"),] #subset dataset

data[, 3:9] <- sapply(data[, 3:9], as.numeric) #convert columns to numeric

#Generate Plot
png("plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, 
                col = "red",
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)"))
dev.off()

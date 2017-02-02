# Import data for dates in question, set header for dataframe as that used in data
data <- read.csv("household_power_consumption.txt", sep = ";",
                 skip = 66637, nrows = 69517-66637, header=FALSE, na.strings = "?")
header <- read.csv("household_power_consumption.txt", sep = ";", nrows =1,
                   header=FALSE, na.strings = "?")
colnames(data) <- unlist(header)


# Change dates and times to date/time formats
data$Date <- NULL
data$Time <- NULL
data <- cbind(datetime, data)

#plot3 manually create plot with x axis of Thurs, Fri, Sat. Then add lines one by one
# then place a legend for the lines
png("	plot3.png", width = 480, height = 480)
plot(datetime, Sub_metering_1, type = "l" , ylab = "Energy sub metering", xlab="")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red","blue"))
dev.off()
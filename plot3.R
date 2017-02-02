# Import data for dates in question, set header for dataframe as that used in data
data <- read.csv("household_power_consumption.txt", sep = ";",
                 skip = 66637, nrows = 69517-66637, header=FALSE, na.strings = "?")
header <- read.csv("household_power_consumption.txt", sep = ";", nrows =1,
                   header=FALSE, na.strings = "?")
colnames(data) <- unlist(header)
attach(data)
par(cex=0.8)

# Change dates and times to date/time formats
Date <- as.Date(Date,"%d/%m/%Y")
Time <- strptime(Time,"%H:%M:%S")

#plot3 manually create plot with x axis of Thurs, Fri, Sat. Then add lines one by one
# then place a legend for the lines
plot(Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "", xaxt = "n")
axis(1,at=c(1, (1+length(Date))/2,length(Date)), labels = c("Thu","Fri","Sat"))
lines(Sub_metering_1, col = "black")
lines(Sub_metering_2, col = "red")
lines(Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1), col = c("black", "red","blue"), text.width = 800)

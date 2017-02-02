# Import data for dates in question, set header for dataframe as that used in data
data <- read.csv("household_power_consumption.txt", sep = ";",
                 skip = 66637, nrows = 69517-66637, header=FALSE, na.strings = "?")
header <- read.csv("household_power_consumption.txt", sep = ";", nrows =1,
                   header=FALSE, na.strings = "?")
colnames(data) <- unlist(header)
attach(data)

# Change dates and times to date/time formats
Date <- as.Date(Date,"%d/%m/%Y")
Time <- strptime(Time,"%H:%M:%S")

# set parameters for tiled plots and smaller text
par(mfrow = c(2,2), cex=0.7)

plot(Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power", xlab = "")
axis(1,at=c(1, (1+length(Date))/2,length(Date)), labels = c("Thu","Fri","Sat"))

plot(Voltage, type="l", xaxt = "n",
     ylab = "Voltage", xlab = "datetime")
axis(1,at=c(1, (1+length(Date))/2,length(Date)), labels = c("Thu","Fri","Sat"))

plot(Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "", xaxt = "n")
axis(1,at=c(1, (1+length(Date))/2,length(Date)), labels = c("Thu","Fri","Sat"))
lines(Sub_metering_1, col = "black")
lines(Sub_metering_2, col = "red")
lines(Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1), col = c("black", "red","blue"), bty = "n", text.width=1400, cex=0.8)

plot(Global_reactive_power, type="l", xaxt = "n",
     ylab = "Global_reactive_power", xlab = "datetime")
axis(1,at=c(1, (1+length(Date))/2,length(Date)), labels = c("Thu","Fri","Sat"))

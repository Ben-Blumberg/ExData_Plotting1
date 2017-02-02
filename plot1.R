# Import data for dates in question, set header for dataframe as that used in data
data <- read.csv("household_power_consumption.txt", sep = ";",
                 skip = 66637, nrows = 69517-66637, header=FALSE, na.strings = "?")
header <- read.csv("household_power_consumption.txt", sep = ";", nrows =1,
                   header=FALSE, na.strings = "?")
colnames(data) <- unlist(header)

# Change dates and times to date/time formats
datetime <- strptime(with(data, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
data$Date <- NULL
data$Time <- NULL
data <- cbind(datetime, data)


#plot1
png("plot1.png", width = 480, height = 480)
hist(Global_active_power,xlab = "Global Active Power (kilowatts)", col ="red",main="Global Active Power")
dev.off()

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
par(cex=0.8)
#plot1
hist(Global_active_power,xlab = "Global Active Power (kilowatts)", col ="red",main="Global Active Power")

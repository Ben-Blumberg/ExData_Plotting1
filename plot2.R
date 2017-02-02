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

#plot2, manually replace x axis with three correcly spaced labels, Thu, Fri, Sat
plot(Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1,at=c(1, (1+length(Date))/2,length(Date)), labels = c("Thu","Fri","Sat"))
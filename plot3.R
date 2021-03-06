#Browse to the working directory
setwd("D:/oNLINE cOURSE")
power<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Obtain the data related to two days(Feb 1 & Feb2):
data<- subset(power, (power$Date == "1/2/2007" | power$Date== "2/2/2007"))

# Changing the class of Date from character to Date:
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Combining the Date and Time; creating a new column called "DateTime":
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Generating Plot3:
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

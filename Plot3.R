## download file, read into R
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url, destfile = "power.zip", method = "curl")
unzip("power.zip")
power<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?", header=TRUE)


## Convert Date, select dates
power$datetime <- with(power,paste (Date, Time))
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
mydata <- power[power$Date %in% (as.Date(c("2007-02-01","2007-02-02"))),]
mydata$datetime <- strptime(mydata$datetime, format= "%d/%m/%Y %H:%M:%S")

## Plot
png(file="Plot3.png", width = 480, height = 480, units = "px")
with(mydata, {
        plot(datetime,Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
        lines(datetime,Sub_metering_1, col = "black")
        lines(datetime,Sub_metering_2, col = "red")
        lines(datetime,Sub_metering_3, col = "blue")
}
)
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=1)
dev.off()

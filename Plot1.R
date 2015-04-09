## download file, read into R
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url, destfile = "power.zip", method = "curl")
unzip("power.zip")
power<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?", header=TRUE)


## Convert Date, select dates
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
mydata <- power[power$Date %in% (as.Date(c("2007-02-01","2007-02-02"))),]

## Plot
png(file="Plot1.png", width = 480, height = 480, units = "px")
hist(mydata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

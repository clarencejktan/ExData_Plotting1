## Comments from the student Mar 2021: I am retaking this R Programming course 
## to refresh my skills after some time away from the data science field.
## It is not possible to fork the same repo twice, so this repo contains my work
## from when I first took the course. It is, nevertheless, my own work.
## Thanks for reviewing it.


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

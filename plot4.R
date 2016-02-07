# download and unzip the data
# put household_power_consumption.txt into "/Users/MBP2015/Desktop/myGithub/assignment1"


setwd("/Users/MBP2015/Desktop/myGithub/assignment1")

mydata <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors = FALSE)
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
library(dplyr)
mydf <- tbl_df(mydata)
rm("mydata")

# select a range of dates

date_selected <- filter(mydf, Date >= "2007-02-01" & Date <= "2007-02-02")




# plot 4

#  set up a four panel graph 

png(file="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

# subplot -1

within(date_selected,plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# subplot-2

within(date_selected,plot(DateTime, Voltage, type="l", xlab="datetime"))


# subplot-3

within(date_selected,plot(DateTime, Sub_metering_1, type="l", col = "black",ylab="Energy sub metering",xlab=""))   # black

within(date_selected,lines(DateTime, Sub_metering_2, type="l", col = "red"))  # red

within(date_selected,lines(DateTime, Sub_metering_3, type="l", col = "blue"))  # blue

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"), bty="n")



# subplot-4


within(date_selected,plot(DateTime, Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power"))


dev.off()




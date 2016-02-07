setwd("/Users/MBP2015/Desktop/myGithub/assignment1")

mydata <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors = FALSE)
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
library(dplyr)
mydf <- tbl_df(mydata)
rm("mydata")

# select a range of dates

date_selected <- filter(mydf, Date >= "2007-02-01" & Date <= "2007-02-02")


# make a new column with date and time combined


date_selected$DateTime <- as.POSIXct(paste(date_selected$Date, date_selected$Time),format="%Y-%m-%d %H:%M:%S")

# plot #2

png(file = "plot2.png", width = 480, height = 480)
within(date_selected,plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

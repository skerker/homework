# download and unzip the data

# do the rest of the script in the current working directory


setwd("/Users/MBP2015/Desktop/myGithub/assignment1")

mydata <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors = FALSE)
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
library(dplyr)
mydf <- tbl_df(mydata)
rm("mydata")

# select a range of dates

date_selected <- filter(mydf, Date >= "2007-02-01" & Date <= "2007-02-02")

#   Source: local data frame [2,880 x 9]

# plot #1

png(file = "plot1.png", width = 480, height = 480)

hist(date_selected$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

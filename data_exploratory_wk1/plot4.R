#plot 4

#install.packages("lubridate")
library(lubridate)

d <- read.table(file="C:/../exploratory_data_analysis/data/exdata_data_household_power_consumption/household_power_consumption.txt",sep= ";", header=TRUE)

head(d)
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
d_new <- d[d$Date >= "2007-02-01" & d$Date <= "2007-02-02", ]
dim(d_new)
d_new
table (d_new$Date)
table (d_new$Global_active_power)


class(d_new$Global_active_power)
d_new$Global_active_power1 <- as.numeric(as.factor(d_new$Global_active_power))
summary(d_new$Global_active_power1)


summary(d_new$Global_active_power1)




d_new$time1 <- paste(d_new$Date, d_new$Time)


d_new$newtime <- ymd_hms(d_new$time)



which(d_new$newtime==ymd_hms("2007-02-02 00:00:00 UTC")) 



d_new$time1 <- paste(d_new$Date, d_new$Time)


d_new$newtime <- ymd_hms(d_new$time)



which(d_new$newtime==ymd_hms("2007-02-02 00:00:00 UTC")) 


png("plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
#1

plot(d_new$newtime, d_new$Global_active_power1, type="l", xlab="", ylab="Global Active Power", cex=0.2)
 


#2
 plot(d_new$newtime,  d_new$Voltage, col="black", lwd=1 , type="l" , xlab= "datetime" ) 


#3
 plot(d_new$newtime, d_new$Sub_metering_1, main = " ", type = "n", ylab="Energy sub metering" , xlab= " ", col= "black") 
 
lines( d_new$newtime, d_new$Sub_metering_1, col="black", lwd=1 , type="l"  ) 

lines( d_new$newtime, d_new$Sub_metering_2, col="red", lwd=1 , type="l"  ) 

lines( d_new$newtime, d_new$Sub_metering_3, col="blue", lwd=1 , type="l" )  

legend ("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#4
 plot( d_new$newtime,  d_new$Global_reactive_power, col="black", lwd=1 , type="l" , xlab= "datetime" , ylab="Global_reactive_power")

dev.off()


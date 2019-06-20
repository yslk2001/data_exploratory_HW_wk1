#plot2

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
 

png("plot2.png",   width = 480, height = 480, pointsize=12)
which(d_new$newtime==ymd_hms("2007-02-02 00:00:00 UTC")) 

with(d_new, plot(newtime, Global_active_power1 , ylab="Global Active Power (kilowatts)", xlab = "", type="l" , lwd=1, xaxt = 'n', yaxt = 'n'))
axis(1, at=c(d_new$newtime[1], d_new$newtime[1441], d_new$newtime[2880]),labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0,1000,2000,3000),labels=c(0,2,4,6))    

dev.off()
getwd()


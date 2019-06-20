#plot 1


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


png("plot1.png",   width = 480, height = 480, pointsize=12)
 hist(d_new$Global_active_power1 , xlab = "Global Active Power (kilowatts)" , col= "red" , xaxt = 'n', main= "Global Active Power" )
axis(1, at=c(0,1000,2000,3000),labels=c(0,1,2,3 ))    
 

dev.off()
 getwd()
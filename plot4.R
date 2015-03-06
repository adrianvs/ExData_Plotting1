# Plots the fourth plot for Exploratory Data Anaysis


# load the dataframe:

data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")


#convert and combine $Date and $Time to a new column of class POSIXlt,
#and subset the data frame to the two days in question:

data$Date <- strptime(data$Date,format="%d/%m/%Y")
dat <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )
DateTime <- paste(dat$Date,dat$Time,sep = "-")
DateTime <- strptime(DateTime,format="%Y-%m-%d-%H:%M:%S")
dat <- cbind(dat,DateTime)

# opening png device:
png(filename = "plot4.png")

#creating the plot:
#setting the canvas to 2x2:
par(mfrow=c(2,2))

#plot1
with(dat,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
#plot2
with(dat,plot(DateTime,Voltage,type="l"))
#plot3
with(dat,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(dat,lines(DateTime,dat$Sub_metering_1))
with(dat,lines(DateTime,dat$Sub_metering_2,col="red"))
with(dat,lines(DateTime,dat$Sub_metering_3,col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") ,lty=1,col=c("black","red","blue"))
#plot4
with(dat,plot(DateTime,Global_reactive_power,type="l"))

# closing device
dev.off()


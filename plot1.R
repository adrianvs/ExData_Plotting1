# Plots the first plot for Exploratory Data Anaysis


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
png(filename = "plot1.png")

#creating the plot:
with(dat, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

# closing device
dev.off()

#Checking and downloading files

if(!file.exists('data.zip')){
url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url,destfile = "data.zip")
}

#Unzip and loading files
unzip("data.zip") # This creates the file "household_power_consumption.txt"
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")

#Date variable setting and cleaning.
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

#Setting Start and End date
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

#Required Data subset
#data2<-data[start:end,]

#Ploting the graph
plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red')
lines(data2$DateTime, data2$Sub_metering_3, type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
 lty=c(.5,.5,.5), col=c("black","red","blue"))

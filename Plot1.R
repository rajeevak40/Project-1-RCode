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
data2<-data[start:end,]

#Histogram setting
hist(as.numeric(as.character(data2$Global_active_power)), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")



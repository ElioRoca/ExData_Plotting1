##set data
#read data from zipfile
dato <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
#change first column to Data class
date<-as.Date(dato[[1]],format = "%d/%m/%Y")
#create index for selected dates
index<-date=="2007-02-01"|date=="2007-02-02"
#subset "date" and "Global_active_power" for given dates
data<-dato[index,c(1:3)]
#change class for time
data[[1]]<-paste(data$Date, data$Time)
data[[4]]<-strptime(data[[1]], format="%d/%m/%Y %H:%M:%S")
#change class for "Global_active_power"
data[[3]]<-as.numeric(data[[3]])/1000
##plot
plot(data[[4]],data[[3]],type="n",main="Global Active Power",ylab="Global Active Power (kilowatts)",xlab="")
lines(data[[4]],data[[3]])
##save plot
dev.copy(png,'plot2.png')
dev.off()



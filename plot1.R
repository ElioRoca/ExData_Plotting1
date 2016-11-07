
##set data
#read data from zipfile
dato <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
#change first column to Data class
date<-as.Date(dato[[1]],format = "%d/%m/%Y")
#create index for selected dates
index<-date=="2007-02-01"|date=="2007-02-02"
#subset data of column "Global_active_power" in kilo wattss for given dates
data<-as.numeric(dato[index,3])/1000

##plot
hist(data, col="red",main="Global active power",xlab="Global active power (kilowatts)",ylab="Frecuency",breaks=c(0, seq(0.25,6, 0.25)))

##save plot
dev.copy(png,'plot1.png')
dev.off()

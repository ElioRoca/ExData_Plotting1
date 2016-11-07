
#read data from zipfile
dato <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
#subset data for  changue data in column "Global active power" to numeric
data<-as.numeric(dato[[3]])
#plot
hist(data[], col="red",main="Global active power",xlab="Global active power (kilowatts)",ylab="Frecuency",breaks=12)

#save plot
dev.copy(png,'plot1.png')
dev.off()

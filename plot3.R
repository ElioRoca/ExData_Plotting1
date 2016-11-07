##set data
#read data from zipfile
dato <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
#subset
#change class to Date
#change class to numeric
##plot
plot(data[[1]],data[[7]],type="n",,main="Global active power",ylab="Global active power (kilowatts)",xlab="time")
lines(data[[1]],data[[7]],col="")
lines(data[[1]],data[[8]],col="")
lines(data[[1]],data[[9]],col="")
##save plot
dev.copy(png,'plot2.png')
dev.off()


##read data from zipfile
#read columns classes 
head <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";",nrows = 5)
classes<-1:length(head)
for(i in 1:length(head)){classes[i]<-class(head[[i]])}
#read frame with data classes, in other case the data "?" turns classes in character
dat <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";",colClasses=x,nrows = 15)
#changue first columns to Data ans Time classes

#plot


#save plot
dev.copy(png,'plot1.png')
dev.off()

#set data
##read data from zipfile
dato <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
##index
###change first column to Data class
date<-as.Date(dato[[1]],format = "%d/%m/%Y")
###create index for selected dates
index<-date=="2007-02-01"|date=="2007-02-02"
##subset "date" and "Global_active_power" for given dates
data<-dato[index,]
##change class for time
data[[1]]<-paste(data$Date, data$Time)
data[[1]]<-strptime(data[[1]], format="%d/%m/%Y %H:%M:%S")
#change class for numeric variables
for(i in 3:9){data[[i]]<-as.numeric(data[[i]])}
#plot
##frame
par(mfrow=c(2,2))
##1st plot
plot(data[[1]],data[[3]]/1000,type="n",ylab="Global Active Power",xlab="")
lines(data[[1]],data[[3]]/1000)
##2nd plot
plot(data[[1]],data[[5]],type="n",ylab="Voltaje",xlab="")
lines(data[[1]],data[[5]])
##3rd plot
plot(data[[1]],data[[7]],type="n",main=NULL,ylab="Energy sub metering",xlab="")
lines(data[[1]],data[[7]])
lines(data[[1]],data[[8]],col="red")
lines(data[[1]],data[[9]],col="blue")
legend("topright", # places a legend at the appropriate place 
c(colnames(data)[7],colnames(data)[8],colnames(data)[9]), # puts text in the legend
lty=c(1,1,1), # gives the legend appropriate symbols (lines)
lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),# gives the legend lines the correct color and width
cex=0.5) #gives size
##4th plot
plot(data[[1]],data[[4]],type="n",ylab=colnames(data)[4],xlab="")
lines(data[[1]],data[[4]])
#save plot
dev.copy(png,'plot4.png')
dev.off()

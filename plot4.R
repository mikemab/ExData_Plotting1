#read created file from directory based off plot1.R

epc <- read.table("data.txt",header=TRUE,sep="\t",dec=".",stringsAsFactors = FALSE)
data <- subset(epc, as.Date(as.character(epc[,1]),format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") | as.Date(as.character(epc[,1]),format="%d/%m/%Y") ==  as.Date("02/02/2007",format="%d/%m/%Y"))

#Plot 4
#Variable Extraction
daytime <- strptime(paste(data[,1],data[,2],sep=" "),"%d/%m/%Y %H:%M:%S")
gap <- as.numeric(data[,3])
voltage <- as.numeric(data[,5])
grp <- as.numeric(data[,4])
sub1 <- as.numeric(data[,7])
sub2 <- as.numeric(data[,8])
sub3 <- as.numeric(data[,9])

#Initalize Plot 4 png creation
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2)) #Graphs by columns
plot(daytime,gap,type="l",xlab="",ylab="Global Active Power",cex=0.2) #Plot1

plot(daytime, sub1, col="black",type="l",ylab = "Energy sub metering", xlab ="") #Plot2
lines(daytime,sub2,col="red")
lines(daytime,sub3,col="blue")
legend("topright",lty=,lwd=c(1,1,1),col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="o")

plot(daytime,voltage,type="l",xlab="datetime",ylab="Voltage") #Plot3

plot(daytime,grp,type="l",xlab="datetime",ylab="Global_reactive_power") #Plot4
dev.off() #End Png
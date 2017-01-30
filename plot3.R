#read created file from directory based off plot1.R

epc <- read.table("data.txt",header=TRUE,sep="\t",dec=".",stringsAsFactors = FALSE)
data <- subset(epc, as.Date(as.character(epc[,1]),format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") | as.Date(as.character(epc[,1]),format="%d/%m/%Y") ==  as.Date("02/02/2007",format="%d/%m/%Y"))

#Plot3
#Variable Declaration
daytime <- strptime(paste(data[,1],data[,2],sep=" "),"%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(data[,7])
sub2 <- as.numeric(data[,8])
sub3 <- as.numeric(data[,9])

#summary(sub2)
#PNG
png("plot3.png",width=480,height=480)
plot(daytime, sub1, col="black",type="l",ylab = "Energy sub metering", xlab ="") #Plot
lines(daytime,sub2,col="red") #red line
lines(daytime,sub3,col="blue") #blue lkine
legend("topright",lty=1,lwd=2.5,col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #adding legend
dev.off() #end PNG
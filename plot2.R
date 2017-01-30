#read created file from directory based off plot1.R

epc <- read.table("data.txt",header=TRUE,sep="\t",dec=".",stringsAsFactors = FALSE)
data <- subset(epc, as.Date(as.character(epc[,1]),format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") | as.Date(as.character(epc[,1]),format="%d/%m/%Y") ==  as.Date("02/02/2007",format="%d/%m/%Y"))

#Plot 2

daytime <- strptime(paste(data[,1],data[,2],sep=" "),"%d/%m/%Y %H:%M:%S")
gap <- as.numeric(data[,3])
png("plot2.png",width=480,height=480)
plot(daytime,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
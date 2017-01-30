#download file from the web
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
epc <- read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
write.table(epc,"data.txt",sep="\t") #write file to data.txt

#Subset data by date
data <- subset(epc, as.Date(as.character(epc[,1]),format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") | as.Date(as.character(epc[,1]),format="%d/%m/%Y") ==  as.Date("02/02/2007",format="%d/%m/%Y"))
write.table(data,"subdata.txt",sep="\t") #write subset of data to txt file


gap <- as.numeric(data[,3])
#Plot 1
png("plot1.png",width=480,height=480)
hist(gap,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="Red")
dev.off()
#read the file
infile <- read.table('household_power_consumption.txt',na.strings="?", header=T, sep=';')

#extract the Feb data
febData <- infile[infile$Date %in% c('1/2/2007','2/2/2007'),]
dates = sapply(febData$Date,function(x) weekdays(as.Date(x,'%d/%m/%Y'),abbr=TRUE))

#plot the data
png('plot3.png')
plot(febData$Sub_metering_1, type='l', xlab='',ylab='Energy sub metering',xaxt='n')
axis(1,at=c(1,sum(dates=='Thu')+1,nrow(febData)+1),labels=c('Thu','Fri','Sat'),las=1)
lines(febData$Sub_metering_2, col='red')
lines(febData$Sub_metering_3, col='blue')
legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'))
dev.off()
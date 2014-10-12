#read the file
infile <- read.table('household_power_consumption.txt',na.strings="?", header=T, sep=';')

#extract the Feb data
febData <- infile[infile$Date %in% c('1/2/2007','2/2/2007'),]

dates = sapply(febData$Date,function(x) weekdays(as.Date(x,'%d/%m/%Y'),abbr=TRUE))

#plot the data
png('plot2.png')

plot(febData$Global_active_power,type='l', xlab='',ylab='Global Active Power (kilowatts)',xaxt='n')
axis(1,at=c(1,sum(dates=='Thu')+1,nrow(febData)+1),labels=c('Thu','Fri','Sat'),las=1)

dev.off()
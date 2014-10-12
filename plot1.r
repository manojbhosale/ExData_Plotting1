#read the file
infile <- read.table('household_power_consumption.txt',na.strings="?", header=T, sep=';')

#extract the Feb data
febData <- infile[infile$Date %in% c('1/2/2007','2/2/2007'),]

#plot the data
png('plot1.png')
hist(febData$Global_active_power,main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency',col='red')
dev.off()
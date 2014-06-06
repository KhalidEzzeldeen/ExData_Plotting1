# Read Full Data
allData = read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)

# Construct Day Time Column
allData$DateTime = strptime(paste(allData$Date, allData$Time),format="%d/%m/%Y %H:%M:%S")

# Convert first column to Date format
allData$Date = as.Date(allData$Date,format='%d/%m/%Y')

# Data between 01/02/2007 and 02/02/2007
reqData = allData[which(allData$Date >= as.Date("01/02/2007",format='%d/%m/%Y') & allData$Date <= as.Date("02/02/2007",format='%d/%m/%Y')),]
head(reqData)
row.names(reqData) = c(1:nrow(reqData))

# Plot 2
png(file="Plot2.png")
plot(reqData$DateTime,reqData$Global_active_power,type="s",ylab='Global Active Power (kilowatts)',xlab='')
dev.off()
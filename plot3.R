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

# Plot 3
png(file="Plot3.png")
plot(reqData$DateTime,reqData$Sub_metering_1,type="s",ylab='Energy sub metering',xlab='',col="black")
points(reqData$DateTime,reqData$Sub_metering_2,type="s",col="red")
points(reqData$DateTime,reqData$Sub_metering_3,type="s",col="blue")
legend("topright", pch = "_", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
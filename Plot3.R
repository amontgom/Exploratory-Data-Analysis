#(2075259 * 9 * 8)/2^20 = ~142 Mb of RAM needed to read. Should be just fine.
#Will still take a while to run, though

#Retrieve File from Internet
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile() #No need to store uncessary .zip files
download.file(fileUrl, destfile = temp, mode = "wb") #add a ", method = "curl"" if using a mac
dateDowloaded <- date()
dateDowloaded
unzip(temp, "household_power_consumption.txt") #unzips the file, turns it into a readable .txt file
HPCData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE) #Note that separation is by semicolons, not commas
unlink(temp)

#install.packages("lubridate") #install Lubridate, if not already present (much better at doing date/time stuff than default code)
library(lubridate)

HPCData$Date<-dmy(HPCData$Date) #Converts Factor-class dates into Date-class dates
HPCDataFeb<-HPCData$Date=="2007-02-01"|HPCData$Date=="2007-02-02" #Extracts February 1st/2nd data
HPCDataDateSlimmed <- HPCData[HPCDataFeb,] #Creates new dataset with slimmed data (much faster than retrieving from old dataset)
HPCDataDateSlimmed$newdate <- with(HPCDataDateSlimmed, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")) #creates a unified date/time column, easier for plotting


#plotting
plot(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Sub_metering_1, type= "n", xlab= "", ylab= "Energy sub metering")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Sub_metering_1, col = "black")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Sub_metering_2, col = "red")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bg = "transparent", y.intersp = 0.3)
dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()

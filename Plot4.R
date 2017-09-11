par(mfrow = c(2, 2))
plot(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Global_active_power, type= "n", xlab= "", ylab= "Global Active Power (kilowatts)")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Global_active_power)
plot(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Voltage, type= "n", xlab= "datetime", ylab= "Voltage")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Voltage)
plot(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Sub_metering_1, type= "n", xlab= "", ylab= "Energy sub metering")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Sub_metering_1, col = "black")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Sub_metering_2, col = "red")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lty=0, bg = "transparent", y.intersp = 0.1)
plot(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Global_reactive_power, type= "n", xlab= "datetime", ylab= "Global_reactive_power")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Global_reactive_power)
dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()
par(mfrow = c(1, 1))
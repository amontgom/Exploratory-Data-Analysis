plot(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Global_active_power, type= "n", xlab= "", ylab= "Global Active Power (kilowatts)")
lines(HPCDataDateSlimmed$newdate, HPCDataDateSlimmed$Global_active_power)
dev.copy(png, file = "Plot2.png", width = 480, height = 480)
dev.off()
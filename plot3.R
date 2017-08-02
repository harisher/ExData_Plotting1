png(filename = "plot3.png", width = 480, height = 480, units = "px", bg=NA)
plot3 <- function(){
        par(mfrow = c(1,1))
        library(lubridate)
        hhp <- read.table("household_power_consumption.txt", sep = ";", 
                          na.strings = "?", skip = 66637, nrows = 2880)
        header <- read.table("household_power_consumption.txt", na.strings = "?", 
                             header = FALSE, sep = ";", nrows = 1, 
                             col.names = FALSE)
        colnames(hhp) <- header[[1]]
        rm("header")
        
        hhp$lubridt <- dmy_hms(paste(hhp$Date,hhp$Time))
        plot(hhp$lubridt, hhp$Sub_metering_1, xlab = "", 
             ylab = "Energy sub metering", type = "l", col = "black")
        lines(hhp$lubridt,hhp$Sub_metering_2, col = "red")
        lines(hhp$lubridt,hhp$Sub_metering_3, col = "blue")
        legend("topright",col = c("black","red","blue"), lwd = 1, lty = 1, 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
}
plot3()
dev.off()
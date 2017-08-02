png(filename = "plot2.png", width = 480, height = 480, units = "px", bg=NA)
plot2 <- function(){
        par(mfrow = c(1,1))
        library(lubridate)
        hhp <- read.table("household_power_consumption.txt", sep = ";", 
                          na.strings = "?", skip = 66637, nrows = 2880)
        header <- read.table("household_power_consumption.txt", na.strings = "?", header = FALSE, sep = ";", nrows = 1, col.names = FALSE)
        colnames(hhp) <- header[[1]]
        rm("header")

        hhp$lubridt <- dmy_hms(paste(hhp$Date,hhp$Time))
        plot(hhp$lubridt, hhp$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
}
plot2()
dev.off()
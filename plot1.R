png(filename = "plot1.png", width = 480, height = 480, units = "px", bg=NA)
plot1 <- function(){
        par(mfrow = c(1,1))
        hhp <- read.table("household_power_consumption.txt", sep = ";", 
                          na.strings = "?", skip = 66637, nrows = 2880)
        header <- read.table("household_power_consumption.txt", header = FALSE, 
                             sep = ";", nrows = 1, col.names = FALSE)
        colnames(hhp) <- header[[1]]
        rm("header")
        hist(hhp$Global_active_power, main="Global Active Power", 
             xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
             col = "red")
}
plot1()
dev.off()
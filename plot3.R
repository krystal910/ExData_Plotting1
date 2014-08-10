#### Plot 3

## Loading the data (assumes zip file has been downloaded and unzipped to the
## current working directory)

  ## Read data from file
  data <- read.table("household_power_consumption.txt",header = TRUE, sep =
                       ";" , na.strings = "?")

  ## Convert date to the correct format so that subset can be created
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

  ## Create subset
  subset <- subset(data, Date >= "2007-02-01" & Date < "2007-02-03")

  ## Add datetime variable
  subset$datetime <- as.POSIXct(paste(subset$Date, as.character(subset$Time)))


  ##Open graphic device
  png(file="plot3.png",width = 480, height = 480)

  ## Generate Plot with no points
  plot(subset$datetime,subset$Sub_metering_1, type ="n",
       ylab="Energy sub metering", xlab="")

  ## Add points
  lines(subset$datetime,subset$Sub_metering_1, col="black")
  lines(subset$datetime,subset$Sub_metering_2, col="red")
  lines(subset$datetime,subset$Sub_metering_3, col="blue")

  ## Add legend
  legend("topright",
        legend = colnames(subset[,7:9]),
        lwd = c(1,1,1),
        col = c("black","red","blue"))
        pt.cex = 1.3)


  ##Close Graphic device
  dev.off()

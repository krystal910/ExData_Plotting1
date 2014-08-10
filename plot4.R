#### Plot 4

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
  png(file="plot4.png",width = 480, height = 480)

  ## Set to output multiple plots ( 2 by 2 )
  par(mfrow = c(2,2))

    ## Generate first plot
    plot(subset$datetime,subset$Global_active_power, type="l",
       ylab="Gobal Active Power (kilowatts)", xlab="")


    ## Generate second plot
    plot(subset$datetime,subset$Voltage, type="l",
       ylab="Voltage", xlab="datetime")


    ## Generate third plot
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
        col = c("black","red","blue"),
        bty="n")

    ## Generate fourth plot
    plot(subset$datetime,subset$Global_reactive_power, type="l",
         ylab="Global_reactive_power", xlab="datetime")

  ##Close graphics device
  dev.off()

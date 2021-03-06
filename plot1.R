#### Plot 1

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
  png(file="plot1.png",width = 480, height = 480)

  ## Generate Plot
  hist(subset$Global_active_power,col="red", main="Global Active Power",
        xlab = "Global Active Power (kilowatts)")

  ##Close graphic device
  dev.off()



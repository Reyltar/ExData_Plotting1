## Note : We assume that the data set has been unzip in the working directory


## Getting data
    EPC_table <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

## Filter on the first 2 days of february
    EPC_table <- subset(EPC_table, EPC_table$Date =='1/2/2007'| EPC_table$Date =='2/2/2007')

## Group date & time into a formated column
    EPC_table$DateTime <- paste(EPC_table$Date, EPC_table$Time)
    EPC_table$DateTime <- strptime(EPC_table$DateTime, format = "%d/%m/%Y %H:%M:%S")

## Clean missing values
    EPC_table[,3:9] <- as.numeric(gsub("\\?", NA, as.matrix(EPC_table[,3:9])))

## Generate plot 2
    png(filename  = "plot2.png")
    with(EPC_table, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
    dev.off() 

## Note : We assume that the data set has been unzip in the working directory


## Getting data
    EPC_table <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

## Filter on the first 2 days of february
    EPC_table <- subset(EPC_table, EPC_table$Date =='1/2/2007'| EPC_table$Date =='2/2/2007')
    
## Clean missing values
    EPC_table[,3:9] <- as.numeric(gsub("\\?", NA, as.matrix(EPC_table[,3:9])))
    
## Generate plot 1
    png(filename  = "plot1.png")
    hist(EPC_table$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off() 
    
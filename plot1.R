if(!exists("household_power_consumption")) {
  library(dplyr)
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = "exdata_data_household_power_consumption.zip")
  unzip("exdata_data_household_power_consumption.zip")
  household_power_consumption <- 
    read.csv("~/ExData_Plotting1/household_power_consumption.txt", 
             sep=";", na.strings="?",
             stringsAsFactors = F) %>%
    filter(Date %in% c("1/2/2007", "2/2/2007"))
}

png("plot1.png", width = 480, height = 480)

hist(household_power_consumption$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
  
  
  

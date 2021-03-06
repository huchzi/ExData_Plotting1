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

household_power_consumption$datetime = strptime(paste(household_power_consumption$Date,
                                                      household_power_consumption$Time), 
                                                format = "%d/%m/%Y %H:%M:%S")

curr_locale <- Sys.getlocale("LC_TIME") 
Sys.setlocale("LC_TIME","en_US.UTF-8") # otherwise weekdays would be named in German in my plots

png("plot2.png", width = 480, height = 480)

plot(household_power_consumption$datetime,
     household_power_consumption$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "")

dev.off()

Sys.setlocale("LC_TIME",curr_locale)

#data file "household_power_consumption.txt" must be in current working directory

if("data.table" %in% rownames(installed.packages()) == FALSE) {install.packages("data.table")}

library(data.table)

hpc<-fread("household_power_consumption.txt")
hpc2<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007"]

hpc2$DateTime=as.POSIXct(strptime(paste(hpc2$Date,hpc2$Time),"%d/%m/%Y %H:%M:%S"))

hpc2$Global_active_power<-as.numeric(hpc2$Global_active_power)
hpc2$Global_reactive_power<-as.numeric(hpc2$Global_reactive_power)
hpc2$Voltage<-as.numeric(hpc2$Voltage)
hpc2$Global_intensity<-as.numeric(hpc2$Global_intensity)
hpc2$Sub_metering_1<-as.numeric(hpc2$Sub_metering_1)
hpc2$Sub_metering_2<-as.numeric(hpc2$Sub_metering_2)
hpc2$Sub_metering_3<-as.numeric(hpc2$Sub_metering_3)


png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(hpc2$Global_active_power~hpc2$DateTime,type="l", ylab="Global Active Power (kilowatts)",xlab="")

dev.off()
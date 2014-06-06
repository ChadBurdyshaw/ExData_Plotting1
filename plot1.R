#Exploratory data analysis Project 1 plot1

power=read.table("household_power_consumption.txt",sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE)
dates=as.Date(power$Date,format="%d/%m/%Y")
power$Date=dates

subpower=subset(power,Date=="2007-02-01" | Date=="2007-02-02")
DateTime=paste(subpower$Date,subpower$Time)
subpower$DateTime=strptime(DateTime,"%Y-%m-%d %H:%M:%S")

#convert all needed variables to numeric
subpower$Global_active_power=as.numeric(subpower$Global_active_power)
subpower$Global_reactive_power=as.numeric(subpower$Global_reactive_power)
subpower$Sub_metering_1=as.numeric(subpower$Sub_metering_1)
subpower$Sub_metering_2=as.numeric(subpower$Sub_metering_2)
subpower$Sub_metering_3=as.numeric(subpower$Sub_metering_3)
subpower$Voltage=as.numeric(subpower$Voltage)

#plot 1
#create png graphics device
png(filename="plot1.png",width=480,height=480,units="px")
with(subpower,{
hist(Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col="red")
})
#close graphics device
dev.off()

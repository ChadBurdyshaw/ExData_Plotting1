#Exploratory data analysis Project 1 plot 3

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

#plot 3
#create png graphics device
png(filename="plot3.png",width=480,height=480,units="px")
with(subpower,{
  plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(DateTime,Sub_metering_1,col="black")
  lines(DateTime,Sub_metering_2,col="red")
  lines(DateTime,Sub_metering_3,col="blue")
  leg.txt=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  legend("topright",legend=leg.txt,lty=1,col=c("black","red","blue"))
})
#close graphics device
dev.off()

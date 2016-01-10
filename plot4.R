##Read the table
a<-read.table("household_power_consumption.txt",header = TRUE,sep=";",
              stringsAsFactors = FALSE,na.strings = "?")

##Convert Date field to data type date
a$Date<-as.Date(a$Date,format = "%d/%m/%Y") #format = 1/1/2000

##Keep only the relevant dates
b<-subset(a,Date >="2007-02-01"& Date<="2007-02-02")
head(b)

##Capture Date and Time in 1 field
datetime <- paste(as.Date(b$Date), b$Time) 
b$Datetime <- as.POSIXct(datetime) 

##Create 'png' file
png("plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

##Create graph 1
plot(b$Datetime,b$Global_active_power,type = "l",xlab = "",
     ylab= "Global Active Power (kilowatts)")

##Create graph 2
with(b, { 
plot(Sub_metering_1~Datetime, type = "l", xlab = "",
          ylab = "Global Active Power (kilowatts)") 
     lines(Sub_metering_2~Datetime, col = "red") 
     lines(Sub_metering_3~Datetime,col = "blue") 
 }) 
legend("topright", col=c("black", "red", "blue"),  lty=1, lwd=2,
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

##Create graph 3
plot(b$Datetime,b$Voltage,type = "l",xlab = "datetime",
     ylab= "Voltage")

##Create graph 4
plot(b$Datetime,b$Global_reactive_power,type = "l",xlab = "datetime")

dev.off()

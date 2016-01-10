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
png("plot2.png", width = 480, height = 480)

##Create plot
plot(b$Datetime,b$Global_active_power,type = "l",xlab = "",
     ylab= "Global Active Power (kilowatts)")
dev.off()

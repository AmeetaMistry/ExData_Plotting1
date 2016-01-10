##Read the table
a<-read.table("household_power_consumption.txt",header = TRUE,sep=";",
              stringsAsFactors = FALSE,na.strings = "?")

##Convert Date field to data type date
a$Date<-as.Date(a$Date,format = "%d/%m/%Y") #format = 1/1/2000

##Keep only the relevant dates
b<-subset(a,Date >="2007-02-01"& Date<="2007-02-02")

##Create 'png' file
png("plot1.png", width = 480, height = 480)

##Create histogram
hist(b$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",
          main="Global Active Power")
dev.off()

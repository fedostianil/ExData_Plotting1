# plot3.R

# Read the dataset
data <- read.table("data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Subset for Feb 1–2, 2007
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Create datetime variable
datetime <- strptime(paste(data_sub$Date, data_sub$Time),
                     format = "%d/%m/%Y %H:%M:%S")

# Convert sub-metering variables to numeric
sm1 <- as.numeric(data_sub$Sub_metering_1)
sm2 <- as.numeric(data_sub$Sub_metering_2)
sm3 <- as.numeric(data_sub$Sub_metering_3)

# Create the plot
png("plot3.png", width = 480, height = 480)

plot(datetime, sm1,
     type = "l",
     ylab = "Energy sub met

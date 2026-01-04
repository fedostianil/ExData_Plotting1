# plot4.R

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

# Convert needed variables to numeric
gap  <- as.numeric(data_sub$Global_active_power)
grp  <- as.numeric(data_sub$Global_reactive_power)
volt <- as.numeric(data_sub$Voltage)

sm1 <- as.numeric(data_sub$Sub_metering_1)
sm2 <- as.numeric(data_sub$Sub_metering_2)
sm3 <- as.numeric(data_sub$Sub_metering_3)

# Create the 2x2 plot
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

# Plot 1
plot(datetime, gap,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Plot 2
plot(datetime, volt,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Plot 3
plot(datetime, sm1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(datetime, sm2, col = "red")
lines(datetime, sm3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Plot 4
plot(datetime, grp,
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")

dev.off()

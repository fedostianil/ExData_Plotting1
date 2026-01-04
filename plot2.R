# plot2.R

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

# Convert power to numeric
gap <- as.numeric(data_sub$Global_active_power)

# Create the plot
png("plot2.png", width = 480, height = 480)

plot(datetime, gap,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

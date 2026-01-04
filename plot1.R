# plot1.R

# Read the dataset
data <- read.table("data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Subset for Feb 1–2, 2007
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert to numeric
gap <- as.numeric(data_sub$Global_active_power)

# Create the plot
png("plot1.png", width = 480, height = 480)

hist(gap,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()

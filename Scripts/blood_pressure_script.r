# Loading data
blood_pressure_data <- read.csv("US_Blood_Pressure_Data.csv")
alcohol_data <- read.csv("US_Alcohol_Data.csv")

# Pulling systolic and diastolic blood pressure data into separate variables.
systolic_data <- blood_pressure_data$Mean.systolic.blood.pressure..mmHg.
diastolic_data <- blood_pressure_data$Mean.diastolic.blood.pressure..mmHg.

# Pulling alcohol total per capita consumption in liters into separate variable.
total_alcohol_data <- alcohol_data$Alcohol.total.per.capita..15...consumption.in.liters..numeric.

# Creating data frame to be able to create a graph out of our data.
graph_systolic_data <- data.frame(systolic_data, total_alcohol_data)

# Loading ggplot2 library.
library(ggplot2)

# Utilizing ggplot to create a scatter plot comparing systolic BP to alcohol consumption.
ggplot(graph_systolic_data, aes(systolic_data, total_alcohol_data)) +
	geom_point(size = 4, color = "purple") +
	geom_smooth(method = "lm", se = FALSE, color = "red") +
	labs(title = "Scatter Plot", systolic_data = "X Values", total_alcohol_data = "Y Values") +
	theme_classic(base_size = 16) +
	theme(plot.title = element_text(hjust = 0.5))

# Pearson correlation test between systolic BP and alcohol consumption.
cor.test(systolic_data, total_alcohol_data, method = c("pearson"))

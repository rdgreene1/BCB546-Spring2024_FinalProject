#ScatterPlot
library(ggplot2)

# A data frame 'df' with the data
df <- data.frame(
  Element = c("B", "Na", "Mg", "Al", "P", "S", "K", "Ca", "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "As", "Se", "Rb", "Mo", "Cd"),
  Line = as.numeric(c("2.2E-05", "1.3E-05", NA, "4.7E-05", "2.9E-12", "6.7E-17", "2.6E-13", "8.7E-14", "2.1E-27", NA, NA, "1.6E-10", "3.3E-23", "2.9E-23", NA, "1.9E-06", "2.7E-32", "1.9E-27", "1.6E-24")),
  Su = as.numeric(c(NA, NA, NA, NA, "3.9E-05", "1.3E-10", "1.2E-16", "2.3E-09", "8.6E-08", "1.2E-08", NA, NA, NA, NA, "4.4E-06", "5.8E-06", "5.4E-11", NA, NA))
)

# Plotting the scatter plot

ggplot(df, aes(x = Element)) +
  geom_point(aes(y = Line, colour = "Line"), size = 4, alpha = 0.4) +
  geom_point(aes(y = Su, colour = "Su"), size = 4, alpha = 0.4) +
  scale_colour_manual(values = c("Line" = "blue", "Su" = "red")) +
  labs(title = "Element Concentration Scatter Plot", x = "Element", y = "Concentration") +
  theme_minimal()


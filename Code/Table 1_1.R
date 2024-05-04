# Load necessary library
library(ggplot2)

# Data from Table 1 for the first three columns
data <- data.frame(
  Element = rep(c("Weight", "B", "Na", "Mg", "Al", "P", "S", "K", "Ca", "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "As", "Se", "Rb", "Sr", "Mo", "Cd"), each = 3),
  Variant = rep(c("Genotype", "Year", "GxY Interaction"), times = 21),
  p_value = c(1.3e-31, 2.6e-04, 1.2e-05, 3.3e-23, 6.6e-17, 2.5e-09, 1.5e-14, 9.4e-75, NA, 1.2e-62, NA, 5.3e-11, 4.2e-09, 2.2e-57, 4.2e-04,
              2.0e-49, 6.7e-69, 2.7e-07, 3.7e-40, 1.3e-07, 8.1e-13, 4.4e-27, NA, 3.8e-11, 2.6e-30, 7.2e-06, 8.5e-08, 2.0e-44, 1.8e-22, 8.7e-11,
              4.0e-51, NA, NA, 3.6e-22, NA, NA, 1.8e-24, 1.2e-21, 2.1e-04, 7.6e-71, 6.9e-12, 2.5e-06, 3.4e-61, 5.2e-23, 9.8e-08, 5.3e-30, NA, 4.2e-05,
              2.7e-08, 3.6e-04, NA, 2.6e-23, 1.4e-36, NA, 4.7e-21, 1.9e-31, 2.1e-04, 2.5e-29, NA, NA, 5.0e-63, 7.5e-05, NA)
)

# Replace NA with 1 (since -log10(1) is 0 and won't show up in the plot)
data$p_value[is.na(data$p_value)] <- 1

# Convert p-values to -log10 scale
data$log_p_value <- -log10(data$p_value)

# Create a factor for ordering the x-axis elements
data$Element <- factor(data$Element, levels = c("Weight", "B", "Na", "Mg", "Al", "P", "S", "K", "Ca", "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "As", "Se", "Rb", "Sr", "Mo", "Cd"))

# Plotting the data using ggplot2
ggplot(data, aes(x = Element, y = log_p_value, fill = Variant)) + 
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  labs(x = "Element", y = "-log10(p-value)", title = "Bar Chart of p-values for Genotype, Year, and GxY Interaction") +
  scale_fill_manual(values = c("Genotype" = "blue", "Year" = "red", "GxY Interaction" = "green")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        legend.title = element_text(size = 12), 
        legend.text = element_text(size = 10),
        plot.title = element_text(size = 16, face = "bold"),
        axis.title = element_text(size = 14)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) # Ensure no space at top and bottom of y-axis
library(ggplot2)

# Assuming 'data' is your DataFrame containing the necessary columns 'Element', 'p_value', and 'Variant'
ggplot(data, aes(x = Element, y = -log10(p_value), fill = Variant)) +
  geom_bar(stat = "identity", position = position_dodge(), width = 0.7) +  # Increase 'width' for wider bars
  scale_fill_manual(values = c("Genotype" = "blue", "Year" = "red", "GxY Interaction" = "green")) +
  labs(x = "Element", y = "-log10(p-value)", title = "Bar Chart of p-values for Genotype, Year, and GxY Interaction") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),  # Rotate and increase size of x-axis labels for clarity
    axis.title = element_text(size = 14),  # Larger axis titles
    plot.title = element_text(size = 16, face = "bold")  # Bold and larger plot title
  )


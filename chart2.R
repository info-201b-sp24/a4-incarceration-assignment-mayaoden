library(dplyr)
library(ggplot2)
library(scales)

us_prison_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

urbancity_prop_in_prison <- us_prison_data %>%
  filter(urbanicity != "") %>%
  filter(!is.na(total_prison_pop)) %>%
  group_by(urbanicity, year) %>%
  summarise(
    prison_pop = sum(as.integer(total_prison_pop)),
    total_pop = sum(total_pop),
    .groups = "drop"
  )

plot <- ggplot(urbancity_prop_in_prison, aes(x = total_pop, y = prison_pop, color = urbanicity)) +
  geom_point() +
  labs(x = "Total Population", y = "Population in Prison", title = "Population in Prison Per Total Population", color = "Urbanicity") +
  scale_x_continuous(labels = comma) +
  scale_y_continuous(labels = comma) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold")
  )

plot(plot)

library(usmap)
library(dplyr)
library(ggplot2)

us_prison_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

state_prop_in_prison <- us_prison_data %>%
  group_by(state) %>%
  summarise(
    prison_pop = sum(as.integer(total_prison_pop), na.rm = T),
    total_pop = sum(as.integer(total_pop), na.rm = T),
    .groups = "drop"
  ) %>%
  mutate(prop_in_prison = prison_pop / total_pop)

plot <- plot_usmap(data = state_prop_in_prison, values = "prop_in_prison", 
           labels = TRUE) +
  scale_fill_continuous(name = "Proportion in Prison", 
                        labels = scales::comma_format(accuracy = 0.001)) +
  labs(title = "Proportion of Population in Prison by State") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        legend.position = "right")

plot(plot)

library(dplyr)
library(ggplot2)

us_prison_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

urbancity_prop_in_prison <- us_prison_data %>%
  filter(urbanicity != "") %>%
  filter(!is.na(total_prison_pop)) %>%
  group_by(urbanicity, year) %>%
  summarise(
    prison_pop = sum(as.integer(total_prison_pop)),
    total_pop = sum(total_pop),
    .groups = "drop"
  ) %>%
  mutate(prop_in_prison = prison_pop / total_pop)

plot <- ggplot(urbancity_prop_in_prison, aes(x = year, y = prop_in_prison, color = urbanicity)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Proportion of Population in Prison", color = "Urbanicity") +
  ggtitle("Proportion of Population in Prison by Urbanicity over Years") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) 

plot(plot)

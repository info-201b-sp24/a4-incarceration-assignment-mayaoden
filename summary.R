library(dplyr)

us_prison_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

max_in_prison_prop <- us_prison_data %>%
  mutate(in_prison_prop = total_prison_pop / total_pop) %>%
  filter(in_prison_prop == max(in_prison_prop, na.rm = TRUE))

max_in_prison_prop_urban <- us_prison_data %>%
  filter(urbanicity == "urban") %>%
  mutate(in_prison_prop = total_prison_pop / total_pop) %>%
  filter(in_prison_prop == max(in_prison_prop, na.rm = TRUE))

max_in_prison_prop_rural <- us_prison_data %>%
  filter(urbanicity == "rural") %>%
  mutate(in_prison_prop = total_prison_pop / total_pop) %>%
  filter(in_prison_prop == max(in_prison_prop, na.rm = TRUE))

max_in_prison_prop_small_mid <- us_prison_data %>%
  filter(urbanicity == "small/mid") %>%
  mutate(in_prison_prop = total_prison_pop / total_pop) %>%
  filter(in_prison_prop == max(in_prison_prop, na.rm = TRUE))

max_in_prison_prop_suburban <- us_prison_data %>%
  filter(urbanicity == "suburban") %>%
  mutate(in_prison_prop = total_prison_pop / total_pop) %>%
  filter(in_prison_prop == max(in_prison_prop, na.rm = TRUE))

summary_stats <- us_prison_data %>%
  mutate(in_prison_prop = total_prison_pop / total_pop) %>%
  summarize(mean_in_prison_prop = mean(in_prison_prop, na.rm = TRUE),
            median_in_prison_prop = median(in_prison_prop, na.rm = TRUE))
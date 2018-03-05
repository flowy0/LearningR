#ggplot tutorial



#scatter plot with smoothing
ggplot(by_year, aes(year, percent_yes)) +
  geom_point() + geom_smooth()


  # Start with by_year_country dataset
by_year_country <- votes_processed %>%
  group_by(year, country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Print by_year_country
by_year_country

# Create a filtered version: UK_by_year
UK_by_year <- filter(by_year_country, country =="United Kingdom")

# Line plot of percent_yes over time for UK only
ggplot(UK_by_year, aes(year, percent_yes)) +geom_line()



# Vector of four countries to examine
countries <- c("United States", "United Kingdom",
               "France", "India")

# Filter by_year_country: filtered_4_countries
filtered_4_countries <- by_year_country %>% filter(country %in% countries)

# Line plot of % yes in four countries
ggplot(filtered_4_countries, aes(year,percent_yes, color=country)) + geom_line()

# Vector of six countries to examine
countries <- c("United States", "United Kingdom",
               "France", "Japan", "Brazil", "India")

# Filtered by_year_country: filtered_6_countries
filtered_6_countries <- by_year_country %>% filter(country %in% countries)

# Line plot of % yes over time faceted by country
ggplot(filtered_6_countries, aes(year,percent_yes, color=country)) +geom_line() + facet_wrap(~ country)

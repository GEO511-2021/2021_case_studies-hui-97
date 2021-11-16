## Wealth over time

# Load packages
library(ggplot2)
library(gapminder)
library(dplyr)

# Remove "Kuwait" from gapminder
gapminder <- gapminder %>%
  filter(!(country=="Kuwait"))


## First plot: Wealth vs. life expectancy in different years
# Plot
ggplot(gapminder, aes(lifeExp, gdpPercap, color=continent, size=pop/100000)) +
  geom_point() + theme_bw() + scale_y_continuous(trans = "sqrt") + facet_wrap(~year,nrow=1) +
  labs(size="Population (100k)", x="Life Expectancy", y="GDP per capita")
# Save the plot
ggsave("W_L1.png", width=15, height=4, units="in")


## Second plot:Change of wealth over time across different continents
# Calculate mean continental wealth using population as the weights
gapminder_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), pop = sum(as.numeric(pop)))
# Plot
ggplot(gapminder) + 
  geom_line(aes(year, gdpPercap, group=country, color=continent)) + geom_point(aes(year, gdpPercap, color=continent, size=pop/100000)) + 
  geom_line(data=gapminder_continent, aes(year, gdpPercapweighted), color="black") + geom_point(data=gapminder_continent, aes(year, gdpPercapweighted, size=pop/100000), color="black") + 
  facet_wrap(~continent,nrow=1) + theme_bw() +
  labs(size="Population (100k)", x="Year", y="GDP per capita")
# Save the plot
ggsave("W_L2.png", width=15, height=4, units="in")

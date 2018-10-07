library(dplyr)
library(ggplot2)
library(gapminder)

gapMinder2007 <- gapminder %>%
  filter(year > 1980) %>%
  arrange(desc(gdpPercap)) %>%
  mutate(gdp = gdpPercap * pop)


ggplot(gapMinder2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) + geom_point() + scale_x_log10() + facet_wrap(~ year)


gapMinder2007 %>%
  summarise(medianGdp = median(gdp))


lifeExpPeryear <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianLifeExp = median(lifeExp))


ggplot(lifeExpPeryear, aes(x = year, y = medianLifeExp)) + geom_line() + facet_wrap(~ continent) + expand_limits(y = 0)


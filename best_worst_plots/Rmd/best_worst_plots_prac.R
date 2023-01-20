library(gapminder)
library(tidyverse)
data(gapminder)
names(gapminder)

ggplot(data = gapminder,
       aes(x = gdpPercap/1000, y = lifeExp)) +
  # geom_path(aes(group = country, color = continent)) +
  geom_point(aes(color = continent, size = pop)) +
  scale_color_brewer(palette = 'Dark2') + scale_x_log10() +
  annotation_logticks(sides = 'b') + 
  # facet_wrap( ~ continent, scales = 'free', nrow = 1) +
  scale_size_area() +
  theme(legend.position = 'bottom',
        legend.box = 'vertical')

p <- ggplot(data = filter(gapminder, year == 2007), aes(x = gdpPercap/1000, y = lifeExp)) +
  geom_point(aes(group = country, size = pop*1e-6,
                 color = continent), alpha = 0.75) +
  scale_color_brewer(palette = "Dark2", name = "Continent") + scale_x_log10() +
  scale_size_area(name = "Population (millions)") +
  theme_bw() + theme(legend.position = "bottom", legend.box = "vertical") + xlab("GDP per capita, adjusted for inflation (1000 USD)") +
  ylab("Life expectancy at birth (years)") + theme(panel.grid.minor.x = element_blank()) + annotation_logticks(sides = "bt")

p

p_bad <- ggplot(data = gapminder,
                aes(x = year - min(year), y = gdpPercap*pop)) +
  geom_point(aes(fill = lifeExp, shape = continent, group = continent),
             position = position_dodge(width = 2.5)) + #facet_wrap(~country, scales = "free_y") +
  scale_y_log10() +
  scale_shape_manual(values = 21:25) +
  theme_dark() +
  theme(legend.position = "left") + scale_fill_gradientn(colours = rainbow(7), name = "Years") + ylab("GDP") +
  xlab("Time") +
  geom_smooth(aes(color = continent), se=FALSE)

p_bad

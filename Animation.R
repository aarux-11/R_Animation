#install.packages("gapminder")
#install.packages("gganimate")
#install.packages("gifski")
library(ggplot2)
library(gganimate)
library(gapminder)
library(devtools)
library(RCurl)
library(httr)

gapminder = data.frame(gapminder)
gapminder


#ggsave('plot_gdpPercap_lifeExp_static.png', width=8, height=8)

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  labs(title = 'Year: 1952-2007', x = 'GDP per capita', y = 'Life expectancy')


p1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life expectancy') +
  transition_time(gapminder['year']) +
  ease_aes('linear')

#set_config( config( ssl_verifypeer = 0L ) )
#devtools::install_github("dgrtwo/gganimate")

animate(p1)

#anim_save('plot_gdpPercap_lifeExp.gif')

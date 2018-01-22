library(ggplot2)
library(dplyr)

setwd("D:\\Polibuda\\TWD\\plakat")
visit <- read.csv("visit.csv") %>%
  mutate(Specjalizacja = factor(Specjalizacja, 
                                levels=Specjalizacja[!duplicated(Specjalizacja)]))
ggplot(visit, aes(x=czas, y=Specjalizacja, color=czy_dzieciecy)) +
  geom_point(size=3) +
  geom_segment(aes(yend=Specjalizacja, x=0, xend=czas)) +
  labs(title="Czas oczekiwania na wizytę u specjalisty",
       subtitle="w czerwcu i lipcu 2017 r.",
       caption="Źródło: Barometr Fundacji Watch Health Care nr 17/2/08/2017",
       y="",
       x="Czas w miesiącach") +
  scale_x_continuous(limits=c(0, 5.2), expand=c(0, 0))+
  scale_color_discrete(breaks=TRUE, labels="lekarz\ndziecięcy", name="") +
  theme_bw() +
  theme(legend.position=c(0.85, 0.18))

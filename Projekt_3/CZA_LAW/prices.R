library(ggplot2)
library(dplyr)

setwd("D:\\Polibuda\\TWD\\plakat")
prices <- read.csv("prices.csv") %>%
  filter(badanie != "Test na borelioze", badanie != "Koronografia")
ggplot(prices, aes(x=badanie, y=cena, fill=badanie)) +
  geom_boxplot() +
  labs(title="Ceny badań",
       caption="Źródło: tourmedica.pl",
       x="",
       y="Cena (PLN)") +
  scale_y_log10() +
  scale_x_discrete(
    labels=c("Artroskopia\nstawu biodrowego", "ECHO serca",
             "EKG - metoda Holtera", "Gastroskopia",
             "Rezonans\nmagnetyczny kręgosłupa",
             "USG jamy brzusznej", "USG nerek"))+
  scale_color_brewer(type="qual", palette=6)+
  theme_bw() +
  theme(legend.position="none")

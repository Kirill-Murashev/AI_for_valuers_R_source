# подключаем библиотеки
library(tidyverse)
library(rvest)

source <- read_html("https://www.bn.ru/kvartiry-vtorichka-vasileostrovskij-rayon/") 

source %>%
  html_nodes()

             
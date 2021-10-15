library(tidyverse)

# Установить рабочую директорию
setwd("/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/R-source/AI_for_valuers_R_source/Hist/")
# Прочитать данные, первая строка --- заголовок, разделитель колонок --- запятая, десятичный разделитель --- точка
# x --- positional аргумент
# header, sep, dec --- named
almatyFlats <- read.csv('/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/datasets/Almaty/almaty-apts-2019-1.csv', header = TRUE, sep = ",", dec = ".")
almatyFlats$price <- as.numeric(almatyFlats$price)
almatyFlats$price.m <- as.numeric(almatyFlats$price.m)
as_tibble(almatyFlats)
hist(almatyFlats$price.m)

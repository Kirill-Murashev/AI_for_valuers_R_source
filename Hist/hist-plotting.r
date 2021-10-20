library(tidyverse)
library(moments)

# установить рабочую директорию
setwd("/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/R-source/AI_for_valuers_R_source/Hist/")
# прочитать данные, первая строка --- заголовок, разделитель колонок --- запятая, десятичный разделитель --- точка
# x --- positional аргумент
# header, sep, dec --- named
almatyFlats <- read.csv('/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/datasets/Almaty/almaty-apts-2019-1.csv', header = TRUE, sep = ",", dec = ".")

# изменить тип объекта на более удобный и современный
as_tibble(almatyFlats)

# создать функцию для "нулевой" версии формулы Стёрджесса
kHistSturgess0 <- function(x, na.omit = FALSE){ # создать фунццию, игнорировать пропущенные значения
  n   <- NROW(x)                                # вычислить число n
  ks0 = (max(x)-min(x))/(1+log2(n))             # рассчитать k
  return(ks0)                                   # возвратить k
}                                               # конец функции

# создать функцию для первой версии формулы Стёрджесса
kHistSturgess1 <- function(x, na.omit = FALSE){ # создать фунццию, игнорировать пропущенные значения
  n   <- NROW(x)                                # вычислить число n
  ks1 = (1+log2(n))                             # рассчитать k
  return(ks1)                                   # возвратить k  
}                                               # конец функции               

# создать функцию для второй версии формулы Стёрджесса
kHistSturgess2 <- function(x, na.omit = FALSE){ # создать фунццию, игнорировать пропущенные значения
  n   <- NROW(x)                                # вычислить число n
  ks2 = (1+(3.3*log10(n)))                      # рассчитать k
  return(ks2)                                   # возвратить k  
}                                               # конец функции

# создать функцию для формулы Брукса и Каррузера
kHistBruksKarruzer <- function(x, na.omit = FALSE){ # создать фунццию, игнорировать пропущенные значения
  n   <- NROW(x)                                    # вычислить число n
  kbk = 5*log10(n)                                  # рассчитать k
  return(kbk)                                       # возвратить k  
}                                                   # конец функции

# создать функцию для формулы Хайнхольда и Гаеде
kHistHeinholdGaede <- function(x, na.omit = FALSE){ # создать фунццию, игнорировать пропущенные значения
  n   <- NROW(x)                                    # вычислить число n
  khg = sqrt(n)                                     # рассчитать k
  return(khg)                                       # возвратить k  
}                                                   # конец функции

# создать функцию для формулы Манна и Вальда
kHistMannWald <- function(x, na.omit = FALSE){ # создать фунццию, игнорировать пропущенные значения
  n   <- NROW(x)                               # вычислить число n
  kmw = 4*sqrt()                                # рассчитать k
  return(kmw)                                  # возвратить k  
}                                              # конец функции
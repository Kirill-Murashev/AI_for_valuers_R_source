library(tidyverse)
library(moments)
library(xtable)
options("scipen"=999, "digits"=3)
# установить рабочую директорию
setwd("/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/R-source/AI_for_valuers_R_source/Hist/")
# прочитать данные, первая строка --- заголовок, разделитель колонок --- запятая, десятичный разделитель --- точка
# x --- positional аргумент
# header, sep, dec --- named
almatyFlats <- read.csv('/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/datasets/Almaty/almaty-apts-2019-1.csv', header = TRUE, sep = ",", dec = ".")

spbaFlats <- read.csv('/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/datasets/Saint-Petersburg/flats/spba_flats_210928.csv', header = TRUE, sep = ",", dec = ".")

# изменить тип объекта на более удобный и современный
as_tibble(almatyFlats)

# создать функцию для "нулевой" версии формулы Стёрджесса
kHistSturgess0 <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                # вычислить число n
  ks0 = (max(x)-min(x))/(1+log2(n))             # рассчитать k
  return(c(ks0))                                # возвратить k
}                                               # конец функции

# создать функцию для первой версии формулы Стёрджесса
kHistSturgess1 <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                # вычислить число n
  ks1 = (1+log2(n))                             # рассчитать k
  return(ks1)                                   # возвратить k  
}                                               # конец функции               

# создать функцию для второй версии формулы Стёрджесса
kHistSturgess2 <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                # вычислить число n
  ks2 = (1+(3.3*log10(n)))                      # рассчитать k
  return(ks2)                                   # возвратить k  
}                                               # конец функции

# создать функцию для формулы Брукса и Каррузера
kHistBruksKarruzer <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                    # вычислить число n
  kbk = 5*log10(n)                                  # рассчитать k
  return(kbk)                                       # возвратить k  
}                                                   # конец функции

# создать функцию для формулы Хайнхольда и Гаеде
kHistHeinholdGaede <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                    # вычислить число n
  khg = sqrt(n)                                     # рассчитать k
  return(khg)                                       # возвратить k  
}                                                   # конец функции

# создать функцию для формулы Манна и Вальда
kHistMannWald <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                               # вычислить число n
  kmw = (4*(2^(1/5)))*((n/qnorm(0.95))^0.4)    # рассчитать k
  return(kmw)                                  # возвратить k  
}                                              # конец функции

# создать функцию для формулы Уильямса
kHistWilliams <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                               # вычислить число n
  kwi = (2*(2^(1/5)))*((n/qnorm(0.95))^0.4)    # рассчитать k
  return(kwi)                                  # возвратить k  
}                                              # конец функции

# создать функцию для первой формулы Хана и Шапиро
kHistHahnShapiro <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                  # вычислить число n
  khs = 4*(0.75*((n-1)^2)^0.2)                    # рассчитать k
  return(khs)                                     # возвратить k  
}                                                 # конец функции

# создать функцию для второй формулы Хана и Шапиро
kHistShapiroHahn <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                  # вычислить число n
  ksh = 1.9*(n^0.4)                               # рассчитать k
  return(ksh)                                     # возвратить k  
}                                                 # конец функции

# создать функцию для формулы Кендалла и Стюарта
kHistKendallStuart <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                    # вычислить число n
  b = 2                                             # задать b: 2 <= b <= 4 
  t1 = qnorm(0.95)                                  # задать t1
  t2 = 0                                            # задать t2
  kks = b*(sqrt(2)*(((n-1)/(t1+t2))^0.4))           # рассчитать k
  return(kks)                                       # возвратить k
}                                                   # конец функции

# создать функцию для формулы Таушанова
kHistTaushanow <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                # вычислить число n
  kta = 4*log10(n)                              # рассчитать k
  return(kta)                                   # возвратить k  
}                                               # конец функции

# создать функцию для формулы Тоневой
kHistTonewa <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                             # вычислить число n
  kto = 5*log10(n)-5                         # рассчитать k
  return(kto)                                # возвратить k  
}                                            # конец функции

# создать функцию для формулы Алексеевой
kHistAlekseewa <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                # вычислить число n
  kurt = kurtosis(x)                            # вычислить коэффициент эксцесса
  counterkurt = 1/(sqrt(kurt))                  # вычислить коэффициент контрэксцесса
  kal = (4/counterkurt)*(log10(n/10))           # рассчитать k
  return(kal)                                   # возвратить k  
}                                               # конец функции

# создать функцию для первой формулы Новицкого
kHistNowiczkij1 <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                 # вычислить число n
  kurt = kurtosis(x)                             # вычислить коэффициент эксцесса
  kn1 = ((kurt+1.5)/6)*(n^0.4)                   # рассчитать k
  return(kn1)                                    # возвратить k  
}                                                # конец функции

# создать функцию для второй формулы Новицкого
kHistNowiczkij2 <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                 # вычислить число n
  kurt = kurtosis(x)                             # вычислить коэффициент эксцесса
  kn2 = (((kurt^4)*(n^2))^(1/5))*(1/3)           # рассчитать k
  return(kn2)                                    # возвратить k  
}                                                # конец функции

# создать функцию для третьей формулы Новицкого
kHistNowiczkij3_min <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                     # вычислить число n
  kurt = kurtosis(x)                                 # вычислить коэффициент эксцесса
  kn3min = 0.55*(n^0.4)                              # рассчитать k min
  return(kn3min)                                     # возвратить k min 
}                                                    # конец функции

# создать функцию для третьей формулы Новицкого
kHistNowiczkij3_max <- function(x, na.omit = FALSE){ # создать функцию, игнорировать пропущенные значения
  n   <- NROW(x)                                     # вычислить число n
  kurt = kurtosis(x)                                 # вычислить коэффициент эксцесса
  kn3max = 1.25*(n^0.4)                              # рассчитать k max
  return(kn3max)                                     # возвратить k max
}                                                    # конец функции

optimalK <- function(x, na.omit = FALSE){ # создать функцию для обобщения результата
  ks0 <- kHistSturgess0(x)
  ks1 <- kHistSturgess1(x)
  ks2 <- kHistSturgess2(x)
  kbk <- kHistBruksKarruzer(x)
  khg <- kHistHeinholdGaede(x)
  kmw <- kHistMannWald(x)
  kwi <- kHistWilliams(x)
  khs <- kHistHahnShapiro(x) 
  ksh <- kHistShapiroHahn(x)
  kks <- kHistKendallStuart(x)
  kta <- kHistTaushanow(x)
  kto <- kHistTonewa(x)
  kal <- kHistAlekseewa(x)
  kn1 <- kHistNowiczkij1(x)
  kn2 <- kHistNowiczkij2(x)
  kn3_min <- kHistNowiczkij3_min(x)
  kn3_max <- kHistNowiczkij3_max(x)
  optimal_k <- return(c(ks0, ks1, ks2, kbk, khg, kmw, kwi, khs, ksh, kks, kta, kto, kal, kn1, kn2, kn3_min, kn3_max))
  return(k)
}

kOptimalAlmaty <- optimalK(almatyFlats$price.m)  
function_name<- c("Sturgess0", "Sturgess1", "Sturgess2", "BruksKarruzer", "HeinholdGaede", "MannWald", "Williams", "HahnShapiro", "ShapiroHahn", "KendallStuart", "Taushanow", "Tonewa", "Alekseewa", "Nowiczkij1", "Nowiczkij2", "Nowiczkij3_min", "Nowiczkij3_max")
kOptimalAlmaty <- tibble(function_name, kOptimalAlmaty)

xtable(kOptimalAlmaty,caption = "оптимальное число k, полученное различными методами", auto = TRUE)

hist(almatyFlats$price.m, breaks = 12, freq = FALSE, xlab = "Цена предложения, казахстанские рубли", ylab = "Плотность вероятности", main = "Гистограмма удельных цен предложений на квартиры, выставленные на вторичном рынке города Алматы (лето 2019)")

kOptimalSpba <- optimalK(spbaFlats$price_m)  
function_name<- c("Sturgess0", "Sturgess1", "Sturgess2", "BruksKarruzer", "HeinholdGaede", "MannWald", "Williams", "HahnShapiro", "ShapiroHahn", "KendallStuart", "Taushanow", "Tonewa", "Alekseewa", "Nowiczkij1", "Nowiczkij2", "Nowiczkij3_min", "Nowiczkij3_max")

kOptimalSpba <- tibble(function_name, kOptimalSpba)

xtable(kOptimalSpba,caption = "оптимальное число k, полученное различными методами", auto = TRUE)

hist(spbaFlats$price_m, breaks = 98, freq = FALSE, xlab = "Цена предложения, российские рубли", ylab = "Плотность вероятности", main = "Гистограмма удельных цен предложений на квартиры, выставленные на вторичном рынке Санкт-Петербургской городской агломерации (2021-09-28)")  

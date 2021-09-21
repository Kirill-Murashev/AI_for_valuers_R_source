# подключаем библиотеки
library(tidyverse)
library(rvest)
library(xml2)
library(httr)
library(purrr)
library(stringr)

# имитируем поведение человека на сайте
#to_get <- seq(0, 150, 10)
#pb <- progress_estimated(length(to_get))
GET("http://httpbin.org/user-agent", user_agent("httr"))

## Собрать ссылки на объявления о продаже квартир в МО "Адмиралтейский" (id "sadadm")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district[0]=747&engine_version=2&object_type[0]=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district[0]=747&engine_version=2&object_type[0]=1&offer_type=flat&p=", 1:5), function(linkCollect){
  source <- read_html(linkCollect)  
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
    html_text() ->
    titles
  
  tibble(links)
}) ->
  sadadm

# Собрать адреса

map_chr(sadadm$links, function(adresses){
  s1 <- read_html(adresses)
  s1 %>%
    html_nodes("div.a10a3f92e9--geo--18qoo address.a10a3f92e9--address--140Ec")%>%
    html_text() ->
    adress
}) ->
  sadadm_adres

sadadm$address <- tibble(sadadm_adres)

# Собрать цены

map_chr(sadadm$links, function(price){
  s1 <- read_html(price)
  s1 %>%
    html_nodes("span.a10a3f92e9--price_value--1iPpd")%>%
    html_text() ->
    price
}) ->
  sadadm_price

sadadm_price = trimws(sadadm_price)
sadadm_price <- gsub('₽', '', sadadm_price)
sadadm_price <- gsub('\\s+', '', sadadm_price)

sadadm$price <- tibble(sadadm_price)
sadadm$price = trimws(sadadm$price)

# Собрать цены за кв. м

map_chr(sadadm$links, function(pricePerM){
  s1 <- read_html(pricePerM)
  s1 %>%
    html_nodes("div.a10a3f92e9--price_per_meter--hKPtN.a10a3f92e9--price_per_meter--residential--1mFDW")%>%
    html_text() ->
    price_per_m
}) ->
  sadadm_price_per_m

sadadm_price_per_m <- gsub('₽/м²', '', sadadm_price_per_m)
sadadm_price_per_m = gsub('\\s+', '', sadadm_price_per_m)
as.numeric(sadadm_price_per_m)

sadadm$price_m <- tibble(sadadm_price_per_m)





sadadm_price <- gsub(' ', '', sadadm_price)
str_replace_all(sadadm_price, fixed("\" "), "")
str_replace_all(sadadm_price, space(), "")


### 

map(was_links_unique$links, function(subway){
  s1 <- read_html(subway)
  s1 %>%
    html_nodes("li.a10a3f92e9--underground--kONgx a.a10a3f92e9--underground_link--AzxRC")%>%
    html_text() ->
    closest_subway
}) -> closest_subway_was

cian_spb_vas$clos_subway <- closest_subway_all

###
lapply(cian_spb_vas$links, function(subwayTime){
  print(links)
  s1 <- read_html(subwayTime)
  s1 %>%
    html_nodes("li.a10a3f92e9--underground--kONgx span.a10a3f92e9--underground_time--1fKft")%>%
    html_text() ->
    subway_time
}) -> subway_time_all


s1 %>%
  html_nodes("span.a10a3f92e9--price_value--1iPpd span")%>%
  html_text() ->
  price
s1 %>%
  html_nodes("div.a10a3f92e9--popup-container--3mFh7.a10a3f92e9--popup-container--left--1yse5")%>%
  html_text() ->
  price_history
s1 %>%
  html_nodes("div.a10a3f92e9--price_per_meter--hKPtN.a10a3f92e9--price_per_meter--residential--1mFDW")%>%
  html_text() ->
  price_per_m
s1 %>%
  html_nodes("div.a10a3f92e9--info--3XiXi div.a10a3f92e9--info-value--18c8R")%>%
  html_text() ->
  characteristics1
square_tot <- (characteristics1[1])
square_liv <- (characteristics1[2])
square_kit <- (characteristics1[3])
floor      <- (characteristics1[4])
year       <- (characteristics1[5])
s1 %>%
  html_nodes("span.a10a3f92e9--value--3Ftu5")%>%
  html_text() ->
  characteristics2
offer_type <- (characteristics2[1])
planning   <- (characteristics2[2])
rooms_sq   <- (characteristics2[3])
height     <- (characteristics2[4])
bathroom   <- (characteristics2[5])
condition  <- (characteristics2[6])
view       <- (characteristics2[7])
s1 %>%
  html_nodes("div.a10a3f92e9--value--38caj")%>%
  html_text() ->
  characteristics3
walls      <- (characteristics3[2])
slabs      <- (characteristics3[3])
entrances  <- (characteristics3[4])
elevator   <- (characteristics3[5])
heating    <- (characteristics3[6])
critical   <- (characteristics3[7])
gas supply <- (characteristics3[8])
}) -> flats_vasileostrovskij 



## Собрать ссылки на объявления о продаже 2к квартир на В. О.

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:12, "&region=2&room2=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:12, "&region=2&room2=1"), function(linkCollect){
  source <- read_html(linkCollect)  
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
    html_text() ->
    titles
  
  tibble(links)
}) ->
  was2_links

## Собрать ссылки на объявления о продаже 3к квартир на В. О.

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:12, "&region=2&room3=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:12, "&region=2&room3=1"), function(linkCollect){
  source <- read_html(linkCollect)  
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
    html_text() ->
    titles
  
  tibble(links)
}) ->
  was3_links

## Собрать ссылки на объявления о продаже 4к квартир на В. О.

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&region=2&room4=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&region=2&room4=1"), function(linkCollect){
  source <- read_html(linkCollect)  
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
    html_text() ->
    titles
  
  tibble(links)
}) ->
  was4_links

## Собрать ссылки на объявления о продаже 5к квартир на В. О.

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&region=2&room5=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&region=2&room5=1"), function(linkCollect){
  source <- read_html(linkCollect)  
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
    html_text() ->
    titles
  
  tibble(links)
}) ->
  was5_links

## Собрать ссылки на объявления о продаже 6к квартир на В. О.

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&region=2&room6=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&region=2&room6=1"), function(linkCollect){
  source <- read_html(linkCollect)  
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
    html_text() ->
    titles
  
  tibble(links)
}) ->
  was6_links

## Собрать ссылки на объявления о продаже квартир-студий на В. О.

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&region=2&room9=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&region=2&room9=1"), function(linkCollect){
  source <- read_html(linkCollect)  
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
    html_text() ->
    titles
  
  tibble(links)
}) ->
  was9_links

## Собрать ссылки на объявления о продаже квартир, имеющих свободную планировку, на В. О.

map_dfr(str_c("https://spb.cian.ru/kupit-kvartiru-svobodnoy-planirovki-vtorichka-sankt-peterburg-vasileostrovskiy-04149/"), function(linkCollect){
  source <- read_html(linkCollect)  
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
    html_text() ->
    titles
  
  tibble(links)
}) ->
  was0_links

# Дополнительно очистить данные
  was8_links <- was0_links[1:4, 1]
  rm(was0_links)
  
  # Объединить датафреймы
  was_links <- bind_rows(was1_links,
        was2_links,
        was3_links,
        was4_links,
        was5_links,
        was6_links,
        was8_links,
        was9_links)
  
  ## Убрать дублирующиеся строки
  was_links %>% distinct() -> was_links_unique
  
  
  
map_chr(was_links_unique$links, function(adresses){
    s1 <- read_html(adresses)
    s1 %>%
    html_nodes("div.a10a3f92e9--geo--18qoo address.a10a3f92e9--address--140Ec")%>%
    html_text() ->
    adress
}) ->
  adresses_was

cian_spb_was <- tibble(adresses_was)

### 

map(was_links_unique$links, function(subway){
  s1 <- read_html(subway)
  s1 %>%
    html_nodes("li.a10a3f92e9--underground--kONgx a.a10a3f92e9--underground_link--AzxRC")%>%
    html_text() ->
    closest_subway
}) -> closest_subway_was

cian_spb_vas$clos_subway <- closest_subway_all

###
lapply(cian_spb_vas$links, function(subwayTime){
  print(links)
  s1 <- read_html(subwayTime)
s1 %>%
  html_nodes("li.a10a3f92e9--underground--kONgx span.a10a3f92e9--underground_time--1fKft")%>%
  html_text() ->
  subway_time
}) -> subway_time_all


s1 %>%
  html_nodes("span.a10a3f92e9--price_value--1iPpd span")%>%
  html_text() ->
  price
s1 %>%
  html_nodes("div.a10a3f92e9--popup-container--3mFh7.a10a3f92e9--popup-container--left--1yse5")%>%
  html_text() ->
  price_history
s1 %>%
  html_nodes("div.a10a3f92e9--price_per_meter--hKPtN.a10a3f92e9--price_per_meter--residential--1mFDW")%>%
  html_text() ->
  price_per_m
s1 %>%
  html_nodes("div.a10a3f92e9--info--3XiXi div.a10a3f92e9--info-value--18c8R")%>%
  html_text() ->
  characteristics1
    square_tot <- (characteristics1[1])
    square_liv <- (characteristics1[2])
    square_kit <- (characteristics1[3])
    floor      <- (characteristics1[4])
    year       <- (characteristics1[5])
s1 %>%
  html_nodes("span.a10a3f92e9--value--3Ftu5")%>%
  html_text() ->
  characteristics2
    offer_type <- (characteristics2[1])
    planning   <- (characteristics2[2])
    rooms_sq   <- (characteristics2[3])
    height     <- (characteristics2[4])
    bathroom   <- (characteristics2[5])
    condition  <- (characteristics2[6])
    view       <- (characteristics2[7])
s1 %>%
  html_nodes("div.a10a3f92e9--value--38caj")%>%
  html_text() ->
  characteristics3
    walls      <- (characteristics3[2])
    slabs      <- (characteristics3[3])
    entrances  <- (characteristics3[4])
    elevator   <- (characteristics3[5])
    heating    <- (characteristics3[6])
    critical   <- (characteristics3[7])
    gas supply <- (characteristics3[8])
   }) -> flats_vasileostrovskij  
  
  
  
2e9--price_value--1iPpd span")%>%
  html_text() ->
  price
s1 %>%
  html_nodes("div.a10a3f92e9--popup-container--3mFh7.a10a3f92e9--popup-container--left--1yse5")%>%
  html_text() ->
  price_history
s1 %>%
  html_nodes("div.a10a3f92e9--price_per_meter--hKPtN.a10a3f92e9--price_per_meter--residential--1mFDW")%>%
  html_text() ->
  price_per_m
s1 %>%
  html_nodes("div.a10a3f92e9--info--3XiXi div.a10a3f92e9--info-value--18c8R")%>%
  html_text() ->
  characteristics1
    square_tot <- (characteristics1[1])
    square_liv <- (characteristics1[2])
    square_kit <- (characteristics1[3])
    floor      <- (characteristics1[4])
    year       <- (characteristics1[5])
s1 %>%
  html_nodes("span.a10a3f92e9--value--3Ftu5")%>%
  html_text() ->
  characteristics2
    offer_type <- (characteristics2[1])
    planning   <- (characteristics2[2])
    rooms_sq   <- (characteristics2[3])
    height     <- (characteristics2[4])
    bathroom   <- (characteristics2[5])
    condition  <- (characteristics2[6])
    view       <- (characteristics2[7])
s1 %>%
  html_nodes("div.a10a3f92e9--value--38caj")%>%
  html_text() ->
  characteristics3
    walls      <- (characteristics3[2])
    slabs      <- (characteristics3[3])
    entrances  <- (characteristics3[4])
    elevator   <- (characteristics3[5])
    heating    <- (characteristics3[6])
    critical   <- (characteristics3[7])
    gas supply <- (characteristics3[8])
   }) -> flats_vasileostrovskij  
  
  
  

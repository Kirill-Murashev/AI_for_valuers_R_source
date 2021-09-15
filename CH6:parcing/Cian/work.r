# подключаем библиотеки
library(tidyverse)
library(rvest)
library(xml2)
library(httr)
library(purrr)

# имитируем поведение человека на сайте
to_get <- seq(0, 150, 10)
pb <- progress_estimated(length(to_get))
GET("http://httpbin.org/user-agent", user_agent("httr"))

source <- read_html("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=149&engine_version=2&object_type%5B0%5D=1&offer_type=flat&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room9=1") 

source %>%
  html_nodes("a._93444fe79c--link--39cNw") %>%
  html_attr("href") ->
  links

source %>%
  html_nodes("span._93444fe79c--color_primary_100--O6-gZ._93444fe79c--lineHeight_28px--3QLml._93444fe79c--fontWeight_bold--t3Ars._93444fe79c--fontSize_22px--3UVPd._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER span") %>%
  html_text() ->
  titles

  tibble(titles = titles,
         links = links) ->
    cian_spb_vas
  
map_chr(cian_spb_vas$links, function(adresses){
    s1 <- read_html(adresses)
    s1 %>%
    html_nodes("div.a10a3f92e9--geo--18qoo address.a10a3f92e9--address--140Ec")%>%
    html_text() ->
    adress
}) ->
  adresses_all

cian_spb_vas$adress <- adresses_all

### 

map_chr(cian_spb_vas$links[1:28], function(subway){
  s1 <- read_html(subway)
  s1 %>%
    html_nodes("li.a10a3f92e9--underground--kONgx a.a10a3f92e9--underground_link--AzxRC")%>%
    html_text() ->
    closest_subway
}) -> as.vector(closest_subway_all)

###
map_chr(cian_spb_vas$links[1:4], function(subwayTime){
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
  
  
  

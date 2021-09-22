#Copyright [2021] [Kirill A. Murashev]

#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at

#http://www.apache.org/licenses/LICENSE-2.0

#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

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

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=747&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=747&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
  }) ->
  sadadm

sadadm <- data.frame(sadadm)
county <- rep('sadadm', nrow(sadadm))
county <- as.factor(county)
sadadm <- cbind(sadadm, county)
sadadm %>% distinct() -> sadadm
 
## Собрать ссылки на объявления о продаже квартир в МО "Екатерингофский" (id "sadeka")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district[0]=741&engine_version=2&object_type[0]=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district[0]=741&engine_version=2&object_type[0]=1&offer_type=flat&p=", 1:5), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  sadeka
sadeka <- data.frame(sadeka)
county <- rep('sadeka', nrow(sadeka))
county <- as.factor(county)
sadeka <- cbind(sadeka, county)
sadeka %>% distinct() -> sadeka

## Собрать ссылки на объявления о продаже квартир в МО "Измайловское" (id "sadizm")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=751&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:14)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=751&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:14), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  sadizm
sadizm <- data.frame(sadizm)
county <- rep('sadizm', nrow(sadizm))
county <- as.factor(county)
sadizm <- cbind(sadizm, county)
sadizm %>% distinct() -> sadizm

## Собрать ссылки на объявления о продаже квартир в МО "Коломна" (id "sadkol")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=743&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=743&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  sadkol
sadkol <- data.frame(sadkol)
county <- rep('sadkol', nrow(sadkol))
county <- as.factor(county)
sadkol <- cbind(sadkol, county)
sadkol %>% distinct() -> sadkol

## Собрать ссылки на объявления о продаже квартир в МО "Семёновский" (id "sadsem")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=759&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=759&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  sadsem
sadsem <- data.frame(sadsem)
county <- rep('sadsem', nrow(sadsem))
county <- as.factor(county)
sadsem <- cbind(sadsem, county)
sadsem %>% distinct() -> sadsem

## Собрать ссылки на объявления о продаже квартир в МО "Сенной" (id "sadsen")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=754&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=754&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  sadsen
sadsen <- data.frame(sadsen)
county <- rep('sadsen', nrow(sadsen))
county <- as.factor(county)
sadsen <- cbind(sadsen, county)
sadsen %>% distinct() -> sadsen

## Собрать ссылки на объявления о продаже квартир в МО "№ 7" (id "swan07")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=740&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:9)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=740&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:9), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swan07

swan07 <- data.frame(swan07)
county <- rep('swan07', nrow(swan07))
county <- as.factor(county)
swan07 <- cbind(swan07, county)
swan07 %>% distinct() -> swan07

## Собрать ссылки на объявления о продаже квартир в МО "Васильевский" (id "swawas")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=712&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=712&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swawas

swawas <- data.frame(swawas)
county <- rep('swawas', nrow(swawas))
county <- as.factor(county)
swawas <- cbind(swawas, county)
swawas %>% distinct() -> swawas

## Собрать ссылки на объявления о продаже квартир в МО "Гавань" (id "swagaw")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=728&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=728&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swagaw

swagaw <- data.frame(swagaw)
county <- rep('swagaw', nrow(swagaw))
county <- as.factor(county)
swagaw <- cbind(swagaw, county)
swagaw %>% distinct() -> swagaw

## Собрать ссылки на объявления о продаже квартир в МО "Морской" (id "swamor")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=718&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=718&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13), function(linkCollect){
  source <- read_html(linkCollect) 
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swamor

swamor <- data.frame(swamor)
county <- rep('swamor', nrow(swamor))
county <- as.factor(county)
swamor <- cbind(swamor, county)
swamor %>% distinct() -> swamor

## Собрать ссылки на объявления о продаже квартир в МО "Остров Декабристов" (id "swaost")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=721&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:14)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=721&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:14), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swaost

swaost <- data.frame(swaost)
county <- rep('swaost', nrow(swaost))
county <- as.factor(county)
swaost <- cbind(swaost, county)
swaost %>% distinct() -> swaost

## Собрать ссылки на объявления о продаже квартир в МО "Округ № 15" (id "swyn15")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=771&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:12)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=771&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:12), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swyn15

swyn15 <- data.frame(swyn15)
county <- rep('swyn15', nrow(swyn15))
county <- as.factor(county)
swyn15 <- cbind(swyn15, county)
swyn15 %>% distinct() -> swyn15

## Собрать ссылки на объявления о продаже квартир в МО "Парнас" (id "swypar")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=700&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:21)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=700&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:21), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swypar

swypar <- data.frame(swypar)
county <- rep('swypar', nrow(swypar))
county <- as.factor(county)
swypar <- cbind(swypar, county)
swypar %>% distinct() -> swypar

## Собрать ссылки на объявления о продаже квартир в МО "Сампсониевское" (id "swysam")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=763&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=763&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swysam

swysam <- data.frame(swysam)
county <- rep('swysam', nrow(swysam))
county <- as.factor(county)
swysam <- cbind(swysam, county)
swysam %>% distinct() -> swysam

## Собрать ссылки на объявления о продаже квартир в МО "Светлановское" (id "swyswe")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=756&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:17)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=756&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:17), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swyswe

swyswe <- data.frame(swyswe)
county <- rep('swyswe', nrow(swyswe))
county <- as.factor(county)
swyswe <- cbind(swyswe, county)
swyswe %>% distinct() -> swyswe

## Собрать ссылки на объявления о продаже квартир в МО "Сосновское" (id "swysos")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=760&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=760&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swysos

swysos <- data.frame(swysos)
county <- rep('swysos', nrow(swysos))
county <- as.factor(county)
swysos <- cbind(swysos, county)
swysos %>% distinct() -> swysos

## Собрать ссылки на объявления о продаже квартир в МО "Шувалово-Озерки" (id "swyshu")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=744&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:16)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=744&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:16), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swyshu

swyshu <- data.frame(swyshu)
county <- rep('swyshu', nrow(swyshu))
county <- as.factor(county)
swyshu <- cbind(swyshu, county)
swyshu %>% distinct() -> swyshu

## Собрать ссылки на объявления о продаже квартир в МО "Левашово" (id "swylew")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=717&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=717&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  swylew

swylew <- data.frame(swylew)
county <- rep('swylew', nrow(swylew))
county <- as.factor(county)
swylew <- cbind(swylew, county)
swylew %>% distinct() -> swylew

## Собрать ссылки на объявления о продаже квартир в МО "Парголово" (id "svypar")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=723&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:31)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=723&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:31), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  svypar

svypar <- data.frame(svypar)
county <- rep('svypar', nrow(svypar))
county <- as.factor(county)
svypar <- cbind(svypar, county)
svypar %>% distinct() -> svypar

## Собрать ссылки на объявления о продаже квартир в МО "Округ № 21" (id "skan21")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=779&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=779&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skan21

skan21 <- data.frame(skan21)
county <- rep('skan21', nrow(skan21))
county <- as.factor(county)
skan21 <- cbind(skan21, county)
skan21 %>% distinct() -> skan21

## Собрать ссылки на объявления о продаже квартир в МО "Академическое" (id "skaaka")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=773&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:9)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=773&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:9), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skaaka

skaaka <- data.frame(skaaka)
county <- rep('skaaka', nrow(skaaka))
county <- as.factor(county)
skaaka <- cbind(skaaka, county)
skaaka %>% distinct() -> skaaka

## Собрать ссылки на объявления о продаже квартир в МО "Гражданка" (id "skagra")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=772&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=772&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skagra

skagra <- data.frame(skagra)
county <- rep('skagra', nrow(skagra))
county <- as.factor(county)
skagra <- cbind(skagra, county)
skagra %>% distinct() -> skagra

## Собрать ссылки на объявления о продаже квартир в МО "Пискарёвка" (id "skapis")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=770&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=770&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skapis

skapis <- data.frame(skapis)
county <- rep('skapis', nrow(skapis))
county <- as.factor(county)
skapis <- cbind(skapis, county)
skapis %>% distinct() -> skapis

## Собрать ссылки на объявления о продаже квартир в МО "Прометей" (id "skapro")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=768&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=768&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skapro

skapro <- data.frame(skapro)
county <- rep('skapro', nrow(skapro))
county <- as.factor(county)
skapro <- cbind(skapro, county)
skapro %>% distinct() -> skapro

## Собрать ссылки на объявления о продаже квартир в МО "Северный" (id "skasew")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=774&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=774&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skasew

skasew <- data.frame(skasew)
county <- rep('skasew', nrow(skasew))
county <- as.factor(county)
skasew <- cbind(skasew, county)
skasew %>% distinct() -> skasew

## Собрать ссылки на объявления о продаже квартир в МО "Финляндский" (id "skafin")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=769&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:12)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=769&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:12), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skafin

skafin <- data.frame(skafin)
county <- rep('skafin', nrow(skafin))
county <- as.factor(county)
skafin <- cbind(skafin, county)
skafin %>% distinct() -> skafin

## Собрать ссылки на объявления о продаже квартир в МО "Автово" (id "skiawt")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=725&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=725&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skiawt

skiawt <- data.frame(skiawt)
county <- rep('skiawt', nrow(skiawt))
county <- as.factor(county)
skiawt <- cbind(skiawt, county)
skiawt %>% distinct() -> skiawt

## Собрать ссылки на объявления о продаже квартир в МО "Дачное" (id "skidac")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=730&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=730&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skidac

skidac <- data.frame(skidac)
county <- rep('skidac', nrow(skidac))
county <- as.factor(county)
skidac <- cbind(skidac, county)
skidac %>% distinct() -> skidac

## Собрать ссылки на объявления о продаже квартир в МО "Княжево" (id "skikny")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=739&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=739&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skikny

skikny <- data.frame(skikny)
county <- rep('skikny', nrow(skikny))
county <- as.factor(county)
skikny <- cbind(skikny, county)
skikny %>% distinct() -> skikny

## Собрать ссылки на объявления о продаже квартир в МО "Красненькая речка" (id "skikra")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=732&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:3)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=732&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:3), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skikra

skikra <- data.frame(skikra)
county <- rep('skikra', nrow(skikra))
county <- as.factor(county)
skikra <- cbind(skikra, county)
skikra %>% distinct() -> skikra

## Собрать ссылки на объявления о продаже квартир в МО "Морские ворота" (id "skimor")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=711&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=732&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skimor

skimor <- data.frame(skimor)
county <- rep('skimor', nrow(skimor))
county <- as.factor(county)
skimor <- cbind(skimor, county)
skimor %>% distinct() -> skimor

## Собрать ссылки на объявления о продаже квартир в МО "Морские ворота" (id "skimor")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=711&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=732&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skimor

skimor <- data.frame(skimor)
county <- rep('skimor', nrow(skimor))
county <- as.factor(county)
skimor <- cbind(skimor, county)
skimor %>% distinct() -> skimor

## Собрать ссылки на объявления о продаже квартир в МО "Нарвский" (id "skinar")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=735&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=735&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skinar

skinar <- data.frame(skinar)
county <- rep('skinar', nrow(skinar))
county <- as.factor(county)
skinar <- cbind(skinar, county)
skinar %>% distinct() -> skinar

## Собрать ссылки на объявления о продаже квартир в МО "Ульянка" (id "skiulq")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=720&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:9)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=720&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:9), function(linkCollect){
  source <- read_html(linkCollect)  
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skiulq

skiulq <- data.frame(skiulq)
county <- rep('skiulq', nrow(skiulq))
county <- as.factor(county)
skiulq <- cbind(skiulq, county)
skiulq%>% distinct() -> skiulq

## Собрать ссылки на объявления о продаже квартир в МО "Колпино" (id "skokol")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=792&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:15)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=792&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:15), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skokol

skokol <- data.frame(skokol)
county <- rep('skokol', nrow(skokol))
county <- as.factor(county)
skokol <- cbind(skokol, county)
skokol%>% distinct() -> skokol

## Собрать ссылки на объявления о продаже квартир в МО "Металоострой" (id "skomet")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=793&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=793&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skomet

skomet <- data.frame(skomet)
county <- rep('skomet', nrow(skomet))
county <- as.factor(county)
skomet <- cbind(skomet, county)
skomet%>% distinct() -> skomet

## Собрать ссылки на объявления о продаже квартир в МО "Петро-Славянка" (id "skopet")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=785&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=785&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skopet

skopet <- data.frame(skopet[1:4, ])
county <- rep('skopet', nrow(skopet))
county <- as.factor(county)
skopet <- cbind(skopet, county)
skopet%>% distinct() -> skopet

## Собрать ссылки на объявления о продаже квартир в МО "Понтонный" (id "skopon")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=795&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=795&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skopon

skopon <- data.frame(skopon)
county <- rep('skopon', nrow(skopon))
county <- as.factor(county)
skopon <- cbind(skopon, county)
skopon%>% distinct() -> skopon

## Собрать ссылки на объявления о продаже квартир в МО "Сапёрный" (id "skosap")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=796&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=796&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skosap

skosap <- data.frame(skosap[1:3, ])
county <- rep('skosap', nrow(skosap))
county <- as.factor(county)
skosap <- cbind(skosap, county)
skosap%>% distinct() -> skosap

## Собрать ссылки на объявления о продаже квартир в МО "Усть-Ижора" (id "skoust")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=794&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=794&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skoust

skoust <- data.frame(skoust[1:2, ])
county <- rep('skoust', nrow(skoust))
county <- as.factor(county)
skoust <- cbind(skoust, county)
skoust%>% distinct() -> skoust

## Собрать ссылки на объявления о продаже квартир в МО "Большая Охта" (id "skrbol")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=778&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=778&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrbol

skrbol <- data.frame(skrbol)
county <- rep('skrbol', nrow(skrbol))
county <- as.factor(county)
skrbol <- cbind(skrbol, county)
skrbol%>% distinct() -> skrbol

## Собрать ссылки на объявления о продаже квартир в МО "Большая Охта" (id "skrbol")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=778&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=778&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrbol

skrbol <- data.frame(skrbol)
county <- rep('skrbol', nrow(skrbol))
county <- as.factor(county)
skrbol <- cbind(skrbol, county)
skrbol%>% distinct() -> skrbol

## Собрать ссылки на объявления о продаже квартир в МО "Малая Охта" (id "skrmal")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=692&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=692&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrmal

skrmal <- data.frame(skrmal)
county <- rep('skrmal', nrow(skrmal))
county <- as.factor(county)
skrmal <- cbind(skrmal, county)
skrmal%>% distinct() -> skrmal

## Собрать ссылки на объявления о продаже квартир в МО "Полюстрово" (id "skrpol")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=780&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:27)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=780&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:27), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrpol

skrpol <- data.frame(skrpol)
county <- rep('skrpol', nrow(skrpol))
county <- as.factor(county)
skrpol <- cbind(skrpol, county)
skrpol%>% distinct() -> skrpol

## Собрать ссылки на объявления о продаже квартир в МО "Пороховые" (id "skrpor")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=789&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=789&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrpor

skrpor <- data.frame(skrpor)
county <- rep('skrpor', nrow(skrpor))
county <- as.factor(county)
skrpor <- cbind(skrpor, county)
skrpor%>% distinct() -> skrpor

## Собрать ссылки на объявления о продаже квартир в МО "Ржевка" (id "skrrzh")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=788&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=788&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrrzh

skrrzh <- data.frame(skrrzh)
county <- rep('skrrzh', nrow(skrrzh))
county <- as.factor(county)
skrrzh <- cbind(skrrzh, county)
skrrzh%>% distinct() -> skrrzh

## Собрать ссылки на объявления о продаже квартир в МО "Горелово" (id "skrgor")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=713&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=713&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrgor

skrgor <- data.frame(skrgor)
county <- rep('skrgor', nrow(skrgor))
county <- as.factor(county)
skrgor <- cbind(skrgor, county)
skrgor%>% distinct() -> skrgor

## Собрать ссылки на объявления о продаже квартир в МО "Константиновское" (id "skrkon")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=716&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=716&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrkon

skrkon <- data.frame(skrkon)
county <- rep('skrkon', nrow(skrkon))
county <- as.factor(county)
skrkon <- cbind(skrkon, county)
skrkon%>% distinct() -> skrkon

## Собрать ссылки на объявления о продаже квартир в МО "Сосновая Поляна" (id "skrsos")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=719&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:19)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=719&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:19), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrsos

skrsos <- data.frame(skrsos)
county <- rep('skrsos', nrow(skrsos))
county <- as.factor(county)
skrsos <- cbind(skrsos, county)
skrsos%>% distinct() -> skrsos

## Собрать ссылки на объявления о продаже квартир в МО "Урицк" (id "skruri")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=704&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=704&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skruri

skruri <- data.frame(skruri)
county <- rep('skruri', nrow(skruri))
county <- as.factor(county)
skruri <- cbind(skruri, county)
skruri%>% distinct() -> skruri

## Собрать ссылки на объявления о продаже квартир в МО "Юго-Запад" (id "skryug")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=729&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=729&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skryug

skryug <- data.frame(skryug)
county <- rep('skryug', nrow(skryug))
county <- as.factor(county)
skryug <- cbind(skryug, county)
skryug%>% distinct() -> skryug

## Собрать ссылки на объявления о продаже квартир в МО "Южно-Приморский" (id "skryuz")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=722&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:33)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=722&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:33), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skryuz

skryuz <- data.frame(skryuz)
county <- rep('skryuz', nrow(skryuz))
county <- as.factor(county)
skryuz <- cbind(skryuz, county)
skryuz%>% distinct() -> skryuz

## Собрать ссылки на объявления о продаже квартир в МО "Красное село" (id "skrkra")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=710&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=710&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect){
  source <- read_html(linkCollect)
  print(linkCollect)
  
  source %>%
    html_nodes("a._93444fe79c--link--39cNw") %>%
    html_attr("href") ->
    links
  
  source %>%
    html_nodes("div._93444fe79c--container--2h0AF p._93444fe79c--color_gray60_100--3VLtJ._93444fe79c--lineHeight_20px--2dV2a._93444fe79c--fontWeight_normal--2G6_P._93444fe79c--fontSize_14px--10R7l._93444fe79c--display_block--1eYsq._93444fe79c--text--2_SER") %>%
    html_text() ->
    price_m
  tibble(links, price_m)
  
}) ->
  skrkra

skrkra <- data.frame(skrkra)
county <- rep('skrkra', nrow(skrkra))
county <- as.factor(county)
skrkra <- cbind(skrkra, county)
skrkra%>% distinct() -> skrkra




# Собрать адреса

map_chr(sadadm$links, function(adresses){
  s1 <- read_html(adresses)
  s1 %>%
    html_nodes("div.a10a3f92e9--geo--18qoo address.a10a3f92e9--address--140Ec")%>%
    html_text() ->
    adress
}) ->
  adres

# Собрать цены

map_chr(sadadm$links, function(price){
  s1 <- read_html(price)
  s1 %>%
    html_nodes("span.a10a3f92e9--price_value--1iPpd")%>%
    html_text() ->
    price
}) ->
  price

sadadm_price = trimws(sadadm_price)
sadadm_price <- gsub('₽', '', sadadm_price)
sadadm_price <- gsub('\\s+', '', sadadm_price)



# Собрать цены за кв. м

map_chr(sadadm$links, function(pricePerM){
  s1 <- read_html(pricePerM)
  s1 %>%
    html_nodes("div.a10a3f92e9--price_per_meter--hKPtN.a10a3f92e9--price_per_meter--residential--1mFDW")%>%
    html_text() ->
    price_per_m
}) ->
  price_per_m

price_per_m <- gsub('₽/м²', '', price_per_m)
price_per_m = gsub('\\s+', '', price_per_m)
as.numeric(price_per_m)
is.numeric(price_per_m)
price_per_met <- as.numeric(price_per_m)
county <- rep('sadadm', 1:nrow(sadadm_new))
county <- as.factor(county)

sadadm_new <- data.frame(price_m = price_per_met, county = county)

write_csv(sadadm_new, '/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/R-source/AI_for_valuers_R_source/datasets/spba_flats_price_m/Admiraltejskij/sadadm.csv', )

## Собрать ссылки на объявления о продаже квартир в МО "Екатерингофский" (id "sadeka")

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=741&engine_version=2&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=741&engine_version=2&offer_type=flat&p=", 1:5), function(linkCollect){
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
  sadeka

# Собрать адреса

map_chr(sadadm$links, function(adresses){
  s1 <- read_html(adresses)
  s1 %>%
    html_nodes("div.a10a3f92e9--geo--18qoo address.a10a3f92e9--address--140Ec")%>%
    html_text() ->
    adress
}) ->
  adres

# Собрать цены

map_chr(sadadm$links, function(price){
  s1 <- read_html(price)
  s1 %>%
    html_nodes("span.a10a3f92e9--price_value--1iPpd")%>%
    html_text() ->
    price
}) ->
  price

sadadm_price = trimws(sadadm_price)
sadadm_price <- gsub('₽', '', sadadm_price)
sadadm_price <- gsub('\\s+', '', sadadm_price)



# Собрать цены за кв. м

map_chr(sadadm$links, function(pricePerM){
  s1 <- read_html(pricePerM)
  s1 %>%
    html_nodes("div.a10a3f92e9--price_per_meter--hKPtN.a10a3f92e9--price_per_meter--residential--1mFDW")%>%
    html_text() ->
    price_per_m
}) ->
  price_per_m

price_per_m <- gsub('₽/м²', '', price_per_m)
price_per_m = gsub('\\s+', '', price_per_m)
as.numeric(price_per_m)
is.numeric(price_per_m)
price_per_met <- as.numeric(price_per_m)
county <- rep('sadadm', 1:nrow(sadadm_new))
county <- as.factor(county)

sadadm_new <- data.frame(price_m = price_per_met, county = county)

write_csv(sadadm_new, '/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/R-source/AI_for_valuers_R_source/datasets/spba_flats_price_m/Admiraltejskij/sadadm.csv', )

################################################################################

?write_csv

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
  
  
  

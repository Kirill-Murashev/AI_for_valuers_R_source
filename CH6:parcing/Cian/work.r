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
library(styler)
library(prettycode)

style_text("a + b", transformers = tidyverse_style(scope = "indention"))

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

## Собрать ссылки на объявления о продаже квартир в МО "Кронштадт" (id skrkro)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=691&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=691&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollect){
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
  skrkro

skrkro <- data.frame(skrkro)
county <- rep('skrkro', nrow(skrkro))
county <- as.factor(county)
skrkro <- cbind(skrkro, county)
skrkro%>% distinct() -> skrkro

## Собрать ссылки на объявления о продаже квартир в МО "Зеленогорск" (id skuzel)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=698&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:3)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=698&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:3), function(linkCollect){
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
  skuzel

skuzel <- data.frame(skuzel)
county <- rep('skuzel', nrow(skuzel))
county <- as.factor(county)
skuzel <- cbind(skuzel, county)
skuzel%>% distinct() -> skuzel

## Собрать ссылки на объявления о продаже квартир в МО "Комарово" (id skukom)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=701&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=701&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
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
  skukom

skukom <- data.frame(skukom)
county <- rep('skukom', nrow(skukom))
county <- as.factor(county)
skukom <- cbind(skukom, county)
skukom%>% distinct() -> skukom

## Собрать ссылки на объявления о продаже квартир в МО "Молодёжное" (id skumol)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=694&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=694&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
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
  skumol

skumol <- data.frame(skumol)
county <- rep('skumol', nrow(skumol))
county <- as.factor(county)
skumol <- cbind(skumol, county)
skumol%>% distinct() -> skumol

## Собрать ссылки на объявления о продаже квартир в МО "Песочный" (id skupes)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=714&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=714&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2), function(linkCollect){
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
  skupes

skupes <- data.frame(skupes)
county <- rep('skupes', nrow(skupes))
county <- as.factor(county)
skupes <- cbind(skupes, county)
skupes%>% distinct() -> skupes

## Собрать ссылки на объявления о продаже квартир в МО "Репино" (id skurep)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=703&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=703&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
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
  skurep

skurep <- data.frame(skurep)
county <- rep('skurep', nrow(skurep))
county <- as.factor(county)
skurep <- cbind(skurep, county)
skurep%>% distinct() -> skurep

## Собрать ссылки на объявления о продаже квартир в МО "Серово" (id skuser)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=696&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=696&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
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
  skuser

skuser <- data.frame(skuser)
county <- rep('skuser', nrow(skuser))
county <- as.factor(county)
skuser <- cbind(skuser, county)
skuser%>% distinct() -> skuser

## Собрать ссылки на объявления о продаже квартир в МО "Сестрорецк" (id skuses)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=705&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=705&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:8), function(linkCollect){
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
  skuses

skuses <- data.frame(skuses)
county <- rep('skuses', nrow(skuses))
county <- as.factor(county)
skuses <- cbind(skuses, county)
skuses%>% distinct() -> skuses

## Собрать ссылки на объявления о продаже квартир в МО "Смолячково" (id skusmo)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=695&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=695&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
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
  skusmo

skusmo <- data.frame(skusmo)
county <- rep('skusmo', nrow(skusmo))
county <- as.factor(county)
skusmo <- cbind(skusmo, county)
skusmo%>% distinct() -> skusmo

## Собрать ссылки на объявления о продаже квартир в МО "Солнечное" (id skusol)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=706&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=706&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
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
  skusol

skusol <- data.frame(skusol[1:2, ])
county <- rep('skusol', nrow(skusol))
county <- as.factor(county)
skusol <- cbind(skusol, county)
skusol%>% distinct() -> skusol

## Собрать ссылки на объявления о продаже квартир в МО "Ушково" (id skuush)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=697&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=697&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollect){
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
  skuush

skuush <- data.frame(skuush[1:2, ])
county <- rep('skuush', nrow(skuush))
county <- as.factor(county)
skuush <- cbind(skuush, county)
skuush%>% distinct() -> skuush

## Собрать ссылки на объявления о продаже квартир в МО "Гагаринское" (id smogag)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=767&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:14)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=767&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:14), function(linkCollect){
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
  smogag

smogag <- data.frame(smogag)
county <- rep('smogag', nrow(smogag))
county <- as.factor(county)
smogag <- cbind(smogag, county)
smogag%>% distinct() -> smogag

## Собрать ссылки на объявления о продаже квартир в МО "Звёздное" (id smozwy)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=761&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:39)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=761&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:39), function(linkCollect){
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
  smozwy

smozwy <- data.frame(smozwy)
county <- rep('smozwy', nrow(smozwy))
county <- as.factor(county)
smozwy <- cbind(smozwy, county)
smozwy%>% distinct() -> smozwy

## Собрать ссылки на объявления о продаже квартир в МО "Московская Застава" (id smomos)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=752&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:15)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=752&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:15), function(linkCollect){
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
  smomos

smomos <- data.frame(smomos)
county <- rep('smomos', nrow(smomos))
county <- as.factor(county)
smomos <- cbind(smomos, county)
smomos%>% distinct() -> smomos

## Собрать ссылки на объявления о продаже квартир в МО "Новоизмайловское" (id smonow)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=749&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:15)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=749&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:15), function(linkCollect){
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
  smonow

smonow <- data.frame(smonow)
county <- rep('smonow', nrow(smonow))
county <- as.factor(county)
smonow <- cbind(smonow, county)
smonow%>% distinct() -> smonow

## Собрать ссылки на объявления о продаже квартир в МО "Пулковский меридиан" (id smopul)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=731&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:17)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=731&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:17), function(linkCollect){
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
  smopul

smopul <- data.frame(smopul)
county <- rep('smopul', nrow(smopul))
county <- as.factor(county)
smopul <- cbind(smopul, county)
smopul%>% distinct() -> smopul

## Собрать ссылки на объявления о продаже квартир в МО "Округ № 54" (id snen54)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=786&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:11)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=786&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:11), function(linkCollect){
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
  snen54

snen54 <- data.frame(snen54)
county <- rep('snen54', nrow(snen54))
county <- as.factor(county)
snen54 <- cbind(snen54, county)
snen54%>% distinct() -> snen54

## Собрать ссылки на объявления о продаже квартир в МО "Ивановский" (id sneiwa)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=777&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=777&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollect){
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
  sneiwa

sneiwa <- data.frame(sneiwa)
county <- rep('sneiwa', nrow(sneiwa))
county <- as.factor(county)
sneiwa <- cbind(sneiwa, county)
sneiwa%>% distinct() -> sneiwa

## Собрать ссылки на объявления о продаже квартир в МО "Народный" (id snenar)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=787&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:20)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=787&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:20), function(linkCollect){
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
  snenar

snenar <- data.frame(snenar)
county <- rep('snenar', nrow(snenar))
county <- as.factor(county)
snenar <- cbind(snenar, county)
snenar%>% distinct() -> snenar

## Собрать ссылки на объявления о продаже квартир в МО "Невская застава" (id snenew)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=745&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=745&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollect){
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
  snenew

snenew <- data.frame(snenew)
county <- rep('snenew', nrow(snenew))
county <- as.factor(county)
snenew <- cbind(snenew, county)
snenew%>% distinct() -> snenew

## Собрать ссылки на объявления о продаже квартир в МО "Невский" (id snenev)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=781&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:11)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=781&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:11), function(linkCollect_snenev){
  source <- read_html(linkCollect_snenev)
  print(linkCollect_snenev)
  
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
  snenev

snenev <- data.frame(snenev)
county <- rep('snenev', nrow(snenev))
county <- as.factor(county)
snenev <- cbind(snenev, county)
snenev%>% distinct() -> snenev

## Собрать ссылки на объявления о продаже квартир в МО "Обуховский" (id sneobu)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=782&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=782&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollect_sneobu){
  source <- read_html(linkCollect_sneobu)
  print(linkCollect_sneobu)
  
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
  sneobu

sneobu <- data.frame(sneobu)
county <- rep('sneobu', nrow(sneobu))
county <- as.factor(county)
sneobu <- cbind(sneobu, county)
sneobu%>% distinct() -> sneobu

## Собрать ссылки на объявления о продаже квартир в МО "Оккервиль" (id sneokk)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=791&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=791&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollect_sneokk){
  source <- read_html(linkCollect_sneokk)
  print(linkCollect_sneokk)
  
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
  sneokk

sneokk <- data.frame(sneokk)
county <- rep('sneokk', nrow(sneokk))
county <- as.factor(county)
sneokk <- cbind(sneokk, county)
sneokk%>% distinct() -> sneokk

## Собрать ссылки на объявления о продаже квартир в МО "Правобережный" (id snepra)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=783&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:11)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=783&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:11), function(linkCollect_snepra){
  source <- read_html(linkCollect_snepra)
  print(linkCollect_snepra)
  
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
  snepra

snepra <- data.frame(snepra)
county <- rep('snepra', nrow(snepra))
county <- as.factor(county)
snepra <- cbind(snepra, county)
snepra%>% distinct() -> snepra

## Собрать ссылки на объявления о продаже квартир в МО "Рыбацкое" (id sneryb)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=790&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:15)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=790&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:15), function(linkCollect_sneryb){
  source <- read_html(linkCollect_sneryb)
  print(linkCollect_sneryb)
  
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
  sneryb

sneryb <- data.frame(sneryb)
county <- rep('sneryb', nrow(sneryb))
county <- as.factor(county)
sneryb <- cbind(sneryb, county)
sneryb%>% distinct() -> sneryb

## Собрать ссылки на объявления о продаже квартир в МО "Аптекарский остров" (id speapt)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=753&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=753&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollect_speapt){
  source <- read_html(linkCollect_speapt)
  print(linkCollect_speapt)
  
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
  speapt

speapt <- data.frame(speapt)
county <- rep('speapt', nrow(speapt))
county <- as.factor(county)
speapt <- cbind(speapt, county)
speapt%>% distinct() -> speapt

## Собрать ссылки на объявления о продаже квартир в МО "Введенский" (id spewwe)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=750&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=750&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4), function(linkCollect_spewwe){
  source <- read_html(linkCollect_spewwe)
  print(linkCollect_spewwe)
  
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
  spewwe

spewwe <- data.frame(spewwe)
county <- rep('spewwe', nrow(spewwe))
county <- as.factor(county)
spewwe <- cbind(spewwe, county)
spewwe%>% distinct() -> spewwe

## Собрать ссылки на объявления о продаже квартир в МО "Кронверкское" (id spekro)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=748&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=748&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4), function(linkCollect_spekro){
  source <- read_html(linkCollect_spekro)
  print(linkCollect_spekro)
  
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
  spekro

spekro <- data.frame(spekro)
county <- rep('spekro', nrow(spekro))
county <- as.factor(county)
spekro <- cbind(spekro, county)
spekro%>% distinct() -> spekro

## Собрать ссылки на объявления о продаже квартир в МО "Петровский" (id spepet)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=736&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=736&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13), function(linkCollect_spepet){
  source <- read_html(linkCollect_spepet)
  print(linkCollect_spepet)
  
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
  spepet

spepet <- data.frame(spepet)
county <- rep('spepet', nrow(spepet))
county <- as.factor(county)
spepet <- cbind(spepet, county)
spepet%>% distinct() -> spepet

## Собрать ссылки на объявления о продаже квартир в МО "Посадский" (id spepos)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=758&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=758&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollect_spepos){
  source <- read_html(linkCollect_spepos)
  print(linkCollect_spepos)
  
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
  spepos

spepos <- data.frame(spepos)
county <- rep('spepos', nrow(spepos))
county <- as.factor(county)
spepos <- cbind(spepos, county)
spepos%>% distinct() -> spepos

## Собрать ссылки на объявления о продаже квартир в МО "Чкаловское" (id spechk)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=733&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:16)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=733&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:16), function(linkCollectSpechk){
  source <- read_html(linkCollectSpechk)
  print(linkCollectSpechk)
  
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
  spechk

spechk <- data.frame(spechk)
county <- rep('spechk', nrow(spechk))
county <- as.factor(county)
spechk <- cbind(spechk, county)
spechk%>% distinct() -> spechk

## Собрать ссылки на объявления о продаже квартир в МО "Ломоносов" (id spelom)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=699&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=699&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4), function(linkCollectSpelom){
  source <- read_html(linkCollectSpelom)
  print(linkCollectSpelom)
  
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
  spelom

spelom <- data.frame(spelom)
county <- rep('spelom', nrow(spelom))
county <- as.factor(county)
spelom <- cbind(spelom, county)
spelom%>% distinct() -> spelom

## Собрать ссылки на объявления о продаже квартир в МО "Петергоф" (id spepe2)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=702&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:9)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=702&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:9), function(linkCollectSpepe2){
  source <- read_html(linkCollectSpepe2)
  print(linkCollectSpepe2)
  
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
  spepe2

spepe2 <- data.frame(spepe2)
county <- rep('spepe2', nrow(spepe2))
county <- as.factor(county)
spepe2<- cbind(spepe2, county)
spepe2%>% distinct() -> spepe2

## Собрать ссылки на объявления о продаже квартир в МО "Стрельна" (id spestr)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=709&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=709&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:2), function(linkCollectSpestr){
  source <- read_html(linkCollectSpestr)
  print(linkCollectSpestr)
  
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
  spestr

spestr <- data.frame(spestr)
county <- rep('spestr', nrow(spestr))
county <- as.factor(county)
spestr<- cbind(spestr, county)
spestr%>% distinct() -> spestr

## Собрать ссылки на объявления о продаже квартир в МО "Округ № 65" (id sprn65)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=726&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:32)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=726&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:32), function(linkCollectSprn65){
  source <- read_html(linkCollectSprn65)
  print(linkCollectSprn65)
  
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
  sprn65

sprn65 <- data.frame(sprn65)
county <- rep('sprn65', nrow(sprn65))
county <- as.factor(county)
sprn65 <- cbind(sprn65, county)
sprn65%>% distinct() -> sprn65

## Собрать ссылки на объявления о продаже квартир в МО "Коломяги" (id sprkol)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=724&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:38)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=724&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:38), function(linkCollectSprkol){
  source <- read_html(linkCollectSprkol)
  print(linkCollectSprkol)
  
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
  sprkol

sprkol <- data.frame(sprkol)
county <- rep('sprkol', nrow(sprkol))
county <- as.factor(county)
sprkol <- cbind(sprkol, county)
sprkol%>% distinct() -> sprkol

## Собрать ссылки на объявления о продаже квартир в МО "Комендантский аэродром" (id sprkom)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=746&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=746&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10), function(linkCollectSprkom){
  source <- read_html(linkCollectSprkom)
  print(linkCollectSprkom)
  
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
  sprkom

sprkom <- data.frame(sprkom)
county <- rep('sprkom', nrow(sprkom))
county <- as.factor(county)
sprkom <- cbind(sprkom, county)
sprkom%>% distinct() -> sprkom

## Собрать ссылки на объявления о продаже квартир в МО "Лахта-Ольгино" (id sprlax)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=715&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=715&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollectSprlax){
  source <- read_html(linkCollectSprlax)
  print(linkCollectSprlax)
  
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
  sprlax

sprlax <- data.frame(sprlax)
county <- rep('sprlax', nrow(sprlax))
county <- as.factor(county)
sprlax <- cbind(sprlax, county)
sprlax%>% distinct() -> sprlax

## Собрать ссылки на объявления о продаже квартир в МО "Озеро Долгое" (id sproze)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=737&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=737&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13), function(linkCollectSproze){
  source <- read_html(linkCollectSproze)
  print(linkCollectSproze)
  
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
  sproze

sproze <- data.frame(sproze)
county <- rep('sproze', nrow(sproze))
county <- as.factor(county)
sproze <- cbind(sproze, county)
sproze%>% distinct() -> sproze

## Собрать ссылки на объявления о продаже квартир в МО "Чёрная речка" (id sprchy)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=742&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:16)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=742&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:16), function(linkCollectSprchy){
  source <- read_html(linkCollectSprchy)
  print(linkCollectSprchy)
  
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
  sprchy

sprchy <- data.frame(sprchy)
county <- rep('sprchy', nrow(sprchy))
county <- as.factor(county)
sprchy <- cbind(sprchy, county)
sprchy%>% distinct() -> sprchy

## Собрать ссылки на объявления о продаже квартир в МО "Юнтолово" (id spryun)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=727&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:29)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=727&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:29), function(linkCollectSpryun){
  source <- read_html(linkCollectSpryun)
  print(linkCollectSpryun)
  
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
  spryun

spryun <- data.frame(spryun)
county <- rep('spryun', nrow(spryun))
county <- as.factor(county)
spryun <- cbind(spryun, county)
spryun%>% distinct() -> spryun

## Собрать ссылки на объявления о продаже квартир в МО "Юнтолово" (id sprlis)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=708&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=708&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollectSprlis){
  source <- read_html(linkCollectSprlis)
  print(linkCollectSprlis)
  
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
  sprlis

sprlis <- data.frame(sprlis[1:11, ])
county <- rep('sprlis', nrow(sprlis))
county <- as.factor(county)
sprlis <- cbind(sprlis, county)
sprlis%>% distinct() -> sprlis

## Собрать ссылки на объявления о продаже квартир в МО "Александровская" (id spuale)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=757&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=757&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollectSpuale){
  source <- read_html(linkCollectSpuale)
  print(linkCollectSpuale)
  
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
  spuale

spuale <- data.frame(spuale)
county <- rep('spuale', nrow(spuale))
county <- as.factor(county)
spuale <- cbind(spuale, county)
spuale%>% distinct() -> spuale

## Собрать ссылки на объявления о продаже квартир в МО "Павловск" (id spupaw)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=764&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:3)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=764&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:3), function(linkCollectSpupaw){
  source <- read_html(linkCollectSpupaw)
  print(linkCollectSpupaw)
  
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
  spupaw

spupaw <- data.frame(spupaw)
county <- rep('spupaw', nrow(spupaw))
county <- as.factor(county)
spupaw <- cbind(spupaw, county)
spupaw%>% distinct() -> spupaw

## Собрать ссылки на объявления о продаже квартир в МО "Пушкин" (id spupus)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=734&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:16)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=734&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:16), function(linkCollectSpupus){
  source <- read_html(linkCollectSpupus)
  print(linkCollectSpupus)
  
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
  spupus

spupus <- data.frame(spupus)
county <- rep('spupus', nrow(spupus))
county <- as.factor(county)
spupus <- cbind(spupus, county)
spupus%>% distinct() -> spupus

## Собрать ссылки на объявления о продаже квартир в МО "Тярлево" (id sputya)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=784&engine_version=2&object_type%5B0%5D=1&offer_type=flat")

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=784&engine_version=2&object_type%5B0%5D=1&offer_type=flat"), function(linkCollectSputya){
  source <- read_html(linkCollectSputya)
  print(linkCollectSputya)
  
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
  sputya

sputya <- data.frame(sputya[1:4, ])
county <- rep('sputya', nrow(sputya))
county <- as.factor(county)
sputya <- cbind(sputya, county)
sputya%>% distinct() -> sputya

## Собрать ссылки на объявления о продаже квартир в МО "Пушкин" (id spushu)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=688&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:31)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=688&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:31), function(linkCollectSpushu){
  source <- read_html(linkCollectSpushu)
  print(linkCollectSpushu)
  
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
  spushu

spushu <- data.frame(spushu)
county <- rep('spushu', nrow(spushu))
county <- as.factor(county)
spushu <- cbind(spushu, county)
spushu%>% distinct() -> spushu

## Собрать ссылки на объявления о продаже квартир в МО "Округ № 72" (id sfrn72)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=776&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=776&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollectSfrn72){
  source <- read_html(linkCollectSfrn72)
  print(linkCollectSfrn72)
  
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
  sfrn72

sfrn72 <- data.frame(sfrn72)
county <- rep('sfrn72', nrow(sfrn72))
county <- as.factor(county)
sfrn72 <- cbind(sfrn72, county)
sfrn72%>% distinct() -> sfrn72

## Собрать ссылки на объявления о продаже квартир в МО "Округ № 75" (id sfrn75)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=693&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=693&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollectSfrn75){
  source <- read_html(linkCollectSfrn75)
  print(linkCollectSfrn75)
  
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
  sfrn75

sfrn75 <- data.frame(sfrn75)
county <- rep('sfrn75', nrow(sfrn75))
county <- as.factor(county)
sfrn75 <- cbind(sfrn75, county)
sfrn75%>% distinct() -> sfrn75

## Собрать ссылки на объявления о продаже квартир в МО "Балканский" (id sfrbal)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=775&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=775&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollectSfrbal){
  source <- read_html(linkCollectSfrbal)
  print(linkCollectSfrbal)
  
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
  sfrbal

sfrbal <- data.frame(sfrbal)
county <- rep('sfrbal', nrow(sfrbal))
county <- as.factor(county)
sfrbal <- cbind(sfrbal, county)
sfrbal%>% distinct() -> sfrbal

## Собрать ссылки на объявления о продаже квартир в МО "Балканский" (id sfrwol)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=765&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=765&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13), function(linkCollectSfrwol){
  source <- read_html(linkCollectSfrwol)
  print(linkCollectSfrwol)
  
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
  sfrwol

sfrwol <- data.frame(sfrwol)
county <- rep('sfrwol', nrow(sfrwol))
county <- as.factor(county)
sfrwol <- cbind(sfrwol, county)
sfrwol%>% distinct() -> sfrwol

## Собрать ссылки на объявления о продаже квартир в МО "Георгиевский" (id sfrgeo)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=762&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=762&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:10), function(linkCollectSfrgeo){
  source <- read_html(linkCollectSfrgeo)
  print(linkCollectSfrgeo)
  
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
  sfrgeo

sfrgeo <- data.frame(sfrgeo)
county <- rep('sfrgeo', nrow(sfrgeo))
county <- as.factor(county)
sfrgeo <- cbind(sfrgeo, county)
sfrgeo%>% distinct() -> sfrgeo

## Собрать ссылки на объявления о продаже квартир в МО "Купчино" (id sfrkup)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=690&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=690&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:5), function(linkCollectSfrkup){
  source <- read_html(linkCollectSfrkup)
  print(linkCollectSfrkup)
  
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
  sfrkup

sfrkup <- data.frame(sfrkup)
county <- rep('sfrkup', nrow(sfrkup))
county <- as.factor(county)
sfrkup <- cbind(sfrkup, county)
sfrkup%>% distinct() -> sfrkup

## Собрать ссылки на объявления о продаже квартир в МО "Округ № 78" (id sczn78)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=687&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=687&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:4), function(linkCollectSczn78){
  source <- read_html(linkCollectSczn78)
  print(linkCollectSczn78)
  
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
  sczn78

sczn78 <- data.frame(sczn78)
county <- rep('sczn78', nrow(sczn78))
county <- as.factor(county)
sczn78 <- cbind(sczn78, county)
sczn78%>% distinct() -> sczn78







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
  
  
  

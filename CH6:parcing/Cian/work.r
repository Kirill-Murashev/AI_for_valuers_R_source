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

## Собрать ссылки на объявления о продаже квартир в МО "Владимирский" (id sczwla)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=707&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:17)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=707&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:17), function(linkCollectSczwla){
  source <- read_html(linkCollectSczwla)
  print(linkCollectSczwla)
  
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
  sczwla

sczwla <- data.frame(sczwla)
county <- rep('sczwla', nrow(sczwla))
county <- as.factor(county)
sczwla <- cbind(sczwla, county)
sczwla%>% distinct() -> sczwla

## Собрать ссылки на объявления о продаже квартир в МО "Дворцовый" (id sczdwo)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=755&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=755&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:6), function(linkCollectSczdwo){
  source <- read_html(linkCollectSczdwo)
  print(linkCollectSczdwo)
  
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
  sczdwo

sczdwo <- data.frame(sczdwo)
county <- rep('sczdwo', nrow(sczdwo))
county <- as.factor(county)
sczdwo <- cbind(sczdwo, county)
sczdwo%>% distinct() -> sczdwo

## Собрать ссылки на объявления о продаже квартир в МО "Лиговка-Ямская" (id sczlig)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=689&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=689&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:7), function(linkCollectSczlig){
  source <- read_html(linkCollectSczlig)
  print(linkCollectSczlig)
  
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
  sczlig

sczlig <- data.frame(sczlig)
county <- rep('sczlig', nrow(sczlig))
county <- as.factor(county)
sczlig <- cbind(sczlig, county)
sczlig%>% distinct() -> sczlig

## Собрать ссылки на объявления о продаже квартир в МО "Литейный" (id sczlit)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=766&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=766&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:13), function(linkCollectSczlit){
  source <- read_html(linkCollectSczlit)
  print(linkCollectSczlit)
  
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
  sczlit

sczlit <- data.frame(sczlit)
county <- rep('sczlit', nrow(sczlit))
county <- as.factor(county)
sczlit <- cbind(sczlit, county)
sczlit%>% distinct() -> sczlit

## Собрать ссылки на объявления о продаже квартир в МО "Смольнинское" (id sczsmo)

str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=738&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:23)

map_dfr(str_c("https://spb.cian.ru/cat.php?deal_type=sale&district%5B0%5D=738&engine_version=2&object_type%5B0%5D=1&offer_type=flat&p=", 1:23), function(linkCollectSczsmo){
  source <- read_html(linkCollectSczsmo)
  print(linkCollectSczsmo)
  
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
  sczsmo

sczsmo <- data.frame(sczsmo)
county <- rep('sczsmo', nrow(sczsmo))
county <- as.factor(county)
sczsmo <- cbind(sczsmo, county)
sczsmo%>% distinct() -> sczsmo

## Собрать ссылки на объявления о продаже квартир на территории "Рощино - Первомайское" (id lwyros)

str_c("https://www.cian.ru/cat.php?bbox=60.1723931893%2C28.8602483883%2C60.4625688845%2C30.4560125484&deal_type=sale&engine_version=2&in_polygon%5B1%5D=29.5405645_60.2528152%2C29.5721774_60.2418861%2C29.6024158_60.2343723%2C29.6354032_60.2377876%2C29.6656416_60.2459845%2C29.698629_60.2487168%2C29.7357398_60.2487168%2C29.7701016_60.2487168%2C29.8099614_60.2487168%2C29.8415743_60.2569136%2C29.85257_60.2733073%2C29.8539445_60.2897009%2C29.8649403_60.3074607%2C29.881434_60.3218052%2C29.8910553_60.3381989%2C29.8855574_60.3559587%2C29.8690637_60.3716693%2C29.8388253_60.3853307%2C29.8085869_60.3928445%2C29.7687271_60.3976259%2C29.7302419_60.3935275%2C29.7013779_60.3812323%2C29.6738884_60.3607402%2C29.6573948_60.3422973%2C29.6450245_60.3231713%2C29.6257819_60.3074607%2C29.5996669_60.2944824%2C29.5721774_60.2835533%2C29.5446879_60.2733073%2C29.5378155_60.2569136%2C29.5405645_60.2528152&object_type%5B0%5D=1&offer_type=flat&p=", 1:3, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.1723931893%2C28.8602483883%2C60.4625688845%2C30.4560125484&deal_type=sale&engine_version=2&in_polygon%5B1%5D=29.5405645_60.2528152%2C29.5721774_60.2418861%2C29.6024158_60.2343723%2C29.6354032_60.2377876%2C29.6656416_60.2459845%2C29.698629_60.2487168%2C29.7357398_60.2487168%2C29.7701016_60.2487168%2C29.8099614_60.2487168%2C29.8415743_60.2569136%2C29.85257_60.2733073%2C29.8539445_60.2897009%2C29.8649403_60.3074607%2C29.881434_60.3218052%2C29.8910553_60.3381989%2C29.8855574_60.3559587%2C29.8690637_60.3716693%2C29.8388253_60.3853307%2C29.8085869_60.3928445%2C29.7687271_60.3976259%2C29.7302419_60.3935275%2C29.7013779_60.3812323%2C29.6738884_60.3607402%2C29.6573948_60.3422973%2C29.6450245_60.3231713%2C29.6257819_60.3074607%2C29.5996669_60.2944824%2C29.5721774_60.2835533%2C29.5446879_60.2733073%2C29.5378155_60.2569136%2C29.5405645_60.2528152&object_type%5B0%5D=1&offer_type=flat&p=", 1:3, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwyros){
  source <- read_html(linkCollectLwyros)
  print(linkCollectLwyros)
  
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
  lwyros

lwyros <- data.frame(lwyros)
county <- rep('lwyros', nrow(lwyros))
county <- as.factor(county)
lwyros <- cbind(lwyros, county)
lwyros%>% distinct() -> lwyros

## Собрать ссылки на объявления о продаже квартир на территории "Сертолово - Чёрная речка" (id lwsser)

str_c("https://www.cian.ru/cat.php?bbox=60.1207741495%2C29.98090533%2C60.1936754783%2C30.37984637&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.1278022_60.1811691%2C30.1223043_60.1775664%2C30.1216171_60.1732773%2C30.1253969_60.1674442%2C30.1288331_60.1631552%2C30.1336437_60.1592093%2C30.1398289_60.1550918%2C30.1470448_60.1518322%2C30.1542608_60.1490872%2C30.1614768_60.1463422%2C30.1683492_60.1435972%2C30.1755652_60.1413669%2C30.1841556_60.1389651%2C30.1927461_60.1369063%2C30.2030547_60.1351907%2C30.2119887_60.1341614%2C30.2202356_60.1334751%2C30.2284824_60.1333036%2C30.2363856_60.1351907%2C30.2391346_60.1399944%2C30.2384474_60.144455%2C30.236042_60.1490872%2C30.2326058_60.1532047%2C30.2281388_60.1576653%2C30.2233281_60.162469%2C30.2161122_60.1669296%2C30.2092398_60.1696745%2C30.2020238_60.1720764%2C30.1927461_60.1746498%2C30.183812_60.1767085%2C30.1752216_60.1782526%2C30.1662875_60.179282%2C30.1552917_60.1803113%2C30.1453267_60.180826%2C30.1353618_60.180826%2C30.1278022_60.1811691&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.1207741495%2C29.98090533%2C60.1936754783%2C30.37984637&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.1278022_60.1811691%2C30.1223043_60.1775664%2C30.1216171_60.1732773%2C30.1253969_60.1674442%2C30.1288331_60.1631552%2C30.1336437_60.1592093%2C30.1398289_60.1550918%2C30.1470448_60.1518322%2C30.1542608_60.1490872%2C30.1614768_60.1463422%2C30.1683492_60.1435972%2C30.1755652_60.1413669%2C30.1841556_60.1389651%2C30.1927461_60.1369063%2C30.2030547_60.1351907%2C30.2119887_60.1341614%2C30.2202356_60.1334751%2C30.2284824_60.1333036%2C30.2363856_60.1351907%2C30.2391346_60.1399944%2C30.2384474_60.144455%2C30.236042_60.1490872%2C30.2326058_60.1532047%2C30.2281388_60.1576653%2C30.2233281_60.162469%2C30.2161122_60.1669296%2C30.2092398_60.1696745%2C30.2020238_60.1720764%2C30.1927461_60.1746498%2C30.183812_60.1767085%2C30.1752216_60.1782526%2C30.1662875_60.179282%2C30.1552917_60.1803113%2C30.1453267_60.180826%2C30.1353618_60.180826%2C30.1278022_60.1811691&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsser){
  source <- read_html(linkCollectLwsser)
  print(linkCollectLwsser)
  
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
  lwsser

lwsser <- data.frame(lwsser)
county <- rep('lwsser', nrow(lwsser))
county <- as.factor(county)
lwsser <- cbind(lwsser, county)
lwsser%>% distinct() -> lwsser

## Собрать ссылки на объявления о продаже квартир на территории "Юкки - Лупполово" (id lwsyuk)

str_c("https://www.cian.ru/cat.php?bbox=60.09684371308551%2C30.078932429980423%2C60.16979822726774%2C30.477873470019496&center=60.13334125804076%2C30.278402949999972&deal_type=sale&engine_version=2&in_polygon[0]=30.2722178_60.155646%2C30.2636273_60.1542729%2C30.2584731_60.1503253%2C30.2546932_60.1446614%2C30.2536624_60.1398556%2C30.254006_60.1352215%2C30.2564113_60.1311023%2C30.2595039_60.1271547%2C30.2636273_60.1232071%2C30.2687816_60.1196027%2C30.2746231_60.1166849%2C30.2797774_60.112909%2C30.2869934_60.1108494%2C30.2952402_60.1111926%2C30.3021126_60.1141104%2C30.3031435_60.1190878%2C30.3024562_60.123722%2C30.3007381_60.1278412%2C30.2986764_60.132647%2C30.2962711_60.1379676%2C30.2935221_60.1427734%2C30.2904296_60.146721%2C30.2859625_60.150497%2C30.2811519_60.1539297%2C30.2735923_60.1558177%2C30.2722178_60.155646&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.09684371308551%2C30.078932429980423%2C60.16979822726774%2C30.477873470019496&center=60.13334125804076%2C30.278402949999972&deal_type=sale&engine_version=2&in_polygon[0]=30.2722178_60.155646%2C30.2636273_60.1542729%2C30.2584731_60.1503253%2C30.2546932_60.1446614%2C30.2536624_60.1398556%2C30.254006_60.1352215%2C30.2564113_60.1311023%2C30.2595039_60.1271547%2C30.2636273_60.1232071%2C30.2687816_60.1196027%2C30.2746231_60.1166849%2C30.2797774_60.112909%2C30.2869934_60.1108494%2C30.2952402_60.1111926%2C30.3021126_60.1141104%2C30.3031435_60.1190878%2C30.3024562_60.123722%2C30.3007381_60.1278412%2C30.2986764_60.132647%2C30.2962711_60.1379676%2C30.2935221_60.1427734%2C30.2904296_60.146721%2C30.2859625_60.150497%2C30.2811519_60.1539297%2C30.2735923_60.1558177%2C30.2722178_60.155646&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12"), function(linkCollectLwsyuk){
  source <- read_html(linkCollectLwsyuk)
  print(linkCollectLwsyuk)
  
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
  lwsyuk

lwsyuk <- data.frame(lwsyuk)
county <- rep('lwsyuk', nrow(lwsyuk))
county <- as.factor(county)
lwsyuk <- cbind(lwsyuk, county)
lwsyuk%>% distinct() -> lwsyuk

## Собрать ссылки на объявления о продаже квартир на территории "Стеклянный - Осельки - Гарболово" (id lwsste)

str_c("https://www.cian.ru/cat.php?bbox=60.1705378741%2C29.5767613699%2C60.4607300353%2C31.1725255301&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.3313475_60.4172612%2C30.2983601_60.4152115%2C30.254377_60.411112%2C30.2090193_60.4049628%2C30.173283_60.3940309%2C30.1540404_60.3783162%2C30.1554149_60.3571356%2C30.1691596_60.3414209%2C30.1884022_60.3263895%2C30.2103938_60.3086251%2C30.2365088_60.2963267%2C30.2653728_60.2840283%2C30.2997346_60.2696801%2C30.3244751_60.2580649%2C30.3505902_60.2450833%2C30.3753307_60.2341513%2C30.4000712_60.2225362%2C30.4303096_60.2143372%2C30.466046_60.2143372%2C30.4990333_60.2218529%2C30.5223994_60.2348346%2C30.5457654_60.2478163%2C30.5732549_60.2594314%2C30.5924976_60.2737796%2C30.5952465_60.2901775%2C30.5911231_60.3072586%2C30.5801273_60.3229733%2C30.5595102_60.3441539%2C30.5375186_60.3598686%2C30.5086546_60.3714837%2C30.4770417_60.3810492%2C30.4468033_60.3878816%2C30.411067_60.3953974%2C30.3794541_60.4042795%2C30.3505902_60.4124785%2C30.3313475_60.4172612&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.1705378741%2C29.5767613699%2C60.4607300353%2C31.1725255301&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.3313475_60.4172612%2C30.2983601_60.4152115%2C30.254377_60.411112%2C30.2090193_60.4049628%2C30.173283_60.3940309%2C30.1540404_60.3783162%2C30.1554149_60.3571356%2C30.1691596_60.3414209%2C30.1884022_60.3263895%2C30.2103938_60.3086251%2C30.2365088_60.2963267%2C30.2653728_60.2840283%2C30.2997346_60.2696801%2C30.3244751_60.2580649%2C30.3505902_60.2450833%2C30.3753307_60.2341513%2C30.4000712_60.2225362%2C30.4303096_60.2143372%2C30.466046_60.2143372%2C30.4990333_60.2218529%2C30.5223994_60.2348346%2C30.5457654_60.2478163%2C30.5732549_60.2594314%2C30.5924976_60.2737796%2C30.5952465_60.2901775%2C30.5911231_60.3072586%2C30.5801273_60.3229733%2C30.5595102_60.3441539%2C30.5375186_60.3598686%2C30.5086546_60.3714837%2C30.4770417_60.3810492%2C30.4468033_60.3878816%2C30.411067_60.3953974%2C30.3794541_60.4042795%2C30.3505902_60.4124785%2C30.3313475_60.4172612&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsste){
  source <- read_html(linkCollectLwsste)
  print(linkCollectLwsste)
  
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
  lwsste

lwsste <- data.frame(lwsste)
county <- rep('lwsste', nrow(lwsste))
county <- as.factor(county)
lwsste <- cbind(lwsste, county)
lwsste%>% distinct() -> lwsste

## Собрать ссылки на объявления о продаже квартир на территории "Агалатово - Скотное" (id lwsaga)

str_c("https://www.cian.ru/cat.php?bbox=60.1295395119%2C29.8354097913%2C60.2751411318%2C30.6332918713&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.2684594_60.2278844%2C30.2574636_60.2196549%2C30.2574636_60.2103968%2C30.2629615_60.2021674%2C30.2650232_60.1932521%2C30.2712084_60.1853656%2C30.2856404_60.1791935%2C30.3007596_60.1730214%2C30.3138171_60.1671922%2C30.3296235_60.1641062%2C30.3523023_60.1627346%2C30.3694833_60.1627346%2C30.3852897_60.1658206%2C30.3969727_60.1719927%2C30.4004089_60.1805651%2C30.3942238_60.1915377%2C30.3846025_60.1983955%2C30.3722322_60.2073108%2C30.3584875_60.2158831%2C30.3468044_60.2217123%2C30.3289363_60.2271986%2C30.3096936_60.229256%2C30.290451_60.229256%2C30.2732701_60.229256%2C30.2684594_60.2278844&object_type%5B0%5D=1&offer_type=flat&p=", 1:3, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.1295395119%2C29.8354097913%2C60.2751411318%2C30.6332918713&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.2684594_60.2278844%2C30.2574636_60.2196549%2C30.2574636_60.2103968%2C30.2629615_60.2021674%2C30.2650232_60.1932521%2C30.2712084_60.1853656%2C30.2856404_60.1791935%2C30.3007596_60.1730214%2C30.3138171_60.1671922%2C30.3296235_60.1641062%2C30.3523023_60.1627346%2C30.3694833_60.1627346%2C30.3852897_60.1658206%2C30.3969727_60.1719927%2C30.4004089_60.1805651%2C30.3942238_60.1915377%2C30.3846025_60.1983955%2C30.3722322_60.2073108%2C30.3584875_60.2158831%2C30.3468044_60.2217123%2C30.3289363_60.2271986%2C30.3096936_60.229256%2C30.290451_60.229256%2C30.2732701_60.229256%2C30.2684594_60.2278844&object_type%5B0%5D=1&offer_type=flat&p=", 1:3, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsaga){
  source <- read_html(linkCollectLwsaga)
  print(linkCollectLwsaga)
  
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
  lwsaga

lwsaga <- data.frame(lwsaga)
county <- rep('lwsaga', nrow(lwsaga))
county <- as.factor(county)
lwsaga <- cbind(lwsaga, county)
lwsaga%>% distinct() -> lwsaga

## Собрать ссылки на объявления о продаже квартир на территории "Токсово - Кузьмоловский - Энколово" (id lwstok)

str_c("https://www.cian.ru/cat.php?bbox=60.0613196497%2C30.08706696%2C60.2072242374%2C30.88494904&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5605732_60.1722667%2C30.5365199_60.1712368%2C30.5145283_60.1695202%2C30.4973474_60.168147%2C30.4739814_60.1650572%2C30.4499281_60.159221%2C30.4286237_60.1513249%2C30.41213_60.1441154%2C30.4018215_60.1362194%2C30.3983853_60.1242036%2C30.4052577_60.1159642%2C30.4162534_60.1077248%2C30.4320599_60.1005153%2C30.4513025_60.0981122%2C30.4726069_60.0970823%2C30.490475_60.0963956%2C30.5097177_60.0963956%2C30.5275858_60.0991421%2C30.5420178_60.104635%2C30.5509519_60.1118445%2C30.5585115_60.1200839%2C30.5660711_60.1303831%2C30.56882_60.1386225%2C30.5722562_60.1482351%2C30.5736307_60.1571611%2C30.5729435_60.1654005%2C30.5626349_60.1719234%2C30.5605732_60.1722667&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.0613196497%2C30.08706696%2C60.2072242374%2C30.88494904&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5605732_60.1722667%2C30.5365199_60.1712368%2C30.5145283_60.1695202%2C30.4973474_60.168147%2C30.4739814_60.1650572%2C30.4499281_60.159221%2C30.4286237_60.1513249%2C30.41213_60.1441154%2C30.4018215_60.1362194%2C30.3983853_60.1242036%2C30.4052577_60.1159642%2C30.4162534_60.1077248%2C30.4320599_60.1005153%2C30.4513025_60.0981122%2C30.4726069_60.0970823%2C30.490475_60.0963956%2C30.5097177_60.0963956%2C30.5275858_60.0991421%2C30.5420178_60.104635%2C30.5509519_60.1118445%2C30.5585115_60.1200839%2C30.5660711_60.1303831%2C30.56882_60.1386225%2C30.5722562_60.1482351%2C30.5736307_60.1571611%2C30.5729435_60.1654005%2C30.5626349_60.1719234%2C30.5605732_60.1722667&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwstok){
  source <- read_html(linkCollectLwstok)
  print(linkCollectLwstok)
  
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
  lwstok

lwstok <- data.frame(lwstok)
county <- rep('lwstok', nrow(lwstok))
county <- as.factor(county)
lwstok <- cbind(lwstok, county)
lwstok%>% distinct() -> lwstok

## Собрать ссылки на объявления о продаже квартир на территории "Бугры" (id lwsbug)

str_c("https://www.cian.ru/cat.php?bbox=60.0489431408%2C30.29930849%2C60.0854939168%2C30.49877901&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.3973256_60.0553095%2C30.4009336_60.0565136%2C30.4047134_60.0578037%2C30.4067751_60.0596099%2C30.4084932_60.061588%2C30.4093523_60.0642542%2C30.4112422_60.0663184%2C30.4127885_60.0686406%2C30.4133039_60.0709628%2C30.4133039_60.073371%2C30.4129603_60.0757792%2C30.4102113_60.0778433%2C30.4048852_60.0788754%2C30.4002464_60.0791334%2C30.3950921_60.0791334%2C30.3909687_60.0789614%2C30.3878761_60.0774993%2C30.3859862_60.0756072%2C30.385299_60.073371%2C30.3851272_60.0711348%2C30.3849554_60.0689846%2C30.3847836_60.0668344%2C30.3854708_60.0647703%2C30.3870171_60.0625341%2C30.3894224_60.0607279%2C30.3918277_60.0590078%2C30.3947485_60.0571157%2C30.3973256_60.0554815%2C30.3973256_60.0553095&object_type%5B0%5D=1&offer_type=flat&p=", 1:6, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.0489431408%2C30.29930849%2C60.0854939168%2C30.49877901&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.3973256_60.0553095%2C30.4009336_60.0565136%2C30.4047134_60.0578037%2C30.4067751_60.0596099%2C30.4084932_60.061588%2C30.4093523_60.0642542%2C30.4112422_60.0663184%2C30.4127885_60.0686406%2C30.4133039_60.0709628%2C30.4133039_60.073371%2C30.4129603_60.0757792%2C30.4102113_60.0778433%2C30.4048852_60.0788754%2C30.4002464_60.0791334%2C30.3950921_60.0791334%2C30.3909687_60.0789614%2C30.3878761_60.0774993%2C30.3859862_60.0756072%2C30.385299_60.073371%2C30.3851272_60.0711348%2C30.3849554_60.0689846%2C30.3847836_60.0668344%2C30.3854708_60.0647703%2C30.3870171_60.0625341%2C30.3894224_60.0607279%2C30.3918277_60.0590078%2C30.3947485_60.0571157%2C30.3973256_60.0554815%2C30.3973256_60.0553095&object_type%5B0%5D=1&offer_type=flat&p=", 1:6, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsbug){
  source <- read_html(linkCollectLwsbug)
  print(linkCollectLwsbug)
  
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
  lwsbug

lwsbug <- data.frame(lwsbug)
county <- rep('lwsbug', nrow(lwsbug))
county <- as.factor(county)
lwsbug <- cbind(lwsbug, county)
lwsbug%>% distinct() -> lwsbug

## Собрать ссылки на объявления о продаже квартир на территории "Западное Мурино" (id lwszap)

str_c("https://www.cian.ru/cat.php?bbox=60.0417353267%2C30.33312904%2C60.0782941105%2C30.53259956&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.425047_60.0708994%2C30.4216108_60.069523%2C30.4195491_60.0675443%2C30.417831_60.0656517%2C30.4162847_60.0636731%2C30.414223_60.0616944%2C30.4123331_60.0598018%2C30.4111304_60.0577372%2C30.411474_60.0556725%2C30.4118177_60.0536079%2C30.4119895_60.0514572%2C30.4143948_60.0497366%2C30.41869_60.0488763%2C30.4228135_60.0483602%2C30.4269369_60.047758%2C30.4308885_60.0469837%2C30.4348401_60.0462095%2C30.4386199_60.0471558%2C30.4413689_60.0487043%2C30.4430869_60.0505969%2C30.443946_60.0526615%2C30.4449768_60.0548122%2C30.4461795_60.0568769%2C30.4480694_60.0587695%2C30.4492721_60.0607481%2C30.4503029_60.0629849%2C30.4516774_60.0649635%2C30.4530519_60.0672002%2C30.4545982_60.0691789%2C30.4532237_60.0713295%2C30.4497875_60.07262%2C30.4456641_60.0737383%2C30.4415407_60.0738243%2C30.4363864_60.0738243%2C30.4324348_60.0732222%2C30.4284832_60.0721898%2C30.425047_60.0709854%2C30.425047_60.0708994&object_type%5B0%5D=1&offer_type=flat&p=", 1:47, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.0417353267%2C30.33312904%2C60.0782941105%2C30.53259956&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.425047_60.0708994%2C30.4216108_60.069523%2C30.4195491_60.0675443%2C30.417831_60.0656517%2C30.4162847_60.0636731%2C30.414223_60.0616944%2C30.4123331_60.0598018%2C30.4111304_60.0577372%2C30.411474_60.0556725%2C30.4118177_60.0536079%2C30.4119895_60.0514572%2C30.4143948_60.0497366%2C30.41869_60.0488763%2C30.4228135_60.0483602%2C30.4269369_60.047758%2C30.4308885_60.0469837%2C30.4348401_60.0462095%2C30.4386199_60.0471558%2C30.4413689_60.0487043%2C30.4430869_60.0505969%2C30.443946_60.0526615%2C30.4449768_60.0548122%2C30.4461795_60.0568769%2C30.4480694_60.0587695%2C30.4492721_60.0607481%2C30.4503029_60.0629849%2C30.4516774_60.0649635%2C30.4530519_60.0672002%2C30.4545982_60.0691789%2C30.4532237_60.0713295%2C30.4497875_60.07262%2C30.4456641_60.0737383%2C30.4415407_60.0738243%2C30.4363864_60.0738243%2C30.4324348_60.0732222%2C30.4284832_60.0721898%2C30.425047_60.0709854%2C30.425047_60.0708994&object_type%5B0%5D=1&offer_type=flat&p=", 1:47, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwszap){
  source <- read_html(linkCollectLwszap)
  print(linkCollectLwszap)
  
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
  lwszap

lwszap <- data.frame(lwszap)
county <- rep('lwszap', nrow(lwszap))
county <- as.factor(county)
lwszap <- cbind(lwszap, county)
lwszap%>% distinct() -> lwszap

## Собрать ссылки на объявления о продаже квартир на территории "Девяткино" (id lwsdew)

str_c("https://www.cian.ru/cat.php?bbox=60.0372253371%2C30.36421539%2C60.0737891312%2C30.56368591&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.4557897_60.0680707%2C30.460085_60.0682428%2C30.4648956_60.0678126%2C30.4690191_60.0671244%2C30.4731425_60.0659199%2C30.4769223_60.0644573%2C30.4807021_60.0631668%2C30.4843101_60.0615322%2C30.4865436_60.0596394%2C30.4879181_60.0576607%2C30.4887771_60.0555098%2C30.4886053_60.053445%2C30.4880899_60.050778%2C30.4851691_60.0493154%2C30.4812175_60.0485411%2C30.4770941_60.0480249%2C30.4724552_60.0486272%2C30.4685036_60.0494015%2C30.4643802_60.0493154%2C30.4595695_60.0487132%2C30.4556179_60.0477668%2C30.4520099_60.0466484%2C30.4485738_60.0454439%2C30.4451376_60.0439814%2C30.4417014_60.0427769%2C30.4391242_60.0444115%2C30.4404987_60.0463903%2C30.4425604_60.048283%2C30.4429041_60.0503478%2C30.4437631_60.0524126%2C30.4454812_60.0545635%2C30.4471993_60.0565422%2C30.4487456_60.058607%2C30.4496046_60.0606718%2C30.4509791_60.0626506%2C30.452869_60.0646294%2C30.4540717_60.0666082%2C30.4557897_60.0680707&object_type%5B0%5D=1&offer_type=flat&p=", 1:21, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.0372253371%2C30.36421539%2C60.0737891312%2C30.56368591&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.4557897_60.0680707%2C30.460085_60.0682428%2C30.4648956_60.0678126%2C30.4690191_60.0671244%2C30.4731425_60.0659199%2C30.4769223_60.0644573%2C30.4807021_60.0631668%2C30.4843101_60.0615322%2C30.4865436_60.0596394%2C30.4879181_60.0576607%2C30.4887771_60.0555098%2C30.4886053_60.053445%2C30.4880899_60.050778%2C30.4851691_60.0493154%2C30.4812175_60.0485411%2C30.4770941_60.0480249%2C30.4724552_60.0486272%2C30.4685036_60.0494015%2C30.4643802_60.0493154%2C30.4595695_60.0487132%2C30.4556179_60.0477668%2C30.4520099_60.0466484%2C30.4485738_60.0454439%2C30.4451376_60.0439814%2C30.4417014_60.0427769%2C30.4391242_60.0444115%2C30.4404987_60.0463903%2C30.4425604_60.048283%2C30.4429041_60.0503478%2C30.4437631_60.0524126%2C30.4454812_60.0545635%2C30.4471993_60.0565422%2C30.4487456_60.058607%2C30.4496046_60.0606718%2C30.4509791_60.0626506%2C30.452869_60.0646294%2C30.4540717_60.0666082%2C30.4557897_60.0680707&object_type%5B0%5D=1&offer_type=flat&p=", 1:21, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsdew){
  source <- read_html(linkCollectLwsdew)
  print(linkCollectLwsdew)
  
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
  lwsdew

lwsdew <- data.frame(lwsdew)
county <- rep('lwsdew', nrow(lwsdew))
county <- as.factor(county)
lwsdew <- cbind(lwsdew, county)
lwsdew%>% distinct() -> lwsdew

## Собрать ссылки на объявления о продаже квартир на территории "Восточное Мурино" (id lwswos)

str_c("https://spb.cian.ru/cat.php?bbox=60.0224940067%2C30.3274012842%2C60.0590741646%2C30.5268718042&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.4715658_60.0466831%2C30.4697618_60.0472425%2C30.467786_60.0475868%2C30.4657243_60.0480171%2C30.4637485_60.0483183%2C30.4616009_60.0482323%2C30.4595392_60.0477159%2C30.4574775_60.0469843%2C30.4553298_60.0462097%2C30.4527527_60.045306%2C30.4507769_60.0448757%2C30.4486293_60.0446605%2C30.4467394_60.0441871%2C30.4448495_60.0431974%2C30.4440763_60.0422076%2C30.4436468_60.0411748%2C30.4451072_60.0403572%2C30.4471689_60.0399268%2C30.4490588_60.0394104%2C30.4510346_60.0389371%2C30.4528386_60.0383776%2C30.4549003_60.0379903%2C30.4571338_60.0377321%2C30.4591096_60.0374309%2C30.4603123_60.0365702%2C30.461515_60.0356665%2C30.4621163_60.0346768%2C30.4640921_60.0340313%2C30.4662397_60.0340313%2C30.4689028_60.0341173%2C30.4700195_60.0353653%2C30.470535_60.0364842%2C30.4707927_60.0378182%2C30.4711363_60.0391953%2C30.4713081_60.0402711%2C30.471394_60.0416482%2C30.4718235_60.0430683%2C30.4718235_60.0442732%2C30.4719094_60.0454781%2C30.4718235_60.0465109%2C30.4715658_60.0466831&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=60.0224940067%2C30.3274012842%2C60.0590741646%2C30.5268718042&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.4715658_60.0466831%2C30.4697618_60.0472425%2C30.467786_60.0475868%2C30.4657243_60.0480171%2C30.4637485_60.0483183%2C30.4616009_60.0482323%2C30.4595392_60.0477159%2C30.4574775_60.0469843%2C30.4553298_60.0462097%2C30.4527527_60.045306%2C30.4507769_60.0448757%2C30.4486293_60.0446605%2C30.4467394_60.0441871%2C30.4448495_60.0431974%2C30.4440763_60.0422076%2C30.4436468_60.0411748%2C30.4451072_60.0403572%2C30.4471689_60.0399268%2C30.4490588_60.0394104%2C30.4510346_60.0389371%2C30.4528386_60.0383776%2C30.4549003_60.0379903%2C30.4571338_60.0377321%2C30.4591096_60.0374309%2C30.4603123_60.0365702%2C30.461515_60.0356665%2C30.4621163_60.0346768%2C30.4640921_60.0340313%2C30.4662397_60.0340313%2C30.4689028_60.0341173%2C30.4700195_60.0353653%2C30.470535_60.0364842%2C30.4707927_60.0378182%2C30.4711363_60.0391953%2C30.4713081_60.0402711%2C30.471394_60.0416482%2C30.4718235_60.0430683%2C30.4718235_60.0442732%2C30.4719094_60.0454781%2C30.4718235_60.0465109%2C30.4715658_60.0466831&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwswos){
  source <- read_html(linkCollectLwswos)
  print(linkCollectLwswos)
  
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
  lwswos

lwswos <- data.frame(lwswos)
county <- rep('lwswos', nrow(lwswos))
county <- as.factor(county)
lwswos <- cbind(lwswos, county)
lwswos%>% distinct() -> lwswos

## Собрать ссылки на объявления о продаже квартир на территории "Всеволожск - Бернгардовка" (id lwswse)

str_c("https://www.cian.ru/cat.php?bbox=59.9884999877%2C30.43777443%2C60.0616951411%2C30.83671547&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.6332933_60.0507704%2C30.6253901_60.0495648%2C30.6178305_60.0473258%2C30.6082092_60.0419866%2C30.6027113_60.0388864%2C30.5972134_60.0350973%2C30.5913719_60.0313083%2C30.585874_60.0271747%2C30.5814069_60.0220078%2C30.5803761_60.0178742%2C30.5810633_60.0128795%2C30.5834686_60.0087459%2C30.5879357_60.0047846%2C30.5951517_60.0020289%2C30.6027113_59.9999621%2C30.6126762_59.9994454%2C30.6219539_60.0003066%2C30.6343242_60.0020289%2C30.6439455_60.0037512%2C30.6532232_60.0051291%2C30.66147_60.0065069%2C30.6710914_60.0077125%2C30.6796818_60.0084015%2C30.6868978_60.0109849%2C30.6917085_60.0151185%2C30.6920521_60.0192521%2C30.6941138_60.0237301%2C30.6941138_60.0280359%2C30.6910212_60.0321694%2C30.6851797_60.0359585%2C30.675902_60.0364752%2C30.6666243_60.0369919%2C30.6587211_60.0388864%2C30.652536_60.0425033%2C30.6473817_60.0459479%2C30.6408529_60.0485314%2C30.6336369_60.0505982%2C30.6332933_60.0507704&object_type%5B0%5D=1&offer_type=flat&p=", 1:10, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.9884999877%2C30.43777443%2C60.0616951411%2C30.83671547&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.6332933_60.0507704%2C30.6253901_60.0495648%2C30.6178305_60.0473258%2C30.6082092_60.0419866%2C30.6027113_60.0388864%2C30.5972134_60.0350973%2C30.5913719_60.0313083%2C30.585874_60.0271747%2C30.5814069_60.0220078%2C30.5803761_60.0178742%2C30.5810633_60.0128795%2C30.5834686_60.0087459%2C30.5879357_60.0047846%2C30.5951517_60.0020289%2C30.6027113_59.9999621%2C30.6126762_59.9994454%2C30.6219539_60.0003066%2C30.6343242_60.0020289%2C30.6439455_60.0037512%2C30.6532232_60.0051291%2C30.66147_60.0065069%2C30.6710914_60.0077125%2C30.6796818_60.0084015%2C30.6868978_60.0109849%2C30.6917085_60.0151185%2C30.6920521_60.0192521%2C30.6941138_60.0237301%2C30.6941138_60.0280359%2C30.6910212_60.0321694%2C30.6851797_60.0359585%2C30.675902_60.0364752%2C30.6666243_60.0369919%2C30.6587211_60.0388864%2C30.652536_60.0425033%2C30.6473817_60.0459479%2C30.6408529_60.0485314%2C30.6336369_60.0505982%2C30.6332933_60.0507704&object_type%5B0%5D=1&offer_type=flat&p=", 1:10, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwswse){
  source <- read_html(linkCollectLwswse)
  print(linkCollectLwswse)
  
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
  lwswse

lwswse <- data.frame(lwswse)
county <- rep('lwswse', nrow(lwswse))
county <- as.factor(county)
lwswse <- cbind(lwswse, county)
lwswse%>% distinct() -> lwswse

## Собрать ссылки на объявления о продаже квартир на территории "Романовка - Щеглово" (id lwsrom)

str_c("https://www.cian.ru/cat.php?bbox=59.9906689624%2C30.53831098%2C60.0638593008%2C30.93725202&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.7975711_60.0041118%2C30.8061616_60.0060063%2C30.8085669_60.0101396%2C30.8061616_60.0146175%2C30.8023817_60.0184064%2C30.7948221_60.0230565%2C30.7882934_60.0282232%2C30.7845136_60.0332177%2C30.781421_60.0371788%2C30.7745487_60.0406233%2C30.7645837_60.04269%2C30.7563369_60.0444123%2C30.7474028_60.0456178%2C30.7384687_60.0469956%2C30.7309091_60.0487179%2C30.721975_60.0502679%2C30.7130409_60.0509568%2C30.7034196_60.0506123%2C30.6944856_60.049579%2C30.6855515_60.0482012%2C30.6773046_60.0457901%2C30.6714631_60.0428622%2C30.6669961_60.0392455%2C30.6714631_60.0356288%2C30.6800536_60.0354566%2C30.6893313_60.0354566%2C30.6975781_60.0351122%2C30.7061686_60.0351122%2C30.7144154_60.0347677%2C30.7089175_60.0314954%2C30.7017015_60.0283954%2C30.6992962_60.024262%2C30.7082303_60.0234009%2C30.7164771_60.0225398%2C30.7250676_60.0206453%2C30.7326272_60.0185786%2C30.739156_60.0153064%2C30.7460283_60.012723%2C30.7525571_60.0099674%2C30.7604603_60.0075563%2C30.7714561_60.005834%2C30.781421_60.0056618%2C30.7900115_60.0053174%2C30.7975711_60.0035951%2C30.7975711_60.0041118&object_type%5B0%5D=1&offer_type=flat&p=", 1:3, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.9906689624%2C30.53831098%2C60.0638593008%2C30.93725202&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.7975711_60.0041118%2C30.8061616_60.0060063%2C30.8085669_60.0101396%2C30.8061616_60.0146175%2C30.8023817_60.0184064%2C30.7948221_60.0230565%2C30.7882934_60.0282232%2C30.7845136_60.0332177%2C30.781421_60.0371788%2C30.7745487_60.0406233%2C30.7645837_60.04269%2C30.7563369_60.0444123%2C30.7474028_60.0456178%2C30.7384687_60.0469956%2C30.7309091_60.0487179%2C30.721975_60.0502679%2C30.7130409_60.0509568%2C30.7034196_60.0506123%2C30.6944856_60.049579%2C30.6855515_60.0482012%2C30.6773046_60.0457901%2C30.6714631_60.0428622%2C30.6669961_60.0392455%2C30.6714631_60.0356288%2C30.6800536_60.0354566%2C30.6893313_60.0354566%2C30.6975781_60.0351122%2C30.7061686_60.0351122%2C30.7144154_60.0347677%2C30.7089175_60.0314954%2C30.7017015_60.0283954%2C30.6992962_60.024262%2C30.7082303_60.0234009%2C30.7164771_60.0225398%2C30.7250676_60.0206453%2C30.7326272_60.0185786%2C30.739156_60.0153064%2C30.7460283_60.012723%2C30.7525571_60.0099674%2C30.7604603_60.0075563%2C30.7714561_60.005834%2C30.781421_60.0056618%2C30.7900115_60.0053174%2C30.7975711_60.0035951%2C30.7975711_60.0041118&object_type%5B0%5D=1&offer_type=flat&p=", 1:3, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsrom){
  source <- read_html(linkCollectLwsrom)
  print(linkCollectLwsrom)
  
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
  lwsrom

lwsrom <- data.frame(lwsrom)
county <- rep('lwsrom', nrow(lwsrom))
county <- as.factor(county)
lwsrom <- cbind(lwsrom, county)
lwsrom%>% distinct() -> lwsrom

## Собрать ссылки на объявления о продаже квартир на территории "Углово - Рахья" (id lwsugl)

str_c("https://www.cian.ru/cat.php?bbox=60.052162194728105%2C30.581674579980415%2C60.12521598049412%2C30.98061562001949&center=60.08870939426276%2C30.78114509999994&deal_type=sale&engine_version=2&in_polygon[0]=30.7096724_60.0577393%2C30.7289151_60.0563637%2C30.746096_60.0543004%2C30.7632769_60.0525809%2C30.7811451_60.0525809%2C30.801075_60.0525809%2C30.8175686_60.0539565%2C30.8381858_60.0560198%2C30.8539922_60.0587709%2C30.8697987_60.0635854%2C30.876671_60.0732144%2C30.8732348_60.0828434%2C30.8677369_60.0914407%2C30.8629263_60.1007257%2C30.8588029_60.1089791%2C30.8457454_60.1148253%2C30.8313134_60.1203276%2C30.8161942_60.1237665%2C30.7955771_60.1247982%2C30.7790834_60.1244543%2C30.7612152_60.122047%2C30.7412853_60.1186081%2C30.7234172_60.1137936%2C30.7096724_60.1086353%2C30.693866_60.0983185%2C30.6856192_60.0883456%2C30.6856192_60.0797483%2C30.6918043_60.0697755%2C30.7028001_60.0628976%2C30.7096724_60.0577393&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.052162194728105%2C30.581674579980415%2C60.12521598049412%2C30.98061562001949&center=60.08870939426276%2C30.78114509999994&deal_type=sale&engine_version=2&in_polygon[0]=30.7096724_60.0577393%2C30.7289151_60.0563637%2C30.746096_60.0543004%2C30.7632769_60.0525809%2C30.7811451_60.0525809%2C30.801075_60.0525809%2C30.8175686_60.0539565%2C30.8381858_60.0560198%2C30.8539922_60.0587709%2C30.8697987_60.0635854%2C30.876671_60.0732144%2C30.8732348_60.0828434%2C30.8677369_60.0914407%2C30.8629263_60.1007257%2C30.8588029_60.1089791%2C30.8457454_60.1148253%2C30.8313134_60.1203276%2C30.8161942_60.1237665%2C30.7955771_60.1247982%2C30.7790834_60.1244543%2C30.7612152_60.122047%2C30.7412853_60.1186081%2C30.7234172_60.1137936%2C30.7096724_60.1086353%2C30.693866_60.0983185%2C30.6856192_60.0883456%2C30.6856192_60.0797483%2C30.6918043_60.0697755%2C30.7028001_60.0628976%2C30.7096724_60.0577393&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12"), function(linkCollectLwsugl){
  source <- read_html(linkCollectLwsugl)
  print(linkCollectLwsugl)
  
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
  lwsugl

lwsugl <- data.frame(lwsugl)
county <- rep('lwsugl', nrow(lwsugl))
county <- as.factor(county)
lwsugl <- cbind(lwsugl, county)
lwsugl%>% distinct() -> lwsugl

## Собрать ссылки на объявления о продаже квартир на территории "Борисова Грива - Ваганово" (id lwsbor)

str_c("https://www.cian.ru/cat.php?bbox=60.02163038149947%2C30.629016859960924%2C60.16771113931067%2C31.426898940039045&center=60.09475197683335%2C31.027957899999997&deal_type=sale&engine_version=2&in_polygon[0]=30.9499565_60.0622159%2C30.965763_60.0594639%2C30.9815694_60.056368%2C31.0001248_60.055336%2C31.0193675_60.055336%2C31.0358611_60.05568%2C31.0523548_60.054992%2C31.0681613_60.0525841%2C31.0853422_60.0512081%2C31.1059593_60.0529281%2C31.1148934_60.0608399%2C31.1155806_60.0701277%2C31.1155806_60.0831994%2C31.1155806_60.0938632%2C31.108021_60.103839%2C31.0970252_60.1117508%2C31.084655_60.1210386%2C31.0743464_60.1282624%2C31.0647251_60.1351423%2C31.044108_60.1382382%2C31.0255526_60.1378942%2C31.0049355_60.1344543%2C30.9877546_60.1299824%2C30.9650757_60.1241345%2C30.9478948_60.1179427%2C30.9403352_60.1103748%2C30.9451459_60.0990231%2C30.9527055_60.0893913%2C30.9520182_60.0801035%2C30.9485821_60.0718477%2C30.951331_60.0632479%2C30.9499565_60.0622159&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=60.02163038149947%2C30.629016859960924%2C60.16771113931067%2C31.426898940039045&center=60.09475197683335%2C31.027957899999997&deal_type=sale&engine_version=2&in_polygon[0]=30.9499565_60.0622159%2C30.965763_60.0594639%2C30.9815694_60.056368%2C31.0001248_60.055336%2C31.0193675_60.055336%2C31.0358611_60.05568%2C31.0523548_60.054992%2C31.0681613_60.0525841%2C31.0853422_60.0512081%2C31.1059593_60.0529281%2C31.1148934_60.0608399%2C31.1155806_60.0701277%2C31.1155806_60.0831994%2C31.1155806_60.0938632%2C31.108021_60.103839%2C31.0970252_60.1117508%2C31.084655_60.1210386%2C31.0743464_60.1282624%2C31.0647251_60.1351423%2C31.044108_60.1382382%2C31.0255526_60.1378942%2C31.0049355_60.1344543%2C30.9877546_60.1299824%2C30.9650757_60.1241345%2C30.9478948_60.1179427%2C30.9403352_60.1103748%2C30.9451459_60.0990231%2C30.9527055_60.0893913%2C30.9520182_60.0801035%2C30.9485821_60.0718477%2C30.951331_60.0632479%2C30.9499565_60.0622159&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11"), function(linkCollectLwsbor){
  source <- read_html(linkCollectLwsbor)
  print(linkCollectLwsbor)
  
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
  lwsbor

lwsbor <- data.frame(lwsbor)
county <- rep('lwsbor', nrow(lwsbor))
county <- as.factor(county)
lwsbor <- cbind(lwsbor, county)
lwsbor%>% distinct() -> lwsbor

## Собрать ссылки на объявления о продаже квартир на территории "Посёлок имени Морозова" (id lwsmor)

str_c("https://www.cian.ru/cat.php?bbox=59.92610567834318%2C30.81974702998045%2C59.99943929892507%2C31.218688070019525&center=59.96279284802914%2C31.01921755&deal_type=sale&engine_version=2&in_polygon[0]=30.9927589_59.9396598%2C30.9992877_59.9422484%2C31.0068473_59.9450096%2C31.0150941_59.9474256%2C31.0229973_59.9496691%2C31.0274644_59.9534657%2C31.032275_59.9576075%2C31.0391474_59.9601961%2C31.046707_59.9620944%2C31.0546102_59.9646831%2C31.0621699_59.9669265%2C31.0690422_59.9700329%2C31.0666369_59.9752101%2C31.0597645_59.9791793%2C31.0522049_59.9819405%2C31.0429272_59.9840114%2C31.0333059_59.9855646%2C31.0223101_59.9859097%2C31.0085654_59.9857371%2C30.9992877_59.9845291%2C30.9906972_59.9828034%2C30.9845121_59.9800422%2C30.9772961_59.9745198%2C30.9738599_59.970378%2C30.9704237_59.9646831%2C30.9693929_59.9603687%2C30.9700801_59.9560543%2C30.9745471_59.9524303%2C30.9821068_59.9481159%2C30.9879483_59.943629%2C30.9927589_59.9401775%2C30.9927589_59.9396598&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.92610567834318%2C30.81974702998045%2C59.99943929892507%2C31.218688070019525&center=59.96279284802914%2C31.01921755&deal_type=sale&engine_version=2&in_polygon[0]=30.9927589_59.9396598%2C30.9992877_59.9422484%2C31.0068473_59.9450096%2C31.0150941_59.9474256%2C31.0229973_59.9496691%2C31.0274644_59.9534657%2C31.032275_59.9576075%2C31.0391474_59.9601961%2C31.046707_59.9620944%2C31.0546102_59.9646831%2C31.0621699_59.9669265%2C31.0690422_59.9700329%2C31.0666369_59.9752101%2C31.0597645_59.9791793%2C31.0522049_59.9819405%2C31.0429272_59.9840114%2C31.0333059_59.9855646%2C31.0223101_59.9859097%2C31.0085654_59.9857371%2C30.9992877_59.9845291%2C30.9906972_59.9828034%2C30.9845121_59.9800422%2C30.9772961_59.9745198%2C30.9738599_59.970378%2C30.9704237_59.9646831%2C30.9693929_59.9603687%2C30.9700801_59.9560543%2C30.9745471_59.9524303%2C30.9821068_59.9481159%2C30.9879483_59.943629%2C30.9927589_59.9401775%2C30.9927589_59.9396598&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12"), function(linkCollectLwsmor){
  source <- read_html(linkCollectLwsmor)
  print(linkCollectLwsmor)
  
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
  lwsmor

lwsmor <- data.frame(lwsmor)
county <- rep('lwsmor', nrow(lwsmor))
county <- as.factor(county)
lwsmor <- cbind(lwsmor, county)
lwsmor%>% distinct() -> lwsmor

## Собрать ссылки на объявления о продаже квартир на территории "Кальтино" (id lwskal)

str_c("https://www.cian.ru/cat.php?bbox=59.9667481863%2C30.56331659%2C60.0033902463%2C30.76278711&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.6618492_60.0016249%2C30.6529151_60.0011076%2C30.6450119_59.999728%2C30.6384832_59.9971413%2C30.6319544_59.9938649%2C30.6288618_59.9893813%2C30.6292055_59.9852426%2C30.6316108_59.9805866%2C30.6360778_59.9767928%2C30.6415757_59.9733439%2C30.6481045_59.9707572%2C30.6560077_59.9692052%2C30.6642545_59.9685154%2C30.6735322_59.9697225%2C30.6821227_59.9719643%2C30.6900259_59.9747234%2C30.6955238_59.9781724%2C30.6972419_59.9828284%2C30.6955238_59.9871395%2C30.691744_59.9914506%2C30.6865897_59.9952444%2C30.680061_59.998176%2C30.6725014_60.0000729%2C30.6645982_60.00128%2C30.6618492_60.0016249&object_type%5B0%5D=1&offer_type=flat&p=", 1:6, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.9667481863%2C30.56331659%2C60.0033902463%2C30.76278711&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.6618492_60.0016249%2C30.6529151_60.0011076%2C30.6450119_59.999728%2C30.6384832_59.9971413%2C30.6319544_59.9938649%2C30.6288618_59.9893813%2C30.6292055_59.9852426%2C30.6316108_59.9805866%2C30.6360778_59.9767928%2C30.6415757_59.9733439%2C30.6481045_59.9707572%2C30.6560077_59.9692052%2C30.6642545_59.9685154%2C30.6735322_59.9697225%2C30.6821227_59.9719643%2C30.6900259_59.9747234%2C30.6955238_59.9781724%2C30.6972419_59.9828284%2C30.6955238_59.9871395%2C30.691744_59.9914506%2C30.6865897_59.9952444%2C30.680061_59.998176%2C30.6725014_60.0000729%2C30.6645982_60.00128%2C30.6618492_60.0016249&object_type%5B0%5D=1&offer_type=flat&p=", 1:6, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwskal){
  source <- read_html(linkCollectLwskal)
  print(linkCollectLwskal)
  
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
  lwskal

lwskal <- data.frame(lwskal)
county <- rep('lwskal', nrow(lwskal))
county <- as.factor(county)
lwskal <- cbind(lwskal, county)
lwskal%>% distinct() -> lwskal

## Собрать ссылки на объявления о продаже квартир на территории "Янино-1" (id lwsyan)

str_c("https://spb.cian.ru/cat.php?bbox=59.9400851366%2C30.48163449%2C59.9767567923%2C30.68110501&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5760437_59.9703359%2C30.5698585_59.9670557%2C30.5633298_59.9636029%2C30.5554266_59.9599774%2C30.5499287_59.9566972%2C30.5475233_59.9522085%2C30.5468361_59.9478925%2C30.5547393_59.9459934%2C30.5636734_59.9459934%2C30.5719203_59.9463387%2C30.5801671_59.9459934%2C30.5884139_59.9458208%2C30.5970044_59.9473746%2C30.604564_59.9508274%2C30.6121236_59.9542802%2C30.6159034_59.9580783%2C30.6145289_59.9623944%2C30.6100619_59.9661925%2C30.6038768_59.9694727%2C30.5935682_59.9710265%2C30.5839469_59.9708538%2C30.5760437_59.9703359&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.9400851366%2C30.48163449%2C59.9767567923%2C30.68110501&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5760437_59.9703359%2C30.5698585_59.9670557%2C30.5633298_59.9636029%2C30.5554266_59.9599774%2C30.5499287_59.9566972%2C30.5475233_59.9522085%2C30.5468361_59.9478925%2C30.5547393_59.9459934%2C30.5636734_59.9459934%2C30.5719203_59.9463387%2C30.5801671_59.9459934%2C30.5884139_59.9458208%2C30.5970044_59.9473746%2C30.604564_59.9508274%2C30.6121236_59.9542802%2C30.6159034_59.9580783%2C30.6145289_59.9623944%2C30.6100619_59.9661925%2C30.6038768_59.9694727%2C30.5935682_59.9710265%2C30.5839469_59.9708538%2C30.5760437_59.9703359&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsyan){
  source <- read_html(linkCollectLwsyan)
  print(linkCollectLwsyan)
  
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
  lwsyan

lwsyan <- data.frame(lwsyan)
county <- rep('lwsyan', nrow(lwsyan))
county <- as.factor(county)
lwsyan <- cbind(lwsyan, county)
lwsyan%>% distinct() -> lwsyan

## Собрать ссылки на объявления о продаже квартир на территории "Колтуши - Аро - Янино-2" (id lwskol)

str_c("https://www.cian.ru/cat.php?bbox=59.9144493161%2C30.53825384%2C59.95114942%2C30.73772436&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.6322335_59.9445475%2C30.6274228_59.9431657%2C30.6234712_59.942043%2C30.619176_59.9407476%2C30.6152244_59.9395385%2C30.61196_59.9382431%2C30.6095546_59.9362567%2C30.608352_59.934184%2C30.6081802_59.932025%2C30.6093828_59.9297795%2C30.6109291_59.9275341%2C30.6138499_59.9260659%2C30.6174579_59.9249432%2C30.6208941_59.9237342%2C30.6246739_59.9224387%2C30.6293127_59.9214887%2C30.6346388_59.9208842%2C30.6391058_59.9207115%2C30.6435729_59.9207115%2C30.6485553_59.9207115%2C30.6531942_59.9211433%2C30.6571458_59.9218342%2C30.661441_59.9226978%2C30.6643618_59.9243387%2C30.66419_59.9264978%2C30.66419_59.9287432%2C30.66419_59.9309022%2C30.665049_59.9330613%2C30.6653926_59.9352204%2C30.667798_59.9369476%2C30.6672826_59.9392794%2C30.6631591_59.9409203%2C30.6583485_59.9421294%2C30.654225_59.9431657%2C30.6495862_59.9440293%2C30.645291_59.9447202%2C30.6397931_59.944893%2C30.6349824_59.944893%2C30.6322335_59.9445475&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.9144493161%2C30.53825384%2C59.95114942%2C30.73772436&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.6322335_59.9445475%2C30.6274228_59.9431657%2C30.6234712_59.942043%2C30.619176_59.9407476%2C30.6152244_59.9395385%2C30.61196_59.9382431%2C30.6095546_59.9362567%2C30.608352_59.934184%2C30.6081802_59.932025%2C30.6093828_59.9297795%2C30.6109291_59.9275341%2C30.6138499_59.9260659%2C30.6174579_59.9249432%2C30.6208941_59.9237342%2C30.6246739_59.9224387%2C30.6293127_59.9214887%2C30.6346388_59.9208842%2C30.6391058_59.9207115%2C30.6435729_59.9207115%2C30.6485553_59.9207115%2C30.6531942_59.9211433%2C30.6571458_59.9218342%2C30.661441_59.9226978%2C30.6643618_59.9243387%2C30.66419_59.9264978%2C30.66419_59.9287432%2C30.66419_59.9309022%2C30.665049_59.9330613%2C30.6653926_59.9352204%2C30.667798_59.9369476%2C30.6672826_59.9392794%2C30.6631591_59.9409203%2C30.6583485_59.9421294%2C30.654225_59.9431657%2C30.6495862_59.9440293%2C30.645291_59.9447202%2C30.6397931_59.944893%2C30.6349824_59.944893%2C30.6322335_59.9445475&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwskol){
  source <- read_html(linkCollectLwskol)
  print(linkCollectLwskol)
  
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
  lwskol

lwskol <- data.frame(lwskol)
county <- rep('lwskol', nrow(lwskol))
county <- as.factor(county)
lwskol <- cbind(lwskol, county)
lwskol%>% distinct() -> lwskol

## Собрать ссылки на объявления о продаже квартир на территории "Воейково - Кирполье" (id lwswoe)

str_c("https://www.cian.ru/cat.php?bbox=59.93763406807711%2C30.650851564453074%2C59.955631984512976%2C30.75058682446282&center=59.94663425181966%2C30.70071919445796&deal_type=sale&engine_version=2&in_polygon[0]=30.7184171_59.9568359%2C30.7141219_59.9568359%2C30.7084522_59.9568359%2C30.7038133_59.956922%2C30.698659_59.956922%2C30.6935047_59.956922%2C30.6892095_59.956922%2C30.6843989_59.9567498%2C30.6799318_59.9560608%2C30.6763238_59.9545968%2C30.6744339_59.95253%2C30.6739185_59.9502047%2C30.6742621_59.9478795%2C30.6746057_59.9458127%2C30.6749494_59.9437458%2C30.6766674_59.941679%2C30.6775265_59.9396121%2C30.6787292_59.937373%2C30.6807909_59.9352201%2C30.6831962_59.9331532%2C30.6856015_59.9313447%2C30.6874914_59.9291056%2C30.6902404_59.9272971%2C30.7005489_59.9271249%2C30.7048442_59.9277277%2C30.7099984_59.9282445%2C30.7141219_59.9285028%2C30.7187607_59.9288473%2C30.7225405_59.9303113%2C30.723915_59.934445%2C30.723915_59.9371147%2C30.7209942_59.9410762%2C30.7194479_59.9444348%2C30.7192761_59.9471906%2C30.7192761_59.949688%2C30.7184171_59.951841%2C30.7179017_59.953994%2C30.7179017_59.9561469%2C30.7184171_59.9568359&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=14")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.93763406807711%2C30.650851564453074%2C59.955631984512976%2C30.75058682446282&center=59.94663425181966%2C30.70071919445796&deal_type=sale&engine_version=2&in_polygon[0]=30.7184171_59.9568359%2C30.7141219_59.9568359%2C30.7084522_59.9568359%2C30.7038133_59.956922%2C30.698659_59.956922%2C30.6935047_59.956922%2C30.6892095_59.956922%2C30.6843989_59.9567498%2C30.6799318_59.9560608%2C30.6763238_59.9545968%2C30.6744339_59.95253%2C30.6739185_59.9502047%2C30.6742621_59.9478795%2C30.6746057_59.9458127%2C30.6749494_59.9437458%2C30.6766674_59.941679%2C30.6775265_59.9396121%2C30.6787292_59.937373%2C30.6807909_59.9352201%2C30.6831962_59.9331532%2C30.6856015_59.9313447%2C30.6874914_59.9291056%2C30.6902404_59.9272971%2C30.7005489_59.9271249%2C30.7048442_59.9277277%2C30.7099984_59.9282445%2C30.7141219_59.9285028%2C30.7187607_59.9288473%2C30.7225405_59.9303113%2C30.723915_59.934445%2C30.723915_59.9371147%2C30.7209942_59.9410762%2C30.7194479_59.9444348%2C30.7192761_59.9471906%2C30.7192761_59.949688%2C30.7184171_59.951841%2C30.7179017_59.953994%2C30.7179017_59.9561469%2C30.7184171_59.9568359&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=14"), function(linkCollectLwswoe){
  source <- read_html(linkCollectLwswoe)
  print(linkCollectLwswoe)
  
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
  lwswoe

lwswoe <- data.frame(lwswoe)
county <- rep('lwswoe', nrow(lwswoe))
county <- as.factor(county)
lwswoe <- cbind(lwswoe, county)
lwswoe%>% distinct() -> lwswoe

## Собрать ссылки на объявления о продаже квартир на территории "Разметелево - Хапо-Ое" (id lwsraz)

str_c("https://www.cian.ru/cat.php?bbox=59.85851012102235%2C30.509613929980404%2C59.93061518615495%2C30.908554970019477&center=59.89458228284545%2C30.709084449999928&deal_type=sale&engine_version=2&in_polygon[0]=30.7561602_59.9063066%2C30.7465389_59.9132079%2C30.7286707_59.9159684%2C30.7101153_59.9170036%2C30.6915599_59.9173487%2C30.674379_59.9173487%2C30.6571981_59.9145882%2C30.648264_59.9073418%2C30.6530747_59.8983701%2C30.6633832_59.8897435%2C30.6798769_59.8821521%2C30.700494_59.875941%2C30.7163005_59.8731804%2C30.7327941_59.8721452%2C30.7492878_59.8718002%2C30.7699049_59.876286%2C30.7692177_59.8852577%2C30.7650943_59.8938843%2C30.7630326_59.9021658%2C30.7561602_59.9063066&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.85851012102235%2C30.509613929980404%2C59.93061518615495%2C30.908554970019477&center=59.89458228284545%2C30.709084449999928&deal_type=sale&engine_version=2&in_polygon[0]=30.7561602_59.9063066%2C30.7465389_59.9132079%2C30.7286707_59.9159684%2C30.7101153_59.9170036%2C30.6915599_59.9173487%2C30.674379_59.9173487%2C30.6571981_59.9145882%2C30.648264_59.9073418%2C30.6530747_59.8983701%2C30.6633832_59.8897435%2C30.6798769_59.8821521%2C30.700494_59.875941%2C30.7163005_59.8731804%2C30.7327941_59.8721452%2C30.7492878_59.8718002%2C30.7699049_59.876286%2C30.7692177_59.8852577%2C30.7650943_59.8938843%2C30.7630326_59.9021658%2C30.7561602_59.9063066&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12"), function(linkCollectLwsraz){
  source <- read_html(linkCollectLwsraz)
  print(linkCollectLwsraz)
  
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
  lwsraz

lwsraz <- data.frame(lwsraz)
county <- rep('lwsraz', nrow(lwsraz))
county <- as.factor(county)
lwsraz <- cbind(lwsraz, county)
lwsraz%>% distinct() -> lwsraz

## Собрать ссылки на объявления о продаже квартир на территории "Дубровка" (id lwsdub)

str_c("https://www.cian.ru/cat.php?bbox=59.8102297974%2C30.70939373%2C59.883820349%2C31.10833477&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.9576581_59.8586371%2C30.9411644_59.8600224%2C30.9274197_59.8652174%2C30.9102388_59.8676417%2C30.8937451_59.8707587%2C30.8772514_59.8735294%2C30.8600705_59.8707587%2C30.8593832_59.8607151%2C30.8655684_59.8499787%2C30.8751897_59.8430521%2C30.8896217_59.8368181%2C30.9013047_59.8309304%2C30.9143622_59.8257354%2C30.9274197_59.8205404%2C30.9397899_59.8260817%2C30.9439134_59.8350864%2C30.9446006_59.8433984%2C30.948724_59.8517104%2C30.9583453_59.8586371%2C30.9576581_59.8586371&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.8102297974%2C30.70939373%2C59.883820349%2C31.10833477&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.9576581_59.8586371%2C30.9411644_59.8600224%2C30.9274197_59.8652174%2C30.9102388_59.8676417%2C30.8937451_59.8707587%2C30.8772514_59.8735294%2C30.8600705_59.8707587%2C30.8593832_59.8607151%2C30.8655684_59.8499787%2C30.8751897_59.8430521%2C30.8896217_59.8368181%2C30.9013047_59.8309304%2C30.9143622_59.8257354%2C30.9274197_59.8205404%2C30.9397899_59.8260817%2C30.9439134_59.8350864%2C30.9446006_59.8433984%2C30.948724_59.8517104%2C30.9583453_59.8586371%2C30.9576581_59.8586371&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsdub){
  source <- read_html(linkCollectLwsdub)
  print(linkCollectLwsdub)
  
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
  lwsdub

lwsdub <- data.frame(lwsdub)
county <- rep('lwsdub', nrow(lwsdub))
county <- as.factor(county)
lwsdub <- cbind(lwsdub, county)
lwsdub%>% distinct() -> lwsdub

## Собрать ссылки на объявления о продаже квартир на территории "Заневка" (id lwszan)

str_c("https://spb.cian.ru/cat.php?bbox=59.91653067987587%2C30.446542089990185%2C59.953228474370455%2C30.646012610009734&center=59.93488466988165%2C30.54627734999996&deal_type=sale&engine_version=2&in_polygon[0]=30.5083075_59.9453334%2C30.5210214_59.9453334%2C30.5302991_59.9453334%2C30.5385459_59.9458516%2C30.5471364_59.9458516%2C30.5560705_59.9458516%2C30.5653482_59.9456788%2C30.5732514_59.9444697%2C30.5804674_59.9415332%2C30.585278_59.9375602%2C30.5876834_59.9335873%2C30.5866525_59.9292689%2C30.5814982_59.9258142%2C30.5725642_59.9239141%2C30.561912_59.9239141%2C30.5536651_59.9242596%2C30.5454183_59.9247778%2C30.5364842_59.9254687%2C30.5275501_59.9270233%2C30.5193033_59.9289234%2C30.5120873_59.9309963%2C30.5052149_59.9334146%2C30.5048713_59.9375602%2C30.5072766_59.9415332%2C30.5076203_59.9456788%2C30.5083075_59.9453334&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.91653067987587%2C30.446542089990185%2C59.953228474370455%2C30.646012610009734&center=59.93488466988165%2C30.54627734999996&deal_type=sale&engine_version=2&in_polygon[0]=30.5083075_59.9453334%2C30.5210214_59.9453334%2C30.5302991_59.9453334%2C30.5385459_59.9458516%2C30.5471364_59.9458516%2C30.5560705_59.9458516%2C30.5653482_59.9456788%2C30.5732514_59.9444697%2C30.5804674_59.9415332%2C30.585278_59.9375602%2C30.5876834_59.9335873%2C30.5866525_59.9292689%2C30.5814982_59.9258142%2C30.5725642_59.9239141%2C30.561912_59.9239141%2C30.5536651_59.9242596%2C30.5454183_59.9247778%2C30.5364842_59.9254687%2C30.5275501_59.9270233%2C30.5193033_59.9289234%2C30.5120873_59.9309963%2C30.5052149_59.9334146%2C30.5048713_59.9375602%2C30.5072766_59.9415332%2C30.5076203_59.9456788%2C30.5083075_59.9453334&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13"), function(linkCollectLwszan){
  source <- read_html(linkCollectLwszan)
  print(linkCollectLwszan)
  
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
  lwszan

lwszan <- data.frame(lwszan)
county <- rep('lwszan', nrow(lwszan))
county <- as.factor(county)
lwszan <- cbind(lwszan, county)
lwszan%>% distinct() -> lwszan

## Собрать ссылки на объявления о продаже квартир на территории "Северное Кудрово" (id lwssew)

str_c("https://spb.cian.ru/cat.php?bbox=59.9067726061%2C30.46950007%2C59.9251320106%2C30.56923533&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5383956_59.9174001%2C30.5385674_59.9186529%2C30.5370211_59.9199921%2C30.5351312_59.9211585%2C30.533499_59.9218929%2C30.5311796_59.9224545%2C30.5286025_59.9226705%2C30.5261971_59.9226705%2C30.5234482_59.9226705%2C30.5213006_59.9226705%2C30.519153_59.9225409%2C30.5170913_59.9222385%2C30.5143423_59.9219361%2C30.5110779_59.9214609%2C30.5090162_59.9211153%2C30.5069545_59.9204673%2C30.5054941_59.9197329%2C30.5042056_59.9188689%2C30.5030888_59.9179617%2C30.5018002_59.9170113%2C30.5013707_59.9158881%2C30.5011989_59.9147217%2C30.5010271_59.9136417%2C30.5007694_59.9126049%2C30.500168_59.9116113%2C30.5005117_59.9105745%2C30.5006835_59.9094945%2C30.502917_59.9092353%2C30.5048069_59.9097969%2C30.5066968_59.9105313%2C30.5085008_59.9111361%2C30.510133_59.9118705%2C30.5122806_59.9121729%2C30.5144282_59.9124753%2C30.5166617_59.9125185%2C30.5189812_59.9127777%2C30.5210429_59.9128641%2C30.5231046_59.9130801%2C30.525424_59.9132529%2C30.5274857_59.9136417%2C30.5294615_59.9140305%2C30.5317809_59.9146353%2C30.5339286_59.9154993%2C30.5357326_59.9161473%2C30.5373647_59.9167953%2C30.5383956_59.9174001&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.9067726061%2C30.46950007%2C59.9251320106%2C30.56923533&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5383956_59.9174001%2C30.5385674_59.9186529%2C30.5370211_59.9199921%2C30.5351312_59.9211585%2C30.533499_59.9218929%2C30.5311796_59.9224545%2C30.5286025_59.9226705%2C30.5261971_59.9226705%2C30.5234482_59.9226705%2C30.5213006_59.9226705%2C30.519153_59.9225409%2C30.5170913_59.9222385%2C30.5143423_59.9219361%2C30.5110779_59.9214609%2C30.5090162_59.9211153%2C30.5069545_59.9204673%2C30.5054941_59.9197329%2C30.5042056_59.9188689%2C30.5030888_59.9179617%2C30.5018002_59.9170113%2C30.5013707_59.9158881%2C30.5011989_59.9147217%2C30.5010271_59.9136417%2C30.5007694_59.9126049%2C30.500168_59.9116113%2C30.5005117_59.9105745%2C30.5006835_59.9094945%2C30.502917_59.9092353%2C30.5048069_59.9097969%2C30.5066968_59.9105313%2C30.5085008_59.9111361%2C30.510133_59.9118705%2C30.5122806_59.9121729%2C30.5144282_59.9124753%2C30.5166617_59.9125185%2C30.5189812_59.9127777%2C30.5210429_59.9128641%2C30.5231046_59.9130801%2C30.525424_59.9132529%2C30.5274857_59.9136417%2C30.5294615_59.9140305%2C30.5317809_59.9146353%2C30.5339286_59.9154993%2C30.5357326_59.9161473%2C30.5373647_59.9167953%2C30.5383956_59.9174001&object_type%5B0%5D=1&offer_type=flat&p=", 1:8, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwssew){
  source <- read_html(linkCollectLwssew)
  print(linkCollectLwssew)
  
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
  lwssew

lwssew <- data.frame(lwssew)
county <- rep('lwssew', nrow(lwssew))
county <- as.factor(county)
lwssew <- cbind(lwssew, county)
lwssew%>% distinct() -> lwssew

## Собрать ссылки на объявления о продаже квартир на территории "Южное Кудрово" (id lwsyuz)

str_c("https://spb.cian.ru/cat.php?bbox=59.8848220103%2C30.41484899%2C59.9215549829%2C30.61431951&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5259236_59.9131322%2C30.5216284_59.9131322%2C30.5171613_59.9129593%2C30.5130379_59.9120085%2C30.5090863_59.9112306%2C30.5056501_59.9095884%2C30.5044475_59.9075139%2C30.5034166_59.9054394%2C30.5027294_59.903365%2C30.5027294_59.9011177%2C30.5023858_59.8990432%2C30.5025576_59.8968823%2C30.5037602_59.8948079%2C30.5065092_59.893252%2C30.5109762_59.8938571%2C30.5149278_59.8947214%2C30.5188794_59.8954993%2C30.5226592_59.8965366%2C30.5248928_59.8985246%2C30.5252364_59.9008584%2C30.5254082_59.9029328%2C30.5252364_59.9050937%2C30.52558_59.9071682%2C30.5267827_59.909329%2C30.526439_59.9114035%2C30.5259236_59.9131322&object_type%5B0%5D=1&offer_type=flat&p=", 1:26, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.8848220103%2C30.41484899%2C59.9215549829%2C30.61431951&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5259236_59.9131322%2C30.5216284_59.9131322%2C30.5171613_59.9129593%2C30.5130379_59.9120085%2C30.5090863_59.9112306%2C30.5056501_59.9095884%2C30.5044475_59.9075139%2C30.5034166_59.9054394%2C30.5027294_59.903365%2C30.5027294_59.9011177%2C30.5023858_59.8990432%2C30.5025576_59.8968823%2C30.5037602_59.8948079%2C30.5065092_59.893252%2C30.5109762_59.8938571%2C30.5149278_59.8947214%2C30.5188794_59.8954993%2C30.5226592_59.8965366%2C30.5248928_59.8985246%2C30.5252364_59.9008584%2C30.5254082_59.9029328%2C30.5252364_59.9050937%2C30.52558_59.9071682%2C30.5267827_59.909329%2C30.526439_59.9114035%2C30.5259236_59.9131322&object_type%5B0%5D=1&offer_type=flat&p=", 1:26, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsyuz){
  source <- read_html(linkCollectLwsyuz)
  print(linkCollectLwsyuz)
  
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
  lwsyuz

lwsyuz <- data.frame(lwsyuz)
county <- rep('lwsyuz', nrow(lwsyuz))
county <- as.factor(county)
lwsyuz <- cbind(lwsyuz, county)
lwsyuz%>% distinct() -> lwsyuz

## Собрать ссылки на объявления о продаже квартир на территории "Новосаратовка - Невский парклесхоз" (id lwsnow)

str_c("https://spb.cian.ru/cat.php?bbox=59.81061799592615%2C30.34570497998048%2C59.88420768724943%2C30.744646020019527&center=59.84743324896589%2C30.545175500000003&deal_type=sale&engine_version=2&in_polygon[0]=30.5773038_59.8236097%2C30.5831454_59.8269005%2C30.5862379_59.8308841%2C30.5893305_59.8355605%2C30.5903613_59.8402369%2C30.590705_59.8443937%2C30.5913922_59.8487237%2C30.5920794_59.8528805%2C30.5937975_59.8570373%2C30.5852071_59.8601549%2C30.576273_59.8624065%2C30.5707751_59.8656973%2C30.5659644_59.8695077%2C30.5563431_59.8708933%2C30.5477527_59.8712397%2C30.5395058_59.8696809%2C30.5326334_59.8667365%2C30.5257611_59.8634457%2C30.5209504_59.8598085%2C30.5137344_59.8575569%2C30.5075493_59.8547857%2C30.4993025_59.8530537%2C30.4965535_59.8490701%2C30.5034259_59.8466453%2C30.5106419_59.8430081%2C30.5182015_59.8404101%2C30.5257611_59.8386781%2C30.5336643_59.8365997%2C30.5419111_59.8353873%2C30.5494708_59.8372925%2C30.5580612_59.8379853%2C30.5656208_59.8362533%2C30.5673389_59.8319233%2C30.5649336_59.8279397%2C30.5714623_59.8248221%2C30.5773038_59.8236097&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.81061799592615%2C30.34570497998048%2C59.88420768724943%2C30.744646020019527&center=59.84743324896589%2C30.545175500000003&deal_type=sale&engine_version=2&in_polygon[0]=30.5773038_59.8236097%2C30.5831454_59.8269005%2C30.5862379_59.8308841%2C30.5893305_59.8355605%2C30.5903613_59.8402369%2C30.590705_59.8443937%2C30.5913922_59.8487237%2C30.5920794_59.8528805%2C30.5937975_59.8570373%2C30.5852071_59.8601549%2C30.576273_59.8624065%2C30.5707751_59.8656973%2C30.5659644_59.8695077%2C30.5563431_59.8708933%2C30.5477527_59.8712397%2C30.5395058_59.8696809%2C30.5326334_59.8667365%2C30.5257611_59.8634457%2C30.5209504_59.8598085%2C30.5137344_59.8575569%2C30.5075493_59.8547857%2C30.4993025_59.8530537%2C30.4965535_59.8490701%2C30.5034259_59.8466453%2C30.5106419_59.8430081%2C30.5182015_59.8404101%2C30.5257611_59.8386781%2C30.5336643_59.8365997%2C30.5419111_59.8353873%2C30.5494708_59.8372925%2C30.5580612_59.8379853%2C30.5656208_59.8362533%2C30.5673389_59.8319233%2C30.5649336_59.8279397%2C30.5714623_59.8248221%2C30.5773038_59.8236097&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12"), function(linkCollectLwsnow){
  source <- read_html(linkCollectLwsnow)
  print(linkCollectLwsnow)
  
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
  lwsnow

lwsnow <- data.frame(lwsnow)
county <- rep('lwsnow', nrow(lwsnow))
county <- as.factor(county)
lwsnow <- cbind(lwsnow, county)
lwsnow%>% distinct() -> lwsnow

## Собрать ссылки на объявления о продаже квартир на территории "Посёлок имени Свердлова" (id lwsswe)

str_c("https://spb.cian.ru/cat.php?bbox=59.7774782669%2C30.46210738%2C59.8511413854%2C30.86104842&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.6050527_59.8457735%2C30.5964622_59.8456001%2C30.5916515_59.8398805%2C30.5906207_59.8355474%2C30.5909643_59.830521%2C30.5926824_59.826188%2C30.5944005_59.8220282%2C30.5961186_59.8178684%2C30.5998984_59.8137087%2C30.604709_59.8097223%2C30.6095197_59.8060825%2C30.6157048_59.8029627%2C30.6222336_59.7996695%2C30.6284187_59.7965497%2C30.6356347_59.7939499%2C30.6442252_59.7920433%2C30.6528156_59.79083%2C30.6634678_59.7894434%2C30.6724019_59.7882302%2C30.6803051_59.7866703%2C30.6892392_59.7847637%2C30.697486_59.7838971%2C30.7071074_59.7830305%2C30.7160414_59.7828572%2C30.7249755_59.7828572%2C30.7321915_59.7851104%2C30.7325351_59.7896168%2C30.730817_59.7946431%2C30.7294426_59.8000162%2C30.7273808_59.8050425%2C30.7208521_59.8100689%2C30.7081382_59.8175218%2C30.6978297_59.8223748%2C30.6899264_59.8287878%2C30.6837413_59.831561%2C30.6730891_59.8358941%2C30.6638114_59.8395338%2C30.6548773_59.8424803%2C30.6449124_59.8447335%2C30.6339166_59.8454268%2C30.6232644_59.8456001%2C30.614674_59.8456001%2C30.6060835_59.8457735%2C30.6050527_59.8457735&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.7774782669%2C30.46210738%2C59.8511413854%2C30.86104842&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.6050527_59.8457735%2C30.5964622_59.8456001%2C30.5916515_59.8398805%2C30.5906207_59.8355474%2C30.5909643_59.830521%2C30.5926824_59.826188%2C30.5944005_59.8220282%2C30.5961186_59.8178684%2C30.5998984_59.8137087%2C30.604709_59.8097223%2C30.6095197_59.8060825%2C30.6157048_59.8029627%2C30.6222336_59.7996695%2C30.6284187_59.7965497%2C30.6356347_59.7939499%2C30.6442252_59.7920433%2C30.6528156_59.79083%2C30.6634678_59.7894434%2C30.6724019_59.7882302%2C30.6803051_59.7866703%2C30.6892392_59.7847637%2C30.697486_59.7838971%2C30.7071074_59.7830305%2C30.7160414_59.7828572%2C30.7249755_59.7828572%2C30.7321915_59.7851104%2C30.7325351_59.7896168%2C30.730817_59.7946431%2C30.7294426_59.8000162%2C30.7273808_59.8050425%2C30.7208521_59.8100689%2C30.7081382_59.8175218%2C30.6978297_59.8223748%2C30.6899264_59.8287878%2C30.6837413_59.831561%2C30.6730891_59.8358941%2C30.6638114_59.8395338%2C30.6548773_59.8424803%2C30.6449124_59.8447335%2C30.6339166_59.8454268%2C30.6232644_59.8456001%2C30.614674_59.8456001%2C30.6060835_59.8457735%2C30.6050527_59.8457735&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLwsswe){
  source <- read_html(linkCollectLwsswe)
  print(linkCollectLwsswe)
  
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
  lwsswe

lwsswe <- data.frame(lwsswe)
county <- rep('lwsswe', nrow(lwsswe))
county <- as.factor(county)
lwsswe <- cbind(lwsswe, county)
lwsswe%>% distinct() -> lwsswe

## Собрать ссылки на объявления о продаже квартир на территории "Новосергиевка" (id lwsnov)

str_c("https://spb.cian.ru/cat.php?bbox=59.89047734664777%2C30.465559139990166%2C59.92720404594162%2C30.66502966000969&center=59.90884579176349%2C30.56529439999994&deal_type=sale&engine_version=2&in_polygon[0]=30.5582502_59.9146367%2C30.5506906_59.9129077%2C30.5448491_59.9096225%2C30.5410693_59.9056458%2C30.547598_59.9025335%2C30.5565321_59.9002857%2C30.5661534_59.8994212%2C30.5754311_59.8995941%2C30.5840216_59.901669%2C30.5888322_59.9056458%2C30.5895195_59.9097954%2C30.5853961_59.9134264%2C30.5798982_59.9165387%2C30.5716513_59.9182677%2C30.5623736_59.9180948%2C30.5582502_59.9146367&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.89047734664777%2C30.465559139990166%2C59.92720404594162%2C30.66502966000969&center=59.90884579176349%2C30.56529439999994&deal_type=sale&engine_version=2&in_polygon[0]=30.5582502_59.9146367%2C30.5506906_59.9129077%2C30.5448491_59.9096225%2C30.5410693_59.9056458%2C30.547598_59.9025335%2C30.5565321_59.9002857%2C30.5661534_59.8994212%2C30.5754311_59.8995941%2C30.5840216_59.901669%2C30.5888322_59.9056458%2C30.5895195_59.9097954%2C30.5853961_59.9134264%2C30.5798982_59.9165387%2C30.5716513_59.9182677%2C30.5623736_59.9180948%2C30.5582502_59.9146367&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13"), function(linkCollectLwsnov){
  source <- read_html(linkCollectLwsnov)
  print(linkCollectLwsnov)
  
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
  lwsnov

lwsnov <- data.frame(lwsnov)
county <- rep('lwsnov', nrow(lwsnov))
county <- as.factor(county)
lwsnov <- cbind(lwsnov, county)
lwsnov%>% distinct() -> lwsnov

## Собрать ссылки на объявления о продаже квартир на территории "Кировск" (id lkikir)

str_c("https://www.cian.ru/cat.php?bbox=59.8415847826%2C30.79661733%2C59.9151058397%2C31.19555837&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.9921362_59.9041363%2C30.9893873_59.9001566%2C30.9869819_59.8949657%2C30.9852638_59.8902939%2C30.9828585_59.8856221%2C30.9804532_59.8807772%2C30.9777042_59.8757594%2C30.9739244_59.8719527%2C30.9708319_59.867973%2C30.9684265_59.8636473%2C30.9649904_59.8591485%2C30.9639595_59.8548227%2C30.9701446_59.8518812%2C30.9790787_59.8515352%2C30.9873256_59.8518812%2C30.9952288_59.8530924%2C31.0024448_59.8558609%2C31.0082863_59.8600136%2C31.0127533_59.8639933%2C31.0172204_59.867973%2C31.0213438_59.8716066%2C31.0251236_59.8755863%2C31.0282162_59.879566%2C31.0275289_59.8838918%2C31.0271853_59.8883905%2C31.0264981_59.8930624%2C31.0206566_59.896696%2C31.0161895_59.9003296%2C31.0096608_59.9032711%2C31.0014139_59.9051745%2C30.9931671_59.9044823%2C30.9921362_59.9041363&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.8415847826%2C30.79661733%2C59.9151058397%2C31.19555837&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.9921362_59.9041363%2C30.9893873_59.9001566%2C30.9869819_59.8949657%2C30.9852638_59.8902939%2C30.9828585_59.8856221%2C30.9804532_59.8807772%2C30.9777042_59.8757594%2C30.9739244_59.8719527%2C30.9708319_59.867973%2C30.9684265_59.8636473%2C30.9649904_59.8591485%2C30.9639595_59.8548227%2C30.9701446_59.8518812%2C30.9790787_59.8515352%2C30.9873256_59.8518812%2C30.9952288_59.8530924%2C31.0024448_59.8558609%2C31.0082863_59.8600136%2C31.0127533_59.8639933%2C31.0172204_59.867973%2C31.0213438_59.8716066%2C31.0251236_59.8755863%2C31.0282162_59.879566%2C31.0275289_59.8838918%2C31.0271853_59.8883905%2C31.0264981_59.8930624%2C31.0206566_59.896696%2C31.0161895_59.9003296%2C31.0096608_59.9032711%2C31.0014139_59.9051745%2C30.9931671_59.9044823%2C30.9921362_59.9041363&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLkikir){
  source <- read_html(linkCollectLkikir)
  print(linkCollectLkikir)
  
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
  lkikir

lkikir <- data.frame(lkikir)
county <- rep('lkikir', nrow(lkikir))
county <- as.factor(county)
lkikir <- cbind(lkikir, county)
lkikir%>% distinct() -> lkikir

## Собрать ссылки на объявления о продаже квартир на территории "Шлиссельбург" (id lkishl)

str_c("https://www.cian.ru/cat.php?bbox=59.9154000908%2C30.94098929%2C59.9520991397%2C31.14045981&deal_type=sale&engine_version=2&in_polygon%5B1%5D=31.0374602_59.9488717%2C31.0288697_59.9469709%2C31.0233718_59.9435148%2C31.0171867_59.9405771%2C31.0092834_59.9376394%2C31.0020675_59.9343561%2C30.9958823_59.9312456%2C30.9914153_59.9274439%2C30.9924461_59.922951%2C31.0013802_59.9200133%2C31.0110015_59.9188036%2C31.024059_59.9186308%2C31.0360857_59.9186308%2C31.0450198_59.9194949%2C31.0532666_59.9200133%2C31.0632315_59.9208773%2C31.0721656_59.9215685%2C31.0810997_59.9222597%2C31.0893466_59.9248518%2C31.0900338_59.9309%2C31.0838487_59.9360841%2C31.0769763_59.938849%2C31.0670114_59.9419595%2C31.0587645_59.9435148%2C31.0494868_59.9454156%2C31.0415836_59.9471437%2C31.0374602_59.9488717&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.9154000908%2C30.94098929%2C59.9520991397%2C31.14045981&deal_type=sale&engine_version=2&in_polygon%5B1%5D=31.0374602_59.9488717%2C31.0288697_59.9469709%2C31.0233718_59.9435148%2C31.0171867_59.9405771%2C31.0092834_59.9376394%2C31.0020675_59.9343561%2C30.9958823_59.9312456%2C30.9914153_59.9274439%2C30.9924461_59.922951%2C31.0013802_59.9200133%2C31.0110015_59.9188036%2C31.024059_59.9186308%2C31.0360857_59.9186308%2C31.0450198_59.9194949%2C31.0532666_59.9200133%2C31.0632315_59.9208773%2C31.0721656_59.9215685%2C31.0810997_59.9222597%2C31.0893466_59.9248518%2C31.0900338_59.9309%2C31.0838487_59.9360841%2C31.0769763_59.938849%2C31.0670114_59.9419595%2C31.0587645_59.9435148%2C31.0494868_59.9454156%2C31.0415836_59.9471437%2C31.0374602_59.9488717&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLkishl){
  source <- read_html(linkCollectLkishl)
  print(linkCollectLkishl)
  
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
  lkishl

lkishl <- data.frame(lkishl)
county <- rep('lkishl', nrow(lkishl))
county <- as.factor(county)
lkishl <- cbind(lkishl, county)
lkishl%>% distinct() -> lkishl

## Собрать ссылки на объявления о продаже квартир на территории "Синявино - Путилово - Молодцово" (id lkisin)

str_c("https://www.cian.ru/cat.php?bbox=59.8030599938%2C30.86516581%2C59.950109711%2C31.66304789&deal_type=sale&engine_version=2&in_polygon%5B1%5D=31.0871434_59.9203916%2C31.0692752_59.9179691%2C31.0548432_59.9117396%2C31.0507198_59.9034338%2C31.0493453_59.8937436%2C31.0479708_59.8816308%2C31.0472836_59.8705563%2C31.0479708_59.8612122%2C31.051407_59.8529063%2C31.0575922_59.8449465%2C31.0665262_59.8373328%2C31.0761476_59.8300651%2C31.0850816_59.8224514%2C31.103637_59.8169141%2C31.1228797_59.8169141%2C31.1400606_59.8169141%2C31.1572415_59.8169141%2C31.1751097_59.8182984%2C31.196414_59.8203749%2C31.2122205_59.8227975%2C31.2300886_59.82522%2C31.2541419_59.8290269%2C31.2733846_59.8321416%2C31.2940017_59.8362945%2C31.3132443_59.8404475%2C31.3304252_59.8425239%2C31.3510423_59.8452926%2C31.3682233_59.8480612%2C31.3854042_59.8511759%2C31.4005234_59.8549828%2C31.4170171_59.8584435%2C31.434198_59.8612122%2C31.4527534_59.8622504%2C31.4692471_59.8632886%2C31.4809301_59.8702102%2C31.4788684_59.8785161%2C31.4651237_59.8833612%2C31.4506917_59.8875141%2C31.434198_59.8899367%2C31.4156426_59.8909749%2C31.3950255_59.8916671%2C31.3771573_59.8923592%2C31.3586019_59.8947818%2C31.3427955_59.8989347%2C31.3304252_59.9048181%2C31.3221784_59.913124%2C31.3194294_59.9224681%2C31.3070592_59.9283514%2C31.2933144_59.9331965%2C31.277508_59.9363112%2C31.2562036_59.9363112%2C31.23971_59.9349269%2C31.2287142_59.9286975%2C31.2218418_59.9210838%2C31.2170311_59.913124%2C31.2012247_59.9103553%2C31.1826693_59.9110475%2C31.1661756_59.9124318%2C31.1517436_59.9172769%2C31.1352499_59.9210838%2C31.118069_59.9217759%2C31.1015753_59.9231602%2C31.0871434_59.9203916&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.8030599938%2C30.86516581%2C59.950109711%2C31.66304789&deal_type=sale&engine_version=2&in_polygon%5B1%5D=31.0871434_59.9203916%2C31.0692752_59.9179691%2C31.0548432_59.9117396%2C31.0507198_59.9034338%2C31.0493453_59.8937436%2C31.0479708_59.8816308%2C31.0472836_59.8705563%2C31.0479708_59.8612122%2C31.051407_59.8529063%2C31.0575922_59.8449465%2C31.0665262_59.8373328%2C31.0761476_59.8300651%2C31.0850816_59.8224514%2C31.103637_59.8169141%2C31.1228797_59.8169141%2C31.1400606_59.8169141%2C31.1572415_59.8169141%2C31.1751097_59.8182984%2C31.196414_59.8203749%2C31.2122205_59.8227975%2C31.2300886_59.82522%2C31.2541419_59.8290269%2C31.2733846_59.8321416%2C31.2940017_59.8362945%2C31.3132443_59.8404475%2C31.3304252_59.8425239%2C31.3510423_59.8452926%2C31.3682233_59.8480612%2C31.3854042_59.8511759%2C31.4005234_59.8549828%2C31.4170171_59.8584435%2C31.434198_59.8612122%2C31.4527534_59.8622504%2C31.4692471_59.8632886%2C31.4809301_59.8702102%2C31.4788684_59.8785161%2C31.4651237_59.8833612%2C31.4506917_59.8875141%2C31.434198_59.8899367%2C31.4156426_59.8909749%2C31.3950255_59.8916671%2C31.3771573_59.8923592%2C31.3586019_59.8947818%2C31.3427955_59.8989347%2C31.3304252_59.9048181%2C31.3221784_59.913124%2C31.3194294_59.9224681%2C31.3070592_59.9283514%2C31.2933144_59.9331965%2C31.277508_59.9363112%2C31.2562036_59.9363112%2C31.23971_59.9349269%2C31.2287142_59.9286975%2C31.2218418_59.9210838%2C31.2170311_59.913124%2C31.2012247_59.9103553%2C31.1826693_59.9110475%2C31.1661756_59.9124318%2C31.1517436_59.9172769%2C31.1352499_59.9210838%2C31.118069_59.9217759%2C31.1015753_59.9231602%2C31.0871434_59.9203916&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLkisin){
  source <- read_html(linkCollectLkisin)
  print(linkCollectLkisin)
  
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
  lkisin

lkisin <- data.frame(lkisin)
county <- rep('lkisin', nrow(lkisin))
county <- as.factor(county)
lkisin <- cbind(lkisin, county)
lkisin%>% distinct() -> lkisin

## Собрать ссылки на объявления о продаже квартир на территории "Мга - Павлово" (id lkimga)

str_c("https://www.cian.ru/cat.php?bbox=59.689387270398264%2C30.576633259960932%2C59.8369401010942%2C31.374515340039054&center=59.76324545449312%2C30.975574300000005&deal_type=sale&engine_version=2&in_polygon[0]=31.0645715_59.7304081%2C31.0762545_59.7370023%2C31.0845014_59.7442906%2C31.0886248_59.7529672%2C31.092061_59.7612967%2C31.0968716_59.7703204%2C31.0865631_59.7807322%2C31.0700694_59.7869794%2C31.0570119_59.7921853%2C31.0357075_59.7998207%2C31.0219628_59.8046796%2C31.0034074_59.8064149%2C30.984852_59.8074561%2C30.9676711_59.8095385%2C30.9504902_59.8119679%2C30.9339965_59.8130091%2C30.9175028_59.8140503%2C30.9010091_59.8143974%2C30.8831409_59.8147444%2C30.8652728_59.8147444%2C30.854277_59.8084973%2C30.8645855_59.8019031%2C30.877643_59.7932265%2C30.8865771_59.784897%2C30.8961984_59.7779557%2C30.9085687_59.7720557%2C30.9223134_59.7658085%2C30.9271241_59.7571319%2C30.9394944_59.7501907%2C30.9504902_59.7435965%2C30.9621732_59.7370023%2C30.9745434_59.7311022%2C30.9855392_59.7248551%2C30.9979095_59.7193021%2C31.0123415_59.713749%2C31.0288352_59.7116667%2C31.0446416_59.7172197%2C31.0576991_59.7227727%2C31.0645715_59.7304081&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.689387270398264%2C30.576633259960932%2C59.8369401010942%2C31.374515340039054&center=59.76324545449312%2C30.975574300000005&deal_type=sale&engine_version=2&in_polygon[0]=31.0645715_59.7304081%2C31.0762545_59.7370023%2C31.0845014_59.7442906%2C31.0886248_59.7529672%2C31.092061_59.7612967%2C31.0968716_59.7703204%2C31.0865631_59.7807322%2C31.0700694_59.7869794%2C31.0570119_59.7921853%2C31.0357075_59.7998207%2C31.0219628_59.8046796%2C31.0034074_59.8064149%2C30.984852_59.8074561%2C30.9676711_59.8095385%2C30.9504902_59.8119679%2C30.9339965_59.8130091%2C30.9175028_59.8140503%2C30.9010091_59.8143974%2C30.8831409_59.8147444%2C30.8652728_59.8147444%2C30.854277_59.8084973%2C30.8645855_59.8019031%2C30.877643_59.7932265%2C30.8865771_59.784897%2C30.8961984_59.7779557%2C30.9085687_59.7720557%2C30.9223134_59.7658085%2C30.9271241_59.7571319%2C30.9394944_59.7501907%2C30.9504902_59.7435965%2C30.9621732_59.7370023%2C30.9745434_59.7311022%2C30.9855392_59.7248551%2C30.9979095_59.7193021%2C31.0123415_59.713749%2C31.0288352_59.7116667%2C31.0446416_59.7172197%2C31.0576991_59.7227727%2C31.0645715_59.7304081&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11"), function(linkCollectLkimga){
  source <- read_html(linkCollectLkimga)
  print(linkCollectLkimga)
  
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
  lkimga

lkimga <- data.frame(lkimga)
county <- rep('lkimga', nrow(lkimga))
county <- as.factor(county)
lkimga <- cbind(lkimga, county)
lkimga%>% distinct() -> lkimga

## Собрать ссылки на объявления о продаже квартир на территории "Отрадное" (id lkiotr)

str_c("https://spb.cian.ru/cat.php?bbox=59.7216281976%2C30.60402128%2C59.7954150081%2C31.00296232&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.7863109_59.7727783%2C30.76913_59.7706938%2C30.7567597_59.7651351%2C30.757447_59.7567971%2C30.7601959_59.7481116%2C30.7636321_59.7394262%2C30.7828747_59.7362994%2C30.8034918_59.7356046%2C30.8220472_59.7373416%2C30.8371664_59.7432478%2C30.8467878_59.7515858%2C30.8502239_59.7599238%2C30.8461005_59.7682618%2C30.835792_59.7769473%2C30.8192983_59.7807689%2C30.8028046_59.7814637%2C30.7869981_59.7786844%2C30.7863109_59.7727783&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.7216281976%2C30.60402128%2C59.7954150081%2C31.00296232&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.7863109_59.7727783%2C30.76913_59.7706938%2C30.7567597_59.7651351%2C30.757447_59.7567971%2C30.7601959_59.7481116%2C30.7636321_59.7394262%2C30.7828747_59.7362994%2C30.8034918_59.7356046%2C30.8220472_59.7373416%2C30.8371664_59.7432478%2C30.8467878_59.7515858%2C30.8502239_59.7599238%2C30.8461005_59.7682618%2C30.835792_59.7769473%2C30.8192983_59.7807689%2C30.8028046_59.7814637%2C30.7869981_59.7786844%2C30.7863109_59.7727783&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLkiotr){
  source <- read_html(linkCollectLkiotr)
  print(linkCollectLkiotr)
  
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
  lkiotr

lkiotr <- data.frame(lkiotr)
county <- rep('lkiotr', nrow(lkiotr))
county <- as.factor(county)
lkiotr <- cbind(lkiotr, county)
lkiotr%>% distinct() -> lkiotr

## Собрать ссылки на объявления о продаже квартир на территории "Никольское" (id lkinik)

str_c("https://www.cian.ru/cat.php?bbox=59.6523875166%2C30.6114139722%2C59.7263275812%2C31.0103550122&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.7784267_59.732808%2C30.7756778_59.7286345%2C30.7688054_59.726026%2C30.7629639_59.722722%2C30.7605586_59.7173312%2C30.7588405_59.7124621%2C30.7578096_59.7077669%2C30.7571224_59.7022022%2C30.7564352_59.6973331%2C30.7591841_59.6921162%2C30.7626203_59.6882905%2C30.7684618_59.6846387%2C30.7760214_59.6815085%2C30.7842682_59.6789001%2C30.7925151_59.677335%2C30.8007619_59.6759438%2C30.8103833_59.6761177%2C30.8193173_59.6780306%2C30.8261897_59.6820302%2C30.8296259_59.6860298%2C30.8316876_59.6905511%2C30.8323748_59.6966375%2C30.831344_59.7009849%2C30.8292823_59.7056801%2C30.8248152_59.7124621%2C30.8186301_59.7182007%2C30.8127886_59.7223742%2C30.8076343_59.7261999%2C30.80248_59.7296779%2C30.7956077_59.7322863%2C30.7870172_59.732808%2C30.7787704_59.7329819%2C30.7784267_59.732808&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.6523875166%2C30.6114139722%2C59.7263275812%2C31.0103550122&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.7784267_59.732808%2C30.7756778_59.7286345%2C30.7688054_59.726026%2C30.7629639_59.722722%2C30.7605586_59.7173312%2C30.7588405_59.7124621%2C30.7578096_59.7077669%2C30.7571224_59.7022022%2C30.7564352_59.6973331%2C30.7591841_59.6921162%2C30.7626203_59.6882905%2C30.7684618_59.6846387%2C30.7760214_59.6815085%2C30.7842682_59.6789001%2C30.7925151_59.677335%2C30.8007619_59.6759438%2C30.8103833_59.6761177%2C30.8193173_59.6780306%2C30.8261897_59.6820302%2C30.8296259_59.6860298%2C30.8316876_59.6905511%2C30.8323748_59.6966375%2C30.831344_59.7009849%2C30.8292823_59.7056801%2C30.8248152_59.7124621%2C30.8186301_59.7182007%2C30.8127886_59.7223742%2C30.8076343_59.7261999%2C30.80248_59.7296779%2C30.7956077_59.7322863%2C30.7870172_59.732808%2C30.7787704_59.7329819%2C30.7784267_59.732808&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLkinik){
  source <- read_html(linkCollectLkinik)
  print(linkCollectLkinik)
  
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
  lkinik

lkinik <- data.frame(lknik)
county <- rep('lkinik', nrow(lkinik))
county <- as.factor(county)
lkinik <- cbind(lkinik, county)
lkinik%>% distinct() -> lkinik

## Собрать ссылки на объявления о продаже квартир на территории "Красный Юор - Ульяновка - Гладкое" (id ltokra)

str_c("https://spb.cian.ru/cat.php?bbox=59.58206497132418%2C30.354256209960862%2C59.73009229335044%2C31.15213829003898&center=59.656160577207416%2C30.753197249999936&deal_type=sale&engine_version=2&in_polygon[0]=30.6157499_59.6857558%2C30.6294946_59.6805292%2C30.6425521_59.6735603%2C30.6542351_59.6658946%2C30.6638564_59.6578804%2C30.6789756_59.6488209%2C30.6934076_59.6404583%2C30.7071524_59.6341863%2C30.7229588_59.6265206%2C30.7367036_59.6209455%2C30.75251_59.6174611%2C30.7710654_59.6185064%2C30.7896208_59.6195517%2C30.8088634_59.6209455%2C30.8281061_59.6223393%2C30.8473487_59.6244299%2C30.8645296_59.6272175%2C30.8796488_59.6317472%2C30.8892702_59.6390645%2C30.8906446_59.6484725%2C30.8817105_59.6568351%2C30.8693403_59.6634555%2C30.8542211_59.6676368%2C30.8377274_59.6707728%2C30.8198592_59.672515%2C30.8033655_59.6742572%2C30.7854974_59.6777416%2C30.7662547_59.6798323%2C30.7490738_59.6819229%2C30.7422014_59.6895887%2C30.7257078_59.6948153%2C30.7078396_59.6944669%2C30.6913459_59.6930731%2C30.6734778_59.6920278%2C30.6542351_59.690634%2C30.6370542_59.6888918%2C30.6205605_59.6864527%2C30.6157499_59.6857558&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11")

map_dfr(str_c("https://spb.cian.ru/cat.php?bbox=59.58206497132418%2C30.354256209960862%2C59.73009229335044%2C31.15213829003898&center=59.656160577207416%2C30.753197249999936&deal_type=sale&engine_version=2&in_polygon[0]=30.6157499_59.6857558%2C30.6294946_59.6805292%2C30.6425521_59.6735603%2C30.6542351_59.6658946%2C30.6638564_59.6578804%2C30.6789756_59.6488209%2C30.6934076_59.6404583%2C30.7071524_59.6341863%2C30.7229588_59.6265206%2C30.7367036_59.6209455%2C30.75251_59.6174611%2C30.7710654_59.6185064%2C30.7896208_59.6195517%2C30.8088634_59.6209455%2C30.8281061_59.6223393%2C30.8473487_59.6244299%2C30.8645296_59.6272175%2C30.8796488_59.6317472%2C30.8892702_59.6390645%2C30.8906446_59.6484725%2C30.8817105_59.6568351%2C30.8693403_59.6634555%2C30.8542211_59.6676368%2C30.8377274_59.6707728%2C30.8198592_59.672515%2C30.8033655_59.6742572%2C30.7854974_59.6777416%2C30.7662547_59.6798323%2C30.7490738_59.6819229%2C30.7422014_59.6895887%2C30.7257078_59.6948153%2C30.7078396_59.6944669%2C30.6913459_59.6930731%2C30.6734778_59.6920278%2C30.6542351_59.690634%2C30.6370542_59.6888918%2C30.6205605_59.6864527%2C30.6157499_59.6857558&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11"), function(linkCollectLtokra){
  source <- read_html(linkCollectLtokra)
  print(linkCollectLtokra)
  
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
  ltokra

ltokra <- data.frame(ltokra)
county <- rep('ltokra', nrow(ltokra))
county <- as.factor(county)
ltokra <- cbind(ltokra, county)
ltokra%>% distinct() -> ltokra

## Собрать ссылки на объявления о продаже квартир на территории "Тосно" (id ltotos)

str_c("https://www.cian.ru/cat.php?bbox=59.4976453761%2C30.68955108%2C59.5719275605%2C31.08849212&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.8412587_59.567135%2C30.8302629_59.5608408%2C30.8261394_59.5524485%2C30.8288884_59.5426575%2C30.836448_59.5332162%2C30.8440076_59.5244742%2C30.8556906_59.5143335%2C30.8694354_59.5083889%2C30.8852418_59.5038431%2C30.90311_59.500696%2C30.9202909_59.500696%2C30.9367846_59.5034934%2C30.9505293_59.5083889%2C30.9519038_59.51818%2C30.9457187_59.5262226%2C30.9367846_59.5335658%2C30.9271633_59.5412588%2C30.9161675_59.5482524%2C30.9051717_59.5566447%2C30.8948631_59.5639879%2C30.8797439_59.5685338%2C30.8618758_59.5688834%2C30.8453821_59.5685338%2C30.8412587_59.567135&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.4976453761%2C30.68955108%2C59.5719275605%2C31.08849212&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.8412587_59.567135%2C30.8302629_59.5608408%2C30.8261394_59.5524485%2C30.8288884_59.5426575%2C30.836448_59.5332162%2C30.8440076_59.5244742%2C30.8556906_59.5143335%2C30.8694354_59.5083889%2C30.8852418_59.5038431%2C30.90311_59.500696%2C30.9202909_59.500696%2C30.9367846_59.5034934%2C30.9505293_59.5083889%2C30.9519038_59.51818%2C30.9457187_59.5262226%2C30.9367846_59.5335658%2C30.9271633_59.5412588%2C30.9161675_59.5482524%2C30.9051717_59.5566447%2C30.8948631_59.5639879%2C30.8797439_59.5685338%2C30.8618758_59.5688834%2C30.8453821_59.5685338%2C30.8412587_59.567135&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLtotos){
  source <- read_html(linkCollectLtotos)
  print(linkCollectLtotos)
  
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
  ltotos

ltotos <- data.frame(ltotos)
county <- rep('ltotos', nrow(ltotos))
county <- as.factor(county)
ltotos <- cbind(ltotos, county)
ltotos%>% distinct() -> ltotos

## Собрать ссылки на объявления о продаже квартир на территории "Войскорово - Фёдоровское - Форносово" (id ltowoj)

str_c("https://www.cian.ru/cat.php?bbox=59.5673576711%2C30.1456308532%2C59.7154499777%2C30.9435129333&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5647705_59.7052381%2C30.5304087_59.6982649%2C30.5015447_59.6891997%2C30.4685574_59.6857131%2C30.4823021_59.6696747%2C30.4987958_59.6550309%2C30.5042937_59.6375979%2C30.5056681_59.6201649%2C30.5056681_59.6027318%2C30.511166_59.5859961%2C30.5276597_59.5713523%2C30.5482768_59.5581032%2C30.5840132_59.5546166%2C30.6224984_59.5574059%2C30.6596092_59.5594979%2C30.6939711_59.5588005%2C30.7297074_59.5560113%2C30.7626948_59.553222%2C30.7943077_59.5594979%2C30.7901842_59.5776282%2C30.775065_59.5936666%2C30.7558224_59.6083104%2C30.722835_59.6166782%2C30.69672_59.6299274%2C30.673354_59.6466631%2C30.6458645_59.6585175%2C30.621124_59.670372%2C30.6005068_59.6843185%2C30.5757663_59.6975676%2C30.5647705_59.7052381&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.5673576711%2C30.1456308532%2C59.7154499777%2C30.9435129333&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.5647705_59.7052381%2C30.5304087_59.6982649%2C30.5015447_59.6891997%2C30.4685574_59.6857131%2C30.4823021_59.6696747%2C30.4987958_59.6550309%2C30.5042937_59.6375979%2C30.5056681_59.6201649%2C30.5056681_59.6027318%2C30.511166_59.5859961%2C30.5276597_59.5713523%2C30.5482768_59.5581032%2C30.5840132_59.5546166%2C30.6224984_59.5574059%2C30.6596092_59.5594979%2C30.6939711_59.5588005%2C30.7297074_59.5560113%2C30.7626948_59.553222%2C30.7943077_59.5594979%2C30.7901842_59.5776282%2C30.775065_59.5936666%2C30.7558224_59.6083104%2C30.722835_59.6166782%2C30.69672_59.6299274%2C30.673354_59.6466631%2C30.6458645_59.6585175%2C30.621124_59.670372%2C30.6005068_59.6843185%2C30.5757663_59.6975676%2C30.5647705_59.7052381&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLtowoj){
  source <- read_html(linkCollectLtowoj)
  print(linkCollectLtowoj)
  
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
  ltowoj

ltowoj <- data.frame(ltowoj)
county <- rep('ltowoj', nrow(ltowoj))
county <- as.factor(county)
ltowoj <- cbind(ltowoj, county)
ltowoj%>% distinct() -> ltowoj

## Собрать ссылки на объявления о продаже квартир на территории "Коммунар" (id lgakom)

str_c("https://www.cian.ru/cat.php?bbox=59.5738749518%2C29.9404642092%2C59.7219384628%2C30.7383462893&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.4054927_59.6460355%2C30.3951841_59.644292%2C30.3855628_59.6425486%2C30.3762851_59.6399334%2C30.3687255_59.6359234%2C30.3639148_59.6315647%2C30.360135_59.6268574%2C30.3560116_59.6228474%2C30.3532627_59.6188375%2C30.3525754_59.6141301%2C30.3563552_59.6097714%2C30.3635712_59.6073306%2C30.3735361_59.6054128%2C30.381783_59.6047154%2C30.3917479_59.6041924%2C30.3999948_59.604018%2C30.4092725_59.6038437%2C30.419581_59.6038437%2C30.4292023_59.6052384%2C30.4367619_59.6069819%2C30.445696_59.6094228%2C30.452912_59.612038%2C30.4587535_59.6151762%2C30.4625333_59.6200579%2C30.4635642_59.6247652%2C30.4618461_59.6296469%2C30.4590971_59.6343543%2C30.455661_59.6385386%2C30.4518812_59.6434203%2C30.4481014_59.6474303%2C30.4426035_59.6509172%2C30.4322949_59.6510915%2C30.4230172_59.6510915%2C30.4137395_59.6496968%2C30.407898_59.6465585%2C30.4054927_59.6460355&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.5738749518%2C29.9404642092%2C59.7219384628%2C30.7383462893&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.4054927_59.6460355%2C30.3951841_59.644292%2C30.3855628_59.6425486%2C30.3762851_59.6399334%2C30.3687255_59.6359234%2C30.3639148_59.6315647%2C30.360135_59.6268574%2C30.3560116_59.6228474%2C30.3532627_59.6188375%2C30.3525754_59.6141301%2C30.3563552_59.6097714%2C30.3635712_59.6073306%2C30.3735361_59.6054128%2C30.381783_59.6047154%2C30.3917479_59.6041924%2C30.3999948_59.604018%2C30.4092725_59.6038437%2C30.419581_59.6038437%2C30.4292023_59.6052384%2C30.4367619_59.6069819%2C30.445696_59.6094228%2C30.452912_59.612038%2C30.4587535_59.6151762%2C30.4625333_59.6200579%2C30.4635642_59.6247652%2C30.4618461_59.6296469%2C30.4590971_59.6343543%2C30.455661_59.6385386%2C30.4518812_59.6434203%2C30.4481014_59.6474303%2C30.4426035_59.6509172%2C30.4322949_59.6510915%2C30.4230172_59.6510915%2C30.4137395_59.6496968%2C30.407898_59.6465585%2C30.4054927_59.6460355&object_type%5B0%5D=1&offer_type=flat&p=", 1:5, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLgakom){
  source <- read_html(linkCollectLgakom)
  print(linkCollectLgakom)
  
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
  lgakom

lgakom <- data.frame(lgakom)
county <- rep('lgakom', nrow(lgakom))
county <- as.factor(county)
lgakom <- cbind(lgakom, county)
lgakom%>% distinct() -> lgakom

## Собрать ссылки на объявления о продаже квартир на территории "Кобралово - Лукаши - Семрино" (id lgakob)

str_c("https://www.cian.ru/cat.php?bbox=59.49277936329312%2C29.963231609960946%2C59.641201050555026%2C30.761113690039068&center=59.567072297463156%2C30.362172649999994&deal_type=sale&engine_version=2&in_polygon[0]=30.3480843_59.5228609%2C30.3680142_59.5232102%2C30.3851951_59.5232102%2C30.402376_59.5246073%2C30.4181825_59.5287985%2C30.4326145_59.5354345%2C30.4436103_59.5417213%2C30.454606_59.5497545%2C30.4601039_59.5602325%2C30.4601039_59.5717583%2C30.4539188_59.5797914%2C30.4436103_59.587126%2C30.4305528_59.5930636%2C30.4147463_59.5983026%2C30.3975654_59.601446%2C30.37901_59.6042401%2C30.3618291_59.606685%2C30.3446481_59.6087806%2C30.3288417_59.6112255%2C30.3102863_59.6108762%2C30.2924181_59.6087806%2C30.2766117_59.6031923%2C30.2690521_59.5951592%2C30.2663031_59.5853797%2C30.2649287_59.5769973%2C30.2642414_59.5679164%2C30.2724883_59.5570891%2C30.2827968_59.5497545%2C30.2951671_59.5431184%2C30.3068501_59.5371809%2C30.3199076_59.5315926%2C30.3336523_59.5263536%2C30.3480843_59.5228609&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.49277936329312%2C29.963231609960946%2C59.641201050555026%2C30.761113690039068&center=59.567072297463156%2C30.362172649999994&deal_type=sale&engine_version=2&in_polygon[0]=30.3480843_59.5228609%2C30.3680142_59.5232102%2C30.3851951_59.5232102%2C30.402376_59.5246073%2C30.4181825_59.5287985%2C30.4326145_59.5354345%2C30.4436103_59.5417213%2C30.454606_59.5497545%2C30.4601039_59.5602325%2C30.4601039_59.5717583%2C30.4539188_59.5797914%2C30.4436103_59.587126%2C30.4305528_59.5930636%2C30.4147463_59.5983026%2C30.3975654_59.601446%2C30.37901_59.6042401%2C30.3618291_59.606685%2C30.3446481_59.6087806%2C30.3288417_59.6112255%2C30.3102863_59.6108762%2C30.2924181_59.6087806%2C30.2766117_59.6031923%2C30.2690521_59.5951592%2C30.2663031_59.5853797%2C30.2649287_59.5769973%2C30.2642414_59.5679164%2C30.2724883_59.5570891%2C30.2827968_59.5497545%2C30.2951671_59.5431184%2C30.3068501_59.5371809%2C30.3199076_59.5315926%2C30.3336523_59.5263536%2C30.3480843_59.5228609&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11"), function(linkCollectLgakob){
  source <- read_html(linkCollectLgakob)
  print(linkCollectLgakob)
  
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
  lgakob

lgakob <- data.frame(lgakob)
county <- rep('lgakob', nrow(lgakob))
county <- as.factor(county)
lgakob <- cbind(lgakob, county)
lgakob%>% distinct() -> lgakob

## Собрать ссылки на объявления о продаже квартир на территории "Гатчина" (id lgagat)

str_c("https://www.cian.ru/cat.php?bbox=59.5155600588%2C29.91431898%2C59.5898026624%2C30.31326002&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.1557109_59.5876259%2C30.1364683_59.5876259%2C30.1172257_59.586927%2C30.100732_59.5855293%2C30.0828638_59.5830834%2C30.0670574_59.5799386%2C30.0498764_59.5750467%2C30.0347572_59.5684076%2C30.0251359_59.5600215%2C30.0189508_59.5519848%2C30.0155146_59.5425504%2C30.0182635_59.5334655%2C30.0278849_59.526477%2C30.0436913_59.5229828%2C30.0608722_59.5201874%2C30.0787404_59.5184403%2C30.0952341_59.5177415%2C30.1131022_59.5177415%2C30.1309704_59.5191392%2C30.1467769_59.5215851%2C30.1639578_59.5250793%2C30.1818259_59.5299712%2C30.1941962_59.535562%2C30.2038175_59.5428998%2C30.2113771_59.5519848%2C30.2120644_59.5610698%2C30.2058792_59.5694559%2C30.1983196_59.5771432%2C30.1886983_59.5851799%2C30.1708301_59.5872764%2C30.1557109_59.5876259&object_type%5B0%5D=1&offer_type=flat&p=", 1:15, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.5155600588%2C29.91431898%2C59.5898026624%2C30.31326002&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.1557109_59.5876259%2C30.1364683_59.5876259%2C30.1172257_59.586927%2C30.100732_59.5855293%2C30.0828638_59.5830834%2C30.0670574_59.5799386%2C30.0498764_59.5750467%2C30.0347572_59.5684076%2C30.0251359_59.5600215%2C30.0189508_59.5519848%2C30.0155146_59.5425504%2C30.0182635_59.5334655%2C30.0278849_59.526477%2C30.0436913_59.5229828%2C30.0608722_59.5201874%2C30.0787404_59.5184403%2C30.0952341_59.5177415%2C30.1131022_59.5177415%2C30.1309704_59.5191392%2C30.1467769_59.5215851%2C30.1639578_59.5250793%2C30.1818259_59.5299712%2C30.1941962_59.535562%2C30.2038175_59.5428998%2C30.2113771_59.5519848%2C30.2120644_59.5610698%2C30.2058792_59.5694559%2C30.1983196_59.5771432%2C30.1886983_59.5851799%2C30.1708301_59.5872764%2C30.1557109_59.5876259&object_type%5B0%5D=1&offer_type=flat&p=", 1:15, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLgagat){
  source <- read_html(linkCollectLgagat)
  print(linkCollectLgagat)
  
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
  lgagat

lgagat <- data.frame(lgagat)
county <- rep('lgagat', nrow(lgagat))
county <- as.factor(county)
lgagat <- cbind(lgagat, county)
lgagat%>% distinct() -> lgagat

## Собрать ссылки на объявления о продаже квартир на территории "Жабино - Войсковицы" (id lgazha)

str_c("https://www.cian.ru/cat.php?bbox=59.48680179758425%2C29.42000920996092%2C59.635249874694175%2C30.21789129003904&center=59.56110793640289%2C29.818950249999993&deal_type=sale&engine_version=2&in_polygon[0]=29.6650092_59.6099888%2C29.6485155_59.6082417%2C29.6464538_59.5991571%2C29.6622602_59.5918194%2C29.6753177_59.5858794%2C29.6911242_59.5799395%2C29.7103668_59.5739995%2C29.7289222_59.5694571%2C29.7433542_59.5649148%2C29.7605351_59.5589748%2C29.7790905_59.554083%2C29.7969587_59.5498901%2C29.8155141_59.5470948%2C29.8340695_59.5446489%2C29.8519376_59.5394078%2C29.8684313_59.5324196%2C29.8835505_59.5282266%2C29.9027932_59.5240337%2C29.9206613_59.5205396%2C29.9392167_59.5173949%2C29.9557104_59.5139008%2C29.9722041_59.5114549%2C29.989385_59.5139008%2C29.9914467_59.5222866%2C29.9845744_59.5320701%2C29.9735786_59.5411548%2C29.9618955_59.5502395%2C29.9495253_59.5596736%2C29.9385295_59.5691077%2C29.9282209_59.577843%2C29.9158507_59.58553%2C29.9027932_59.5935665%2C29.887674_59.6009041%2C29.8539993_59.6064947%2C29.829946_59.6085912%2C29.8134524_59.6096394%2C29.794897_59.6103382%2C29.7715309_59.6106876%2C29.7502266_59.6106876%2C29.7296095_59.6106876%2C29.7103668_59.6106876%2C29.6924987_59.6106876%2C29.6746305_59.6106876%2C29.6650092_59.6099888&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.48680179758425%2C29.42000920996092%2C59.635249874694175%2C30.21789129003904&center=59.56110793640289%2C29.818950249999993&deal_type=sale&engine_version=2&in_polygon[0]=29.6650092_59.6099888%2C29.6485155_59.6082417%2C29.6464538_59.5991571%2C29.6622602_59.5918194%2C29.6753177_59.5858794%2C29.6911242_59.5799395%2C29.7103668_59.5739995%2C29.7289222_59.5694571%2C29.7433542_59.5649148%2C29.7605351_59.5589748%2C29.7790905_59.554083%2C29.7969587_59.5498901%2C29.8155141_59.5470948%2C29.8340695_59.5446489%2C29.8519376_59.5394078%2C29.8684313_59.5324196%2C29.8835505_59.5282266%2C29.9027932_59.5240337%2C29.9206613_59.5205396%2C29.9392167_59.5173949%2C29.9557104_59.5139008%2C29.9722041_59.5114549%2C29.989385_59.5139008%2C29.9914467_59.5222866%2C29.9845744_59.5320701%2C29.9735786_59.5411548%2C29.9618955_59.5502395%2C29.9495253_59.5596736%2C29.9385295_59.5691077%2C29.9282209_59.577843%2C29.9158507_59.58553%2C29.9027932_59.5935665%2C29.887674_59.6009041%2C29.8539993_59.6064947%2C29.829946_59.6085912%2C29.8134524_59.6096394%2C29.794897_59.6103382%2C29.7715309_59.6106876%2C29.7502266_59.6106876%2C29.7296095_59.6106876%2C29.7103668_59.6106876%2C29.6924987_59.6106876%2C29.6746305_59.6106876%2C29.6650092_59.6099888&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11"), function(linkCollectLgazha){
  source <- read_html(linkCollectLgazha)
  print(linkCollectLgazha)
  
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
  lgazha

lgazha <- data.frame(lgazha)
county <- rep('lgazha', nrow(lgazha))
county <- as.factor(county)
lgazha <- cbind(lgazha, county)
lgazha%>% distinct() -> lgazha

## Собрать ссылки на объявления о продаже квартир на территории "Пудость" (id lgapud)

str_c("https://www.cian.ru/cat.php?bbox=59.57564249237989%2C29.843411629980434%2C59.64975229828434%2C30.242352670019507&center=59.612717899336516%2C30.042882149999983&deal_type=sale&engine_version=2&in_polygon[0]=29.9959783_59.6324189%2C29.9849825_59.6311981%2C29.9791409_59.628059%2C29.9805154_59.6235247%2C29.9853261_59.6200368%2C29.9928857_59.6155025%2C29.9997581_59.6114913%2C30.0100666_59.607829%2C30.0193443_59.6048643%2C30.028622_59.6024227%2C30.0368689_59.6008532%2C30.0451157_59.5992836%2C30.0533625_59.5970164%2C30.0616094_59.5949237%2C30.0701998_59.5937029%2C30.0787903_59.5931797%2C30.0877244_59.5930053%2C30.0973457_59.5942261%2C30.1031872_59.5975396%2C30.1049053_59.6020739%2C30.1066234_59.6062594%2C30.1052489_59.6106194%2C30.1007819_59.6149793%2C30.0935659_59.6181184%2C30.0863499_59.6203856%2C30.0787903_59.6224783%2C30.0712307_59.6247455%2C30.0629839_59.626315%2C30.0537062_59.6275358%2C30.0447721_59.6287566%2C30.0365252_59.6294542%2C30.0269039_59.6305005%2C30.0183135_59.6311981%2C30.0090358_59.6317213%2C30.0007889_59.6320701%2C29.9959783_59.6324189&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.57564249237989%2C29.843411629980434%2C59.64975229828434%2C30.242352670019507&center=59.612717899336516%2C30.042882149999983&deal_type=sale&engine_version=2&in_polygon[0]=29.9959783_59.6324189%2C29.9849825_59.6311981%2C29.9791409_59.628059%2C29.9805154_59.6235247%2C29.9853261_59.6200368%2C29.9928857_59.6155025%2C29.9997581_59.6114913%2C30.0100666_59.607829%2C30.0193443_59.6048643%2C30.028622_59.6024227%2C30.0368689_59.6008532%2C30.0451157_59.5992836%2C30.0533625_59.5970164%2C30.0616094_59.5949237%2C30.0701998_59.5937029%2C30.0787903_59.5931797%2C30.0877244_59.5930053%2C30.0973457_59.5942261%2C30.1031872_59.5975396%2C30.1049053_59.6020739%2C30.1066234_59.6062594%2C30.1052489_59.6106194%2C30.1007819_59.6149793%2C30.0935659_59.6181184%2C30.0863499_59.6203856%2C30.0787903_59.6224783%2C30.0712307_59.6247455%2C30.0629839_59.626315%2C30.0537062_59.6275358%2C30.0447721_59.6287566%2C30.0365252_59.6294542%2C30.0269039_59.6305005%2C30.0183135_59.6311981%2C30.0090358_59.6317213%2C30.0007889_59.6320701%2C29.9959783_59.6324189&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12"), function(linkCollectLgapud){
  source <- read_html(linkCollectLgapud)
  print(linkCollectLgapud)
  
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
  lgapud

lgapud <- data.frame(lgapud)
county <- rep('lgapud', nrow(lgapud))
county <- as.factor(county)
lgapud <- cbind(lgapud, county)
lgapud%>% distinct() -> lgapud

## Собрать ссылки на объявления о продаже квартир на территории "Малое Верево - Зайцы" (id lgamal)

str_c("https://www.cian.ru/cat.php?bbox=59.5964612988%2C29.97616088%2C59.6705250713%2C30.37510192&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.1194498_59.6001232%2C30.1276966_59.5983805%2C30.1383488_59.5978577%2C30.1472829_59.5978577%2C30.1558733_59.598032%2C30.1637765_59.5996004%2C30.1716798_59.6016915%2C30.1788958_59.603957%2C30.1864554_59.6062224%2C30.1947022_59.6086621%2C30.2019182_59.6109275%2C30.2087906_59.61389%2C30.2115395_59.6180724%2C30.2153193_59.6233003%2C30.2166938_59.6281797%2C30.2177246_59.6325363%2C30.2232225_59.6400296%2C30.2239098_59.6443862%2C30.2263151_59.6490914%2C30.2304385_59.6527509%2C30.2342183_59.656759%2C30.23628_59.6609413%2C30.2369673_59.6651237%2C30.2311258_59.6687832%2C30.2211608_59.6691317%2C30.2146321_59.665995%2C30.2098214_59.6625097%2C30.205698_59.657456%2C30.2019182_59.6520539%2C30.1967639_59.6464774%2C30.1888607_59.640901%2C30.1837064_59.6372414%2C30.176834_59.6330591%2C30.1665255_59.6283539%2C30.1589659_59.6253915%2C30.150719_59.6229518%2C30.1414413_59.6201635%2C30.1338817_59.6173753%2C30.1263221_59.6142386%2C30.1197934_59.6109275%2C30.1149827_59.607268%2C30.1142955_59.6030857%2C30.1194498_59.6001232&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.5964612988%2C29.97616088%2C59.6705250713%2C30.37510192&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.1194498_59.6001232%2C30.1276966_59.5983805%2C30.1383488_59.5978577%2C30.1472829_59.5978577%2C30.1558733_59.598032%2C30.1637765_59.5996004%2C30.1716798_59.6016915%2C30.1788958_59.603957%2C30.1864554_59.6062224%2C30.1947022_59.6086621%2C30.2019182_59.6109275%2C30.2087906_59.61389%2C30.2115395_59.6180724%2C30.2153193_59.6233003%2C30.2166938_59.6281797%2C30.2177246_59.6325363%2C30.2232225_59.6400296%2C30.2239098_59.6443862%2C30.2263151_59.6490914%2C30.2304385_59.6527509%2C30.2342183_59.656759%2C30.23628_59.6609413%2C30.2369673_59.6651237%2C30.2311258_59.6687832%2C30.2211608_59.6691317%2C30.2146321_59.665995%2C30.2098214_59.6625097%2C30.205698_59.657456%2C30.2019182_59.6520539%2C30.1967639_59.6464774%2C30.1888607_59.640901%2C30.1837064_59.6372414%2C30.176834_59.6330591%2C30.1665255_59.6283539%2C30.1589659_59.6253915%2C30.150719_59.6229518%2C30.1414413_59.6201635%2C30.1338817_59.6173753%2C30.1263221_59.6142386%2C30.1197934_59.6109275%2C30.1149827_59.607268%2C30.1142955_59.6030857%2C30.1194498_59.6001232&object_type%5B0%5D=1&offer_type=flat&p=", 1:2, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLgamal){
  source <- read_html(linkCollectLgamal)
  print(linkCollectLgamal)
  
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
  lgamal

lgamal <- data.frame(lgamal)
county <- rep('lgamal', nrow(lgamal))
county <- as.factor(county)
lgamal <- cbind(lgamal, county)
lgamal%>% distinct() -> lgamal

## Собрать ссылки на объявления о продаже квартир на территории "Тайцы" (id lgataj)

str_c("https://www.cian.ru/cat.php?bbox=59.64681664549372%2C30.01881583999018%2C59.68381331552544%2C30.218286360009703&center=59.66532010112647%2C30.11855109999995&deal_type=sale&engine_version=2&in_polygon[0]=30.1101325_59.6779849%2C30.10515_59.6765049%2C30.1011984_59.6751119%2C30.0962159_59.6728484%2C30.0938106_59.670846%2C30.0920925_59.6684954%2C30.0908898_59.6662318%2C30.0905462_59.6637942%2C30.0905462_59.6613565%2C30.0922643_59.6588317%2C30.0951851_59.6572647%2C30.0994803_59.6557846%2C30.1044628_59.6545658%2C30.1094452_59.6539564%2C30.1140841_59.6536082%2C30.1192383_59.6532599%2C30.1247362_59.6529117%2C30.1300623_59.6526505%2C30.1353884_59.6526505%2C30.1396836_59.6531729%2C30.1432916_59.6543917%2C30.145697_59.6565682%2C30.146556_59.6588317%2C30.1462124_59.6613565%2C30.1451815_59.663533%2C30.1434634_59.6666671%2C30.1415735_59.6687566%2C30.1391682_59.6711942%2C30.1353884_59.6732837%2C30.131265_59.6747637%2C30.1274852_59.6757213%2C30.1223309_59.676679%2C30.1182075_59.6773755%2C30.1139123_59.6778108%2C30.1101325_59.6779849&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.64681664549372%2C30.01881583999018%2C59.68381331552544%2C30.218286360009703&center=59.66532010112647%2C30.11855109999995&deal_type=sale&engine_version=2&in_polygon[0]=30.1101325_59.6779849%2C30.10515_59.6765049%2C30.1011984_59.6751119%2C30.0962159_59.6728484%2C30.0938106_59.670846%2C30.0920925_59.6684954%2C30.0908898_59.6662318%2C30.0905462_59.6637942%2C30.0905462_59.6613565%2C30.0922643_59.6588317%2C30.0951851_59.6572647%2C30.0994803_59.6557846%2C30.1044628_59.6545658%2C30.1094452_59.6539564%2C30.1140841_59.6536082%2C30.1192383_59.6532599%2C30.1247362_59.6529117%2C30.1300623_59.6526505%2C30.1353884_59.6526505%2C30.1396836_59.6531729%2C30.1432916_59.6543917%2C30.145697_59.6565682%2C30.146556_59.6588317%2C30.1462124_59.6613565%2C30.1451815_59.663533%2C30.1434634_59.6666671%2C30.1415735_59.6687566%2C30.1391682_59.6711942%2C30.1353884_59.6732837%2C30.131265_59.6747637%2C30.1274852_59.6757213%2C30.1223309_59.676679%2C30.1182075_59.6773755%2C30.1139123_59.6778108%2C30.1101325_59.6779849&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13"), function(linkCollectLgataj){
  source <- read_html(linkCollectLgataj)
  print(linkCollectLgataj)
  
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
  lgataj

lgataj <- data.frame(lgataj)
county <- rep('lgataj', nrow(lgataj))
county <- as.factor(county)
lgataj <- cbind(lgataj, county)
lgataj%>% distinct() -> lgataj

## Собрать ссылки на объявления о продаже квартир на территории "Терволово - Кипень - Келози" (id lloter)

str_c("https://www.cian.ru/cat.php?bbox=59.63423722510077%2C29.664978379980436%2C59.70821744532373%2C30.06391942001951&center=59.67124781524742%2C29.864448899999985&deal_type=sale&engine_version=2&in_polygon[0]=29.8500169_59.700476%2C29.832836_59.7011722%2C29.8149679_59.6962986%2C29.8087827_59.6879439%2C29.8005359_59.6778486%2C29.7970997_59.667057%2C29.7991614_59.6566136%2C29.80947_59.6489551%2C29.821153_59.6430371%2C29.8541404_59.6412966%2C29.8713213_59.6416447%2C29.8898767_59.642689%2C29.9063704_59.6447777%2C29.9214896_59.6493032%2C29.9304237_59.6576579%2C29.9317981_59.6681014%2C29.9194279_59.6781967%2C29.9029342_59.6855071%2C29.8885022_59.6903807%2C29.873383_59.6956024%2C29.8575765_59.7001279%2C29.8500169_59.700476&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.63423722510077%2C29.664978379980436%2C59.70821744532373%2C30.06391942001951&center=59.67124781524742%2C29.864448899999985&deal_type=sale&engine_version=2&in_polygon[0]=29.8500169_59.700476%2C29.832836_59.7011722%2C29.8149679_59.6962986%2C29.8087827_59.6879439%2C29.8005359_59.6778486%2C29.7970997_59.667057%2C29.7991614_59.6566136%2C29.80947_59.6489551%2C29.821153_59.6430371%2C29.8541404_59.6412966%2C29.8713213_59.6416447%2C29.8898767_59.642689%2C29.9063704_59.6447777%2C29.9214896_59.6493032%2C29.9304237_59.6576579%2C29.9317981_59.6681014%2C29.9194279_59.6781967%2C29.9029342_59.6855071%2C29.8885022_59.6903807%2C29.873383_59.6956024%2C29.8575765_59.7001279%2C29.8500169_59.700476&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12"), function(linkCollectLloter){
  source <- read_html(linkCollectLloter)
  print(linkCollectLloter)
  
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
  lloter

lloter <- data.frame(lloter)
county <- rep('lloter', nrow(lloter))
county <- as.factor(county)
lloter <- cbind(lloter, county)
lloter%>% distinct() -> lloter

## Собрать ссылки на объявления о продаже квартир на территории "Лаголово - Русско-Высоцкое" (id llolag)

str_c("https://www.cian.ru/cat.php?bbox=59.661770499247005%2C29.78033747998042%2C59.73568980209196%2C30.17927852001947&center=59.698750619412685%2C29.979807999999945&deal_type=sale&engine_version=2&in_polygon[0]=29.9521467_59.7083105%2C29.9425254_59.7063973%2C29.9342786_59.7027447%2C29.9277498_59.6999617%2C29.9222519_59.696483%2C29.9184721_59.6919608%2C29.9177849_59.6872646%2C29.92397_59.6832641%2C29.931186_59.681003%2C29.9404637_59.6794376%2C29.952834_59.67822%2C29.9610808_59.6780461%2C29.9713894_59.678394%2C29.9813543_59.6801333%2C29.9926937_59.6829162%2C30.0012842_59.6853513%2C30.0115927_59.6883082%2C30.0194959_59.6909172%2C30.0263683_59.6943958%2C30.0322098_59.6978745%2C30.038395_59.701875%2C30.0418311_59.7060494%2C30.0404567_59.7102238%2C30.0363332_59.7138764%2C30.0308353_59.7170072%2C30.0229321_59.7187465%2C30.01228_59.7194423%2C29.9981916_59.7190944%2C29.9882267_59.7180508%2C29.9744819_59.7156157%2C29.9655478_59.7133546%2C29.9562701_59.7102238%2C29.9521467_59.7083105&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.661770499247005%2C29.78033747998042%2C59.73568980209196%2C30.17927852001947&center=59.698750619412685%2C29.979807999999945&deal_type=sale&engine_version=2&in_polygon[0]=29.9521467_59.7083105%2C29.9425254_59.7063973%2C29.9342786_59.7027447%2C29.9277498_59.6999617%2C29.9222519_59.696483%2C29.9184721_59.6919608%2C29.9177849_59.6872646%2C29.92397_59.6832641%2C29.931186_59.681003%2C29.9404637_59.6794376%2C29.952834_59.67822%2C29.9610808_59.6780461%2C29.9713894_59.678394%2C29.9813543_59.6801333%2C29.9926937_59.6829162%2C30.0012842_59.6853513%2C30.0115927_59.6883082%2C30.0194959_59.6909172%2C30.0263683_59.6943958%2C30.0322098_59.6978745%2C30.038395_59.701875%2C30.0418311_59.7060494%2C30.0404567_59.7102238%2C30.0363332_59.7138764%2C30.0308353_59.7170072%2C30.0229321_59.7187465%2C30.01228_59.7194423%2C29.9981916_59.7190944%2C29.9882267_59.7180508%2C29.9744819_59.7156157%2C29.9655478_59.7133546%2C29.9562701_59.7102238%2C29.9521467_59.7083105&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=12"), function(linkCollectLlolag){
  source <- read_html(linkCollectLlolag)
  print(linkCollectLlolag)
  
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
  llolag

llolag <- data.frame(llolag)
county <- rep('llolag', nrow(llolag))
county <- as.factor(county)
llolag <- cbind(llolag, county)
llolag%>% distinct() -> llolag

## Собрать ссылки на объявления о продаже квартир на территории "Ропша - Гостилицы" (id llorop)

str_c("https://www.cian.ru/cat.php?bbox=59.66069252843077%2C29.376541159960926%2C59.808372272872056%2C30.174423240039047&center=59.73461421659809%2C29.7754822&deal_type=sale&engine_version=2&in_polygon[0]=29.9225509_59.7185937%2C29.9417935_59.7192887%2C29.9576_59.7217215%2C29.969283_59.7307573%2C29.954851_59.7384031%2C29.9266743_59.7415309%2C29.9060572_59.742921%2C29.8524527_59.7467439%2C29.8297739_59.7488291%2C29.8105313_59.7505668%2C29.7899141_59.7540421%2C29.7741077_59.757865%2C29.7521161_59.7616878%2C29.7308118_59.7665533%2C29.7033223_59.7738515%2C29.6861414_59.7766318%2C29.6634625_59.7797596%2C29.6449072_59.7811497%2C29.6249773_59.7821923%2C29.6022985_59.7818448%2C29.5906154_59.7752417%2C29.5871792_59.7665533%2C29.5816814_59.7568224%2C29.586492_59.7488291%2C29.5968006_59.7397932%2C29.6071091_59.7307573%2C29.6201666_59.7192887%2C29.6304752_59.7119905%2C29.6421582_59.7039972%2C29.6538412_59.696699%2C29.6710222_59.6897483%2C29.6964499_59.6869681%2C29.7136308_59.6869681%2C29.7328735_59.6883582%2C29.7548651_59.6904434%2C29.7830418_59.6928762%2C29.7988482_59.6953089%2C29.8249632_59.6998268%2C29.8524527_59.7067775%2C29.8682592_59.7102528%2C29.8840656_59.7137282%2C29.9033082_59.7172035%2C29.9198019_59.7192887%2C29.9225509_59.7185937&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.66069252843077%2C29.376541159960926%2C59.808372272872056%2C30.174423240039047&center=59.73461421659809%2C29.7754822&deal_type=sale&engine_version=2&in_polygon[0]=29.9225509_59.7185937%2C29.9417935_59.7192887%2C29.9576_59.7217215%2C29.969283_59.7307573%2C29.954851_59.7384031%2C29.9266743_59.7415309%2C29.9060572_59.742921%2C29.8524527_59.7467439%2C29.8297739_59.7488291%2C29.8105313_59.7505668%2C29.7899141_59.7540421%2C29.7741077_59.757865%2C29.7521161_59.7616878%2C29.7308118_59.7665533%2C29.7033223_59.7738515%2C29.6861414_59.7766318%2C29.6634625_59.7797596%2C29.6449072_59.7811497%2C29.6249773_59.7821923%2C29.6022985_59.7818448%2C29.5906154_59.7752417%2C29.5871792_59.7665533%2C29.5816814_59.7568224%2C29.586492_59.7488291%2C29.5968006_59.7397932%2C29.6071091_59.7307573%2C29.6201666_59.7192887%2C29.6304752_59.7119905%2C29.6421582_59.7039972%2C29.6538412_59.696699%2C29.6710222_59.6897483%2C29.6964499_59.6869681%2C29.7136308_59.6869681%2C29.7328735_59.6883582%2C29.7548651_59.6904434%2C29.7830418_59.6928762%2C29.7988482_59.6953089%2C29.8249632_59.6998268%2C29.8524527_59.7067775%2C29.8682592_59.7102528%2C29.8840656_59.7137282%2C29.9033082_59.7172035%2C29.9198019_59.7192887%2C29.9225509_59.7185937&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=11"), function(linkCollectLlorop){
  source <- read_html(linkCollectLlorop)
  print(linkCollectLlorop)
  
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
  llorop

llorop <- data.frame(llorop)
county <- rep('llorop', nrow(llorop))
county <- as.factor(county)
llorop <- cbind(llorop, county)
llorop%>% distinct() -> llorop

## Собрать ссылки на объявления о продаже квартир на территории "Новоселье - Аннино " (id llonow)

str_c("https://www.cian.ru/cat.php?bbox=59.7536822404%2C29.86526138%2C59.8273980687%2C30.26420242&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.081741_59.8145797%2C30.0717761_59.8149267%2C30.0618112_59.8149267%2C30.0528771_59.8144062%2C30.0415377_59.8112834%2C30.0374142_59.8074667%2C30.0350089_59.8031295%2C30.0329472_59.7986188%2C30.0301983_59.7932407%2C30.0281365_59.7880361%2C30.0277929_59.7838724%2C30.0288238_59.7786677%2C30.03226_59.7746775%2C30.0360398_59.7705138%2C30.0422249_59.767738%2C30.0508154_59.7661766%2C30.0587186_59.767738%2C30.0662782_59.7701668%2C30.0738378_59.7731161%2C30.0807102_59.7757184%2C30.0868953_59.7784942%2C30.091706_59.782311%2C30.0965166_59.7864747%2C30.0985783_59.7909854%2C30.0996092_59.7960165%2C30.10064_59.8001802%2C30.1016709_59.8050379%2C30.10064_59.8092016%2C30.0965166_59.8130183%2C30.0882698_59.8147532%2C30.081741_59.8145797&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.7536822404%2C29.86526138%2C59.8273980687%2C30.26420242&deal_type=sale&engine_version=2&in_polygon%5B1%5D=30.081741_59.8145797%2C30.0717761_59.8149267%2C30.0618112_59.8149267%2C30.0528771_59.8144062%2C30.0415377_59.8112834%2C30.0374142_59.8074667%2C30.0350089_59.8031295%2C30.0329472_59.7986188%2C30.0301983_59.7932407%2C30.0281365_59.7880361%2C30.0277929_59.7838724%2C30.0288238_59.7786677%2C30.03226_59.7746775%2C30.0360398_59.7705138%2C30.0422249_59.767738%2C30.0508154_59.7661766%2C30.0587186_59.767738%2C30.0662782_59.7701668%2C30.0738378_59.7731161%2C30.0807102_59.7757184%2C30.0868953_59.7784942%2C30.091706_59.782311%2C30.0965166_59.7864747%2C30.0985783_59.7909854%2C30.0996092_59.7960165%2C30.10064_59.8001802%2C30.1016709_59.8050379%2C30.10064_59.8092016%2C30.0965166_59.8130183%2C30.0882698_59.8147532%2C30.081741_59.8145797&object_type%5B0%5D=1&offer_type=flat&p=", 1:4, "&polygon_name%5B1%5D=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C+%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1"), function(linkCollectLlonow){
  source <- read_html(linkCollectLlonow)
  print(linkCollectLlonow)
  
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
  llonow

llonow <- data.frame(llonow)
county <- rep('llonow', nrow(llonow))
county <- as.factor(county)
llonow <- cbind(llonow, county)
llonow%>% distinct() -> llonow

## Собрать ссылки на объявления о продаже квартир на территории "Горбунки" (id llogor)

str_c("https://www.cian.ru/cat.php?bbox=59.80573138198501%2C29.93100841999511%2C59.824146820947156%2C30.030743680004857&center=59.81494037776833%2C29.980876049999996&deal_type=sale&engine_version=2&in_polygon[0]=29.9795875_59.8211374%2C29.9744332_59.8211374%2C29.9699662_59.8203573%2C29.96653_59.8190571%2C29.9648119_59.8170634%2C29.9646401_59.8138562%2C29.9667018_59.8116025%2C29.9704816_59.8098689%2C29.9758077_59.8087421%2C29.9823364_59.808482%2C29.9888652_59.8085687%2C29.9928168_59.8092622%2C29.9959094_59.8106491%2C29.9969402_59.8128161%2C29.997112_59.8150698%2C29.9960812_59.8174101%2C29.9941913_59.8195772%2C29.9904115_59.8212241%2C29.9849136_59.8213975%2C29.9807901_59.8213108%2C29.9795875_59.8211374&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=14")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.80573138198501%2C29.93100841999511%2C59.824146820947156%2C30.030743680004857&center=59.81494037776833%2C29.980876049999996&deal_type=sale&engine_version=2&in_polygon[0]=29.9795875_59.8211374%2C29.9744332_59.8211374%2C29.9699662_59.8203573%2C29.96653_59.8190571%2C29.9648119_59.8170634%2C29.9646401_59.8138562%2C29.9667018_59.8116025%2C29.9704816_59.8098689%2C29.9758077_59.8087421%2C29.9823364_59.808482%2C29.9888652_59.8085687%2C29.9928168_59.8092622%2C29.9959094_59.8106491%2C29.9969402_59.8128161%2C29.997112_59.8150698%2C29.9960812_59.8174101%2C29.9941913_59.8195772%2C29.9904115_59.8212241%2C29.9849136_59.8213975%2C29.9807901_59.8213108%2C29.9795875_59.8211374&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=14"), function(linkCollectLlogor){
  source <- read_html(linkCollectLlogor)
  print(linkCollectLlogor)
  
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
  llogor

llogor <- data.frame(llogor)
county <- rep('llogor', nrow(llogor))
county <- as.factor(county)
llogor <- cbind(llogor, county)
llogor%>% distinct() -> llogor

## Собрать ссылки на объявления о продаже квартир на территории "Разбегаево - Узигонты" (id lloraz)

str_c("https://www.cian.ru/cat.php?bbox=59.7769969014355%2C29.806582189990205%2C59.813849415167226%2C30.00605271000973&center=59.795428265527434%2C29.906317449999953&deal_type=sale&engine_version=2&in_polygon[0]=29.8930881_59.8113849%2C29.8831232_59.8115583%2C29.8717838_59.8101705%2C29.8649114_59.8075682%2C29.8625061_59.8032311%2C29.8649114_59.7982001%2C29.8721274_59.7933426%2C29.8786562_59.7903933%2C29.8858722_59.7865767%2C29.8937754_59.7838009%2C29.9033967_59.7818926%2C29.9116435_59.7808517%2C29.9209212_59.7798108%2C29.9291681_59.7792904%2C29.9381022_59.7798108%2C29.9446309_59.7825866%2C29.9484107_59.7865767%2C29.9501288_59.7910873%2C29.9487543_59.7952509%2C29.9449745_59.799241%2C29.9398203_59.8028842%2C29.9336351_59.8067008%2C29.9264191_59.8093031%2C29.9171414_59.8105174%2C29.9068329_59.8110379%2C29.8982424_59.8113849%2C29.8930881_59.8113849&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.7769969014355%2C29.806582189990205%2C59.813849415167226%2C30.00605271000973&center=59.795428265527434%2C29.906317449999953&deal_type=sale&engine_version=2&in_polygon[0]=29.8930881_59.8113849%2C29.8831232_59.8115583%2C29.8717838_59.8101705%2C29.8649114_59.8075682%2C29.8625061_59.8032311%2C29.8649114_59.7982001%2C29.8721274_59.7933426%2C29.8786562_59.7903933%2C29.8858722_59.7865767%2C29.8937754_59.7838009%2C29.9033967_59.7818926%2C29.9116435_59.7808517%2C29.9209212_59.7798108%2C29.9291681_59.7792904%2C29.9381022_59.7798108%2C29.9446309_59.7825866%2C29.9484107_59.7865767%2C29.9501288_59.7910873%2C29.9487543_59.7952509%2C29.9449745_59.799241%2C29.9398203_59.8028842%2C29.9336351_59.8067008%2C29.9264191_59.8093031%2C29.9171414_59.8105174%2C29.9068329_59.8110379%2C29.8982424_59.8113849%2C29.8930881_59.8113849&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13"), function(linkCollectLloraz){
  source <- read_html(linkCollectLloraz)
  print(linkCollectLloraz)
  
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
  lloraz

lloraz <- data.frame(lloraz)
county <- rep('lloraz', nrow(lloraz))
county <- as.factor(county)
lloraz <- cbind(lloraz, county)
lloraz%>% distinct() -> lloraz

## Собрать ссылки на объявления о продаже квартир на территории "Разбегаево - Узигонты" (id lloniz)

str_c("https://www.cian.ru/cat.php?bbox=59.8133834144693%2C29.785202139990222%2C59.85019560217617%2C29.98467266000977&center=59.83179461178748%2C29.884937399999995&deal_type=sale&engine_version=2&in_polygon[0]=29.8773778_59.8439205%2C29.8734262_59.8429675%2C29.8694746_59.8415815%2C29.8660384_59.8401954%2C29.8632894_59.838636%2C29.8607123_59.8363837%2C29.8588224_59.8336115%2C29.8586506_59.8314457%2C29.8588224_59.8286736%2C29.8595096_59.8262479%2C29.8603687_59.8241688%2C29.8634612_59.8220897%2C29.8674129_59.8210501%2C29.8725671_59.8200106%2C29.8775496_59.8195774%2C29.8830475_59.8194042%2C29.8887172_59.8194908%2C29.8938715_59.8198373%2C29.8979949_59.8203571%2C29.9036646_59.8221763%2C29.9067572_59.8242554%2C29.9093343_59.8262479%2C29.9112242_59.8285003%2C29.9112242_59.8310992%2C29.9098497_59.8336981%2C29.9081316_59.8368168%2C29.906929_59.8389826%2C29.9045237_59.8409751%2C29.900572_59.8423611%2C29.8909507_59.8437472%2C29.8856246_59.8441804%2C29.8809858_59.8441804%2C29.8773778_59.8439205&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.8133834144693%2C29.785202139990222%2C59.85019560217617%2C29.98467266000977&center=59.83179461178748%2C29.884937399999995&deal_type=sale&engine_version=2&in_polygon[0]=29.8773778_59.8439205%2C29.8734262_59.8429675%2C29.8694746_59.8415815%2C29.8660384_59.8401954%2C29.8632894_59.838636%2C29.8607123_59.8363837%2C29.8588224_59.8336115%2C29.8586506_59.8314457%2C29.8588224_59.8286736%2C29.8595096_59.8262479%2C29.8603687_59.8241688%2C29.8634612_59.8220897%2C29.8674129_59.8210501%2C29.8725671_59.8200106%2C29.8775496_59.8195774%2C29.8830475_59.8194042%2C29.8887172_59.8194908%2C29.8938715_59.8198373%2C29.8979949_59.8203571%2C29.9036646_59.8221763%2C29.9067572_59.8242554%2C29.9093343_59.8262479%2C29.9112242_59.8285003%2C29.9112242_59.8310992%2C29.9098497_59.8336981%2C29.9081316_59.8368168%2C29.906929_59.8389826%2C29.9045237_59.8409751%2C29.900572_59.8423611%2C29.8909507_59.8437472%2C29.8856246_59.8441804%2C29.8809858_59.8441804%2C29.8773778_59.8439205&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13"), function(linkCollectLloniz){
  source <- read_html(linkCollectLloniz)
  print(linkCollectLloniz)
  
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
  lloniz

lloniz <- data.frame(lloniz)
county <- rep('lloniz', nrow(lloniz))
county <- as.factor(county)
lloniz <- cbind(lloniz, county)
lloniz%>% distinct() -> lloniz

## Собрать ссылки на объявления о продаже квартир на территории "Большая Ижора - Лебяжье" (id llobol)

str_c("https://www.cian.ru/cat.php?bbox=59.934348359101406%2C29.388671339990193%2C59.97102638157549%2C29.588141860009742&center=59.95269246124098%2C29.488406599999966&deal_type=sale&engine_version=2&in_polygon[0]=29.4062818_59.96866%2C29.4018147_59.9643434%2C29.3990658_59.9600268%2C29.4007839_59.9551922%2C29.4083435_59.9512209%2C29.4148722_59.948113%2C29.4251808_59.9441417%2C29.4344585_59.9417244%2C29.4427053_59.9398251%2C29.4509522_59.9384438%2C29.4602299_59.9377532%2C29.4750055_59.9368899%2C29.49253_59.9367172%2C29.5086801_59.9367172%2C29.518645_59.9367172%2C29.5296408_59.9367172%2C29.5464781_59.9368899%2C29.5554122_59.9375805%2C29.5674388_59.9396525%2C29.5749985_59.9413791%2C29.5777474_59.9456957%2C29.5760293_59.9498396%2C29.5701878_59.9536382%2C29.5602229_59.9558829%2C29.5506015_59.9583002%2C29.5426983_59.9598541%2C29.5341079_59.9614081%2C29.5241429_59.9622714%2C29.514178_59.9631347%2C29.5031822_59.9636527%2C29.4932173_59.9643434%2C29.4835959_59.965034%2C29.4677895_59.96607%2C29.4554192_59.9667607%2C29.4471724_59.967106%2C29.4361766_59.9672787%2C29.425868_59.9677967%2C29.416934_59.9683147%2C29.4086871_59.9684873%2C29.4062818_59.96866&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13")

map_dfr(str_c("https://www.cian.ru/cat.php?bbox=59.934348359101406%2C29.388671339990193%2C59.97102638157549%2C29.588141860009742&center=59.95269246124098%2C29.488406599999966&deal_type=sale&engine_version=2&in_polygon[0]=29.4062818_59.96866%2C29.4018147_59.9643434%2C29.3990658_59.9600268%2C29.4007839_59.9551922%2C29.4083435_59.9512209%2C29.4148722_59.948113%2C29.4251808_59.9441417%2C29.4344585_59.9417244%2C29.4427053_59.9398251%2C29.4509522_59.9384438%2C29.4602299_59.9377532%2C29.4750055_59.9368899%2C29.49253_59.9367172%2C29.5086801_59.9367172%2C29.518645_59.9367172%2C29.5296408_59.9367172%2C29.5464781_59.9368899%2C29.5554122_59.9375805%2C29.5674388_59.9396525%2C29.5749985_59.9413791%2C29.5777474_59.9456957%2C29.5760293_59.9498396%2C29.5701878_59.9536382%2C29.5602229_59.9558829%2C29.5506015_59.9583002%2C29.5426983_59.9598541%2C29.5341079_59.9614081%2C29.5241429_59.9622714%2C29.514178_59.9631347%2C29.5031822_59.9636527%2C29.4932173_59.9643434%2C29.4835959_59.965034%2C29.4677895_59.96607%2C29.4554192_59.9667607%2C29.4471724_59.967106%2C29.4361766_59.9672787%2C29.425868_59.9677967%2C29.416934_59.9683147%2C29.4086871_59.9684873%2C29.4062818_59.96866&object_type[0]=1&offer_type=flat&polygon_name[0]=%D0%9E%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1&zoom=13"), function(linkCollectLlobol){ 
  source <- read_html(linkCollectLlobol)
  print(linkCollectLlobol)
  
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
  llobol

llobol <- data.frame(llobol)
county <- rep('llobol', nrow(llobol))
county <- as.factor(county)
llobol <- cbind(llobol, county)
llobol%>% distinct() -> llobol

s_adm <- rbind(sadadm, sadeka, sadizm, sadkol, sadsem, sadsen)
s_was <- rbind(swan07, swawas, swagaw, swamor, swaost)
s_wyb <- rbind(swyn15, swypar, swysam, swyswe, swysos, swyshu, swylew, svypar)
s_kal <- rbind(skan21, skaaka, skagra, skapis, skapro, skasew, skafin)
s_kir <- rbind(skiawt, skidac, skikny, skikra, skimor, skinar, skiulq)
s_kol <- rbind(skokol, skomet, skopet, skopon, skosap, skoust)
s_krg <- rbind(skrbol, skrmal, skrpol, skrpor, skrrzh)
s_krs <- rbind(skrgor, skrkon, skrsos, skruri, skryug, skryuz, skrkra)
s_krn <- rbind(skrkro)
s_kur <- rbind(skuzel, skumol, skupes, skurep, skuses, skusol)
s_mos <- rbind(smogag, smozwy, smomos, smonow, smopul)
s_new <- rbind(snen54, sneiwa, snenar, snenew, snenev, sneobu, sneokk, snepra, sneryb)
s_pet <- rbind(speapt, spewwe, spekro, spepet, spepos, spechk)
s_pec <- rbind(spelom, spepe2, spestr)
s_prm <- rbind(sprn65, sprkol, sprkom, sprlax, sproze, sprchy, spryun, sprlis)
s_pus <- rbind(spupaw, spupus, sputya, spushu)
s_frz <- rbind(sfrn72, sfrn75, sfrbal, sfrwol, sfrgeo, sfrkup)
s_czn <- rbind(sczn78, sczwla, sczdwo, sczlig, sczlit, sczsmo)
l_wyb <- rbind(lwyros)
l_wsw <- rbind(lwsser, lwsyuk, lwsste, lwsaga, lwstok, lwsbug, lwszap, lwsdew, lwswos, lwswse, lwsrom, lwsugl, lwsbor, lwsmor, lwsyan, lwskol, lwskal, lwswoe, lwsraz, lwszan, lwssew, lwsyuz, lwsdub, lwsnow, lwsswe)
l_kir <- rbind(lkikir, lkishl, lkisin, lkiotr, lkimga, lkinik)
l_tos <- rbind(ltokra, ltotos, ltowoj)
l_gat <- rbind(lgakom, lgakob, lgagat, lgazha, lgapud, lgamal, lgataj)
l_lom <- rbind(lloter, llolag, llorop, llonow, llogor, lloraz, lloniz, llobol)

spb <- rbind(s_adm, s_czn, s_frz, s_kal, s_kir, s_kol, s_krg, s_krn, s_krs, s_kur, s_mos, s_new, s_pec, s_pet, s_prm, s_was, s_wyb, s_pus)
lo <- rbind(l_wyb, l_wsw, l_kir, l_tos, l_gat, l_lom)

spba <- rbind(spb, lo)
spba$price_m <- gsub("[^0-9.-]", "", spba$price_m)
spba$price_m <- as.numeric(spba$price_m)
spba_flats %>% distinct() -> spba_flats

summary(spba$price_m)
write.csv(spba, '/home/kaarlahti/TresoritDrive/Methodics/My/AI_for_valuers/R-source/AI_for_valuers_R_source/datasets/spba_flats_price_m/spba_flats.csv')

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
   }) -> flats_x
  
  
  

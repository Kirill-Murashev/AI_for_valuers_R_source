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
  
  
  

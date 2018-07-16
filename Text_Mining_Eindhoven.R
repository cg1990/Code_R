library(dplyr)
library(tidytext)
library(stringr)
library(tm)
library(purrr)
library(ggplot2)

text <- paste(readLines("Memo_Tilburg_2.txt"))

text


library(dplyr)
  tilburgText <- data_frame(line = 1:5, text = text)
tilburgText
  

library(tidytext)
tidy_books <- tilburgText %>%
  unnest_tokens(word, text)

data(stop_words)
  tidy_books <- tidy_books %>%
    anti_join(stop_words)

library(dplyr)
  tidy_books %>%
    count(word, sort = TRUE) 
  tidy_books

  nrc_joy <- get_sentiments("nrc") %>% 
    filter(sentiment == "joy")
  
  tidy_books %>%

    inner_join(nrc_joy) %>%
    count(word, sort = TRUE)  
  tidy_books
  

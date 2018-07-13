library(dplyr)
library(tidytext)
library(stringr)
library(tm)
library(purrr)
library(ggplot2)

text <- paste(readLines("Memo_Tilburg_2.txt"))

text


library(dplyr)
tilburgText <- data_frame(line = 1:6, text = text)

tilburgText
  
  
library(tidytext)

tilburgText %>%
  unnest_tokens(word, text)  


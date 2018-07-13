library(dplyr)
library(tidytext)
library(stringr)
library(tm)
library(purrr)
library(ggplot2)

library(dplyr)
text_df <- data_frame(line = 1:4, text = text)

text_df
  
  
library(tidytext)

text_df %>%
  unnest_tokens(word, text)  


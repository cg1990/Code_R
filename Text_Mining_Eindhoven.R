library(dplyr)
library(tidytext)

tilburgText <- paste(readLines("Memo_Tilburg_2.txt"), collapse = " ")
  tilburgText
  
tilburgText <- gsub(pattern="\\W", replace=" ", tilburgText)
  tilburgText
  
tilburgText2 <- gsub(pattern="\\d", replace=" ", tilburgText)
  tilburgText2
tilburgText2 <- tolower(tilburgText2)
  tilburgText2

tilburgText2 <- removeWords(tilburgText2, stopwords())%>%
  mutate(linenumber = row_number())%>%
  tilburgText2
  count(words())

tidy_tilburgText2 <- tilburgText2
  tidy_tilburgText2
  
text_df <- data_frame(line = 1:4, tilburgText2 = tilburgText2)
  text_df





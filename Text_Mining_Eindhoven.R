getwd()

tilburgText <- paste(readLines("Memo_Tilburg_2.txt"), collapse = " ")
tilburgText
tilburgText <- gsub(pattern="\\W", replace=" ", tilburgText)
tilburgText
tilburgText2 <- gsub(pattern="\\d", replace=" ", tilburgText)
tilburgText2
tilburgText2 <- tolower(tilburgText2)
tilburgText2
library(tm)
tilburgText2 <- removeWords(tilburgText2, stopwords())
tilburgText2





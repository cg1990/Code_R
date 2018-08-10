library(tm)
library(SnowballC)
library(wordcloud)
library(igraph)

list.files(pattern=".csv")

list.filenames = list.files(pattern = ".csv")
list.filenames
list.data <- list()
reviews = read.csv(list.filenames[i], stringsAsFactors = F, row.names = 1)
reviews

review_corpus = Corpus(VectorSource(reviews))
review_corpus

review_corpus = tm_map(review_corpus, content_transformer(tolower))
review_corpus = tm_map(review_corpus, removeNumbers)
review_corpus = tm_map(review_corpus, removePunctuation)
review_corpus = tm_map(review_corpus, removeWords, c("the", "and", stopwords("english")))
review_corpus =  tm_map(review_corpus, stripWhitespace)

inspect(review_corpus[0])

review_dtm <- DocumentTermMatrix(review_corpus)
review_dtm
inspect(review_dtm)

review_dtm = removeSparseTerms(review_dtm, 0.99)
review_dtm

findFreqTerms(review_dtm, 10)

freq = data.frame(sort(colSums(as.matrix(review_dtm)), decreasing=TRUE))
wordcloud(rownames(freq), freq[,1], max.words=50, colors=brewer.pal(14, "Dark2"))

review_dtm_tfidf <- DocumentTermMatrix(review_corpus, control = list(weighting = weightTfIdf))
review_dtm_tfidf = removeSparseTerms(review_dtm_tfidf, 0.95)
review_dtm_tfidf
inspect(review_dtm_tfidf)

g1 <- graph( edges=c(1,2, 2,3, 3, 1), n=3, directed=F ) 
plot(g1)

class(g1)

g2 <- graph( edges=c(1,2, 2,3, 3, 1), n=10 )
plot(g2)

g3 <- graph( c("John", "Jim", "Jim", "Jill", "Jill", "John"))
plot(g3)

g4 <- graph( c("John", "Jim", "Jim", "Jack", "Jim", "Jack", "John", "John"), 
             
             isolates=c("Jesse", "Janis", "Jennifer", "Justin") ) 

plot(g4, edge.arrow.size=.5, vertex.color="gold", vertex.size=15, 
     
     vertex.frame.color="gray", vertex.label.color="black", 
     
     vertex.label.cex=0.8, vertex.label.dist=2, edge.curved=0.2) 

g4[]

V(g4)$gender <- c("male", "male", "male", "male", "female", "female", "male")

E(g4)$type <- "email" # Edge attribute, assign "email" to all edges

E(g4)$weight <- 10    # Edge weight, setting all existing edges to 10

plot(g4, edge.arrow.size=.5, vertex.label.color="black", vertex.label.dist=1.5,
     
     vertex.color=c( "pink", "skyblue")[1+(V(g4)$gender=="male")] ) 

eg <- make_empty_graph(40)

plot(eg, vertex.size=10, vertex.label=NA)

fg <- make_full_graph(40)

plot(fg, vertex.size=10, vertex.label=NA)


tr <- make_tree(40, children = 3, mode = "undirected")

plot(tr, vertex.size=10, vertex.label=NA)

er <- sample_gnm(n=100, m=40) 

plot(er, vertex.size=6, vertex.label=NA)  


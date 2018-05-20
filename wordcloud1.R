ww2<-readLines("Worldwar2.txt")
ww2

library(tm)

ww2_corpus<-Corpus(VectorSource(ww2))

#to view the Corpus

inspect(ww2_corpus)

#cleaning the text and text transformation

ww2_clean<-tm_map(ww2_corpus,tolower)
ww2_clean<-tm_map(ww2_clean,removeNumbers)
ww2_clean<-tm_map(ww2_clean,removePunctuation)
ww2_clean<-tm_map(ww2_clean,stripWhitespace)
ww2_clean<-tm_map(ww2_clean,removeWords,stopwords())  #removing words like in the or 
ww2_clean<-tm_map(ww2_clean,stemDocument) # lose,lost,losing,loser will be converted one word

#lets see the document after cleaning

inspect(ww2_clean)


library(wordcloud)

wordcloud(ww2_clean,min.freq = 2)
wordcloud(ww2_clean,min.freq = 1,colors = brewer.pal(8,"Dark2"))

#lets see te important words
wordcloud(ww2_clean,min.freq = 1,colors = brewer.pal(8,"Dark2"),random.order = F)

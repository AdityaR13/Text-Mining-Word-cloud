# Load imdb database
imdb <- read.csv("IMDB Top 50.csv")

# Convert to characters
imdb$Description <- as.character(imdb$Description)

# Load text mining package
library(tm)

# Load SnowballC package
library(SnowballC)

# Load RColorBrewer package
library(RColorBrewer)

#summary
summary(imdb)

# Convert description into a corpus
Corpus <- Corpus(VectorSource(imdb$Description))

# Convert terms to lower case
Corpus <- tm_map(Corpus, content_transformer(tolower))

# Remove punctuation
Corpus <- tm_map(Corpus, removePunctuation)

# Remove stop words from corpus
Corpus <- tm_map(Corpus, removeWords, stopwords("English"))

# Reduce terms to stems in corpus
Corpus <- tm_map(Corpus, stemDocument, "english")

# Strip whitespace from corpus
Corpus <- tm_map(Corpus, stripWhitespace)

# Convert corpus to text document
Corpus <- tm_map(Corpus, PlainTextDocument)

# Inspect first entry in the corpus
Corpus[[1]]$content

# Recrearting corpus as vector due to occurring error
Corpus <- Corpus(VectorSource(Corpus))

# Load the wordcloud package
library(wordcloud)

# Create a frequency word cloud
wordcloud( words = Corpus, max.words = 100, scale = c(2,0.2), colors=brewer.pal(8,"Dark2"))



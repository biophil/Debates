# this script will do the necessary stuff to bring the debate transcript into R in a useful way

source('is-name.R')

if(!exists('rawDebate')) {
        rawDebate <- scan(file='republican-2.txt', what=character())
}

if(!exists('wordStruct')) {
        wordStruct <- parseDebate(rawDebate)
}

numWords <- lapply(wordStruct$words, length) # vector of the number of words said by each cand
wordLengths <- lapply(wordStruct$words, nchar) # vector of all word lengths
avg.wordLength <- sapply(wordStruct$words, mean.wordLength) # vector of average word-length by each cand
max.wordLength <- sapply(wordStruct$words, maximum.wordLength) # vector of max word-length by each cand
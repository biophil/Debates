# this script will do the necessary stuff to bring the debate transcript into R in a useful way

source('is-name.R')

if(!exists('rawDebate')) {
        rawDebate <- scan(file='republican-2.txt', what=character())
}

if(!exists('wordStruct')) {
        wordStruct <- parseDebate(rawDebate)
}
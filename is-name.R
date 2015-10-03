## is-name checks a string to see if it's a name
isName <- function(word){
       to.ret <- grepl("[A-Z]{2,}[:]$",word) # checks for all caps followed by colon
       to.ret
}

isAnnotation <- function (word) {
        to.ret <- grepl("^[(][A-Za-z \t\r\n\v\f]{1,}[)]$",word) # something surrounded by parentheses
        to.ret
}

cleanPunct <- function(word) {
        to.ret <- gsub("[^[:alnum:]()]", "", word)
        to.ret
}


## parse-debate takes the raw character vector, picks out names, and builds the debate structure
parseDebate <- function(raw.input){
        speaker.words <- list() # will be list of speaker words
        position <- numeric()
        
        ## first look through the beginning and discard everything that's lame
        for(i in 1:length(raw.input)) {
                if(isName(raw.input[i])){
                        position <- i # if speaker name found, start next loop at i
                        break
                }
        }
        
        speaker <- character()
        #speaker <- raw.input[position] # initialize speaker name
        speaker.ID <- 1 # loop begins at first found speaker name
        for(i in position:length(raw.input)){
                this.word <- raw.input[i] # this.word is raw; no cleaning yet
                if(isName(this.word)){ # name-check requires the ending colon, so not clean yet
                        speaker <- cleanPunct(this.word) # current speaker (w/ colon removed)
                } else { # if not a name, this word belongs to the last person who spoke
                        this.word <- cleanPunct(this.word) # stip punctuation
                        if(!isAnnotation(this.word)){ # check if annotation
                                # then append
                                speaker.words[[speaker]] <- append(speaker.words[[speaker]],this.word)
                        }
                }
        }
        speaker.words
}

mean.wordLength <- function(charVec){
        mean(nchar(charVec))
}

maximum.wordLength <- function(charVec){
        max(nchar(charVec))
}
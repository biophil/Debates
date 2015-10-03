## is-name checks a string to see if it's a name
isName <- function(word){
       to.ret <- grepl("[A-Z]{2,}[:]$",word) # checks for all caps followed by colon
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
        
        speaker <- raw.input[position] # initialize speaker name
        speaker.ID <- 1 # loop begins at first found speaker name
        for(i in position:length(raw.input)){
                if(isName(raw.input[i])){
                        speaker <- raw.input[i] # current speaker
                } else { # if not a name, this word belongs to the last person who spoke
                        speaker.words[[speaker]] <- append(speaker.words[[speaker]],raw.input[i])
                }
        }
        speaker.words
}
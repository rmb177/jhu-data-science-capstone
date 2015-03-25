
createNgramModel <- function()
{
    con <- file("data_sets/training.txt") 
    open(con);
    tokenized_words <- c()
    while (length(lines <- readLines(con, n = 1000, warn = FALSE)) > 0) 
    {
        tokenized_words <- c(tokenized_words, stri_extract_all_words(lines))
    } 
    close(con)
    
    dt <- data.table(count(unlist(tokenized_words)))
    write.csv(dt, "unigrams.csv")
}


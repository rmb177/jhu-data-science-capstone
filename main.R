library(data.table)
library(plyr)
library(stringi)

source("download_files.R")
source("create_data_sets.R")
source("create_ngram_model.R")


# GLOBAL CONSTANTS
FILES_TO_EXTRACT = c("final/en_US/en_US.blogs.txt",
                     "final/en_US/en_US.news.txt",
                     "final/en_US/en_US.twitter.txt")

# Main driver program that calls all of the steps to run the project
#
run <- function()
{
    downloadFiles()
    createDataSets()
    createNgramModel()
}

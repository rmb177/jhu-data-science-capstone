DATA_URL <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
DATA_FILE <- "data.zip"

# Download the zip file containing the data files from the course website 
# if it doesn't exist in the current directory. Unzip the US files if they 
# haven't already been unzipped.
downloadFiles <- function()
{
    if (!file.exists(DATA_FILE))
    {
        download.file(DATA_URL, destfile = DATA_FILE, method="curl")
    }
    
    if (!file.exists("final"))
    {
        unzip(DATA_FILE, FILES_TO_EXTRACT)    
    }
}

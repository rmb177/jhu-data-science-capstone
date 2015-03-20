DATA_SET_DIR = "data_sets"
DATA_FILES = c("data_sets/training.txt", 
               "data_sets/validation.txt",
               "data_sets/testing.txt")

# Break the corpus up into training, validation and testing sets (60/20/20 split).
# We'll split the files up by processing 100 lines at a time, first 60 lines get written
# out to a training file, next 20 into a validation file and next 20 into a testing file.
createDataSets <- function()
{
    if (!file.exists(DATA_SET_DIR))
    {
        dir.create(DATA_SET_DIR)
        
        for (dataFile in DATA_FILES)
        {
            file.create(dataFile)
        }
        
        trainingConn <- file(DATA_FILES[1], open="a+b")
        validationConn <- file(DATA_FILES[2], open="a+b")
        testingConn <- file(DATA_FILES[3], open="a+b")
        
        for (inputFile in FILES_TO_EXTRACT)
        {
            con <- file(inputFile, open="r+b")
            while (length(lines <- readLines(con, n=100, warn=FALSE)) > 0) 
            {
                if (length(lines) == 100)
                {
                    writeLines(lines[1:60], trainingConn)
                    writeLines(lines[61:80], validationConn)
                    writeLines(lines[81:100], testingConn)
                }
            }
            close(con)
        }
        
        close(trainingConn)
        close(validationConn)
        close(testingConn)
    }
}

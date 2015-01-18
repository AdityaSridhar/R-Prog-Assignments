complete <- function(directory, id = 1:332)
{
    providedData <- id 
    numberOfEntries <- length(providedData)
    my_data <- data.frame(id = numeric(numberOfEntries), nobs = numeric(numberOfEntries))    
    
    fileList <- list.files(directory)
    
    for(i in 1:numberOfEntries)
    {
        fileName <- paste(directory,"/",fileList[providedData[i]],sep="")
        monitorData <- read.csv(fileName)
        goodData <- monitorData[complete.cases(monitorData),]
        my_data$id[i] <- providedData[i]
        my_data$nobs[i] <- nrow(goodData[,])
    }
    my_data  
}
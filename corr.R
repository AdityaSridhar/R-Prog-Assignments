corr <- function(directory, threshold = 0)
{
    source("complete.R")
    my_data <- complete(directory)
    
    correlationVector <- numeric()
    
    fileList <- list.files(directory)
    
    for(i in my_data$id)
    {
        if(my_data$nobs[i] > threshold)
        {
            fileName <- paste(directory,"/",fileList[i],sep="")
            monitorData <- read.csv(fileName)
            goodData <- monitorData[complete.cases(monitorData),]
            sulfNitrate <- cor(goodData$sulfate,goodData$nitrate)
            correlationVector <- c(correlationVector, sulfNitrate)
        }
    } 
    
    correlationVector  
}
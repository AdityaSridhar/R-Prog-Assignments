pollutantmean <- function(directory, pollutant, id = 1:332)
{
    pollusum <- 0
    pollucount <- 0
    pollumean <- 0 
    fileList <- list.files(directory)
    for(i in id)
    {
        fileName <- paste(directory,"/",fileList[i],sep="")
        monitorData <- read.csv(fileName)
        goodData <- monitorData[complete.cases(monitorData[pollutant]),]
        pollusum <- sum((goodData[pollutant])[,1]) + pollusum
        pollucount <- length((goodData[pollutant])[,1]) + pollucount
    }
    pollumean <- pollusum/pollucount 
}


datafolder    <- "./UCI HAR Dataset/"

featuresFile  <- "features.txt"

subjectsFiles <- c("test/subject_test.txt", 
                   "train/subject_train.txt")

activityFiles <- c("test/y_test.txt", 
                   "train/y_train.txt")

dataFiles     <- c("test/X_test.txt", 
                   "train/X_train.txt")


get_columninfo <- function(featuresFile) {
    if (!file.exists(featuresFile))
        stop(paste("missing file", featuresFile))
    features <- read.table(featuresFile, row.names=1, as.is=T)[,1]
    # select columns with mean and standard deviation (meanFreq and gravityMean are not considered!)
    sel <- grepl("mean\\(|std\\(", features)
    # ignore all other columns
    features[!sel] <- "NULL"
    return(features)
}

get_subjectinfo <- function(subjectsFile) {
    if (!file.exists(subjectsFile))
        stop(paste("missing file", subjectsFile))
    return(scan(subjectsFile))
}

get_activityinfo <- function(activityFile) {
    if (!file.exists(activityFile))
        stop(paste("missing file", activityFile))
    return(factor(scan(activityFile), labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                                               "SITTING", "STANDING", "LAYING")))
}

get_data <- function(dataFile, colSelected="numeric") {
    if (!file.exists(dataFile))
        stop(paste("missing file", dataFile))
    data <- read.table(dataFile, colClasses=ifelse(colSelected=="NULL", "NULL", "numeric"))
    # create column names and remove multiple "." in the names
    colnames(data) <- gsub("(\\.)+", ".", make.names(colSelected[colSelected != "NULL"]))
    # remove multiple "Body" in the names
    colnames(data) <- gsub("(Body)+", "Body", colnames(data))
    colnames(data) <- gsub("\\.$", "", colnames(data))
    return(data)
}

merge_data <- function(subjectFiles, activityFiles, dataFiles) {
    data <- data.frame()
    for (i in seq_along(dataFiles)) {
        subjects   <- get_subjectinfo(paste0(datafolder, subjectsFiles[i]))
        activities <- get_activityinfo(paste0(datafolder, activityFiles[i]))
        dataset    <- get_data(paste0(datafolder, dataFiles[i]), columninfo)
        
        data <- rbind(data, data.frame(subject=subjects, activity=activities, dataset))
    }
    data <- transform(data, subject=factor(subject))
    return(data)
}

columninfo <- get_columninfo(paste0(datafolder, featuresFile))

dataset <- merge_data(subjectFiles, activityFiles, dataFiles)

tidydata <- aggregate(dataset[,-c(1,2)], by=list(subject=dataset$subject, activity=dataset$activity), mean, na.rm=T)

write.table(tidydata, "tidyData.txt", row.names=F)

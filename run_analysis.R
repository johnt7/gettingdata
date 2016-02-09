library(dplyr)


#files of interest
featureFileName <- "UCI HAR Dataset/features.txt"
activityFileName <- "UCI HAR Dataset/activity_labels.txt"

trainTableFileName <- "UCI HAR Dataset/train/X_train.txt"
trainSubjectFileName <- "UCI HAR Dataset/train/subject_train.txt"
tainActivityFileName <- "UCI HAR Dataset/train/y_train.txt"

testTableFileName <- "UCI HAR Dataset/test/X_test.txt"
testSubjectFileName <- "UCI HAR Dataset/test/subject_test.txt"
testActivityFileName <- "UCI HAR Dataset/test/y_test.txt"

outAllFilename <- "allData.csv"
outSummaryFilename <- "summaryData.csv"


# Load the features and activity names and clean them a bit.
features <- read.table(featureFileName,stringsAsFactors=FALSE)
featureList <-  grep("(-mean[(])|(-std[(])", features[,2])
featureNames <- features[featureList,2]
featureNames <- gsub("[()]", "", featureNames)
activities <- read.table(activityFileName,stringsAsFactors=FALSE)
activities[,2] <- gsub("_", "-", activities[,2])

#load the training data.  
trainSubjects <- read.table(trainSubjectFileName)
trainActivity <- read.table(tainActivityFileName)
trainData <- read.table(trainTableFileName)

#load the test data.
testSubjects <- read.table(testSubjectFileName)
testActivity <- read.table(testActivityFileName)
testData <- read.table(testTableFileName)

# combine the test and training data
allData <- rbind(trainData, testData)

# select only the data columns we want, and put names on them
allData <- allData[,featureList]
colnames(allData) <- featureNames

# add the subject and activity columns
allData$subject <- c(trainSubjects[,1],testSubjects[,1])
allData$activity <- activities[c(trainActivity[,1], testActivity[,1]),2]


summaryData <- allData %>%
                group_by(subject, activity) %>%
                summarise_each(funs(sum), 1:66)
                

write.table(allData, outAllFilename, row.names=FALSE)
write.table(summaryData, outSummaryFilename, row.names=FALSE)

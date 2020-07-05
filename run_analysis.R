# Load test and train sets
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubj <- read.table("UCI HAR Dataset/test/subject_test.txt")

trainSet <- read.table("UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubj <- read.table("UCI HAR Dataset/train/subject_train.txt")


# Merge the test and train sets
mergedTest <- cbind(testSet, testLabels, testSubj)
mergedTrain <- cbind(trainSet, trainLabels, trainSubj)
mergedData <- rbind(mergedTest, mergedTrain)

# Load features text file, giving variable names
features <- read.table("UCI HAR Dataset/features.txt")

# Find the column numbers of any mean or std variables
featPos <- grep("mean|std", features$V2)

# Subset merged data to only columns representing mean or std variables
# keeping activity and subject labels
meanstdData <- mergedData[,c(featPos, 562:563)]

# Function to rename activity numbers with descriptive name
renameAct <- function(x){
        
        x <- sub("1", "walking", x)
        x <- sub("2", "walking upstairs", x)
        x <- sub("3", "walking downstairs", x)
        x <- sub("4", "sitting", x)
        x <- sub("5", "standing", x)
        x <- sub("6", "laying", x)
        
        x
}

# Rename activity variable in data frame
meanstdData[,ncol(meanstdData)-1] <- sapply(meanstdData[,ncol(meanstdData)-1], renameAct)

# Tidy up variable names
varNames <- c(features[featPos, "V2"], "activity", "subject")
varNames <- gsub("\\()", "", varNames)
varNames <- gsub("-", "", varNames)


# Include variable names in data frame
colnames(meanstdData) <- varNames

# Create and populate matrix with variable means for each activity within each subject
averagesData <- matrix(ncol = ncol(meanstdData), nrow = length(unique(meanstdData$subject))*length(unique(meanstdData$activity)))

counter <- 1

for (subj in unique(meanstdData$subject)){
        
        subsetbySubj <- meanstdData[meanstdData$subject==subj,]
        for (act in unique(meanstdData$activity)){
                subsetbyAct <- subsetbySubj[subsetbySubj$activity==act,]
                avs <- colMeans(subsetbyAct[,1:79])
                averagesData[counter,] <- c(avs, act, subj)
                counter <- counter + 1
                
        }
        
}

# Coerce to data frame and add variable names        
averagesDF <- data.frame(averagesData)        
colnames(averagesDF) <- colnames(meanstdData)

# Write both datasets to csv files
write.csv(meanstdData, "UCI HAR Dataset/meanstdData.csv")
write.csv(averagesDF, "UCI HAR Dataset/averagesActSubj.csv")

        
        
        
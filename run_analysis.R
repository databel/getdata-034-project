#1. Merges the training and the test sets to create one data set.
setwd("./doc/data-science/data-science-track/3-ds-getdata/project")
X_test = read.table("./X_test.txt")
X_train = read.table("./X_train.txt")


#4. Appropriately labels the data set with descriptive variable names. 
colnames(X_test) <- features$V2
colnames(X_train) <- features$V2

# Merge 2 tables
test=cbind(y_test,X_test)
train=cbind(y_train,X_train)
mergedData=rbind(test,train)
#dim(mergedData1) is 10299 562


#3. Uses descriptive activity names to name the activities in the data set
colnames(mergedData)[1] <- "Activity"
mergedData$Activity[mergedData$Activity %in% "1"] <- "WALKING"
mergedData$Activity[mergedData$Activity %in% "2"] <- "WALKING_UPSTAIRS"
mergedData$Activity[mergedData$Activity %in% "3"] <- "WALKING_DOWNSTAIRS"
mergedData$Activity[mergedData$Activity %in% "4"] <- "SITTING"
mergedData$Activity[mergedData$Activity %in% "5"] <- "STANDING"
mergedData$Activity[mergedData$Activity %in% "6"] <- "LAYING"

# Eliminate duplicate columns
mergedData <- mergedData[, !duplicated(colnames(mergedData))]


#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
data_mean_sd = select(mergedData,contains("mean()"), contains("std()"))


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_avg = mergedData %>%
  group_by(Activity) %>%
  summarise_each (funs(mean), contains("mean()"), contains("std()"))

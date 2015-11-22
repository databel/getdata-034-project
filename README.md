# getdata-034-project
Coursera/Data Science Track/Getting and Cleaning Data/Project

The data (in .txt format) are downloaded from the following website https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The read data table are X_test and X_train. The two data tables are given new (561) column names, which are contained in features.txt file. The merged data file is mergedData. Then Activity column is added to the mergedData, which now has 10299 rows and 562 columns. Descriptive activity names are added in accordance with the activity-labels.txt file. Duplicated columns are removed. Lastly, extract only the measurements on the mean and standard deviation for each measurement. The data is now named data_mean_sd.

For step #5, a tidy data file, tidy_avg.txt, is created with the average of each variable for each activity and each subject.

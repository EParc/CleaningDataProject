## Load required packages
library(readr)
library(dplyr)

## Load test data
x_test <- read_table("Coursera/Data-Cleaning/CourseProject/UCI HAR Dataset/test/X_test.txt",col_names = FALSE)
subject_test <- read_table("Coursera/Data-Cleaning/CourseProject/UCI HAR Dataset/test/subject_test.txt",col_names = FALSE)
y_test <- read_table("Coursera/Data-Cleaning/CourseProject/UCI HAR Dataset/test/y_test.txt",col_names = FALSE)

## Load training data
x_train <- read_table("Coursera/Data-Cleaning/CourseProject/UCI HAR Dataset/train/X_train.txt",col_names = FALSE)
subject_train <- read_table("Coursera/Data-Cleaning/CourseProject/UCI HAR Dataset/train/subject_train.txt",col_names = FALSE)
y_train <- read_table("Coursera/Data-Cleaning/CourseProject/UCI HAR Dataset/train/y_train.txt",col_names = FALSE)

## Filter data sets for only required features
features <- read.table("Coursera/Data-Cleaning/CourseProject/UCI HAR Dataset/features.txt")
req_features <- grep(".*mean\\(\\)|.*std.*", features[,2])
x_test <- x_test[req_features]
x_train <- x_train[req_features]

## Fix subject and activities data
activity_labels <- read_table("Coursera/Data-Cleaning/CourseProject/UCI HAR Dataset/activity_labels.txt",col_names = FALSE)
y_train <- inner_join(y_train,activity_labels)[2]
y_test <- inner_join(y_test,activity_labels)[2]

## Rename columns with correct names
names(x_test) <- features[req_features,2]
names(x_train) <- features[req_features,2]
names(y_train) <- "activity"
names(y_test) <- "activity"
names(subject_train) <- "subject"
names(subject_test) <- "subject"

## Merge all six data files into one data set
test_data <- cbind(subject_test,y_test,x_test)
train_data <- cbind(subject_train,y_train,x_train)
all_data <- rbind(test_data,train_data)

## Create second, tidy data set with average of each variable for each activity and subject
tidy_data <- aggregate(data=all_data,FUN=mean,. ~subject + activity)
write.table(tidy_data,"Coursera/Data-Cleaning/CourseProject/Final_data/tidydata.txt",row.name=FALSE)
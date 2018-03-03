---
title: "Codebook for Getting & Cleaning Data Project"
author: "ABrunk"
date: "March 2, 2018"
output: html_document
---

## Data Files

The file `tidydata.txt` includes the final data set.  The file `run_analysis.R` takes the original data set and creates the tidy data set

## Data File contents

The file `tidy_data.csv` organizes 30 test subjects by six different activities.  The activities are:
`laying`
`sitting`
`standing`
`walking`
`walking downstairs`
`walking upstairs`.

Additional columns consist of averages by subject and activity for the features that were measured.  The following description of the features comes from the original data set provided:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
`-XYZ` is used to denote 3-axial signals in the X, Y and Z directions.

`tBodyAcc-XYZ`
`tGravityAcc-XYZ`
`tBodyAccJerk-XYZ`
`tBodyGyro-XYZ`
`tBodyGyroJerk-XYZ`
`tBodyAccMag`
`tGravityAccMag`
`tBodyAccJerkMag`
`tBodyGyroMag`
`tBodyGyroJerkMag`
`fBodyAcc-XYZ`
`fBodyAccJerk-XYZ`
`fBodyGyro-XYZ`
`fBodyAccMag`
`fBodyAccJerkMag`
`fBodyGyroMag`
`fBodyGyroJerkMag`

While the original data contained many variables for each measurement, the tidy data set includes only `mean():` Mean value and `std():` Standard deviation

## Transformations

A number of transformations were needed to convert the original data set (see `Readme.md` file for source location) to the tidy data set:

1. Load required packages `readr` and `dplyr`

2. Load six original data files containing test (`X_test.txt`, `Y_test.txt`, `subject_test.txt`) and training (`X_train.txt`, `Y_train.txt`, `subject_train.txt`) data into R:

3. Import list of features from `features.txt` file and filter data files to exclude all measurement variables other than mean and standard deviation

4. Load activities labels from `activity_labels.txt` file and replace abbreviated labels in test and training data with full activity labels

5. Rename columns in activity and subject label data frames with correct column names (subject and activity)

6. Merge all six data files from step 2 into a single data set `all_data`

7. Aggregate data by averaging all measurement variable by subject and activity, and save resulting data file as `tidydata.txt`


---
title: "CodeBook.md"
output: html_document
---

# CodeBook

```{r setup, include=FALSE}
This is the CodeBook for tidy data set obtained by running the script 'run_analysis.R'.
It indicates all the variables and summaries calculated, along with units, and any other
relevant information
```

# Original Data Set

> Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
> 
> [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
> 
> Here are the data for the project:
> 
> [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Data Set Information (from link above)

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
> 
> Check the [README.md](README.md) file for further details about this dataset. 
> 
> A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]
> 
> An updated version of this dataset can be found at [Web Link]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.

# Processing data set to get tidy data

## Input files

* 'activity_labels.txt': Indexes (class labels) and names of the activities measured

Index  | Label
------ | -------------------
1      | WALKING
2      | WALKING_UPSTAIRS
3      | WALKING_DOWNSTAIRS
4      | SITTING
5      | STANDING
6      | LAYING

* 'features.txt': Variables
Out of the whole scope of variables (x 561) contained in the file 'features.txt', we will consider only the measurements on the mean and standard deviation for each measurement (x 66)

  + `1 tBodyAcc-mean()-X`
  + `2 tBodyAcc-mean()-Y`
  + `3 tBodyAcc-mean()-Z`
  + `4 tBodyAcc-std()-X`
  + `5 tBodyAcc-std()-Y`
  + `6 tBodyAcc-std()-Z`
  + `...`
  + `41 tGravityAcc-mean()-X`
  + `42 tGravityAcc-mean()-Y`
  + `43 tGravityAcc-mean()-Z`
  + `44 tGravityAcc-std()-X`
  + `45 tGravityAcc-std()-Y`
  + `46 tGravityAcc-std()-Z`
  + `...`
  + `81 tBodyAccJerk-mean()-X`
  + `82 tBodyAccJerk-mean()-Y`
  + `83 tBodyAccJerk-mean()-Z`
  + `84 tBodyAccJerk-std()-X`
  + `85 tBodyAccJerk-std()-Y`
  + `86 tBodyAccJerk-std()-Z`
  + `...`
  + `121 tBodyGyro-mean()-X`
  + `122 tBodyGyro-mean()-Y`
  + `123 tBodyGyro-mean()-Z`
  + `124 tBodyGyro-std()-X`
  + `125 tBodyGyro-std()-Y`
  + `126 tBodyGyro-std()-Z`
  + `...`
  + `161 tBodyGyroJerk-mean()-X`
  + `162 tBodyGyroJerk-mean()-Y`
  + `163 tBodyGyroJerk-mean()-Z`
  + `164 tBodyGyroJerk-std()-X`
  + `165 tBodyGyroJerk-std()-Y`
  + `166 tBodyGyroJerk-std()-Z`
  + `...`
  + `201 tBodyAccMag-mean()`
  + `202 tBodyAccMag-std()`
  + `...`
  + `214 tGravityAccMag-mean()`
  + `215 tGravityAccMag-std()`
  + `...`
  + `227 tBodyAccJerkMag-mean()`
  + `228 tBodyAccJerkMag-std()`
  + `...`
  + `240 tBodyGyroMag-mean()`
  + `241 tBodyGyroMag-std()`
  + `...`
  + `253 tBodyGyroJerkMag-mean()`
  + `254 tBodyGyroJerkMag-std()`
  + `...`
  + `266 fBodyAcc-mean()-X`
  + `267 fBodyAcc-mean()-Y`
  + `268 fBodyAcc-mean()-Z`
  + `269 fBodyAcc-std()-X`
  + `270 fBodyAcc-std()-Y`
  + `271 fBodyAcc-std()-Z`
  + `...`
  + `345 fBodyAccJerk-mean()-X`
  + `346 fBodyAccJerk-mean()-Y`
  + `347 fBodyAccJerk-mean()-Z`
  + `348 fBodyAccJerk-std()-X`
  + `349 fBodyAccJerk-std()-Y`
  + `350 fBodyAccJerk-std()-Z`
  + `...`
  + `424 fBodyGyro-mean()-X`
  + `425 fBodyGyro-mean()-Y`
  + `426 fBodyGyro-mean()-Z`
  + `427 fBodyGyro-std()-X`
  + `428 fBodyGyro-std()-Y`
  + `429 fBodyGyro-std()-Z`
  + `...`
  + `503 fBodyAccMag-mean()`
  + `504 fBodyAccMag-std()`
  + `...`
  + `516 fBodyBodyAccJerkMag-mean()`
  + `517 fBodyBodyAccJerkMag-std()`
  + `...`
  + `529 fBodyBodyGyroMag-mean()`
  + `530 fBodyBodyGyroMag-std()`
  + `...`
  + `542 fBodyBodyGyroJerkMag-mean()`
  + `543 fBodyBodyGyroJerkMag-std()`
  + `...`

* Subjects taking part of the experiment

  + test/subject_test.txt
  + train/subject_train.txt

* Subjects being part of the experiment

  + test/subject_test.txt
  + train/subject_train.txt

  File name               | Content
------------------------- | ------------------------------------------------------------
test/subject_test.txt     | Both files contain indexes from `1 to 30` corresponding to the
------------------------- | volunteer being part of the experiment
train/subject_train.txt   | 

* Subjects taking part of the experiment

  + test/subject_test.txt
  + train/subject_train.txt


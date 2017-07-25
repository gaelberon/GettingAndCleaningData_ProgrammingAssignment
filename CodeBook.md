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
> [UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Data Set Information (from link above)

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
> 
> Check the [README.txt](./UCI HAR Dataset/README.txt) file for further details about this dataset. 
> 
> A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]
> 
> An updated version of this dataset can be found at [Web Link]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.

# Processing data set to get tidy data

## Input files

* `activity_labels.txt`  
This file contains the indexes (class labels) and names of the activities measured

Index  | Label
------ | -------------------
1      | WALKING
2      | WALKING_UPSTAIRS
3      | WALKING_DOWNSTAIRS
4      | SITTING
5      | STANDING
6      | LAYING

* `features.txt`  
This file contains the whole scope of variables available (x 561). Out of those, we will consider for building our tidy data only the measurements on the mean and standard deviation for each measurement (x 66)

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

* `UCI HAR Dataset/test/subject_test.txt` and `UCI HAR Dataset/train/subject_train.txt`  
Both files contain indexes from `1 to 30` corresponding to the subjects (volunteers) being part of the experiment

* `UCI HAR Dataset/test/y_test.txt` and `UCI HAR Dataset/train/y_train.txt`  
Both files contain indexes from `1 to 6` corresponding to the activity performed during the experiment

* `UCI HAR Dataset/test/X_test.txt` and `UCI HAR Dataset/train/X_train.txt`  
Both files contain all measurements (for all features described above) performed during the experiment

* In directories: `UCI HAR Dataset/test/Inertial Signals/` and `UCI HAR Dataset/train/Inertial Signals/`, we find the files: `body_acc_x_[...].txt`, `body_acc_y_[...].txt`, `body_acc_z_[...].txt`, `body_gyro_x_[...].txt`, `body_gyro_y_[...].txt`, `body_gyro_z_[...].txt`, `total_acc_x_[...].txt`, `total_acc_y_[...].txt`, `total_acc_z_[...].txt`  
Files containting other measurements (acceleration, body acceleration, velocity)

## Processing the original data set into tidy data

### The transformations are performed by method `process_tidydata()` from the script `run_analysis.R`. The assignment is asking this process to compute the following tasks:
1. Merge the training and the test sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

### The solution proposed here does the following sub-tasks:

**1. Merge the training and the test sets into data frame 'tidydata'**  

  + Load and merge subjects for training and test sets into data frame 'subject'  
    NB: a column is added to keep the information of 'training' and 'test'
  + Load and merge activities labels for training and test sets into data frame 'activity'
  + Load and merge data for training and test sets into data frame 'mdata'  
  
**2. Extract only the measurements on the mean and standard deviation for each measurement**  

  + Read all available features from file 'features.txt'
  + Extract variables names for 'mean' and 'standard deviation' from available features from data frame 'av_features' into 'mean_and_std_features'
  + Subset data frame with data of measurements 'mdata' with only 'mean' and 'standard deviation' features  
  
**3. Use descriptive activity names to name the activities in the data set**  

  + Read activities labels from file 'activity_label.txt'
  + Replace activities codes with expected labels in data frame 'activity'  
  
**4. Appropriately label the data set with descriptive variable names**  

  + Update the names of the 2 columns of data frame 'subject'
  + Update the name of the single column of data frame 'activity'
  + Update column names of data frame 'mdata' with labels from the file 'features.txt' loaded into data frame 'av_features'
  + Merge the 3 datasets above into a final one containing expected data:  
    + observations: all recorded data for the 21 training and 9 test subjects regarding the 6 activities  
    + variables: subject, category (TRAINING or TEST), activity names and all means and standard deviations  
    
**5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject**  

  + Compute the means on data frame 'tidydata' by subject, category and activity, using the 'ddply' method from package 'plyr'
  + Upload the tidy data set into the file 'tidydataset.txt'
  + Upload the tidy data set with means into the file 'tidydataset_means.txt'
  + Return final tidy data frame 'tidydata'  

## Output files

* `tidydataset.txt`  
File containing the tidy data for both training and test data sets. The variables retrieved from input files are as follows:
  + `subject: integer in [1:30]` -- indexes corresponding to the volunteer retrieved from files `subject_test.txt` and `subject_train.txt`
  + `category: character string in ["TRAINING", "TEST"]` -- whether the subject belongs to the TEST or TRAINING categories
  + `activity: character string in ["LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"]` -- indexes are retrieved from files `y_test.txt` and `y_train.txt` and replaced while processing tidy data with corresponding labels from the file `activity_labels.txt`
  + `tBodyAcc-mean()-X` to `fBodyBodyGyroJerkMag-std(): numeric `-- all measurements from file 'X_test' and 'X_train'. Every rows of those files show a vector of all 561 available features (see file `features.txt`), so we need to filter what we consider to be useful for our analysis, ie: data regarding means and standard deviations for each measurement.  
  
Example:
  
subject  | category | activity           | tBodyAcc-mean()-X | tBodyAcc-mean()-Y | ... | fBodyBodyGyroJerkMag-std()
-------- | -------- | ------------------ | ----------------- | ----------------- | --- | --------------------------
1        | TRAINING | LAYING             | num               | num               | ... | num                       
2        | TEST     | SITTING            | num               | num               | ... | num                       
3        | TRAINING | STANDING           | num               | num               | ... | num                       
...      | ...      | ...                | ...               | ...               | ... | ...                       
28       | TRAINING | WALKING            | num               | num               | ... | num                       
29       | TRAINING | WALKING_DOWNSTAIRS | num               | num               | ... | num                       
30       | TRAINING | WALKING_UPSTAIRS   | num               | num               | ... | num                       
  
* `tidydataset_means.txt`  
This file contains the same variables as per the file 'tidydataset.txt' except that data of each variable is averaged for each activity and each subject
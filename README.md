---
title: "Coursera - Getting and Cleaning Data - Programming Assignment"
output: html_document
---

# Repository 'GettingAndCleaningData_ProgrammingAssignment'

## This repo contains

* `UCI HAR Dataset (directory):` Input files corresponding to the data collected from the accelerometers from the Samsung Galaxy S smartphone.
`run_analysis.R:` script file to answer the programming assignment problematic
* `README.md:` explains the analysis files is clear and understandable
* `CodeBook.md:` update of the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information
* `tidydataset_means.txt:` output file that corresponds to the 5th step of the programming assignment

## The R script 'run_analysis.R' does the following tasks

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# Context

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.  

# About the original data

> Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
> 
> [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
> 
> Here are the data for the project:
> 
> [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Feature selection
 
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ ('t' stands for 'time'). These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
> 
> These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> For each record it is provided:
> 
> * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> * Triaxial Angular velocity from the gyroscope. 
> * A 561-feature vector with time and frequency domain variables. 
> * Its activity label. 
> * An identifier of the subject who carried out the experiment.
> 
> Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
>   + `tBodyAcc-XYZ`
>   + `tGravityAcc-XYZ`
>   + `tBodyGyro-XYZ`
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
>   + `tBodyAccJerk-XYZ`
>   + `tBodyGyroJerk-XYZ`
> 
> Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm:
>   + `tBodyAccMag`
>   + `tGravityAccMag`
>   + `tBodyAccJerkMag`
>   + `tBodyGyroMag`
>   + `tBodyGyroJerkMag`
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing (Note the 'f' to indicate frequency domain signals):
>   + `fBodyAcc-XYZ`
>   + `fBodyAccJerk-XYZ`
>   + `fBodyGyro-XYZ`
>   + `fBodyAccMag`
>   + `fBodyAccJerkMag`
>   + `fBodyGyroMag`
>   + `fBodyGyroJerkMag`

## The set of variables that were estimated from these signals are: 

>   + `mean(): Mean value`
>   + `std(): Standard deviation`
>   + `mad(): Median absolute deviation`
>   + `max(): Largest value in array`
>   + `min(): Smallest value in array`
>   + `sma(): Signal magnitude area`
>   + `energy(): Energy measure. Sum of the squares divided by the number of values.`
>   + `iqr(): Interquartile range`
>   + `entropy(): Signal entropy`
>   + `arCoeff(): Autorregresion coefficients with Burg order equal to 4`
>   + `correlation(): correlation coefficient between two signals`
>   + `maxInds(): index of the frequency component with largest magnitude`
>   + `meanFreq(): Weighted average of the frequency components to obtain a mean frequency`
>   + `skewness(): skewness of the frequency domain signal`
>   + `kurtosis(): kurtosis of the frequency domain signal`
>   + `bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.`
>   + `angle(): Angle between to vectors`

## Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

>   + `gravityMean`
>   + `tBodyAccMean`
>   + `tBodyAccJerkMean`
>   + `tBodyGyroMean`
>   + `tBodyGyroJerkMean`

## Variables
 
> The complete list of variables (561) of each feature vector is available in 'features.txt'.

# License

> Use of the dataset in this project for publications must be acknowledged by referencing the following publication [1]
> 
> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
> 
> This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

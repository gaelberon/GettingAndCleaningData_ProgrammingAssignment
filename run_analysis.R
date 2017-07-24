# The R script 'run_analysis.R' does the following:
## 1. Merge the training and the test sets to create one data set
## 2. Extract only the measurements on the mean and standard deviation for each
##    measurement
## 3. Use descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive variable names
## 5. From the data set in step 4, create a second, independent tidy data set
##    with the average of each variable for each activity and each subject

# process_tidydata is the main function that processes all the steps above

process_tidydata <- function() {

        ########################################################################
        # 1. Merge the training and the test sets into data frame 'tidydata'
        
        ## 1.1 Load and merge subjects for training and test sets into data
        ##     frame 'subject'
        ##     NB: we add a column to keep the information of 'training' and
        ##     'test'
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        subject_train <- cbind(subject_train,
                               category = rep("TRAINING",length(subject_train)))
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        subject_test <- cbind(subject_test,
                              category = rep("TEST",length(subject_test)))
        subject <- rbind(subject_train, subject_test)
        
        ## 1.2 Load and merge activities labels for training and test sets
        ##     into data frame 'activity'
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
        activity <- rbind(y_train, y_test)
        
        ## 1.3 Load and merge data for training and test sets into data frame
        ##     'mdata'
        X_train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt")
        X_test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt")
        mdata <- rbind(X_train, X_test)
        
        ########################################################################
        # 2. Extract only the measurements on the mean and standard deviation
        #    for each measurement.
        
        ## 2.1 Read all available features from file 'features.txt'
        av_features <- read.table("./UCI HAR Dataset/features.txt")
        
        ## 2.2 Extract variables names for 'mean' and 'standard deviation' from
        ##     available features from data frame 'av_features' into
        ##     'mean_and_std_features'
        mean_and_std_features <- grep("-mean\\(\\)|-std\\(\\)", av_features[,2])
        
        ## 2.3 Subset data frame with data of measurements 'mdata' with only
        ##     'mean' and 'standard deviation' features
        mdata <- mdata[,mean_and_std_features]
        
        ########################################################################
        # 3. Use descriptive activity names to name the activities in the
        #    data set
        
        ## 3.1 Read activities labels from file 'activity_label.txt'
        activitycodelabel <- read.table("./UCI HAR Dataset/activity_labels.txt")
        
        ## 3.2 Replace activities codes with expected labels in data frame
        ##     'activity'
        activity[,1] <- activitycodelabel[activity[,1], 2]
        
        ########################################################################
        # 4. Appropriately label the data set with descriptive variable names
        
        ## 4.1 Update the names of the 2 columns of data frame 'subject'
        names(subject) <- c("subject", "category")
        
        ## 4.2 Update the name of the single column of data frame 'activity'
        names(activity) <- "activity"
        
        ## 4.3 Update column names of data frame 'mdata' with labels from the
        ##     file 'features.txt' loaded into data frame 'av_features'
        names(mdata) <- av_features[mean_and_std_features, 2]
        
        ## 4.4 Merge the 3 datasets above into a final one containing expected
        ##     data:
        ##     - observations: all recorded data for the 21 training and 9 test
        ##       subjects regarding the 6 activities
        ##     - variables: subject, category (TRAINING or TEST), activity names
        ##       and all means and standard deviations
        tidydata <- cbind(subject, activity, mdata)
        View(tidydata)
        
        ########################################################################
        # 5. From the data set in step 4, create a second, independent tidy
        #    data set with the average of each variable for each activity and
        #    each subject
        means <- ddply(tidydata,
                       .(subject, category, activity),
                       function(x) colMeans(x[, 4:69]))
        View(means)
        
        ########################################################################
        # Finally, Return final tidy data frame 'tidydata'
        return(tidydata)
}

load_inertial_signals <- function() {
        # Inertial Signals
        ## Train set
        body_acc_x_train <-
                read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
        print(dim(body_acc_x_train))
        print(head(body_acc_x_train))
#        body_acc_y_train <-
#                read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
#        body_acc_z_train <-
#                read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
#        body_gyro_x_train <-
#                read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
#        body_gyro_y_train <-
#                read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
#        body_gyro_z_train <-
#                read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
#        total_acc_x_train <-
#                read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
#        total_acc_y_train <-
#                read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
#        total_acc_z_train <-
#                read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
}

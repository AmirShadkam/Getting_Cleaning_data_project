## Getting and Cleaning Data Project
Amir Shadkam
09/27/2015

### Source Data
you can find the description of data used here at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The source data is here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window,
a vector of features was obtained by calculating variables from the time and frequency domain.


### Section 1. 
rbind the training and the test sets to create one data set.read the data into tables, the column names are in features.txt
features.txt, activity_labels.txt, subject_train.txt, x_train.txt, y_train.txt, subject_test.txt,x_test.txt, y_test.txt
Assign column names and merge to create one data set.

### Section 2. 
Extract only the measurements on the mean and std for each measurement. 
Create a logcal vector that contains TRUE values for the ID, mean and std columns and FALSE values for the others.
Subset this data to keep only the necessary columns.

### Section 3. 
To make descriptive activity names for activities in the data set
Merge data subset with the activityType table. 

### Section 4. 
Appropriately label the data set with descriptive activity names.

### Section 5. 
Create a data set with the average of each variable for each activity and each subject. 
we need to use ddply to average over subject_Id and activity_Id

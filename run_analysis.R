#  1-  Merges the training and the test sets to create one data set.
#  2-  Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3-  Uses descriptive activity names to name the activities in the data set
#  4-  Appropriately labels the data set with descriptive variable names. 
#  5-  From the data set in step 4, creates a second, independent tidy data set with the average 
#      of each variable for each activity and each subject.


## read the train and test data
data_train_X <-read.table("UCI HAR Dataset/train/X_train.txt")
data_train_Y <-read.table("UCI HAR Dataset/train/y_train.txt")
data_train_subject <-read.table("UCI HAR Dataset/train/subject_train.txt")

data_test_X <-read.table("UCI HAR Dataset/test/X_test.txt")
data_test_Y <-read.table("UCI HAR Dataset/test/y_test.txt")
data_test_subject <-read.table("UCI HAR Dataset/test/subject_test.txt")

# read activity labels and name its columns
data_activityLabel = read.table("UCI HAR Dataset/activity_labels.txt")
colnames(data_activityLabel) = c("activity_Id","activity_label")


# combine the train and test data
data_X <- rbind(data_train_X, data_test_X)
data_Y <- rbind(data_train_Y, data_test_Y)
data_subject <- rbind(data_train_subject,data_test_subject)

# extract the column names from features
features <- read.table("UCI HAR Dataset/features.txt")
colnames(data_X) = features[,2]
# name the remaining columns approperiately
colnames(data_Y) = "activity_Id"
colnames(data_subject) = "subject_Id"

# combine the columns
data_total <- cbind(data_subject,data_Y,data_X)


# select the columns with for mean and std variables except the mean frequency
col_vector =grepl("^activity",names(data_total)) | grepl("^subject",names(data_total)) | (grepl("mean",names(data_total)) & !grepl("meanFreq",names(data_total))) | grepl("std",names(data_total))
data_total_sub <-data_total[col_vector]

# merge the activity labels to the data to get the tidy data for step 4
data_tidy <- merge(data_activityLabel,data_total_sub,by="activity_Id")


# get the data set with the average of each variable for each activity and each subject
library(dplyr)
data_average <- ddply(data_tidy, .(subject_Id,activity_label), function(x) colMeans(x[, 4:69]))
# save the data average in a table
write.table(data_average, "data_avg.txt", row.name=FALSE)

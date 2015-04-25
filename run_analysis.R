## getdata-013 Course Project
## run analysis on UCI HAR Dataset
##
## Assumes the data is in the current working directory.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
##
## See accompanying README.md and CodeBook.md files

# load required libraries
library(dplyr)
library(tidyr)

# part 1
# read in training related data and combine by columns
train_obs <- read.table(con <- file("train/X_train.txt"))
train_class <- read.table(con <- file("train/y_train.txt"))
train_subjects <- read.table(con <- file("train/subject_train.txt"))
train_data <- cbind(train_subjects, train_class, train_obs)

# read in test related data and combine by columns
test_obs <- read.table(con <- file("test/X_test.txt"))
test_class <- read.table(con <- file("test/y_test.txt"))
test_subjects <- read.table(con <- file("test/subject_test.txt"))
test_data <- cbind(test_subjects, test_class, test_obs)

# combine the two data sets by rows
all_data <- rbind(train_data, test_data)

# part 2
# get list of feature names from 2nd field of features.txt file
# and apply this + subject and activity class as column headings
#
# NB the values in 2nd field are read in as factors by default
# converting to their numeric value and then returning the level will
# produce a vector of characters. Exctracting directly gives a list
# or the factor level instead of just the names/character values.
features <- read.table(con <- file("features.txt"))
features_char <- levels(features$V2)[as.numeric(features$V2)]
# some feature names are duplicated, so append sequence number with make.unique
col_headings <- c("subject", "activity", make.unique(features_char))
colnames(all_data) <- col_headings
mean_std_data <- select(all_data, subject, activity, contains("-mean()"), contains("-std()"))

# part 3
# read in activity names data
activity_names <- read.table(con <- file("activity_labels.txt"))
colnames(activity_names) <- c("activity", "activity name")
# new df with result of part 2 plus additional column with activity name
joined_data <- left_join(mean_std_data, activity_names, by="activity")
# re-order columns to put activity name (col69) after activity (col2)
joined_data <- joined_data[,c(1:2,69,3:68)]

# part 4
# see README.md for further details of how the descriptive names are derived
descriptive_names <- c(
    "subject",
    "activity",
    "activity name",
    "Mean of time domain signal from body acceleration in the X direction",
    "Mean of time domain signal from body acceleration in the Y direction",
    "Mean of time domain signal from body acceleration in the Z direction",
    "Mean of time domain signal from gravity acceleration in the X direction",
    "Mean of time domain signal from gravity acceleration in the Y direction",
    "Mean of time domain signal from gravity acceleration in the Z direction",
    "Mean of time domain signal from body acceleration jerk in the X direction",
    "Mean of time domain signal from body acceleration jerk in the Y direction",
    "Mean of time domain signal from body acceleration jerk in the Z direction",
    "Mean of time domain signal from body gyroscope in the X direction",
    "Mean of time domain signal from body gyroscope in the Y direction",
    "Mean of time domain signal from body gyroscope in the Z direction",
    "Mean of time domain signal from body gyroscope jerk in the X direction",
    "Mean of time domain signal from body gyroscope jerk in the Y direction",
    "Mean of time domain signal from body gyroscope jerk in the Z direction",
    "Mean of magnitude of time domain signal from body acceleration",
    "Mean of magnitude of time domain signal from gravity acceleration",
    "Mean of magnitude of time domain signal from body acceleration jerk",
    "Mean of magnitude of time domain signal from body gyroscope",
    "Mean of magnitude of time domain signal from body gyroscope jerk",
    "Mean of frequency domain signal from body acceleration in the X direction",
    "Mean of frequency domain signal from body acceleration in the Y direction",
    "Mean of frequency domain signal from body acceleration in the Z direction",
    "Mean of frequency domain signal from body acceleration jerk in the X direction",
    "Mean of frequency domain signal from body acceleration jerk in the Y direction",
    "Mean of frequency domain signal from body acceleration jerk in the Z direction",
    "Mean of frequency domain signal from body gyroscope in the X direction",
    "Mean of frequency domain signal from body gyroscope in the Y direction",
    "Mean of frequency domain signal from body gyroscope in the Z direction",
    "Mean of magnitude of frequency domain signal from body acceleration",
    "Mean of magnitude of frequency domain signal from body acceleration jerk",
    "Mean of magnitude of frequency domain signal from body gyroscope",
    "Mean of magnitude of frequency domain signal from body gyroscope jerk",
    "Standard deviation of time domain signal from body acceleration in the X direction",
    "Standard deviation of time domain signal from body acceleration in the Y direction",
    "Standard deviation of time domain signal from body acceleration in the Z direction",
    "Standard deviation of time domain signal from gravity acceleration in the X direction",
    "Standard deviation of time domain signal from gravity acceleration in the Y direction",
    "Standard deviation of time domain signal from gravity acceleration in the Z direction",
    "Standard deviation of time domain signal from body acceleration jerk in the X direction",
    "Standard deviation of time domain signal from body acceleration jerk in the Y direction",
    "Standard deviation of time domain signal from body acceleration jerk in the Z direction",
    "Standard deviation of time domain signal from body gyroscope in the X direction",
    "Standard deviation of time domain signal from body gyroscope in the Y direction",
    "Standard deviation of time domain signal from body gyroscope in the Z direction",
    "Standard deviation of time domain signal from body gyroscope jerk in the X direction",
    "Standard deviation of time domain signal from body gyroscope jerk in the Y direction",
    "Standard deviation of time domain signal from body gyroscope jerk in the Z direction",
    "Standard deviation of magnitude of time domain signal from body acceleration",
    "Standard deviation of magnitude of time domain signal from gravity acceleration",
    "Standard deviation of magnitude of time domain signal from body acceleration jerk",
    "Standard deviation of magnitude of time domain signal from body gyroscope",
    "Standard deviation of magnitude of time domain signal from body gyroscope jerk",
    "Standard deviation of frequency domain signal from body acceleration in the X direction",
    "Standard deviation of frequency domain signal from body acceleration in the Y direction",
    "Standard deviation of frequency domain signal from body acceleration in the Z direction",
    "Standard deviation of frequency domain signal from body acceleration jerk in the X direction",
    "Standard deviation of frequency domain signal from body acceleration jerk in the Y direction",
    "Standard deviation of frequency domain signal from body acceleration jerk in the Z direction",
    "Standard deviation of frequency domain signal from body gyroscope in the X direction",
    "Standard deviation of frequency domain signal from body gyroscope in the Y direction",
    "Standard deviation of frequency domain signal from body gyroscope in the Z direction",
    "Standard deviation of magnitude of frequency domain signal from body acceleration",
    "Standard deviation of magnitude of frequency domain signal from body acceleration jerk",
    "Standard deviation of magnitude of frequency domain signal from body gyroscope",
    "Standard deviation of magnitude of frequency domain signal from body gyroscope jerk"
    )
colnames(joined_data) <- descriptive_names

# part 5
# most of the column names are actually values, so fix with gather
# then group and summarise to calculate mean & fulfil requirements for this part
tidy_data <-
    joined_data %>%
    gather(feature, signal, -subject, -activity, -`activity name`) %>%
    group_by(subject, `activity name`, feature) %>%
    summarise(count=n(), signal_mean = mean(signal))
# save tidy output to a text file
write.table(tidy_data, file="output.txt", row.names=FALSE)

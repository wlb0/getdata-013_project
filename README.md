# getdata-013_project
Course project for the Getting and Cleaning Data subject

## Data
Background on dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, then extracted into the UCI HAR Dataset folder. This is used as the working folder.

### Summary of data
* 30 volunteers (numbered 1-30)
* 6 activities
  * 1 WALKING
  * 2 WALKING_UPSTAIRS
  * 3 WALKING_DOWNSTAIRS
  * 4 SITTING
  * 5 STANDING
  * 6 LAYING
* 10299 total observations, broken into:
  * 2947 observations in test data
  * 7352 observations in train data
* 561 variables for each observation

## Relevant files
This relates to files in the UCI HAR Dataset folder.
NB. data from the 'train|test/Inertial Signals' folders is not used in the analysis as they are excluded from consideration by step 2 of requirements (ie they are not a '-mean()' or a '-std()' measurement).
- 'features.txt': List of all 561 features (variables).
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'activity_labels.txt': Links the class labels (found in the y_train.txt file) with their activity name.
(the following applies equally to the test data, i.e. substitute 'test' for 'train')
- 'train/X_train.txt': Observation data.
- 'train/y_train.txt': Class labels; each row identifies the type of activity related to each observation/window sample. Its range is from 1 to 6.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Data processing steps

### 1. Merges the training and the test sets to create one data set.
- For each of the training and test sets (substitute test for train where relevant)
  - read in the main observation data (X_train)
  - read in the class labels (y_train)
  - read in the subject data (subject_train)
  - add class labels and subject data as additional columns to the main observation data
- Combine the two modified observation data sets (i.e. including class labels and subject data).

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Set column names based on subject, activity (class), and list of variables in 'features.txt'
NB. there are duplicate variable names, viz. some of those with "-bandsenergy()" in the name. To get around problems later on, force the variable/column names to be unique by appending sequence numbers using make.unique()
Select/extract only the subject, activity, and those features/variables with '-mean()' or '-std()' as part of their name.

### 3. Uses descriptive activity names to name the activities in the data set.
Create new df by doing a left join of the result from step 2, with the data from 'activity_labels.txt'; this adds an activity name field to the data from step 2. Re-order the columns to place the activity name field after the activity field.

### 4. Appropriately labels the data set with descriptive variable names. 
With reference to 'features_info.txt', the various components of a variable name contribute to their descriptive names. The breakup is as follows:
* a '-mean()' in the variable name denotes a "mean of"; similarly a '-std()' denotes a "standard deviation of"
* a leading 't' in the variable name denotes a "time domain signal from"; similarly a leading 'f' denotes a "frequency domain signal from"
* the portion between the leading t/f, and the -mean/std portion of the variable name, tells us
  * [optional] whether it's a magnitude signal
  * whether the signal is from the body or gravity
  * whether it's an acceleration or gyroscope signal
  * [optional] whether it's a jerk signal
* a trailing -X, -Y or -Z in the filename indicates the direction of the signal
For example, 'tBodyAcc-mean()-X' would translate to "Mean of time domain signal from body acceleration in the X direction". Similarly, 'fBodyBodyGyroJerkMag-std()' would translate to "Standard deviation of magnitude of frequency domain signal from body gyroscope jerk".
The translation itself is done in Excel, by copying the colnames from the df into a worksheet, using helper columns and various if formulas to build the various components of the description based on the presence of the corresponding components of the variable name, and putting them all together at the end. The resulting list is then fed back into a character vector used to update the column names of the df. See file 'Variable name expansion.xlsx'.

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Tidy the output of step 4 by 
* gathering the columns with variable names - these column names should all be values of a variable called "feature"
* the value in the resulting key-value pair is then the signal reading
* grouping the gathered result by subject, activity name, and feature
* summarising the grouped result by calculating the mean of the signal readings.
Write out the result to a text file.


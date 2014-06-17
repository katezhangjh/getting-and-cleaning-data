Mean and Standard Deviation summary for Human Activity Recognition Using Smartphones Dataset
======================================================================================================
kate_zhangjh@hotmail.com

##Processing the data

From the original input unzipped, we use data from following 6 datasets:
- UCI HAR Dataset/test/subject_test.txt
- UCI HAR Dataset/test/y_test.txt
- UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/train/subject_train.txt
- UCI HAR Dataset/train/y_train.txt
- UCI HAR Dataset/train/X_train.txt

The dataset containing "subject" refer to subject (participants); the dataset containing "y" refer to activity and the dataset containing x refer to 561 signal measurement including mean and std I will subset later. "test" refers to testing group while "train" refers to training group.

Combine first 3 datasets by columns based on same observation for form testing dataset, other 3 datasets by columns to get training dataset, and combine testing dataset and training dataset by rows.The dataset I get is named as mydata.

Replace numeric activity index with  description.
In 561 measurement, find description like mean(),std() but exclude meanFreq() which is not deem as mean.
reference table is:

- UCI HAR Dataset/activity_labels.txt
- UCI HAR Dataset/features.txt

Reshape the table and get the average number for each combination. The dataset is names mytidydata and output as tidydata.txt,total 180 obs of 68 variable.

##Output Explanation

The output has 68 variables:

- 1:activity
- 2:subject
- 3:tBodyAcc:mean()-X
- 4:tBodyAcc-mean()-Y
- 5:tBodyAcc-mean()-Z
- 6:tBodyAcc-std()-X
- 7:tBodyAcc-std()-Y
- 8:tBodyAcc-std()-Z
- 9:tGravityAcc-mean()-X
- 10:tGravityAcc-mean()-Y
- 11:tGravityAcc-mean()-Z
- 12:tGravityAcc-std()-X
- 13:tGravityAcc-std()-Y
- 14:tGravityAcc-std()-Z
- 15:tBodyAccJerk-mean()-X
- 16:tBodyAccJerk-mean()-Y
- 17:tBodyAccJerk-mean()-Z
- 18:tBodyAccJerk-std()-X
- 19:tBodyAccJerk-std()-Y
- 20:tBodyAccJerk-std()-Z
- 21:tBodyGyro-mean()-X
- 22:tBodyGyro-mean()-Y
- 23:tBodyGyro-mean()-Z
- 24:tBodyGyro-std()-X
- 25:tBodyGyro-std()-Y
- 26:tBodyGyro-std()-Z
- 27:tBodyGyroJerk-mean()-X
- 28:tBodyGyroJerk-mean()-Y
- 29:tBodyGyroJerk-mean()-Z
- 30:tBodyGyroJerk-std()-X
- 31:tBodyGyroJerk-std()-Y
- 32:tBodyGyroJerk-std()-Z
- 33:tBodyAccMag-mean()
- 34:tBodyAccMag-std()
- 35:tGravityAccMag-mean()
- 36:tGravityAccMag-std()
- 37:tBodyAccJerkMag-mean()
- 38:tBodyAccJerkMag-std()
- 39:tBodyGyroMag-mean()
- 40:tBodyGyroMag-std()
- 41:tBodyGyroJerkMag-mean()
- 42:tBodyGyroJerkMag-std()
- 43:fBodyAcc-mean()-X
- 44:fBodyAcc-mean()-Y
- 45:fBodyAcc-mean()-Z
- 46:fBodyAcc-std()-X
- 47:fBodyAcc-std()-Y
- 48:fBodyAcc-std()-Z
- 49:fBodyAccJerk-mean()-X
- 50:fBodyAccJerk-mean()-Y
- 51:fBodyAccJerk-mean()-Z
- 52:fBodyAccJerk-std()-X
- 53:fBodyAccJerk-std()-Y
- 54:fBodyAccJerk-std()-Z
- 55:fBodyGyro-mean()-X
- 56:fBodyGyro-mean()-Y
- 57:fBodyGyro-mean()-Z
- 58:fBodyGyro-std()-X
- 59:fBodyGyro-std()-Y
- 60:fBodyGyro-std()-Z
- 61:fBodyAccMag-mean()
- 62:fBodyAccMag-std()
- 63:fBodyBodyAccJerkMag-mean()
- 64:fBodyBodyAccJerkMag-std()
- 65:fBodyBodyGyroMag-mean()
- 66:fBodyBodyGyroMag-std()
- 67:fBodyBodyGyroJerkMag-mean()
- 68:fBodyBodyGyroJerkMag-std

###variable of 1 & 2
- 1:activity:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- 2:subject:a group of 30 volunteers within an age bracket of 19-48 years.

###variable of 3 to 68
- first character is t: time domain signal statistics, t stands for time
- first character is f: frequency domain signal statistics, f stands for frequency.
- variable has BodyAcc: body accelerate signals
- variable has GravityAcc: gravity acceleration signals
- variable has BodyAccJerk: body liner acceleration Jerk signals
- variable has BodyGyro: body gyroscope signals
- variable has BodyGyroJerk: body angular velocity signals
- variable has Mag: magnitude by the Euclidean norm
- variable has mean: mean of signals
- variable has std: standard deviation
- variable has XYZ: X,Y,Z directions

##Original Data Reference
Original data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
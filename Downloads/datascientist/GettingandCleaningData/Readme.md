Mean and Standard Deviation summary for Human Activity Recognition Using Smartphones Dataset
======================================================================================================
kate_zhangjh@hotmail.com

======================================================================================================
From the original input unzipped, we use data from following 6 datasets:
-UCI HAR Dataset/test/subject_test.txt
-UCI HAR Dataset/test/y_test.txt
-UCI HAR Dataset/test/X_test.txt
-UCI HAR Dataset/train/subject_train.txt
-UCI HAR Dataset/train/y_train.txt
-UCI HAR Dataset/train/X_train.txt

The dataset containing "subject" refer to subject (participants); the dataset containing "y" refer to activity and the dataset containing x refer to 561 signal measurement including mean and sd I will subset later. "test" refers to testing group while "train" refers to training group.

Combine first 3 datasets by columns based on same observation for form testing dataset, other 3 datasets by columns to get training dataset, and combine testing dataset and training dataset by rows.The dataset I get is named as mydata.
======================================================================================================
Replace numeric activity index with  description.
In 561 measurement, find description like mean(),std() but exclude meanFreq() which is not deem as mean.
reference table is:

-UCI HAR Dataset/activity_labels.txt
-UCI HAR Dataset/features.txt
======================================================================================================
Reshape the table and get the average number for each combination. The dataset is names mytidydata, 180 obs of 68 variable
observations are 1-activity(6 activities)/2-subjects(30 participants) combination, variables are as following:

1-activity
2-subject
3-tBodyAcc-mean()-X
4-tBodyAcc-mean()-Y
5-tBodyAcc-mean()-Z
6-tBodyAcc-std()-X
7-tBodyAcc-std()-Y
8-tBodyAcc-std()-Z
9-tGravityAcc-mean()-X
10-tGravityAcc-mean()-Y
11-tGravityAcc-mean()-Z
12-tGravityAcc-std()-X
13-tGravityAcc-std()-Y
14-tGravityAcc-std()-Z
15-tBodyAccJerk-mean()-X
16-tBodyAccJerk-mean()-Y
17-tBodyAccJerk-mean()-Z
18-tBodyAccJerk-std()-X
19-tBodyAccJerk-std()-Y
20-tBodyAccJerk-std()-Z
21-tBodyGyro-mean()-X
22-tBodyGyro-mean()-Y
23-tBodyGyro-mean()-Z
24-tBodyGyro-std()-X
25-tBodyGyro-std()-Y
26-tBodyGyro-std()-Z
27-tBodyGyroJerk-mean()-X
28-tBodyGyroJerk-mean()-Y
29-tBodyGyroJerk-mean()-Z
30-tBodyGyroJerk-std()-X
31-tBodyGyroJerk-std()-Y
32-tBodyGyroJerk-std()-Z
33-tBodyAccMag-mean()
34-tBodyAccMag-std()
35-tGravityAccMag-mean()
36-tGravityAccMag-std()
37-tBodyAccJerkMag-mean()
38-tBodyAccJerkMag-std()
39-tBodyGyroMag-mean()
40-tBodyGyroMag-std()
41-tBodyGyroJerkMag-mean()
42-tBodyGyroJerkMag-std()
43-fBodyAcc-mean()-X
44-fBodyAcc-mean()-Y
45-fBodyAcc-mean()-Z
46-fBodyAcc-std()-X
47-fBodyAcc-std()-Y
48-fBodyAcc-std()-Z
49-fBodyAccJerk-mean()-X
50-fBodyAccJerk-mean()-Y
51-fBodyAccJerk-mean()-Z
52-fBodyAccJerk-std()-X
53-fBodyAccJerk-std()-Y
54-fBodyAccJerk-std()-Z
55-fBodyGyro-mean()-X
56-fBodyGyro-mean()-Y
57-fBodyGyro-mean()-Z
58-fBodyGyro-std()-X
59-fBodyGyro-std()-Y
60-fBodyGyro-std()-Z
61-fBodyAccMag-mean()
62-fBodyAccMag-std()
63-fBodyBodyAccJerkMag-mean()
64-fBodyBodyAccJerkMag-std()
65-fBodyBodyGyroMag-mean()
66-fBodyBodyGyroMag-std()
67-fBodyBodyGyroJerkMag-mean()
68-fBodyBodyGyroJerkMag-std

#1-2
1-activity:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
2-subject:a group of 30 volunteers within an age bracket of 19-48 years.

#3-68
##first digit 
3-42  time domain signal statistics, t stands for time
43-68 frequency domain signal statistics, f stands for frequency.

#3-69
##second digit to digit before first "-" or "Mag"
3-8 and 43-48 BodyAcc: body accelerate signals
9-14 GravityAcc: gravity acceleration signals
15-20 and 49-54 BodyAccJerk: body liner acceleration Jerk signals
21-26 and 55-60 BodyGyro: body gyroscope signals
27-32 BodyGyroJerk: body angular velocity signals

#33-42 and 61-68 
##Mag
- magnitude by the Euclidean norm

#3-68
-mean: mean of signals
-st: standard deviation
-XYZ: X,Y,Z directions

======================================================================================================
Original data is from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
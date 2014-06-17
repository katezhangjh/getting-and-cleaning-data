
getwd()
setwd("/home/kate/Downloads/data scientist/Getting and Cleaning Data")

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,"./mydata.zip",method="curl")
files<-unzip("./mydata.zip",list=T)

#Merges the training and the test sets to create one data set.

testdata.x<-read.csv(unz("dmydata.zip","UCI HAR Dataset/test/X_test.txt"),header=F,comment.char="",sep="")
testdata.y<-read.csv(unz("dmydata.zip","UCI HAR Dataset/test/y_test.txt"),header=F,comment.char="",sep="")
testdata.subj<-read.csv(unz("dmydata.zip","UCI HAR Dataset/test/subject_test.txt"),header=F,comment.char="",sep="")
testdata<-cbind(testdata.y,testdata.subj,testdata.x)

traindata.x<-read.csv(unz("dmydata.zip","UCI HAR Dataset/train/X_train.txt"),header=F,comment.char="",sep="")
traindata.y<-read.csv(unz("dmydata.zip","UCI HAR Dataset/train/y_train.txt"),header=F,comment.char="",sep="")
traindata.subj<-read.csv(unz("dmydata.zip","UCI HAR Dataset/train/subject_train.txt"),header=F,comment.char="",sep="")
traindata<-cbind(traindata.y,traindata.subj,traindata.x)

mydata<-rbind(testdata,traindata)


#Extracts only the measurements on the mean and standard deviation for each measurement.
## get toselect column idx
feature<-read.csv(unz("mydata.zip","UCI HAR Dataset/features.txt"),header=F,comment.char="",sep="")
colnames(feature)<-c("idx","description")
feature.idx<-with(feature,idx[which((grepl("mean()",description) | grepl("std()",description)) & !grepl("meanFreq",description))])

##add 2 as to add subject and activity and 
toselect=c(1,2,feature.idx+2)
mydata<-mydata[,toselect]


#Uses descriptive activity names to name the activities in the data set
activityLabel<-read.csv(unz("dmydata.zip","UCI HAR Dataset/activity_labels.txt"),header=F,comment.char="",sep="")
mydataMerge<-merge(activityLabel,mydata, by="V1",all=T)
#mydataMerge<-arrange(mydataMerge,V1,V1.1)
mydataMerge$V1<-NULL


#Appropriately labels the data set with descriptive variable names. 
feature.description<-with(feature,as.character(description[which((grepl("mean()",description) | grepl("std()",description)) & 
                                                                         !grepl("meanFreq",description))]))
description<-c("activity","subject",feature.description)
colnames(mydataMerge)<-description

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
mydataMelt<-melt(mydataMerge,id=c("activity","subject"))
mytidydata<-dcast(mydataMelt,activity+subject~variable,mean)

#write a txt file to working directory
write.csv(mytidydata,"tidydata.txt",row.names = FALSE)


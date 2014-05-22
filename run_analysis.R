# 
# 
# Check the README.txt file for further details about this dataset and coding.
# 
# 

# 1.Merges the training and the test sets to create one data set.

if(!file.exists("data")) {
        dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/data1.csv", method="curl")
dateDownloaded <- date()

# Data was unzipped using extract files option in Windows 7. 
#This resulted in two main files, plus supplementary files (Inertial signals files were ignored)

#read in data into various data frames:

subjecttest <- read.table("./data/test/subject_test.txt")#each subject (person)
names(subjecttest) <- c("subject") #name the variable
unique(subjecttest$subject)#check 

ytest <- read.table("./data/test/y_test.txt")#these should be the activities (label)
names(ytest)=c("activity")
unique(ytest$activity)
str(ytest) 

xtest <- read.table("./data/test/x_test.txt")#these are all the gyro scores

# Here I jump to activity task 3 as I want columns names for xtest
# 3.Uses descriptive activity names to name the activities in the data set


# remove brackets and dashes

names <- read.table("./data/features.txt")

names$V2 <- as.character(names$V2)
names$V3 <- gsub(")", "",names$V2)
names$V3 <- gsub("\\(", "",names$V3)
names$V3 <- gsub("\\-", "",names$V3)

# While I appreciate var names should be lowercase, for the moment I'm going to leave them as is
# we could just go  names$V3  <- tolower(names$V3)

# I'm also going to identify column positions that have mean and standard deviation variables:

means <- grep(pattern = "mean", x = names$V3)
std <- grep(pattern = "std", x = names$V3)

# pray that the names match the xtest variables (they are the same length, no guarantee of order)

names(xtest)=names$V3
#select some columns to see if they look alright:
xtest[1:5, 1:5]

#combine above 3 data frames:
xtest  <- cbind(xtest, ytest, subjecttest)

# do it all again for the train data:
subjecttrain <- read.table("./data/train/subject_train.txt")
ytrain <- read.table("./data/train/y_train.txt")
xtrain <- read.table("./data/train/x_train.txt")
names(subjecttrain)  <- c("subject")
names(ytrain)  <- c("activity")
names(xtrain) <- names$V3
xtrain  <- cbind(xtrain, ytrain, subjecttrain)

#now combine the train and test data frames:

tidydata1  <- rbind(xtrain, xtest)

# 2.Extracts only the measurements on the mean and standard deviation for each
# measurement.

#use the positions of the mean and std columns extracted from 
#the names file above:
tidydata2  <- tidydata1[, c(means, std, 562, 563)]
names(tidydata2)
# 
# 4.Appropriately labels the data set with descriptive activity names.

# I take this instruction to mean turn 1:6 into Walk:Sleep (or whatever) for activity

activityname <- read.table("./data/activity_labels.txt")
#print it out to see what names are needed for which codes
activityname

for(i in 1:10299){
        if(tidydata2$activity[i]==1){tidydata2$activity[i]="Walking"}
        if(tidydata2$activity[i]==2){tidydata2$activity[i]="Walking_upstairs"}
        if(tidydata2$activity[i]==3){tidydata2$activity[i]="Walking_downstairs"}
        if(tidydata2$activity[i]==4){tidydata2$activity[i]="Sitting"}
        if(tidydata2$activity[i]==5){tidydata2$activity[i]="Standing"}
        if(tidydata2$activity[i]==6){tidydata2$activity[i]="Laying"}
}

# 
# 5.Creates a second, independent tidy data set with the average of each
# variable for each activity and each subject.

require(plyr)
tidydata2$subject <- as.factor(tidydata2$subject)
tidyData  <- ddply(tidydata2, .(activity, subject), numcolwise(mean))
write.csv(tidyData,file='data/tidydata.csv')

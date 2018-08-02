## 0. download and unzip the dataset
if (!file.exists("UCI HAR Dataset")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip")
  unzip("Dataset.zip")
}

## 1. Merges the training and the test sets to create one data set.
  #import feature list
  features <- read.csv("UCI HAR Dataset/features.txt", sep = " ", header = FALSE)
  
  #import and merge Features labeled with feature names
    # read files
    X_train <- read.fwf("UCI HAR Dataset/train/X_train.txt", widths = c(17, rep(16, times = 560)), col.names = features$V2)
    X_test <- read.fwf("UCI HAR Dataset/test/X_test.txt", widths = c(17, rep(16, times = 560)), col.names = features$V2)
    
    # merge training and test sets
    X <- rbind(X_train,X_test)
  
    # clean unmerged tables
    rm("X_train")
    rm("X_test")
    rm("features")
  
  #import and merge Labels in a "labelindex" column
    # read files
    Y_train <- read.csv("UCI HAR Dataset/train/Y_train.txt", header = FALSE, col.names = "labelIndex")
    Y_test <- read.csv("UCI HAR Dataset/test/Y_test.txt", header = FALSE, col.names = "labelIndex")
    
    # merge training and test sets
    Y <- rbind(Y_train,Y_test)
    
    # clean unmerged tables
    rm("Y_train")
    rm("Y_test")
  
    #import and merge subjects in a "subject" column
    # read files
    subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subject")
    subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subject")
    
    # merge training and test set
    subject <- rbind(subject_train,subject_test)
  
    # clean unmerged tables
    rm("subject_train")
    rm("subject_test")
    
  #agregate all subjects,features and lables in a single table and remove old tables
    FullDF <- cbind(subject, X, Y)
    rm("subject")
    rm("X")
    rm("Y")
    
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  names.all <- names(FullDF)
  names.filtered <- names.all[grep("subject|labelIndex|\\.mean\\.|\\.std\\.", names.all)]
  FullDF <- FullDF[,names.filtered]
  rm("names.all")
  rm("names.filtered")

## 3. Uses descriptive activity names to name the activities in the data set
  #import activity list
  activities <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE, col.names = c("index", "activity"))
  
  #Add activity column with merge
  FullDF <- merge(FullDF,activities, by.x = "labelIndex", by.y = "index")
  rm("activities")
  
  #drop old labelindex column
  FullDF <- FullDF[,!(names(FullDF) == "labelIndex")]

## 4. Appropriately labels the data set with descriptive variable names
  # remove multiple dots from names
  names(FullDF) <- sub("\\.\\.\\.|\\.\\.", ".", names(FullDF))
  
  # remove trailing dots
  names(FullDF) <- sub("\\.$", "", names(FullDF))
  
  # replace Acc by accelerometer, Gyro by gyroscope, ^t by time, ^f by frequency
  names(FullDF) <- sub("Acc", "accelerometer", names(FullDF))
  names(FullDF) <- sub("Gyro", "gyroscope", names(FullDF))
  names(FullDF) <- sub("Mag", "magnitude", names(FullDF))
  names(FullDF) <- sub("^t", "time", names(FullDF))
  names(FullDF) <- sub("^f", "frequency", names(FullDF))
  
  # replace BodyBody by Body
  names(FullDF) <- sub("BodyBody", "Body", names(FullDF))
  
  # rename feature.[mean|std].[X|Y|Z] into feature[X|Y|Z][mean|std]
  names(FullDF) <- sub("^([^.]*)\\.([^.]*)\\.([^.]*)$", "\\1\\3\\2", names(FullDF))
  names(FullDF) <- sub("std$", "standarddeviation", names(FullDF))
  names(FullDF) <- gsub("\\.", "", names(FullDF))
  
  # set to lowercase
  names(FullDF) <- tolower(names(FullDF))
  
  
## 5. From the data set in step 4, creates a second, independent tidy 
##    data set with the average of each variable for each activity and each subject.
  FullDF.tidy <- aggregate(.~subject+activity,FullDF,mean)
  
  FullDF.tidy

## 1 Merges the training and the test sets to create one data set.
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
    All <- cbind(subject, X, Y)
    rm("subject")
    rm("X")
    rm("Y")
    
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  names.all <- names(All)
  names.filtered <- names.all[grep("subject|labelIndex|\\.mean\\.|\\.std\\.", names.all)]
  All <- All[,name.filtered]

## 3. Uses descriptive activity names to name the activities in the data set
  #import activity list
  activities <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE, col.names = c("index", "activity"))
  
  #Add activity column with merge
  All <- merge(All,activities, by.x = "labelIndex", by.y = "index")
  
  #drop old labelindex column
  All <- All[,!(names(All) == "labelIndex")]

## 4. Appropriately labels the data set with descriptive variable names
  # remove multiple dots from names
  names(All) <- sub("\\.\\.\\.|\\.\\.", ".", names(All))
  
  # remove trailing dots
  names(All) <- sub("\\.$", "", names(All))
  
  # rename feature.[mean|std].[X|Y|Z] into featureOnAxis[X|Y|Z].[mean|std]
  names(All) <- sub("^([^.]*)\\.([^.]*)\\.([^.]*)$", "\\1OnAxis\\3.\\2", names(All))
  
## 5. From the data set in step 4, creates a second, independent tidy 
##    data set with the average of each variable for each activity and each subject.
  All.grouped <- aggregate(.~subject+activity,All,mean)
  

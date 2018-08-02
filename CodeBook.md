# Intro
This document describes all the operation performed on the following dataset

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Here are the computing steps 

- If necessary download and unzip the dataset
- Merges the training and the test sets to create one data set.
	- Import feature list
	- Import and merge Features labeled with feature name from feature list
  	- Import and merge Labels in a "labelindex" column
	- Import and merge subjects in a "subject" column
	- Aggregate all subjects,features and labels in a single table FullDF and remove old tables
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
	- Import activity lables
	- Merge with FullDF on labelindex and drop labelindex column
- Appropriately labels the data set with descriptive variable names	
 	- remove abreviations
	- set to lower case
	- remove special characters
- From FullDF, creates a second data frame, independent tidy data set (FullDF.tidy) with the average of each variable for each activity and each subject.

# Attribute Information:

For each record in the dataset it is provided: 
- A 68-feature vector with time and frequency domain variables, numerical values beween -1 and 1. 
- Its activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 
- An identifier of the subject who carried out the experiment identified by an index from 1 to 30.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timebodyaccelerometer[xyz] and timebodygyroscope[xyz]. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timebodyaccelerometer[xyz] and timegravityaccelerometer[xyz]) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timebodyaccelerometerjerk[xyz] and timebodygyroscopejerk[xyz]). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timebodyaccelerometermagnitude, timegravityaccelerometermagnitude, timebodygyroscopejerkmagnitude, timebodygyroscopemagnitude, timebodyaccelerometerjerkmagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencybodyaccelerometer[xyz], frequencybodyaccelerometerjerk[xyz], frequencybodygyroscope[xyz], frequencybodygyroscopejerk[xyz], frequencybodyaccelerometermagnitude, frequencybodyaccelerometerjerkmagnitude, frequencybodygyroscopemagnitude, frequencybodygyroscopejerkmagnitude. (Note the 'frequency' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'OnAxisXYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are suffixed by: 
mean: Mean value
std: Standard deviation

 [1] "subject"                                                 
 [2] "timebodyaccelerometerxmean"                              
 [3] "timebodyaccelerometerymean"                              
 [4] "timebodyaccelerometerzmean"                              
 [5] "timebodyaccelerometerxstandarddeviation"                 
 [6] "timebodyaccelerometerystandarddeviation"                 
 [7] "timebodyaccelerometerzstandarddeviation"                 
 [8] "timegravityaccelerometerxmean"                           
 [9] "timegravityaccelerometerymean"                           
[10] "timegravityaccelerometerzmean"                           
[11] "timegravityaccelerometerxstandarddeviation"              
[12] "timegravityaccelerometerystandarddeviation"              
[13] "timegravityaccelerometerzstandarddeviation"              
[14] "timebodyaccelerometerjerkxmean"                          
[15] "timebodyaccelerometerjerkymean"                          
[16] "timebodyaccelerometerjerkzmean"                          
[17] "timebodyaccelerometerjerkxstandarddeviation"             
[18] "timebodyaccelerometerjerkystandarddeviation"             
[19] "timebodyaccelerometerjerkzstandarddeviation"             
[20] "timebodygyroscopexmean"                                  
[21] "timebodygyroscopeymean"                                  
[22] "timebodygyroscopezmean"                                  
[23] "timebodygyroscopexstandarddeviation"                     
[24] "timebodygyroscopeystandarddeviation"                     
[25] "timebodygyroscopezstandarddeviation"                     
[26] "timebodygyroscopejerkxmean"                              
[27] "timebodygyroscopejerkymean"                              
[28] "timebodygyroscopejerkzmean"                              
[29] "timebodygyroscopejerkxstandarddeviation"                 
[30] "timebodygyroscopejerkystandarddeviation"                 
[31] "timebodygyroscopejerkzstandarddeviation"                 
[32] "timebodyaccelerometermagnitudemean"                      
[33] "timebodyaccelerometermagnitudestandarddeviation"         
[34] "timegravityaccelerometermagnitudemean"                   
[35] "timegravityaccelerometermagnitudestandarddeviation"      
[36] "timebodyaccelerometerjerkmagnitudemean"                  
[37] "timebodyaccelerometerjerkmagnitudestandarddeviation"     
[38] "timebodygyroscopemagnitudemean"                          
[39] "timebodygyroscopemagnitudestandarddeviation"             
[40] "timebodygyroscopejerkmagnitudemean"                      
[41] "timebodygyroscopejerkmagnitudestandarddeviation"         
[42] "frequencybodyaccelerometerxmean"                         
[43] "frequencybodyaccelerometerymean"                         
[44] "frequencybodyaccelerometerzmean"                         
[45] "frequencybodyaccelerometerxstandarddeviation"            
[46] "frequencybodyaccelerometerystandarddeviation"            
[47] "frequencybodyaccelerometerzstandarddeviation"            
[48] "frequencybodyaccelerometerjerkxmean"                     
[49] "frequencybodyaccelerometerjerkymean"                     
[50] "frequencybodyaccelerometerjerkzmean"                     
[51] "frequencybodyaccelerometerjerkxstandarddeviation"        
[52] "frequencybodyaccelerometerjerkystandarddeviation"        
[53] "frequencybodyaccelerometerjerkzstandarddeviation"        
[54] "frequencybodygyroscopexmean"                             
[55] "frequencybodygyroscopeymean"                             
[56] "frequencybodygyroscopezmean"                             
[57] "frequencybodygyroscopexstandarddeviation"                
[58] "frequencybodygyroscopeystandarddeviation"                
[59] "frequencybodygyroscopezstandarddeviation"                
[60] "frequencybodyaccelerometermagnitudemean"                 
[61] "frequencybodyaccelerometermagnitudestandarddeviation"    
[62] "frequencybodyaccelerometerjerkmagnitudemean"             
[63] "frequencybodyaccelerometerjerkmagnitudestandarddeviation"
[64] "frequencybodygyroscopemagnitudemean"                     
[65] "frequencybodygyroscopemagnitudestandarddeviation"        
[66] "frequencybodygyroscopejerkmagnitudemean"                 
[67] "frequencybodygyroscopejerkmagnitudestandarddeviation"    
[68] "activity"

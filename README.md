# Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws


# Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]

An updated version of this dataset can be found at [Web Link]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.


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

# The included files in this project includes:
- run_analysis.R : Download, tidy the dataset and create 2 tables, one with the full data, one with mean aggregation on all features grouped by subject and activity
- CodeBook.md : describing the operations performed on the original dataset to clean and tidy


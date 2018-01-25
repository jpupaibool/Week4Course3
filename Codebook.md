# This codebook contains all variables used in run_analysis.R for the assignement of week 4 of course 3.

# The variable names are in an order they appear in the script.


subject_train	-	Data frame of subject_train.txt
		          	1 column, 7352 rows of subject numbers
		          	
subject_test	-	Data frame of subject_test.txt
		          	1 column, 2947 rows of subject numbers
		          	
subject_total	-	Data frame of the combination of subject_train and subject test.
		          	1 column (subject), 10299 rows containing subject numbers (1 to 30).



y_train		- 	Data frame of y_train.txt
		        	1 column, 7352 rows of activity codes
		        	
y_test		-	Data frame of y_test.txt
		      	1 column, 2947 rows of activity codes
		      	
activity_total	-	Data frame of the combination of y_train and y_test
		            	2 columns (activity.code, activit.name), 10299 rows
		            	activity.code 1 = activity.name "WALKING"
		            	activity.code 2 = activity.name "WALKING_UPSTAIRS"
		            	activity.code 3 = activity.name "WALKING_DOWNSTAIRS"
		            	activity.code 4 = activity.name "STANDING"
		            	activity.code 5 = activity.name "SITTING"
		            	activity.code 6 = activity.name "LAYING"



x_train		-	List of character that is read from x_train.txt.

x_test		-	List of character that is read from x_test.txt.

x_train2	-	Data frame of x_train.txt
		      	561 columns of measurements of sensor signals, 7352 rows
		      	
x_test2		-	Data frame of x_test.txt
		      	561 columns of measurements of sensor signals, 2947 rows
		      	
features	-	List of character that is read from features.txt.
		      	It is utilized as the column names of measure_total.
		      	
measure_total	-	Data frame that is the combination of subject_total, activity_total, x_train2, and x_test2.
		          	This contains 561 measurements from sensor signals of 30 subjects doing 6 activities.
		          	563 columns, 10299 rows
		          	


col_meanstd	-	List of character that indicates column names that contain "mean" or "std".

measure_meanstd	-	Data frame that extracts only columns with mean or std from measure_total.
		            	68 columns (subject, activity.name, and 66 measurements of mean and std)
		            	The column names of 66 measurements are changed to make them more descriptive.
		            	
col.names	-	List of character of column names of 66 measurements

col.names2	-	List of character of new column names of 66 measurements that are more descriptive than col.names.


measure_meanstd.melt	-	data frame that is molted from measure_meanstd
			                	4 columns (subject, activity.name, varaible, value), 679734 rows
			                	
			                	
measure_meanstd.average	-	data frame that contains tiday data of averages of each measurement for each activity and each subject.
			                  	68 column (subject, activity.name, and 66 measurements), 180 rows
			                  	This tidy data set is written to a text file called "Week4Final.txt".


# The final file "Week4Final.txt".
It contains the average of each measurement for each activity and each subject from the Human Activity Recognition Using Smartphones Data Set.

It contains 68 columns and 180 rows.

Column names are

1 subject  - subject identifier - 1 to 30

2 activity.name	- activity (6 levels) - WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS, SITTING, STANDING, LAYING

66 columns of measurements of mean and std values as listed below:
3 time.BodyAcc.mean.X                  
4 time.BodyAcc.mean.Y                 
5 time.BodyAcc.mean.Z                 
6 time.BodyAcc.std.X                  
7 time.BodyAcc.std.Y                   
8 time.BodyAcc.std.Z                  
9 time.GravityAcc.mean.X               
10 time.GravityAcc.mean.Y              
11 time.GravityAcc.mean.Z              
12 time.GravityAcc.std.X               
13 time.GravityAcc.std.Y                
14 time.GravityAcc.std.Z               
15 time.BodyAccJerk.mean.X            
16 time.BodyAccJerk.mean.Y           
17 time.BodyAccJerk.mean.Z              
18 time.BodyAccJerk.std.X              
19 time.BodyAccJerk.std.Y               
20 time.BodyAccJerk.std.Z              
21 time.BodyGyro.mean.X                 
22 time.BodyGyro.mean.Y                
23 time.BodyGyro.mean.Z                 
24 time.BodyGyro.std.X                 
25 time.BodyGyro.std.Y                 
26 time.BodyGyro.std.Z                 
27 time.BodyGyroJerk.mean.X            
28 time.BodyGyroJerk.mean.Y          
29 time.BodyGyroJerk.mean.Z            
30 time.BodyGyroJerk.std.X             
31 time.BodyGyroJerk.std.Y              
32 time.BodyGyroJerk.std.Z            
33 time.BodyAccMag.mean                
34 time.BodyAccMag.std                 
35 time.GravityAccMag.mean              
36 time.GravityAccMag.std              
37 time.BodyAccJerkMag.mean             
38 time.BodyAccJerkMag.std             
39 time.BodyGyroMag.mean               
40 time.BodyGyroMag.std               
41 time.BodyGyroJerkMag.mean           
42 time.BodyGyroJerkMag.std           
43 fastfourier.BodyAcc.mean.X          
44 fastfourier.BodyAcc.mean.Y         
45 fastfourier.BodyAcc.mean.Z          
46 fastfourier.BodyAcc.std.X          
47 fastfourier.BodyAcc.std.Y           
48 fastfourier.BodyAcc.std.Z          
49 fastfourier.BodyAccJerk.mean.X      
50 fastfourier.BodyAccJerk.mean.Y     
51 fastfourier.BodyAccJerk.mean.Z       
52 fastfourier.BodyAccJerk.std.X     
53 fastfourier.BodyAccJerk.std.Y      
54 fastfourier.BodyAccJerk.std.Z      
55 fastfourier.BodyGyro.mean.X         
56 fastfourier.BodyGyro.mean.Y        
57 fastfourier.BodyGyro.mean.Z         
58 fastfourier.BodyGyro.std.X          
59 fastfourier.BodyGyro.std.Y           
60 fastfourier.BodyGyro.std.Z        
61 fastfourier.BodyAccMag.mean        
62 fastfourier.BodyAccMag.std         
63 fastfourier.BodyBodyAccJerkMag.mean  
64 fastfourier.BodyBodyAccJerkMag.std 
65 fastfourier.BodyBodyGyroMag.mean     
66 fastfourier.BodyBodyGyroMag.std    
67 fastfourier.BodyBodyGyroJerkMag.mean
68 fastfourier.BodyBodyGyroJerkMag.std 


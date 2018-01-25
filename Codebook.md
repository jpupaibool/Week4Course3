This codebook contains all variables used in run_analysis. R for the assignement of week 4 of course 3.

The variable names are in an order they appear in the script.



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




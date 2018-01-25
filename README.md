# Week4Course3
Course Project of Course 3 Getting and Cleaning Data

Move all files needed for this assignment to the same working directory.

Read text files subject_train.txt and subject_test.txt.
> subject_train <- readLines("subject_train.txt")

> subject_test <- readLines("subject_test.txt")


Change subject_train and subject_test to data frames.
> subject_train <- as.data.frame(subject_train)

> subject_test <- as.data.frame(subject_test)


Assign column name "subject" to subject_train and subject_test.
> colnames(subject_train) <- "subject"

> colnames(subject_test) <- "subject"


Combine rows of subject_train and subject_test to subject_total.
Change subject number to numeric because it will be sorted in a later step.
> subject_total <- rbind(subject_train, subject_test)

> subject_total$subject <- as.numeric(subject_total$subject)

> dim(subject_total)


Do the same steps for y_train.txt, y_test.txt.
Use "activity.code" as the column name.
> y_train <- readLines("y_train.txt")

> y_test <- readLines("y_test.txt")

> y_train <- as.data.frame(y_train)

> y_test <- as.data.frame(y_test)

> colnames(y_train) <- "activity.code"

> colnames(y_test) <- "activity.code"

> activity_total <- rbind(y_train, y_test)

> dim(activity_total)


Create another column "activity.name" to the data frame activity_total.
It will be more descriptive as required by the assignment.
This is the requirement #3 of the assignment.
> activity_total$activity.name <- ifelse(activity_total$activity.code == 1, "WALKING", 
ifelse(activity_total$activity.code == 2, "WALKING_UPSTAIRS",
ifelse(activity_total$activity.code == 3, "WALKING_DOWNSTAIRS",
ifelse(activity_total$activity.code == 4, "STANDING",
ifelse(activity_total$activity.code == 5, "SITTING", "LAYING")))))
   
   
Read test files x_train.txt and x_test.txt.
> x_train <- readLines("x_train.txt")

> x_test <- readLines("x_test.txt")


Separate all values of x_train and x_test by a space (" ").
> x_train2 <- strsplit(x_train, " ")

> x_test2 <- strsplit(x_test, " ")


x_train2 and x_test2 have many blank elements ("").
Remove blank elements ("") from x_train2 and x_test2.
> for(i in 1:7352) { x_train2[[i]] <- x_train2[[i]][!x_train2[[i]] == ""]}

> for(i in 1:2947) { x_test2[[i]] <- x_test2[[i]][!x_test2[[i]] == ""]}


Change x_train2 and x_test2 to data frames.
> x_train2 <- as.data.frame(x_train2)

> x_test2 <- as.data.frame(x_test2)


Transpose x_train2 and x_test2.
(This will change x_train2 and x_test2 to matrix.)
> x_train2 <- t(x_train2)

> x_test2 <- t(x_test2)


Change x_train2 and x_test2 back from matrix to data frames.
> x_train2 <- as.data.frame(x_train2)

> x_test2 <- as.data.frame(x_test2)


Assign row names of x_train2 and X_test2.
> rownames(x_train2) <- c(1:7352)

> rownames(x_test2) <- c(1:2947)


Read text file features.txt.
> features <- readLines("features.txt")


Assign features to column names of the data frames x_train2 and x_test2.
> colnames(x_train2) <- features

> colnames(x_test2) <- features


Combine rows of x_train2 and x_test2 to measure_total.
> measure_total <- rbind(x_train2, x_test2)

> dim(measure_total)


Combine columns of data frames subject_total, activity_total, and measure_total together.
This will create one data sete as required by the assignment.
This is requirement #1 of the assignement.
> measure_total <- cbind(subject_total, activity_total, measure_total)

> dim(measure_total)

> names(measure_total)


Select only columns that have mean and std to a new data frame "measure_meanstd"
Check its dimension.
> col_meanstd <- grep("mean|std", names(measure_total))

> measure_meanstd <- measure_total[ , c(1:3, col_meanstd)]

> dim(measure_meanstd)

> names(measure_meanstd)


The columns also include "meanFreq".
We should exclude variables with "meanFreq" and keep only "mean" and "std".
> measure_meanstd <- measure_meanstd[!grepl("meanFreq", names(measure_meanstd))]

> dim(measure_meanstd)names(measure_meanstd)


Now we have subject, activity.code, activity.name, and 66 more variables.
This is requirement #2 of the assignment.

Make a tidy data set by the following steps.
Delete the 2nd column(activity.code) since we don't need it anymore.
Sort measure_meanstd by subject and then by activity.name.
Reassign row names from 1 to 10299.
> measure_meanstd <- measure_meanstd[, -2]

> measure_meanstd <- measure_meanstd[order(measure_meanstd$subject, measure_meanstd$activity.name), ]

> rownames(measure_meanstd) <- 1:nrow(measure_meanstd)


Change variable names to be more descriptive by the following steps.
This is the requirement #4 of the assignment.
Remove numbers from the variable names.
Remove "()" from the variable names.
Replace "t" in the variable names with "time-".
Replace "f" in the variable names with "fastfourer-".
Replace "-" in the variable names with with ".".
> col.names <- names(measure_meanstd[3:68])

> splitcol.names <- strsplit(col.names, " ")

> secondElement <- function(x) { x[2] }

> col.names2 <- sapply(splitcol.names, secondElement)

> col.names2 <- sub("\\()", "", col.names2)

> col.names2 <- sub("^t", "time-", col.names2)

> col.names2 <- sub("^f", "fastfourier-", col.names2)

> col.names2 <- gsub("-", "\\.", col.names2)

> print(col.names2)

> colnames(measure_meanstd)[3:68] <- col.names2


Next steps below are for the requirement #5 of the assignment.
Melt measure_meanstd using subject and activity.name as the id.vars.
> library(reshape2)

> measure_meanstd.melt <- melt(measure_meanstd, id.vars = c("subject", "activity.name"), measure.vars = col.names2)


Change the column "value" from factor to numeric.
> measure_meanstd.melt$value <- as.numeric(as.character(measure_meanstd.melt$value))


Create a new data frame for averages of each variable for each "subject" and "activity.name".
> measure_meanstd.average <- dcast(measure_meanstd.melt, subject + activity.name ~ variable, mean)


Write the data to a text file "Week4Final.txt".
> write.table(measure_meanstd.average, file = "Week4Final.txt", row.names = FALSE)


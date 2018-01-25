
subject_train <- readLines("subject_train.txt")
subject_test <- readLines("subject_test.txt")

subject_train <- as.data.frame(subject_train)
subject_test <- as.data.frame(subject_test)

colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"

subject_total <- rbind(subject_train, subject_test)
subject_total$subject <- as.numeric(subject_total$subject)
dim(subject_total)

y_test <- readLines("y_test.txt")
y_train <- as.data.frame(y_train)
y_test <- as.data.frame(y_test)
colnames(y_train) <- "activity.code"
colnames(y_test) <- "activity.code"
activity_total <- rbind(y_train, y_test)
dim(activity_total)

activity_total$activity.name <- ifelse(activity_total$activity.code == 1, "WALKING", 
                                ifelse(activity_total$activity.code == 2, "WALKING_UPSTAIRS", 
                                ifelse(activity_total$activity.code == 3, "WALKING_DOWNSTAIRS", 
                                ifelse(activity_total$activity.code == 4, "STANDING", 
                                ifelse(activity_total$activity.code == 5, "SITTING", "LAYING")))))

x_train <- readLines("x_train.txt")
x_test <- readLines("x_test.txt")

x_train2 <- strsplit(x_train, " ")
x_test2 <- strsplit(x_test, " ")

for(i in 1:7352)
{ x_train2[[i]] <- x_train2[[i]][!x_train2[[i]] == ""]
}
for(i in 1:2947)
{ x_test2[[i]] <- x_test2[[i]][!x_test2[[i]] == ""]
}

x_train2 <- as.data.frame(x_train2)
x_test2 <- as.data.frame(x_test2)

x_train2 <- t(x_train2)
x_test2 <- t(x_test2)

x_train2 <- as.data.frame(x_train2)
x_test2 <- as.data.frame(x_test2)

rownames(x_train2) <- c(1:7352)
rownames(x_test2) <- c(1:2947)

features <- readLines("features.txt")

colnames(x_train2) <- features
colnames(x_test2) <- features

measure_total <- rbind(x_train2, x_test2)
dim(measure_total)

measure_total <- cbind(subject_total, activity_total, measure_total)
dim(measure_total)
names(measure_total)

col_meanstd <- grep("mean|std", names(measure_total))
measure_meanstd <- measure_total[ , c(1:3, col_meanstd)]
dim(measure_meanstd)
names(measure_meanstd)

measure_meanstd <- measure_meanstd[!grepl("meanFreq", names(measure_meanstd))]
dim(measure_meanstd)
names(measure_meanstd)

measure_meanstd <- measure_meanstd[, -2]
measure_meanstd <- measure_meanstd[order(measure_meanstd$subject,
                                         measure_meanstd$activity.name), ]
rownames(measure_meanstd) <- 1:nrow(measure_meanstd)

col.names <- names(measure_meanstd[3:68])
splitcol.names <- strsplit(col.names, " ")
secondElement <- function(x) { x[2] }
col.names2 <- sapply(splitcol.names, secondElement)
col.names2 <- sub("\\()", "", col.names2)
col.names2 <- sub("^t", "time-", col.names2)
col.names2 <- sub("^f", "fastfourier-", col.names2)
col.names2 <- gsub("-", "\\.", col.names2)
print(col.names2)
colnames(measure_meanstd)[3:68] <- col.names2

library(reshape2)
measure_meanstd.melt <- melt(measure_meanstd, id.vars = c("subject", "activity.name"), 
                             measure.vars = col.names2)

measure_meanstd.melt$value <- as.numeric(as.character(measure_meanstd.melt$value))

measure_meanstd.average <- dcast(measure_meanstd.melt, subject + activity.name ~ variable, mean)

write.table(measure_meanstd.average, file = "Week4Final.txt", row.names = FALSE)

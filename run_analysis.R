#1. Merging the training and the test sets to create a data set
#1.1. Reading Files
setwd("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project")
x_train <- read.table("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Y_train.txt")
s_train <- read.table("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Y_test.txt")
s_test <- read.table("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project/UCI HAR Dataset/test/subject_test.txt")

f <- read.table("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project/UCI HAR Dataset/features.txt")

al <- read.table("E:/Academia/Data Science Specialization/Getting and Cleaning Data/Project/UCI HAR Dataset/activity_labels.txt")

#1.2. Assingning column names
colnames(x_train) <- f[,2]
colnames(y_train) <- "activityId"
colnames(s_train) <- "subjectId"

colnames(x_test) <- f[,2]
colnames(y_test) <- "activityId"
colnames(s_test) <- "subjectId"

colnames(al) <- c("activityId","activityType")

#1.3. Merging Data
mrg_train <- cbind(y_train, s_train, x_train)
mrg_test <- cbind(y_test, s_test, x_test) 
mrg <- rbind(mrg_train, mrg_test)

#2. Extracting only the measurementon the mean and standard deviaton for each measurement
#2.1. Creating subset from mrg
cNames <- colnames(mrg)
cnMeas <- (grepl("activityId", cNames) |
             grepl("subjectId", cNames) |
             grepl("mean..", cNames) |
             grepl("std..",cNames))
ssmrg <- mrg[,cnMeas == TRUE]

#3. Using descriptive activity names to name the activities in the data set
sActNames <- merge(ssmrg, al, by="activityId", all.x = TRUE)

#4.Creating a second, independent tidy data set with the average of each variable
# for each activity and each subject:
sAveActSubj <- aggregate(. ~subjectId + activityId, sActNames, mean)
sAveActSubj <- sAveActSubj[order(sAveActSubj$subjectId, sAveActSubj$activityId),]

#4.1. Writing tidy data set in txt file
write.table(sAveActSubj,"sAveActSubj.txt", row.names = FALSE)

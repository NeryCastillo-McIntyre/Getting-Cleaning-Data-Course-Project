# 1. Merge the training and the test sets to create one data set

# Read the X_train.txt file into R

X_train <- read.table("train/X_train.txt")

# Read the X_test.txt file into R

X_test <- read.table("test/X_test.txt")

# Combine the two sets with rbind() for a full set

X_t <- rbind(X_train, X_test)

# Read the features.txt file into R

features <- read.table("features.txt")

# Extract labels without numbers by subsetting features

featuresonly <- features[, 2]

# Name the columns of X_t with featuresonly

names(X_t) <- featuresonly

# Read the subject_train.txt file into R

subject_train <- read.table("train/subject_train.txt")

# Read the subject_test.txt file into R

subject_test <- read.table("test/subject_test.txt")

# Combine the two sets with rbind() for a full set

subject <- rbind(subject_train, subject_test)

# Combine X_t and subject with cbind()

Xsubject <- cbind(X_t, subject)

# Name the subject column/variable

colnames (Xsubject) [562] <- "Subject"

# Read the y_train.txt file into R

y_train <- read.table("train/y_train.txt")

# Read the y_test.txt file into R

y_test <- read.table("test/y_test.txt")

# Combine the two sets with rbind() for a full set

y_t <- rbind(y_train, y_test)

# Combine Xsubject and y_t with cbind()

Xsubjectivity <- cbind(Xsubject, y_t)

# Name the activity column/variable

colnames (Xsubjectivity) [563] <- "Activity"

# 2. Extract only the measurements on the mean and standard deviation
# for each measurement using grepl()

HAR <- Xsubjectivity[ , grepl("Subject|Activity|Mean|mean|std", names(Xsubjectivity))]

# 3. Use descriptive activity names to name the activities in the data set

HAR$Activity <- factor(HAR$Activity,
                       levels = c(1, 2, 3, 4, 5, 6),
                       labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# 4. Appropriately label the data set with descriptive variable names

names(HAR) <- gsub("tBodyAcc", "TimeBodyAcceleration", names(HAR))
names(HAR) <- gsub("tGravityAcc", "TimeGravityAcceleration", names(HAR))
names(HAR) <- gsub("tBodyGyro", "TimeBodyGyroscope", names(HAR))
names(HAR) <- gsub("fBodyAcc", "FrequencyBodyAcceleration", names(HAR))
names(HAR) <- gsub("fBodyGyro", "FrequencyBodyGyroscope", names(HAR))
names(HAR) <- gsub("Mag", "Magnitude", names(HAR))
names(HAR) <- gsub("-mean()", "Mean", names(HAR))
names(HAR) <- gsub("-std()", "StandardDeviation", names(HAR))
names(HAR) <- gsub("-X", "X", names(HAR))
names(HAR) <- gsub("-Y", "Y", names(HAR))
names(HAR) <- gsub("-Z", "Z", names(HAR))
names(HAR) <- gsub("fBodyBodyAcc", "FrequencyBodyAcceleration", names(HAR))
names(HAR) <- gsub("fBodyBodyGyro", "FrequencyBodyGyroscope", names(HAR))

# 5. From the data set in step 4,
# creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

#Load packages to further manipulate data

library(plyr); library(dplyr); library(tidyr);

# Load the data into a 'data frame tbl' or 'tbl_df'

Indy <- tbl_df(HAR) %>%
  
# Group data by Subject first, then by Activity
  
   tidy <- group_by(Indy, Subject, Activity) %>%
  
# Find the average of each Activity by Subject
  
  EachAverage <- summarise_each(tidy, funs(mean)) %>%
  write.table(EachAverage, "TidyDataSet.txt", row.name=FALSE)

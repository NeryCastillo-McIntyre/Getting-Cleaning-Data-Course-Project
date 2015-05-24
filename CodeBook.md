# “Code Book”
## for Coursera's "Getting & Cleaning Data" Course Project

### 1. Merge the training and the test sets to create one data set

* Read the X_train.txt file into R and save it into an object called X_train

* Read the X_test.txt file into R and save it into an object called X_test

* Combine the two sets with rbind() for a full set, saved into an object called X_t

* Read the features.txt file into R and save it into an object called features

* Extract activity labels on second column, without numbers by subsetting features and save it into object called featuresonly

* Name the columns of X_t with objects contained in featuresonly

* Read the subject_train.txt file into R and save it into an object called subject_train

* Read the subject_test.txt file into R and save it into an object called subject_test

* Combine the two sets with rbind() for a full set, saved into an object called subject

* Combine X_t and subject with cbind(), saved into an object called Xsubject

* Name the subject column/variable number 562 "Subject"

* Read the y_train.txt file into R and save it into an object called y_train

* Read the y_test.txt file into R and save it into an object called y_test

* Combine the two sets with rbind() for a full set, saved into an object called y_t

* Combine Xsubject and y_t with cbind(), saved into an object called Xsubjectivity

* Name the activity column/variable number 563 "Activity"

### 2. Extract only the measurements on the mean and standard deviation for each measurement using grepl() by extracting the columns that contain the strings "Subject", "Activity", "Mean", "mean", and "std", and save it into an object called HAR

### 3. Use descriptive activity names to name the activities in the data set using factor() with levels 1:6 and labels from the activity_labels.txt file

### 4. Appropriately label the data set with descriptive variable names using gsub() to replace fragments of labels with fully spelled-out labels

### 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

* Load plyr, dplyr, and tidyr packages to further manipulate data

* Load the data into a 'data frame tbl' or 'tbl_df' and save it into an object called Indy, followed by %>% ("then")

* Group data by Subject first, then by Activity, and save it into an object called tidy

* Find the average of each Activity by Subject using summarise_each() and saving it into an object called EachAverage

### 6. Create a txt file titled TidyDataSet to submit

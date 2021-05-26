library(dplyr)

# reading test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# reading train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


# reading data description
var_names <- read.table("./UCI HAR Dataset/features.txt")

# reading activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Merge the training and the test sets to create one data set.
X_tot <- rbind(X_train, X_test)
Y_tot <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

# Extracts only the mean and standard deviation for the measurement.
selected_var <- var_names[grep("mean\\(\\)|std\\(\\)",var_names[,2]),]
X_tot <- X_tot[,selected_var[,1]]

# Uses descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activity"
Y_tot$activitylabel <- factor(Y_tot$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_tot[,-1]

# Label the dataset appropriately with variable names
colnames(X_tot) <- var_names[selected_var[,1],2]

# From the data set created previously, we create a second and independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Sub_total) <- "subject"
total <- cbind(X_tot, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)

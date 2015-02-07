#Specifying the location of the files
trainpath<-paste0(getwd(),"/UCI HAR Dataset/train/X_train.txt")
testpath<-paste0(getwd(),"/UCI HAR Dataset/test/X_test.txt")
#Getting Data into Memory for both datasets
XTrain<-read.table(trainpath)
XTest<-read.table(testpath)

#Meging Both DataSets
merged<-rbind(XTrain,XTest)

#Assigning variable names to the dataset
featurespath<-paste0(getwd(),"/UCI HAR Dataset/features.txt")
features<-read.csv(featurespath,header=F,sep=" ")
names(merged)<-features[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
# Limit to columns with feature names matching mean() or std():
matches <- grep("(mean|std)\\(\\)", names(merged))
limited <- merged[, matches]

# Use descriptive activity names to name the activities in the data set.
# Get the activity data and map to nicer names:
yTrain <- read.csv(paste0(getwd(),"/UCI HAR Dataset/train/y_train.txt"),header=F)
yTest  <- read.csv(paste0(getwd(),"/UCI HAR Dataset/test/y_test.txt"),header=F)
yMerged <- rbind(yTrain, yTest)[, 1]
activityNames <-  c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
activities <- activityNames[yMerged]


# Appropriately label the data set with descriptive variable names.
# Change t to Time, f to Frequency, mean() to Mean and std() to StdDev
# Remove extra dashes and BodyBody naming error from original feature names
names(limited) <- gsub("^t", "Time", names(limited))
names(limited) <- gsub("^f", "Frequency", names(limited))
names(limited) <- gsub("-mean\\(\\)", "Mean", names(limited))
names(limited) <- gsub("-std\\(\\)", "StdDev", names(limited))
names(limited) <- gsub("-", "", names(limited))
names(limited) <- gsub("BodyBody", "Body", names(limited))



# Add activities and subject with nice names
subjectTrain <- read.csv(paste0(getwd(),"/UCI HAR Dataset/train/subject_train.txt"),header=F)
subjectTest  <- read.csv(paste0(getwd(),"/UCI HAR Dataset/test/subject_test.txt"),header=F)
subjects <- rbind(subjectTrain, subjectTest)[, 1]


tidy <- cbind(Subject = subjects, Activity = activities, limited)



# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
# Column means for all but the subject and activity columns
limitedColMeans <- function(data) { colMeans(data[,-c(1,2)]) }
tidyMeans <- ddply(tidy, .(Subject, Activity), limitedColMeans)
names(tidyMeans)[-c(1,2)] <- paste0("Mean", names(tidyMeans)[-c(1,2)])

# Write file
write.table(tidyMeans, "tidyMeans.txt", row.names = FALSE)

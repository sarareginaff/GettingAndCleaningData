# Sara Regina Ferreira de Faria
# sarareginaff@gmail.com

# Libraries
library('fBasics')
library('dplyr')

# 4 - Appropriately labels the data set with descriptive variable names.
if (!exists("features"))
  features <- read.table("UCI HAR Dataset/features.txt", as.is=TRUE)[,2]

features <- gsub("()", "", features, fixed=TRUE)
features <- gsub(".", "", features, fixed=TRUE)
features <- tolower(features)

# Check if exists or read data from txt - to avoid computational waist
if (!exists("testX"))
  testX <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=features)
if (!exists("testY"))
  testY <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="activity")
if (!exists("testSubject"))
  testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")

if (!exists("trainX"))
  trainX <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=features)
if(!exists("trainY"))
  trainY <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="activity")
if (!exists("trainSubject"))
  trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")

# 1 - Merges the training and the test sets to create one data set.
trainData <- cbind(trainX, trainY, trainSubject)
testData <- cbind(testX, testY, testSubject)
data <- rbind(trainData, testData)

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
means <- colMeans(data)
stdDev <- colStdevs(data)

# 3 - Uses descriptive activity names to name the activities in the data set
if (!exists("activities"))
  activities <- read.table("UCI HAR Dataset/activity_labels.txt")
data$activity <- as.factor(data$activity)
levels(data$activity) <- activities[,2]

# 5 - From the data set in step 4, creates a tidy data set with the average of each variable for each activity and each subject.
tidy_data <- group_by(data,activity, subject)
tidy_data <- summarise_all(tidy_data, funs(mean))

# 6 - Write txt
write.table(tidy_data,"tidy_data.txt", row.name=FALSE)


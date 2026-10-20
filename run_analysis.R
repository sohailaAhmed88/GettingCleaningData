url <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip"

if (!dir.exists("UCI HAR Dataset")) {
  download.file(url, "Dataset.zip", mode = "wb")
  unzip("Dataset.zip")
}

features <- read.table("UCI HAR Dataset/features.txt",
                       stringsAsFactors = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              stringsAsFactors = FALSE)


x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

names(x) <- features$V2

selected <- grepl("mean\\(\\)|std\\(\\)", names(x))
x <- x[, selected]

names(x) <- gsub("\\(\\)", "", names(x))
names(x) <- gsub("-", "_", names(x))

activity <- activity_labels$V2[match(y$V1, activity_labels$V1)]

combined <- data.frame(
  subject = subject$V1,
  activity = activity,
  x,
  check.names = FALSE
)

tidy_data <- aggregate(
  combined[, -(1:2)],
  by = list(
    subject = combined$subject,
    activity = combined$activity
  ),
  FUN = mean
)

tidy_data <- tidy_data[
  order(tidy_data$subject, tidy_data$activity), ]
rownames(tidy_data) <- NULL

write.table(tidy_data, "tidy_data.txt",
            row.names = FALSE, quote = FALSE)

print(dim(tidy_data))
head(tidy_data)
# CodeBook: Getting and Cleaning Data

## Project Description

This project uses data collected from the accelerometers of Samsung Galaxy S smartphones to study human activity.

## Source Data

The original dataset contains measurements collected from 30 volunteers performing six activities.

## Variables

* `subject`: Identifies the volunteer, numbered from 1 to 30.
* `activity`: Describes the activity performed, such as WALKING, SITTING, or STANDING.
* The remaining variables contain average measurements of the mean and standard deviation features recorded by the smartphone sensors.

## Data Cleaning

1. Combined the training and test datasets.
2. Selected measurements containing mean() or std() features.
3. Replaced activity identifiers with descriptive activity names.
4. Improved measurement column names by removing parentheses and replacing hyphens with underscores.
5. Calculated the average of each selected measurement for every subject and activity.

## Output

The final file, `tidy_data.txt`, contains 180 rows and 68 columns. Each row represents one subject performing one activity.

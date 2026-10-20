# Getting and Cleaning Data Project

## Overview

This project cleans and summarizes the Human Activity Recognition Using Smartphones dataset.

## Files

* `run_analysis.R`: R script that performs the data cleaning and analysis.
* `CodeBook.md`: Describes the variables and transformations.
* `tidy_data.txt`: Final tidy dataset.

## How to Run

1. Open RStudio.
2. Set the working directory to the project folder.
3. Open `run_analysis.R`.
4. Click the Source button to run the script.
5. The script creates `tidy_data.txt`.

## Analysis

The script combines the training and test data, selects mean and standard deviation measurements, labels activities, and calculates average measurements for each subject and activity.

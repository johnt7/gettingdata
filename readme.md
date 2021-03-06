---
title: "Run Analysis"
author: "John Turner"
output: html_document
---

## Overview
This project is meant to take the data from the "Human Activity Recognition Using Smartphones Dataset", combine it and then produce a summary.

### Data
The data comes from the "Human Activity Recognition Using Smartphones Dataset".  Details of the project can be found at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.  The data comes from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

The data is made up of:

+ activity_labels.txt - a two column table giving the name for each activity value.
+ features.txt - a two column table giving the name for each feature column in the data files.
+ features_info.txt - a description of the data.
+ README.txt - a description of the files included in the package
+ train/X_train.txt - the table of training data.
+ train/y_train.txt - the activity for each row of the training data
+ train/subject_train.txt - the subject who performed the data for each row in the data.
+ train/Inertial Signals - Not being used
+ test/X_test.txt - the table of test data.
+ test/y_test.txt - the activity for each row of the testing data
+ test/subject_test.txt - the subject who performed the data for each row in the data.
+ test/Inertial Signals - Not being used

### Processing
The code loads the test and training date, and merges them. It adds the subject and activity information, adjusting the activity names to be cleaner.  The column names are cleaned up and added as well.
Finally, a summary data set is created based on the average of all data fields for each subject and activity.
The activiy

## Execution
To run it:

+ Make sure the dataset has been unzipped into the project directory.
+ Start up an R session with the working directory set to the project
+ In the R session execute:
  + source('run_analysis.R')

### Files

+ readme.md - this file.  A description of the project
+ codebook.md - a description of the data for the prject
+ run_analysis.R - the code that performs the work.
+ summaryData.txt - file generated by the code.
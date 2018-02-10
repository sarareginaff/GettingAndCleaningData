# GettingAndCleaningData

## Libraries

First the code loads the necessary libraries

## Descriptive variable names

The feature file is read and cleaned to be more descriptive. The empty parentesis and the dots are removed and all the names are set in lower case.

## Load data

All train and test data are loaded only if it has not been loaded yet. It avoid to waist computational processing.

## Merges training and test sets

Merge all train e test data to create only one dataset

## Mean and standard deviation for each measurement.

Get only the meand and standard deviation for each masurement.

## Uses descriptive activity names

Read the activity_labels file and set it as factors to improve data human reading.

## Summarisee data

A tidy data set is created with the average of each variable for each activity and each subject

## Export file
Export txt file with the tidy dataframe.

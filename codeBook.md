Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt and store them to variables respectively.
 2. Read X_test.txt, y_test.txt and subject_test.txt ans store them to variables repectively.
 3. Concatenate *testData* to *trainData* to generate a 10299x561 data frame using rbind().
 4. Read the features.txt file  store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of *joinData* with the 66 corresponding columns.  
 5. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.   
 6. Read the activity_labels.txt file .
 7. Clean the activity names in the second column of *activity*. 
 8. Transform the values of *joinLabel* according to the *activity* data frame.  
 9. Combine the *joinSubject*, *joinLabel* and *joinData* by column to get a new cleaned 10299x68 data frame, *cleanedData*. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.  
 10. Write the *cleanedData* out to "tidyMeans.txt" file in current working directory.

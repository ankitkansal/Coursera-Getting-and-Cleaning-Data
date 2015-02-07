Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 1. Set Path to downloaded data.
 2. Read X_train.txt, X _test.txt data set and store them to variables XTrain and XTest respectively.
 3. Merge above data with rbind() function and assign it to merged data.
 4. Assign column names to the dataset by reading features file.
 5. Limit the comlumns as spedcified in the problem set using regular expression.
 6. Read subject train and test datasets and bind them using rbind() function again. 
 6. Add activities and subject with nice names.
 7. Find Column means for all but the subject and activity columns.
 8. Create the required dataset as output.

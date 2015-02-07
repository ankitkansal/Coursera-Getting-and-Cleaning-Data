# Coursera-Getting-and-Cleaning-Data
This file describes how run_analysis.R script works.

1 First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2 Make sure the extracted folder and the run_analysis.R script are both in the current working directory.

3 Second, use source("run_analysis.R") command in RStudio. 

4 Read Comments as they specified in the script each following step in detail. 

5 Finally, use data <- read.table("tidyMeans.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject. 

6 tidyMeans.txt (220 KB): it contains a data frame called cleanedData with output required.

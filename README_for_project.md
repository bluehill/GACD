## Read me for codebook and run_analysis

The experimental design, data sources and variable names and explanations are given in the codebook

This README explains how the run_analysis.R script works:

1. We have 6 files we need to join up to create one file. Three are test, and three are training data. What I do is I first create a  data frame with the 3 from test, and the 3 from train, and then join these. I do the join using a simple rbind as I create common names for each set.  

2. From the above I create the single dataframe with all info: tidydata1. From this I selected only variables with mean and standard deviation.


I recorded the positions of all columns with 'mean' and 'std' in their names using a grep function

3. For the bulk of the data I use the file with the names (features.txt) for all the complicated x variables, which I simplify by using gsub to get rid of (, ), and - . I put the option for tolowercase as an optional step.

4. I renamed the activity types (originally 1:6) as descriptive variables from the activity_lablels.txt file

5. I used the plyr package and ddply to quickly assemble a summary dataset, tidyData, based on mean values of the variables by activity and subject.This is written out as a csv file.


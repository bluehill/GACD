# Codebook

## Getting and cleaning data course


## Overview:

This is a project for the Coursera Getting and Cleaning Data online course run through the John Hopkins University, supervised by Jeff Leek. 

The data linked to from the course website represent data collected
from the accelerometers from the Samsung Galaxy S smartphone. A full
description is available at the site where the data was obtained:
        
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

For results presented here, data were downloaded from: 
        
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

on date:  14/05/2014 12:17:00

# Data collection and background information:
 
The following is reproduced from the following website for readability (but if you are evaluating you can skip this):
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an
 age bracket of 19-48 years. Each person performed six activities (WALKING,
 WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a
 smartphone (Samsung Galaxy S II) on the waist. Using its embedded
 accelerometer and gyroscope, we captured 3-axial linear acceleration and
 3-axial angular velocity at a constant rate of 50Hz. The experiments have been
 video-recorded to label the data manually. The obtained dataset has been
 randomly partitioned into two sets, where 70% of the volunteers was selected
 for generating the training data and 30% the test data.
 
 The sensor signals (accelerometer and gyroscope) were pre-processed by
 applying noise filters and then sampled in fixed-width sliding windows of 2.56
 sec and 50% overlap (128 readings/window). The sensor acceleration signal,
 which has gravitational and body motion components, was separated using a
 Butterworth low-pass filter into body acceleration and gravity. The
 gravitational force is assumed to have only low frequency components,
 therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a
 vector of features was obtained by calculating variables from the time and
 frequency domain.

## the Variables:

 For each record in the dataset this info is provided: 
 - Triaxial acceleration from  the accelerometer (total acceleration) and the estimated body acceleration. 
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables. 
 - Its activity label. 
 - An identifier of the subject who carried out the experiment.

## Transformations

- For this exercise we merged the various files into one file
- I only transformed subject to a factor (from integer)
- following instructions, labels were added from the file of variable names
 - these were simplified by extracting brackets and dashes
 - data were transformed to create a summary data set by activity and subject

## Reference: 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Data preparation

Data were downloaded and saved to a folder called 'data'. 
I have ignored the "Inertial Signals" folders.

The README-for-project.md file contains information on the structure of how the run_analysis.R works to produce the tidydata.csv file.

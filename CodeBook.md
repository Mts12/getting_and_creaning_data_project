# Code Book

## About the data
The data processed here comes from exmeriment using smartphone with embedded accelerometer and gyroscope.
On this experiment, 30 subjects between 19 and 18 years old performed six different activities (see Variables for detail)
and their motions (3-axial linear acceleration and 3-axial angular velocity) were measured. These signals went through some processes to obtain phisical quantities (see Physical Quantities) which then used to estimate feature vector variables representing each activity.

In this copurse project, I prticularly extracted two variables from feature vector --mean and standard deviation-- and computed mean for the each variable by each activity and each subject.

## Transformation 
Following transformations were done for experimental data through R code:
1. Merged separated data sets (test and train data)
2. Extracted the measurements on the mean and standard deviation for each measurement
3. Renamed the activities in the data set
4. Renamed variables 
5. Comuputed the average of each variable for each activity and each subject and then saved the data as tidy_data_set.txt

## Variables
First 2 variables, *Subject* and *Activity* describe subject number and activities the subjects performed:
- *Subject*     : Number of subjects (1-30)
- *Activity*    : Six different activites that subjects did (Walking, WalkingUpstairs, WalkingDownstairs, Sitting, Standing and Laying).

Subsequent variable names consist of 4 parts:

[Types].[Physical Quantities].[Estimated Variables].[Axes]


#### Types 
- *TimeSeries*.... Data with this prefix stands for time series data.
- *Frequency*..... Data with this prefix stands for processed data with Fast Fourier Transform

#### Physical Quantities
- *BodyAcc*................... Body linear acceleration signals
- *BodyAccMag*............ Magnitude of BodyAcc
- *BodyAccJerk*............ Derivatives of BodyAcc
- *BodyAccJerkMag*..... Magnitude of BodyAccJerk

- *GravityAcc*............... Gravity acceleration signals
- *GravityAccMag*........ Magnitude of GravityAcc

- *BodyGyro*................ Body rotation velocity signals
- *BodyGyroMag*......... Magnitude of BodyGyro
- *BodyGyroJerk*......... Derivatives of BodyGyro
- *BodyGyroJerkMag*.. Magnitude of BodyGyroJerk

#### Estimated Variables
Followings are extracted variables from the feature vector.
- *Mean*.... Mean value
- *Std*........ Standard deviation 

#### Axes
- *X*....... Transition along or rotation around X axis
- *Y*....... Transition along or rotation around Y axis
- *Z*....... Transition along or rotation around Z axis
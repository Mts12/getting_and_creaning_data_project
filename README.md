# Description on R Code
Course project on Getting and Creaning Data 

### Read data sets (3 to 16)
Following six data sets and feature are read:
- UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/test/y_test.txt
- UCI HAR Dataset/train/X_train.txt
- UCI HAR Dataset/train/y_train.txt
- UCI HAR Dataset/features.txt
- UCI HAR Dataset/test/subject_test.txt
- UCI HAR Dataset/train/subject_train.txt

The data sets are actually devided into two sets, test and train data sets. Prefix *X* stands for variables in feature vectors and corresponding activities are saved in files with prefix *y*. 
Similarly, files with the prefix *subject* include subject numbers (1 to 30) which correpond to each feature vector in X_test.txt and y_test.txt. The code also read features.txt including list of vactor variable names.

### Merge test and train data sets (20 to 24)
The subsequent process is to merge test and train data sets using rbind() function, producing two data frames X_data and Y_data which store merged feature vectors and its activity.

### Extract mean and std from feature variable vector (26 and 27)  
At this process, variables which are relevant to mean and standard deviation are extacted from entire variables using grep() function which returns indexes from the secound argument which includes the first argument.  In this case,  the functiuon picked up indexes of elements in feature which include mean() or std(). 


### Rename activities (29 to 39)
Since activities are represented with numbers ranging from 1 to 6, we need to named them instead of using numbers. Enumerated strings in *activities*  describe activities with their indexes correponding to the numbers representing activities (Walking = 1, Laying = 6 etc,) and all numbers in y_data are replaced by strings. y_data then merged with X_data using cbind().

### Labels the data set with descriptive variable names (41 to 51)
I converted variables' names in accordance with following rules:
- Replace *-mean* and *-std* with *Mean* and *Std*
- Replace prefix *t* and *f* with *TimeSeries* and *Frequency*
- Introduce period to separate variables' names into several semantic parts


### Ceate tidy data set with the average for each activity and each subject (56 to 72)
I computed mean for each subject and activity and then saved it as tidy_data_set.txt.
In order to extract area for compute avarage, I made mask called *select* in nested for loop scanning all combination of sunjects and activities.   

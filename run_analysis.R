run_analysis <- function(){
    
    ## Read test files
    X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
    
    ## Read train files
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    
    ## Read features files
    features  <- read.table("./UCI HAR Dataset/features.txt")
    
    ## Read features files
    subject_test   <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    subject_train  <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    subject        <- rbind(subject_test, subject_train)
    names(subject) <- c("Subject")
    
    ## Merges test and train data sets (Step1)
    X_data <- rbind(X_test, X_train)
    y_data <- rbind(y_test, y_train)
    names(X_data) <- features$V2
    names(y_data) <- c("Activity")
    
    ## Extract mean and std for each variable (Step2)
    X_data <- X_data[, grep("(mean\\(\\)|std\\(\\))", features$V2)]
    
    ## Add activity names (step3)
    activities <- c("Walking", 
                    "WalkingUpstairs", 
                    "WalkingDownstairs", 
                    "Sitting", 
                    "Standing", 
                    "Laying"
                    )
    ## Add Activities to tidy_data
    y_data$Activity <- activities[y_data$Activity]
    tidy_data       <- cbind(y_data, X_data) 
        
    ## Labels the data set with descriptive variable names (step4)
    names(tidy_data) <- sub("\\(\\)","" ,names(tidy_data))
    
    names(tidy_data) <- sub("-mean",".Mean",names(tidy_data))
    names(tidy_data) <- sub("-std",".Std"  ,names(tidy_data))
    names(tidy_data) <- sub("BodyBody","Body" ,names(tidy_data))
    
    names(tidy_data) <- sub("tBody"   ,"TimeSeries.Body"   , names(tidy_data))
    names(tidy_data) <- sub("tGravity","TimeSeries.Gravity", names(tidy_data))
    names(tidy_data) <- sub("fBody"   ,"Frequency.Body"    , names(tidy_data))
    names(tidy_data) <- sub("fGravity","Frequency.Gravity" , names(tidy_data))
    
    ## Creates a second, independent tidy data set with the average of each variable 
    ## for each activity and each subject. (Step5)
    
    ## Add subject numbera to tidy_data
    tidy_data <- cbind(subject, tidy_data) 
    
    ## Initialize some data.
    out_data  <- NULL
    subjects  <- unique(tidy_data$Subject)
    last      <- dim(tidy_data)[2]
    
    ## Compute mean for each activity and each subject
    for(Subject in subjects){
        for(Activity in activities){
            select    <- tidy_data$Subject==Subject & tidy_data$Activity==Activity
            mean_data <- as.data.frame(lapply(tidy_data[select, 3:last], mean))
            row_data  <- cbind(Subject, Activity, mean_data)
            out_data  <- rbind(out_data, row_data)
        }
    }
    ## Save result
    write.table(out_data, "tidy_data_set.txt", row.names=FALSE)
}
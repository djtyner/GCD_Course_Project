# Code_Book

The information that follows was taken from the "README.txt" and "features_info.txt" files that were included with the data that was used for this project.  Where appropriate, the text will mimic that of the original authors of those two files, and modifications to the text will be included to 
* eliminate information about data that was not directly used for this project;
* provide my attempt to clarify their terminology (assuming that I am understanding their work and their documentation of it);
* indicate any variables and summaries that are a result of the execution of my run_analysis.R code.  
The work of the original authors is not intended to be plagiarized, rather it is included here for accuracy (since some of their work is completely foreign to me!).

## From README.txt
Human Activity Recognition Using Smartphones Dataset
Version 1.0
##
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
## Experiment Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% of the volunteers were selected for the test data.
NOTE: the process of selecting the two groups is not stated by the orignal authors anywhere in the two files. 

The sensor signals (accelerometer sensor signals and gyroscope sensor signals) were pre-processed by applying noise filters and then were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into two components: body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record, the following data was recorded:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label.
** 1 - WALKING
** 2 - WALKING UPSTAIRS
** 3 - WALKING DOWNSTAIRS
** 4 - SITTING
** 5 - STANDING
** 6 - LAYING 
* A numerical identifier of the subject who carried out the experiment (numbers 1 thru 30)

The dataset includes the following files:
* "README.txt"
* "features_info.txt": gives information about the variables used on the feature vector.
* "features.txt": gives names of the 561 data measurements that were recorded for each record.
* "activity_labels.txt": Links the class number with their activity name.
* "train/X_train.txt": Training set.
* "train/y_train.txt": Training labels.
* "test/X_test.txt": Test set.
* "test/y_test.txt": Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* "train/subject_train.txt": Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Notes: 
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

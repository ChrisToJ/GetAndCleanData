
# Variables in the dataset
==========================

The original codebook describes the measured features as follows [1]:
"The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals 
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they 
were filtered using a median filter and a 3rd order low pass Butterworth filter 
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter 
with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals)."

The dataset provided here summarises the original dataset grouped by volunteer/subject (1st column 'subject') and activity (2nd column 'activity').
In the following columns the means and standard deviation of the following features are averaged on a per person and per activity basis:
- tBodyAcc
- tGravityAcc
- tBodyAccJerk
- tBodyGyro
- tBodyGyroJerk
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc
- fBodyAccJerk
- fBodyGyro
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The extensions '.mean' and '.std' indicate that the data is the average of means and standard deviations, respectively.
The extensions '.X', '.Y', and '.Z' specify the 3-axial signals in the X, Y and Z directions, respectively.



# References
============
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

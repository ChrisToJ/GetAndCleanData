Human Activity Recognition Using Smartphones Dataset
====================================================

# Introduction

The raw dataset consists of measurements of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) that have been performed by a group of 30 volunteers (age 19-48 years) wearing a smartphone (Samsung Galaxy S II) on the waist. Details about the original dataset can be found at [1] or requested at [2].

The dataset provided here contains the averages of means and standard deviations of a subset of measurements/features for each volunteer and activity.
For this, the original test and training datasets were combined.

# Dataset description

The dataset contains the following files:
- "README.md" - this document
- "CodeBook.md" - the code book describing variables, data, and transformations
- "run_analysis.R" - the R script used to generate this dataset
- "tidyData.txt" - the dataset

For each record in the dataset it is reported:
- the identifier of the volunteer/subject
- the activity label
- the average of means and standard deviations (std) of measurements/features (specified in the code book)

# R-script description

The R-script "run_analysis.R" does not take any user input. The locations and names of the original dataset files are specified at the beginning of the script (lines 1-15). Then, five functions are defined:
- get_columninfo extracts the columns containing mean and standard deviation information. Columns providing a mean value without the corresponding standard deviation are excluded (e.g. features containing "gravityMean" and "meanFreq")
- get_subjectinfo provides the volunteer/subject number for each record (1-30)
- get_activityinfo provides the activity information for each record (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- get_data extracts the data in the specified columns and creates descriptive variable names for the columns
- merge_data assembles the dataset by invoking get_subjectinfo, get_activityinfo, and get_data

First, the information about the measured features is retrieved (get_columninfo). 
Then, the dataset is assembled using the original test and training datasets including information about the volunteer/subject and the activities (merge_data).
The data is aggregated by volunteer/subject and by activity, and the mean values are determined.
Finally, the resulting dataset is saved as "tidyData.txt".

# Notes

- original features were normalized and bounded within [-1,1]
- each feature vector is a row in the text file

# References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] activityrecognition@smartlab.ws
# Codebook

The dataset "averagesActSubj.csv" was created by column-binding the data, labels and subjects from both the "test" and "train"  folders within the "UCI HAR Dataset" into test and train data-frames. The resulting data-frames were then row-bound into one large data-frame. 

Each row comprised 561 columns corresponding to the features in "UCI HAR Dataset/features.txt", a column named "activity" containing the activity label (1-6) and a column named "subject" containing the subject label (1-30).

Columns were selected from this data-frame based on whether they contained  "mean" or "std" in the variable name. The "activity" and "subject" label columns for each row were kept.

Each entry in the activity column was renamed from the numbers 1-6 to their corresponding label given in  "UCI HAR Dataset/activity_labels.txt":

1 WALKING  
2 WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  

The variable names were then tidied up by removing the characters "()" and "-".

The data-frame was then subset by each factor in the "subject" variable, and within each of these factors, subset again by each factor in the "activity" variable. The mean of each variable was then taken and appended into a final data-frame ("averagesActSubj.csv"). This data-frame therefore contains the average of each variable over each activity for each subject.

The dataset contains 180 rows and 81 columns, for which the variable names are as follows:

1 tBodyAccmeanX  
2 tBodyAccmeanY  
3 tBodyAccmeanZ  
4 tBodyAccstdX  
5 tBodyAccstdY  
6 tBodyAccstdZ  
7 tGravityAccmeanX  
8 tGravityAccmeanY  
9 tGravityAccmeanZ  
10 tGravityAccstdX  
11 tGravityAccstdY  
12 tGravityAccstdZ  
13 tBodyAccJerkmeanX  
14 tBodyAccJerkmeanY  
15 tBodyAccJerkmeanZ  
16 tBodyAccJerkstdX  
17 tBodyAccJerkstdY  
18 tBodyAccJerkstdZ  
19 tBodyGyromeanX  
20 tBodyGyromeanY  
21 tBodyGyromeanZ  
22 tBodyGyrostdX  
23 tBodyGyrostdY  
24 tBodyGyrostdZ  
25 tBodyGyroJerkmeanX  
26 tBodyGyroJerkmeanY  
27 tBodyGyroJerkmeanZ  
28 tBodyGyroJerkstdX  
29 tBodyGyroJerkstdY  
30 tBodyGyroJerkstdZ  
31 tBodyAccMagmean  
32 tBodyAccMagstd  
33 tGravityAccMagmean  
34 tGravityAccMagstd  
35 tBodyAccJerkMagmean  
36 tBodyAccJerkMagstd  
37 tBodyGyroMagmean  
38 tBodyGyroMagstd  
39 tBodyGyroJerkMagmean  
40 tBodyGyroJerkMagstd  
41 fBodyAccmeanX  
42 fBodyAccmeanY  
43 fBodyAccmeanZ  
44 fBodyAccstdX  
45 fBodyAccstdY  
46 fBodyAccstdZ  
47 fBodyAccmeanFreqX  
48 fBodyAccmeanFreqY  
49 fBodyAccmeanFreqZ  
50 fBodyAccJerkmeanX  
51 fBodyAccJerkmeanY  
52 fBodyAccJerkmeanZ  
53 fBodyAccJerkstdX  
54 fBodyAccJerkstdY  
55 fBodyAccJerkstdZ  
56 fBodyAccJerkmeanFreqX  
57 fBodyAccJerkmeanFreqY  
58 fBodyAccJerkmeanFreqZ  
59 fBodyGyromeanX  
60 fBodyGyromeanY  
61 fBodyGyromeanZ  
62 fBodyGyrostdX  
63 fBodyGyrostdY  
64 fBodyGyrostdZ  
65 fBodyGyromeanFreqX  
66 fBodyGyromeanFreqY  
67 fBodyGyromeanFreqZ  
68 fBodyAccMagmean  
69 fBodyAccMagstd  
70 fBodyAccMagmeanFreq  
71 fBodyBodyAccJerkMagmean  
72 fBodyBodyAccJerkMagstd  
73 fBodyBodyAccJerkMagmeanFreq  
74 fBodyBodyGyroMagmean  
75 fBodyBodyGyroMagstd  
76 fBodyBodyGyroMagmeanFreq  
77 fBodyBodyGyroJerkMagmean  
78 fBodyBodyGyroJerkMagstd  
79 fBodyBodyGyroJerkMagmeanFreq  
80 activity  
81 subject  
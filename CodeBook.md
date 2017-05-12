# Variables
x_train, y_train, s_train, x_test, y_test, s_test: Contain downloaded data set
f, al: Contain correct names to correct datasets
mrg_train: Dataset used to join data from train
mrg_test:Dataset used to join data from test
mrg: Dataset used to join data from train and test
cNames, cnMeas: Contain the information to correctly select the measurements of the dataset
ssmrg:Dataset containing only the measures
sActNames: Dataset that includes the names of the activities
sAveActSubj:Dataset containing the final result delivered according to the project instructions

# Process
1. Read the data to be processed independently each.
2. The correct names of some fields are stored in variables
3. Field names in datasets are corrected
4. The Test and Train data is independently merge
5. The data of Test and Train are joined in a single data set
6. A data set is constructed of only the mean and standard deviation measures for each measurement
7. A dataset is built to name the activities
8. An independent and ordered data set is created with the average of each activity for each subject

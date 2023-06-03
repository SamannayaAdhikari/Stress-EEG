# Stress-EEG
Identification of stress during mirror image recognition task 


# Dataset :
https://www.sciencedirect.com/science/article/pii/S2352340921010465
Rajdeep Ghosh a, Nabamita Deb a, Kaushik Sengupta a, Anurag Phukan a, Nitin Choudhury a, Sreshtha Kashyap a, Souvik Phadikar b, Ramesh Saha a, Pranesh Das c, Nidul Sinha b, Priyanka Dutta d

# Data used : 
from the "filtered" data folder only "mirror image" files are selected and from that only 1st trial of each subject is selected for analysis

# code :
the "first.m" file inside "filtered_data" is for time domain feature extraction 
the "second.m" file inside "filtered_data" is for frequency domain feature extraction 
the "feature_symmetry -Sheet1.csv" is the final dataset prepared for preprocessing and training.
"third.m" is for data preprocessing

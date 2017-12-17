# student_performance

This projects test to see if there is difference in perfomace between male and females. This is exucuted by taking the average performace male performance in a subject and comparing it to the average female performance in a subject. The t-test is used to see how likely the null hypothesis is of occuring.

There are two data sets provided in the `data` folder one for a set of students studied in math class another for that same set of students studied in portuguese class. The source code provided for this analysis was create for the math data set but can also be run on the portuguese data set. To run the anaylsis open up shell and run `bash run_this.sh`. This driver script runs each script in the `src` with inputs already entered. You may also or run each script individually but you will have to enter the input for each script yourself.

Usage:

```
make all
```
to undo analysis:

```
clear all
```

To run scripts individually

Scripts should be ran in the follwing order: 
* `get_data.R` input 1: data (url or within a directory)  input 2: Where you would like the result to go 
* `calculate_grades.R` where you written the results of the previous script   input 2: Where you would like the result to go
* `boxplot.R` where you written the results of the previous script   input 2: Where you would like the result to go
* `stats.R` where you written the results of `calculate_grades.R`   input 2: Where you would like the result to go 
* `create_report.R` Does not take any inputs

If the analysis is unable to run due to the calculate_grades.R script go inside the script and use `.libPaths` to set the path to where the required libraires are located.
The libraries required for this analysis is tidyverse and ezknitr.

Usage example:

```
# in src/calculate_grades.R

R_LIBS_USER=c("C:/Users/Toniloba/Documents/R/win-library/3.4")
.libPaths("C:/Users/Toniloba/Documents/R/win-library/3.4")
```
## by Ted Thompson

### 2017

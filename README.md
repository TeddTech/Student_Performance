# student_performance

This projects test to see if there is difference in perfomace between male and females. There are two data sets provided in the `data` folder one for a set of students studied in math class another for that same set of students studied in portuguese class. The source code provided for this analysis was create for the math data set but can also be run on the portuguese data set. To run the anaylsis open up shell and run `bash run_this.sh`. This driver script runs each script in the `src` with inputs already entered. You may also or run each script individually but you will have to enter the input for each script yourself.

Scripts should be ran in the follwing order: 
* `get_data.R` input 1: data (url or within a directory)  input 2: Where you would like the result to go 
* `calculate_grades.R` where you written the results of the previous script   input 2: Where you would like the result to go
* `boxplot.R` where you written the results of the previous script   input 2: Where you would like the result to go
* `stats.R` where you written the results of `calculate_grades.R`   input 2: Where you would like the result to go 
* `create_report.R` Does not take any inputs

### 1.
This project uses the ![Student Performance Data Set](http://archive.ics.uci.edu/ml/datasets/Student+Performance) (http://archive.ics.uci.edu/ml/datasets/Student+Performance) from the UCI machine learning repositiry.

### 2.
Do females perform better than males in school given all other factors are the same? And what is the most influential factor that decides how well a student performs.

### 3.
The average performance of female students differ from the average perfromace of male students.

### 4.
I plan to use R to wrangle the data organize and create new features if necessary. I will also have a summary table summarizing key statistics. I plan on using a boxplot for my first visulization and a interaction plot built using ggplot `geom_line()` function. Other methods I may use to visualize the data may include a dot plot and bat chart.


## by Ted Thompson

### 2017

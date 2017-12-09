#! /usr/bin/env Rscript 

# calculate_grades.R
# Ted Thompson, Dec 2017
#
# This script calculates the mean grades of each student from student-mat.csv
# This script takes two arguments as inputs.
# -a path/filename pointing to the data
# -a path/filename where to write the file to and what to call it
#
# Usage: Rscript boxplot.R '../data/marks_data.csv' 'results/average_grades.csv'

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
var_data <- args[1]
var_dir <- args[2]

#define main function

main <- function(){
  
  #read in data
  dat1 <- read.table(var_data,sep=";",header=TRUE)
  
  #find average grades
  dat2 <- dat1 %>% mutate(average_grade = (G1+ G2+ G3)/3)
  
  #write results
  grades <- write.csv(dat2, var_dir)
  
  
  paste('Location of calculated data with average grade of each student is written inside the following variable: grades')
  
}


#call main function

main()
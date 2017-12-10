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

R_LIBS_USER=c("C:/Users/Toniloba/Documents/R/win-library/3.4")
.libPaths("C:/Users/Toniloba/Documents/R/win-library/3.4")

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
var_data <- args[1]
var_dir <- args[2]

#define main function

main <- function(){
  
  #read in data
  dat1 <- read.csv(var_data,header=TRUE)
  
  
  #find average grades

  average_grades <- (dat1$G1+ dat1$G2+ dat1$G3)/3
  
  dat2 <- data.frame(sex = dat1$sex, average_grades, age = dat1$age)

  #dat2 <- dplyr::mutate(dat1,average_grade = (dat1$G1+ dat1$G2+ dat1$G3)/3)

  
  #write results
  write.csv(dat2, var_dir)
  #grades <- write.csv(dat2, var_dir)

  
  paste('Location of calculated data with average grade of each student is written inside the following variable: grades')
}

ave <- function(){
  
}

#call main function

main()
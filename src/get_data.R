#! /usr/bin/env Rscript 

# boxplot.R
# Ted Thompson, Dec 2017
#
# This script downloads the data required and saves it in data directory
# This script takes two arguments as as input:
# - a URL pointing to the data
# - a path/filename where to write the file to and what to call it
#
# Usage: Rscript get_data.R 'http://archive.ics.uci.edu/ml/machine-learning-databases/' '../data/marks_data.csv'



# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
var_data <- args[1]
var_dir <- args[2]

#define main function

main <- function(){
  
  #read in data
  dat1 <- read.table(var_data,sep=";",header=TRUE)
  
  # average_grades <- (dat1$G1+ dat1$G2+ dat1$G3)/3
  # datt <- data.frame(sex = dat1$sex, average_grades, age = dat1$age)
  # write.csv(datt, 'results/average_grades.csv')
  # write.csv(datt$average_grades, 'results/a.csv')
  # write.csv(datt$sex, 'results/b.csv')
  
  #write data
  dat <- write.csv(dat1, var_dir)
  
  paste('Location of data is written inside the following variable: dat')

}


#call main function

main()
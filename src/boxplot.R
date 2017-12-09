#! /usr/bin/env Rscript 

# boxplot.R
# Ted Thompson, Dec 2017
#
# This script creates a box plot of the average grade of males and females
# This script takes dat2 from calculate_grades.R as input
# - a path/filename pointing to the data
# - a path/filename prefix where to write the figure to and what to call it
#
# Usage: Rscript boxplot.R '../results/average_grades.csv' '../results/mvf.png'



# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
var_data <- args[1]
var_dir <- args[2]

#define main function

main <- function(){
  dat2 <- read.table(var_data,sep=";",header=TRUE)
  mvf <- boxplot(dat2$average_grade~dat2$sex,
          las=1, ylab="Grade", xlab="Gender", 
          main="Difference Grades Between Male and Females")
  
  png(filename= var_dir)
  plot(mvf)
  dev.off()
}


#call main function

main()
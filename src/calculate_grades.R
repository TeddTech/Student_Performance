#! /usr/bin/env Rscript 

# calculate_grades.R
# Ted Thompson, Dec 2017
#
# This script calculates the mean grades of each student from student-mat.csv
# This script takes no arguments.
#
# Usage: Rscript boxplot.R

#define main function

main <- function(){
  
  #read in data
  dat1 <- read.table("../data/student-mat.csv",sep=";",header=TRUE)
  
  #find average grades
  dat2 <- dat1 %>% mutate(average_grade = (G1+ G2+ G3)/3)
  
  #print out final dataframe
  return(dat2)
  
}


#call main function

main()
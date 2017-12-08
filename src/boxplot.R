#! /usr/bin/env Rscript 

# boxplot.R
# Ted Thompson, Dec 2017
#
# This script creates a box plot of the average grade of males and females
# This script takes dat2 from calculate_grades.R as input
#
# Usage: Rscript boxplot.R dat2



# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
variable <- args[1]

#define main function

main <- function(){
  
  mvf <- boxplot(variable$average_grade~variable$sex,
          las=1, ylab="Grade", xlab="Gender", 
          main="Difference Grades Between Male and Females")
  
  png(filename="../results/mvf.png")
  plot(mvf)
  dev.off()
}


#call main function

main()
#! /usr/bin/env Rscript 

# boxplot.R
# Ted Thompson, Dec 2017
#
# This script creates the resulting statistics for for the hypothesis
# This script takes dat2 from calculate_grades.R as input
#
# Usage: Rscript stats.R dat2

# set path
.libPaths("C:/Users/Toniloba/Documents/R/win-library/3.4")

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
variable <- args[1]

#define main function

main <- function(){
  
  datt <- read.csv(variable,header=TRUE)
 
  ttest <- t.test(datt$average_grade~datt$sex,
                  paired=F, var.eq=T)
  
  print('Number of female obsevations:')
  print(table(datt$sex)[[1]])
  print('Number of male observations:')
  print(table(datt$sex)[[2]])
  return(broom::tidy(ttest))
}


#call main function

main()
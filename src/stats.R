#! /usr/bin/env Rscript 

# boxplot.R
# Ted Thompson, Dec 2017
#
# This script creates the resulting statistics for for the hypothesis
# This script takes dat2 from calculate_grades.R as input
#
# Usage: Rscript stats.R dat2



# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
variable <- args[1]

#define main function

main <- function(){
  
  print(table(variable$sex))
 
  ttest <- t.test(variable$average_grade~variable$sex,
                  paired=F, var.eq=T)
  print(tidy(ttest))
  
}


#call main function

main()
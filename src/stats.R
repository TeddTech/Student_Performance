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
  
  datt <- read.table(variable,sep=";",header=TRUE)
  
  print(table(datt$sex))
 
  ttest <- t.test(datt$average_grade~datt$sex,
                  paired=F, var.eq=T)
  print(tidy(ttest))
  
  paste('Number of female obsevations', table(datt$sex)[[1]])
  paste('Number of male observations', table(datt$sex)[[2]])
  
}


#call main function

main()
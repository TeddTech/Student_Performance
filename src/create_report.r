#! /usr/bin/env Rscript 

# calculate_grades.R
# Ted Thompson, Dec 2017
#
# This script create a report containing the results of the analysis
# This script takes no inputs.
#
# Usage: Rscript create_report.R


.libPaths("C:/Users/Toniloba/Documents/R/win-library/3.4")
ezknitr::ezknit("src/grades_report.Rmd", out_dir = "doc")

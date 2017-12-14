##Makefile

##Ted Thompson, December 2017

##This script runs the full analysis, presents the results at the end and is the driver scrip for this project
##usage: make all

##run top to bottom
all: doc/grades_report.md

##This script downloads the data required and saves it in data directory
data/marks_data.csv: data/student/student-mat.csv src/get_data.R
	Rscript src/get_data.R data/student/student-mat.csv data/marks_data.csv

##This script calculates the mean grades of each student from student-mat.csv
results/average_grades.csv: data/marks_data.csv src/calculate_grades.R
	Rscript src/calculate_grades.R data/marks_data.csv results/average_grades.csv

##This script creates a box plot of the average grade of males and females
results/male_vs_female.png: results/average_grades.csv src/boxplot.R
	Rscript src/boxplot.R results/average_grades.csv results/male_vs_female.png

## This script creates the resulting statistics for for the hypothesis
	Rscript src/stats.R results/average_grades.csv

##create report
doc/grades_report.md: results/average_grades.csv results/male_vs_female.png
	Rscript src/create_report.R

##clean up intermediate files.
clean:
	rm -f data/marks_data.csv
	rm -f results/average_grades.csv
	rm -f results/male_vs_female.png
	rm -f results/average_grades.csv
	rm -f doc/grades_report.md

# Driver script
# Ted Thompson Dec 2017
# This script runs the full analysis and presents the results at the end
#
#usage: bash run_this.sh

# This script downloads the data required and saves it in data directory
Rscript src/get_data.R 'https://raw.githubusercontent.com/TeddTech/student_data/master/student-mat.csv' 'data/marks_data.csv'

# This script calculates the mean grades of each student from student-mat.csv
Rscript src/calculate_grades.R 'data/marks_data.csv' 'results/average_grades.csv'

# This script creates a box plot of the average grade of males and females
Rscript src/boxplot.R 'results/average_grades.csv' 'results/mvf.png'

# This script creates the resulting statistics for for the hypothesis
Rscript src/stats.R 'results/average_grades.csv'

# create report
Rscript src/create_report.R

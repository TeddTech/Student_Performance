---
title: "Grades Report"
author: "Ted Thompson"
date: "December 7, 2017"
output: html_document
---




## Do females perform better than males in school?

This analysis attempts to answer.Do females perform better than males in school given all other factors are the same? And what is the most influential factor that decides how well a student performs.The hypothesis presesnted is the average performance of female students differ from the average perfromace of male students.

This project uses the Student Performance Data Set (http://archive.ics.uci.edu/ml/datasets/Student+Performance) from the UCI machine learning repositiry. I to use R to wrangle the data organize and create new features. I also have a summary table summarizing key statistics. A boxplot is shown for my visulization.



```r
library(tidyverse)
```

```
## Loading tidyverse: ggplot2
## Loading tidyverse: tibble
## Loading tidyverse: tidyr
## Loading tidyverse: readr
## Loading tidyverse: purrr
## Loading tidyverse: dplyr
```

```
## Conflicts with tidy packages ----------------------------------------------
```

```
## filter(): dplyr, stats
## lag():    dplyr, stats
```

```r
library(broom)
```

## Load Data


```r
dat1 <- read.table('https://raw.githubusercontent.com/TeddTech/student_data/master/student-mat.csv',sep=";",header=TRUE)

dat2 <- dat1 %>% mutate(average_grade = (G1+ G2+ G3)/3)
dat2
```

```
##     school sex age address famsize Pstatus Medu Fedu     Mjob     Fjob
## 1       GP   F  18       U     GT3       A    4    4  at_home  teacher
## 2       GP   F  17       U     GT3       T    1    1  at_home    other
## 3       GP   F  15       U     LE3       T    1    1  at_home    other
## 4       GP   F  15       U     GT3       T    4    2   health services
## 5       GP   F  16       U     GT3       T    3    3    other    other
## 6       GP   M  16       U     LE3       T    4    3 services    other
## 7       GP   M  16       U     LE3       T    2    2    other    other
## 8       GP   F  17       U     GT3       A    4    4    other  teacher
## 9       GP   M  15       U     LE3       A    3    2 services    other
## 10      GP   M  15       U     GT3       T    3    4    other    other
## 11      GP   F  15       U     GT3       T    4    4  teacher   health
## 12      GP   F  15       U     GT3       T    2    1 services    other
## 13      GP   M  15       U     LE3       T    4    4   health services
## 14      GP   M  15       U     GT3       T    4    3  teacher    other
## 15      GP   M  15       U     GT3       A    2    2    other    other
## 16      GP   F  16       U     GT3       T    4    4   health    other
## 17      GP   F  16       U     GT3       T    4    4 services services
## 18      GP   F  16       U     GT3       T    3    3    other    other
## 19      GP   M  17       U     GT3       T    3    2 services services
## 20      GP   M  16       U     LE3       T    4    3   health    other
## 21      GP   M  15       U     GT3       T    4    3  teacher    other
## 22      GP   M  15       U     GT3       T    4    4   health   health
## 23      GP   M  16       U     LE3       T    4    2  teacher    other
## 24      GP   M  16       U     LE3       T    2    2    other    other
## 25      GP   F  15       R     GT3       T    2    4 services   health
## 26      GP   F  16       U     GT3       T    2    2 services services
## 27      GP   M  15       U     GT3       T    2    2    other    other
## 28      GP   M  15       U     GT3       T    4    2   health services
## 29      GP   M  16       U     LE3       A    3    4 services    other
## 30      GP   M  16       U     GT3       T    4    4  teacher  teacher
## 31      GP   M  15       U     GT3       T    4    4   health services
## 32      GP   M  15       U     GT3       T    4    4 services services
## 33      GP   M  15       R     GT3       T    4    3  teacher  at_home
## 34      GP   M  15       U     LE3       T    3    3    other    other
## 35      GP   M  16       U     GT3       T    3    2    other    other
## 36      GP   F  15       U     GT3       T    2    3    other    other
## 37      GP   M  15       U     LE3       T    4    3  teacher services
## 38      GP   M  16       R     GT3       A    4    4    other  teacher
## 39      GP   F  15       R     GT3       T    3    4 services   health
## 40      GP   F  15       R     GT3       T    2    2  at_home    other
## 41      GP   F  16       U     LE3       T    2    2    other    other
## 42      GP   M  15       U     LE3       T    4    4  teacher    other
## 43      GP   M  15       U     GT3       T    4    4 services  teacher
## 44      GP   M  15       U     GT3       T    2    2 services services
## 45      GP   F  16       U     LE3       T    2    2    other  at_home
## 46      GP   F  15       U     LE3       A    4    3    other    other
## 47      GP   F  16       U     LE3       A    3    3    other services
## 48      GP   M  16       U     GT3       T    4    3   health services
## 49      GP   M  15       U     GT3       T    4    2  teacher    other
## 50      GP   F  15       U     GT3       T    4    4 services  teacher
## 51      GP   F  16       U     LE3       T    2    2 services services
## 52      GP   F  15       U     LE3       T    4    2   health    other
## 53      GP   M  15       U     LE3       A    4    2   health   health
## 54      GP   F  15       U     GT3       T    4    4 services services
## 55      GP   F  15       U     LE3       A    3    3    other    other
## 56      GP   F  16       U     GT3       A    2    1    other    other
## 57      GP   F  15       U     GT3       A    4    3 services services
## 58      GP   M  15       U     GT3       T    4    4  teacher   health
## 59      GP   M  15       U     LE3       T    1    2    other  at_home
## 60      GP   F  16       U     GT3       T    4    2 services    other
## 61      GP   F  16       R     GT3       T    4    4   health  teacher
## 62      GP   F  16       U     GT3       T    1    1 services services
## 63      GP   F  16       U     LE3       T    1    2    other services
## 64      GP   F  16       U     GT3       T    4    3  teacher   health
## 65      GP   F  15       U     LE3       T    4    3 services services
## 66      GP   F  16       U     LE3       T    4    3  teacher services
## 67      GP   M  15       U     GT3       A    4    4    other services
## 68      GP   F  16       U     GT3       T    3    1 services    other
## 69      GP   F  15       R     LE3       T    2    2   health services
## 70      GP   F  15       R     LE3       T    3    1    other    other
## 71      GP   M  16       U     GT3       T    3    1    other    other
## 72      GP   M  15       U     GT3       T    4    2    other    other
## 73      GP   F  15       R     GT3       T    1    1    other    other
## 74      GP   M  16       U     GT3       T    3    1    other    other
## 75      GP   F  16       U     GT3       T    3    3    other services
## 76      GP   M  15       U     GT3       T    4    3  teacher    other
## 77      GP   M  15       U     GT3       T    4    0  teacher    other
## 78      GP   F  16       U     GT3       T    2    2    other    other
## 79      GP   M  17       U     GT3       T    2    1    other    other
## 80      GP   F  16       U     GT3       T    3    4  at_home    other
## 81      GP   M  15       U     GT3       T    2    3    other services
## 82      GP   M  15       U     GT3       T    2    3    other    other
## 83      GP   F  15       U     LE3       T    3    2 services    other
## 84      GP   M  15       U     LE3       T    2    2 services services
## 85      GP   F  15       U     GT3       T    1    1    other    other
## 86      GP   F  15       U     GT3       T    4    4 services services
## 87      GP   F  16       U     LE3       T    2    2  at_home    other
## 88      GP   F  15       U     GT3       T    4    2    other    other
## 89      GP   M  16       U     GT3       T    2    2 services    other
## 90      GP   M  16       U     LE3       A    4    4  teacher   health
## 91      GP   F  16       U     GT3       T    3    3    other    other
## 92      GP   F  15       U     GT3       T    4    3 services    other
## 93      GP   F  16       U     LE3       T    3    1    other    other
## 94      GP   F  16       U     GT3       T    4    2  teacher services
## 95      GP   M  15       U     LE3       T    2    2 services   health
## 96      GP   F  15       R     GT3       T    1    1  at_home    other
## 97      GP   M  16       R     GT3       T    4    3 services    other
## 98      GP   F  16       U     GT3       T    2    1    other    other
## 99      GP   F  16       U     GT3       T    4    4    other    other
## 100     GP   F  16       U     GT3       T    4    3    other  at_home
## 101     GP   M  16       U     GT3       T    4    4 services services
## 102     GP   M  16       U     GT3       T    4    4 services  teacher
## 103     GP   M  15       U     GT3       T    4    4 services    other
## 104     GP   F  15       U     GT3       T    3    2 services    other
## 105     GP   M  15       U     GT3       A    3    4 services    other
## 106     GP   F  15       U     GT3       A    3    3    other   health
## 107     GP   F  15       U     GT3       T    2    2    other    other
## 108     GP   M  16       U     GT3       T    3    3 services    other
## 109     GP   M  15       R     GT3       T    4    4    other    other
## 110     GP   F  16       U     LE3       T    4    4   health   health
## 111     GP   M  15       U     LE3       A    4    4  teacher  teacher
## 112     GP   F  16       R     GT3       T    3    3 services    other
## 113     GP   F  16       U     GT3       T    2    2  at_home    other
## 114     GP   M  15       U     LE3       T    4    2  teacher    other
## 115     GP   M  15       R     GT3       T    2    1   health services
## 116     GP   M  16       U     GT3       T    4    4  teacher  teacher
## 117     GP   M  15       U     GT3       T    4    4    other  teacher
## 118     GP   M  16       U     GT3       T    3    3    other services
## 119     GP   M  17       R     GT3       T    1    3    other    other
## 120     GP   M  15       U     GT3       T    3    4    other    other
## 121     GP   F  15       U     GT3       T    1    2  at_home services
## 122     GP   M  15       U     GT3       T    2    2 services services
## 123     GP   F  16       U     LE3       T    2    4    other   health
## 124     GP   M  16       U     GT3       T    4    4   health    other
## 125     GP   F  16       U     GT3       T    2    2    other    other
## 126     GP   M  15       U     GT3       T    3    4 services services
## 127     GP   F  15       U     LE3       A    3    4    other    other
## 128     GP   F  19       U     GT3       T    0    1  at_home    other
## 129     GP   M  18       R     GT3       T    2    2 services    other
## 130     GP   M  16       R     GT3       T    4    4  teacher  teacher
## 131     GP   F  15       R     GT3       T    3    4 services  teacher
## 132     GP   F  15       U     GT3       T    1    1  at_home    other
## 133     GP   F  17       U     LE3       T    2    2    other    other
## 134     GP   F  16       U     GT3       A    3    4 services    other
## 135     GP   M  15       R     GT3       T    3    4  at_home  teacher
## 136     GP   F  15       U     GT3       T    4    4 services  at_home
## 137     GP   M  17       R     GT3       T    3    4  at_home    other
## 138     GP   F  16       U     GT3       A    3    3    other    other
## 139     GP   M  16       U     LE3       T    1    1 services    other
## 140     GP   F  15       U     GT3       T    4    4  teacher  teacher
## 141     GP   M  15       U     GT3       T    4    3  teacher services
## 142     GP   M  16       U     LE3       T    2    2 services services
## 143     GP   F  15       U     GT3       T    4    4  teacher services
## 144     GP   F  16       U     LE3       T    1    1  at_home  at_home
## 145     GP   M  17       U     GT3       T    2    1    other    other
## 146     GP   F  15       U     GT3       T    1    1    other services
## 147     GP   F  15       U     GT3       T    3    2   health services
## 148     GP   F  15       U     GT3       T    1    2  at_home    other
## 149     GP   M  16       U     GT3       T    4    4  teacher  teacher
## 150     GP   M  15       U     LE3       A    2    1 services    other
## 151     GP   M  18       U     LE3       T    1    1    other    other
## 152     GP   M  16       U     LE3       T    2    1  at_home    other
## 153     GP   F  15       R     GT3       T    3    3 services services
## 154     GP   M  19       U     GT3       T    3    2 services  at_home
## 155     GP   F  17       U     GT3       T    4    4    other  teacher
## 156     GP   M  15       R     GT3       T    2    3  at_home services
## 157     GP   M  17       R     LE3       T    1    2    other    other
## 158     GP   F  18       R     GT3       T    1    1  at_home    other
## 159     GP   M  16       R     GT3       T    2    2  at_home    other
## 160     GP   M  16       U     GT3       T    3    3    other services
## 161     GP   M  17       R     LE3       T    2    1  at_home    other
## 162     GP   M  15       R     GT3       T    3    2    other    other
## 163     GP   M  16       U     LE3       T    1    2    other    other
## 164     GP   M  17       U     GT3       T    1    3  at_home services
## 165     GP   M  17       R     LE3       T    1    1    other services
## 166     GP   M  16       U     GT3       T    3    2 services services
## 167     GP   M  16       U     GT3       T    2    2    other    other
## 168     GP   F  16       U     GT3       T    4    2   health services
## 169     GP   F  16       U     GT3       T    2    2    other    other
## 170     GP   F  16       U     GT3       T    4    4   health   health
## 171     GP   M  16       U     GT3       T    3    4    other    other
## 172     GP   M  16       U     GT3       T    1    0    other    other
## 173     GP   M  17       U     LE3       T    4    4  teacher    other
## 174     GP   F  16       U     GT3       T    1    3  at_home services
## 175     GP   F  16       U     LE3       T    3    3    other    other
## 176     GP   M  17       U     LE3       T    4    3  teacher    other
## 177     GP   F  16       U     GT3       T    2    2 services    other
## 178     GP   M  17       U     GT3       T    3    3    other    other
## 179     GP   M  16       R     GT3       T    4    2  teacher services
## 180     GP   M  17       U     GT3       T    4    3    other    other
## 181     GP   M  16       U     GT3       T    4    3  teacher    other
## 182     GP   M  16       U     GT3       T    3    3 services    other
## 183     GP   F  17       U     GT3       T    2    4 services services
## 184     GP   F  17       U     LE3       T    3    3    other    other
## 185     GP   F  16       U     GT3       T    3    2    other    other
## 186     GP   M  17       U     GT3       T    3    3 services services
## 187     GP   M  16       U     GT3       T    1    2 services services
## 188     GP   M  16       U     LE3       T    2    1    other    other
## 189     GP   F  17       U     GT3       A    3    3   health    other
## 190     GP   M  17       R     GT3       T    1    2  at_home    other
## 191     GP   F  16       U     GT3       T    2    3 services services
## 192     GP   F  17       U     GT3       T    1    1  at_home services
## 193     GP   M  17       U     GT3       T    1    2  at_home services
## 194     GP   M  16       R     GT3       T    3    3 services services
## 195     GP   M  16       U     GT3       T    2    3    other    other
## 196     GP   F  17       U     LE3       T    2    4 services services
## 197     GP   M  17       U     GT3       T    4    4 services  teacher
## 198     GP   M  16       R     LE3       T    3    3  teacher    other
## 199     GP   F  17       U     GT3       T    4    4 services  teacher
## 200     GP   F  16       U     LE3       T    4    4  teacher  teacher
## 201     GP   F  16       U     GT3       T    4    3   health    other
## 202     GP   F  16       U     GT3       T    2    3    other    other
## 203     GP   F  17       U     GT3       T    1    1    other    other
## 204     GP   F  17       R     GT3       T    2    2    other    other
## 205     GP   F  16       R     GT3       T    2    2 services services
## 206     GP   F  17       U     GT3       T    3    4  at_home services
## 207     GP   F  16       U     GT3       A    3    1 services    other
## 208     GP   F  16       U     GT3       T    4    3  teacher    other
## 209     GP   F  16       U     GT3       T    1    1  at_home    other
## 210     GP   F  17       R     GT3       T    4    3  teacher    other
## 211     GP   F  19       U     GT3       T    3    3    other    other
## 212     GP   M  17       U     LE3       T    4    4 services    other
## 213     GP   F  16       U     GT3       A    2    2    other    other
## 214     GP   M  18       U     GT3       T    2    2 services    other
## 215     GP   F  17       R     LE3       T    4    4 services    other
## 216     GP   F  17       U     LE3       T    3    2    other    other
## 217     GP   F  17       U     GT3       T    4    3    other    other
## 218     GP   M  18       U     LE3       T    3    3 services   health
## 219     GP   F  17       U     GT3       T    2    3  at_home    other
## 220     GP   F  17       U     GT3       T    2    2  at_home  at_home
## 221     GP   F  17       R     GT3       T    2    1  at_home services
## 222     GP   F  17       U     GT3       T    1    1  at_home    other
## 223     GP   F  16       U     GT3       T    2    3 services  teacher
## 224     GP   M  18       U     GT3       T    2    2    other    other
## 225     GP   F  16       U     GT3       T    4    4  teacher services
## 226     GP   F  18       R     GT3       T    3    1    other    other
## 227     GP   F  17       U     GT3       T    3    2    other    other
## 228     GP   M  17       U     LE3       T    2    3 services services
## 229     GP   M  18       U     LE3       T    2    1  at_home    other
## 230     GP   F  17       U     GT3       A    2    1    other    other
## 231     GP   F  17       U     LE3       T    4    3   health    other
## 232     GP   M  17       R     GT3       T    2    2    other    other
## 233     GP   M  17       U     GT3       T    4    4  teacher  teacher
## 234     GP   M  16       U     GT3       T    4    4   health    other
## 235     GP   M  16       U     LE3       T    1    1    other    other
## 236     GP   M  16       U     GT3       T    3    2  at_home    other
## 237     GP   M  17       U     LE3       T    2    2    other    other
## 238     GP   F  16       U     GT3       T    2    1    other    other
## 239     GP   F  17       R     GT3       T    2    1  at_home services
## 240     GP   M  18       U     GT3       T    2    2    other services
## 241     GP   M  17       U     LE3       T    4    3   health    other
## 242     GP   M  17       R     LE3       A    4    4  teacher    other
## 243     GP   M  16       U     LE3       T    4    3  teacher    other
## 244     GP   M  16       U     GT3       T    4    4 services services
## 245     GP   F  18       U     GT3       T    2    1    other    other
## 246     GP   M  16       U     GT3       T    2    1    other    other
## 247     GP   M  17       U     GT3       T    2    3    other    other
## 248     GP   M  22       U     GT3       T    3    1 services services
## 249     GP   M  18       R     LE3       T    3    3    other services
## 250     GP   M  16       U     GT3       T    0    2    other    other
## 251     GP   M  18       U     GT3       T    3    2 services    other
## 252     GP   M  16       U     GT3       T    3    3  at_home    other
## 253     GP   M  18       U     GT3       T    2    1 services services
## 254     GP   M  16       R     GT3       T    2    1    other    other
## 255     GP   M  17       R     GT3       T    2    1    other    other
## 256     GP   M  17       U     LE3       T    1    1   health    other
## 257     GP   F  17       U     LE3       T    4    2  teacher services
## 258     GP   M  19       U     LE3       A    4    3 services  at_home
## 259     GP   M  18       U     GT3       T    2    1    other    other
## 260     GP   F  17       U     LE3       T    2    2 services services
## 261     GP   F  18       U     GT3       T    4    3 services    other
## 262     GP   M  18       U     GT3       T    4    3  teacher    other
## 263     GP   M  18       R     GT3       T    3    2    other    other
## 264     GP   F  17       U     GT3       T    3    3    other    other
## 265     GP   F  18       U     GT3       T    2    2  at_home services
## 266     GP   M  18       R     LE3       A    3    4    other    other
## 267     GP   M  17       U     GT3       T    3    1 services    other
## 268     GP   F  18       R     GT3       T    4    4  teacher    other
## 269     GP   M  18       U     GT3       T    4    2   health    other
## 270     GP   F  18       R     GT3       T    2    1    other    other
## 271     GP   F  19       U     GT3       T    3    3    other services
## 272     GP   F  18       U     GT3       T    2    3    other services
## 273     GP   F  18       U     LE3       T    1    1    other    other
## 274     GP   M  17       R     GT3       T    1    2  at_home  at_home
## 275     GP   F  17       U     GT3       T    2    4  at_home   health
## 276     GP   F  17       U     LE3       T    2    2 services    other
## 277     GP   F  18       R     GT3       A    3    2    other services
## 278     GP   M  18       U     GT3       T    4    4  teacher services
## 279     GP   F  18       U     GT3       T    4    4   health   health
## 280     GP   M  18       U     LE3       T    4    3  teacher services
## 281     GP   M  17       U     LE3       A    4    1 services    other
## 282     GP   M  17       U     LE3       A    3    2  teacher services
## 283     GP   F  18       R     LE3       T    1    1  at_home    other
## 284     GP   F  18       U     GT3       T    1    1    other    other
## 285     GP   F  17       U     GT3       T    2    2    other    other
## 286     GP   M  17       U     GT3       T    1    1    other    other
## 287     GP   F  18       U     GT3       T    2    2  at_home  at_home
## 288     GP   F  17       U     GT3       T    1    1 services  teacher
## 289     GP   M  18       U     GT3       T    2    1 services services
## 290     GP   M  18       U     LE3       A    4    4  teacher  teacher
## 291     GP   M  18       U     GT3       T    4    2  teacher    other
## 292     GP   F  17       U     GT3       T    4    3   health services
## 293     GP   F  18       U     LE3       T    2    1 services  at_home
## 294     GP   F  17       R     LE3       T    3    1 services    other
## 295     GP   M  18       R     LE3       T    3    2 services    other
## 296     GP   M  17       U     GT3       T    3    3   health    other
## 297     GP   F  19       U     GT3       T    4    4   health    other
## 298     GP   F  18       U     LE3       T    4    3    other    other
## 299     GP   F  18       U     GT3       T    4    3    other    other
## 300     GP   M  18       U     LE3       T    4    4  teacher  teacher
## 301     GP   F  18       U     LE3       A    4    4   health    other
## 302     GP   M  17       U     LE3       T    4    4    other  teacher
## 303     GP   F  17       U     GT3       T    4    2    other    other
## 304     GP   F  17       U     GT3       T    3    2   health   health
## 305     GP   M  19       U     GT3       T    3    3    other    other
## 306     GP   F  18       U     GT3       T    2    4 services  at_home
## 307     GP   M  20       U     GT3       A    3    2 services    other
## 308     GP   M  19       U     GT3       T    4    4  teacher services
## 309     GP   M  19       R     GT3       T    3    3    other services
## 310     GP   F  19       U     LE3       T    1    1  at_home    other
## 311     GP   F  19       U     LE3       T    1    2 services services
## 312     GP   F  19       U     GT3       T    2    1  at_home    other
## 313     GP   M  19       U     GT3       T    1    2    other services
## 314     GP   F  19       U     LE3       T    3    2 services    other
## 315     GP   F  19       U     GT3       T    1    1  at_home   health
## 316     GP   F  19       R     GT3       T    2    3    other    other
## 317     GP   F  18       U     GT3       T    2    1 services    other
## 318     GP   F  18       U     GT3       T    4    3    other    other
## 319     GP   F  17       R     GT3       T    3    4  at_home services
## 320     GP   F  18       U     GT3       T    4    4  teacher    other
## 321     GP   F  17       U     GT3       A    4    3 services services
## 322     GP   F  17       U     GT3       T    2    2    other    other
## 323     GP   F  17       R     LE3       T    2    2 services services
## 324     GP   F  17       U     GT3       T    3    1 services services
## 325     GP   F  17       U     LE3       T    0    2  at_home  at_home
## 326     GP   M  18       U     GT3       T    4    4    other    other
## 327     GP   M  17       U     GT3       T    3    3    other services
## 328     GP   M  17       R     GT3       T    2    2 services    other
## 329     GP   F  17       U     GT3       T    4    4  teacher services
## 330     GP   F  17       U     GT3       T    4    4  teacher  teacher
## 331     GP   M  18       U     LE3       T    2    2    other    other
## 332     GP   F  17       R     GT3       T    2    4  at_home    other
## 333     GP   F  18       U     GT3       T    3    3 services services
## 334     GP   F  18       U     LE3       T    2    2    other    other
## 335     GP   F  18       R     GT3       T    2    2  at_home    other
## 336     GP   F  17       U     GT3       T    3    4 services    other
## 337     GP   F  19       R     GT3       A    3    1 services  at_home
## 338     GP   F  17       U     GT3       T    3    2    other    other
## 339     GP   F  18       U     LE3       T    3    3 services services
## 340     GP   F  17       R     GT3       A    3    2    other    other
## 341     GP   F  19       U     GT3       T    2    1 services services
## 342     GP   M  18       U     GT3       T    4    4  teacher services
## 343     GP   M  18       U     LE3       T    3    4 services    other
## 344     GP   F  17       U     GT3       A    2    2  at_home  at_home
## 345     GP   F  18       U     GT3       T    2    3  at_home    other
## 346     GP   F  18       U     GT3       T    3    2    other services
## 347     GP   M  18       R     GT3       T    4    3  teacher services
## 348     GP   M  18       U     GT3       T    4    3  teacher    other
## 349     GP   F  17       U     GT3       T    4    3   health    other
## 350     MS   M  18       R     GT3       T    3    2    other    other
## 351     MS   M  19       R     GT3       T    1    1    other services
## 352     MS   M  17       U     GT3       T    3    3   health    other
## 353     MS   M  18       U     LE3       T    1    3  at_home services
## 354     MS   M  19       R     GT3       T    1    1    other    other
## 355     MS   M  17       R     GT3       T    4    3 services    other
## 356     MS   F  18       U     GT3       T    3    3 services services
## 357     MS   F  17       R     GT3       T    4    4  teacher services
## 358     MS   F  17       U     LE3       A    3    2 services    other
## 359     MS   M  18       U     LE3       T    1    1    other services
## 360     MS   F  18       U     LE3       T    1    1  at_home services
## 361     MS   F  18       R     LE3       A    1    4  at_home    other
## 362     MS   M  18       R     LE3       T    1    1  at_home    other
## 363     MS   F  18       U     GT3       T    3    3 services services
## 364     MS   F  17       U     LE3       T    4    4  at_home  at_home
## 365     MS   F  17       R     GT3       T    1    2    other services
## 366     MS   M  18       R     GT3       T    1    3  at_home    other
## 367     MS   M  18       U     LE3       T    4    4  teacher services
## 368     MS   F  17       R     GT3       T    1    1    other services
## 369     MS   F  18       U     GT3       T    2    3  at_home services
## 370     MS   F  18       R     GT3       T    4    4    other  teacher
## 371     MS   F  19       U     LE3       T    3    2 services services
## 372     MS   M  18       R     LE3       T    1    2  at_home services
## 373     MS   F  17       U     GT3       T    2    2    other  at_home
## 374     MS   F  17       R     GT3       T    1    2    other    other
## 375     MS   F  18       R     LE3       T    4    4    other    other
## 376     MS   F  18       R     GT3       T    1    1    other    other
## 377     MS   F  20       U     GT3       T    4    2   health    other
## 378     MS   F  18       R     LE3       T    4    4  teacher services
## 379     MS   F  18       U     GT3       T    3    3    other    other
## 380     MS   F  17       R     GT3       T    3    1  at_home    other
## 381     MS   M  18       U     GT3       T    4    4  teacher  teacher
## 382     MS   M  18       R     GT3       T    2    1    other    other
## 383     MS   M  17       U     GT3       T    2    3    other services
## 384     MS   M  19       R     GT3       T    1    1    other services
## 385     MS   M  18       R     GT3       T    4    2    other    other
## 386     MS   F  18       R     GT3       T    2    2  at_home    other
## 387     MS   F  18       R     GT3       T    4    4  teacher  at_home
## 388     MS   F  19       R     GT3       T    2    3 services    other
## 389     MS   F  18       U     LE3       T    3    1  teacher services
## 390     MS   F  18       U     GT3       T    1    1    other    other
## 391     MS   M  20       U     LE3       A    2    2 services services
## 392     MS   M  17       U     LE3       T    3    1 services services
## 393     MS   M  21       R     GT3       T    1    1    other    other
## 394     MS   M  18       R     LE3       T    3    2 services    other
## 395     MS   M  19       U     LE3       T    1    1    other  at_home
##         reason guardian traveltime studytime failures schoolsup famsup
## 1       course   mother          2         2        0       yes     no
## 2       course   father          1         2        0        no    yes
## 3        other   mother          1         2        3       yes     no
## 4         home   mother          1         3        0        no    yes
## 5         home   father          1         2        0        no    yes
## 6   reputation   mother          1         2        0        no    yes
## 7         home   mother          1         2        0        no     no
## 8         home   mother          2         2        0       yes    yes
## 9         home   mother          1         2        0        no    yes
## 10        home   mother          1         2        0        no    yes
## 11  reputation   mother          1         2        0        no    yes
## 12  reputation   father          3         3        0        no    yes
## 13      course   father          1         1        0        no    yes
## 14      course   mother          2         2        0        no    yes
## 15        home    other          1         3        0        no    yes
## 16        home   mother          1         1        0        no    yes
## 17  reputation   mother          1         3        0        no    yes
## 18  reputation   mother          3         2        0       yes    yes
## 19      course   mother          1         1        3        no    yes
## 20        home   father          1         1        0        no     no
## 21  reputation   mother          1         2        0        no     no
## 22       other   father          1         1        0        no    yes
## 23      course   mother          1         2        0        no     no
## 24  reputation   mother          2         2        0        no    yes
## 25      course   mother          1         3        0       yes    yes
## 26        home   mother          1         1        2        no    yes
## 27        home   mother          1         1        0        no    yes
## 28       other   mother          1         1        0        no     no
## 29        home   mother          1         2        0       yes    yes
## 30        home   mother          1         2        0        no    yes
## 31        home   mother          1         2        0        no    yes
## 32  reputation   mother          2         2        0        no    yes
## 33      course   mother          1         2        0        no    yes
## 34      course   mother          1         2        0        no     no
## 35        home   mother          1         1        0        no    yes
## 36       other   father          2         1        0        no    yes
## 37        home   mother          1         3        0        no    yes
## 38  reputation   mother          2         3        0        no    yes
## 39      course   mother          1         3        0       yes    yes
## 40  reputation   mother          1         1        0       yes    yes
## 41        home   mother          2         2        1        no    yes
## 42        home    other          1         1        0        no    yes
## 43      course   father          1         2        0        no    yes
## 44      course   father          1         1        0       yes    yes
## 45      course   father          2         2        1       yes     no
## 46      course   mother          1         2        0       yes    yes
## 47        home   mother          1         2        0        no    yes
## 48  reputation   mother          1         4        0        no     no
## 49        home   mother          1         2        0        no    yes
## 50       other   father          1         2        1       yes    yes
## 51      course   mother          3         2        0        no    yes
## 52       other   mother          1         2        0        no    yes
## 53       other   father          2         1        1        no     no
## 54      course   mother          1         1        0       yes    yes
## 55       other   mother          1         1        0        no     no
## 56       other   mother          1         2        0        no     no
## 57  reputation   mother          1         2        0        no    yes
## 58  reputation   mother          1         2        0        no    yes
## 59        home   father          1         2        0       yes    yes
## 60      course   mother          1         2        0        no    yes
## 61       other   mother          1         2        0        no    yes
## 62      course   father          4         1        0       yes    yes
## 63  reputation   father          1         2        0       yes     no
## 64        home   mother          1         3        0       yes    yes
## 65  reputation   father          1         2        0       yes     no
## 66      course   mother          3         2        0        no    yes
## 67  reputation   mother          1         4        0        no    yes
## 68      course   mother          1         4        0       yes    yes
## 69  reputation   mother          2         2        0       yes    yes
## 70  reputation   father          2         4        0        no    yes
## 71  reputation   father          2         4        0        no    yes
## 72      course   mother          1         4        0        no     no
## 73  reputation   mother          1         2        2       yes    yes
## 74  reputation   mother          1         1        0        no     no
## 75        home   mother          1         2        0       yes    yes
## 76        home   mother          1         2        0        no    yes
## 77      course   mother          2         4        0        no     no
## 78  reputation   mother          1         4        0        no     no
## 79        home   mother          2         1        3       yes    yes
## 80      course   mother          1         2        0        no    yes
## 81      course   father          1         1        0       yes    yes
## 82        home   mother          1         3        0       yes     no
## 83  reputation   mother          1         2        0        no    yes
## 84        home   mother          2         2        0        no     no
## 85        home   father          1         2        0        no    yes
## 86  reputation   father          2         2        2        no     no
## 87      course   mother          1         2        0        no    yes
## 88  reputation   mother          1         3        0        no    yes
## 89  reputation   father          2         2        1        no     no
## 90  reputation   mother          1         2        0        no    yes
## 91        home   mother          1         3        0        no    yes
## 92  reputation   mother          1         1        0        no     no
## 93        home   father          1         2        0       yes    yes
## 94        home   mother          2         2        0        no    yes
## 95  reputation   mother          1         4        0        no    yes
## 96        home   mother          2         4        1       yes    yes
## 97  reputation   mother          2         1        0       yes    yes
## 98      course   mother          1         2        0        no    yes
## 99  reputation   mother          1         1        0        no     no
## 100     course   mother          1         3        0       yes    yes
## 101      other   mother          1         1        0       yes    yes
## 102      other   father          1         3        0        no    yes
## 103     course   mother          1         1        0        no    yes
## 104       home   mother          2         2        0       yes    yes
## 105     course   mother          1         2        0        no    yes
## 106 reputation   father          1         4        0       yes     no
## 107     course   mother          1         4        0       yes    yes
## 108       home   father          1         3        0        no    yes
## 109       home   father          4         4        0        no    yes
## 110      other   mother          1         3        0        no    yes
## 111     course   mother          1         1        0        no     no
## 112 reputation   father          1         3        1       yes    yes
## 113       home   mother          1         2        1       yes     no
## 114     course   mother          1         1        0        no     no
## 115 reputation   mother          1         2        0        no     no
## 116     course   father          1         2        0        no    yes
## 117 reputation   father          2         2        0        no    yes
## 118       home   father          2         1        0        no     no
## 119     course   father          3         2        1        no    yes
## 120 reputation   father          1         1        0        no     no
## 121     course   mother          1         2        0        no     no
## 122       home   father          1         4        0        no    yes
## 123     course   father          2         2        0        no    yes
## 124     course   mother          1         1        0        no    yes
## 125       home   mother          1         2        0        no     no
## 126       home   father          1         1        0       yes     no
## 127       home   mother          1         2        0       yes     no
## 128     course    other          1         2        3        no    yes
## 129 reputation   mother          1         1        2        no    yes
## 130     course   mother          1         1        0        no     no
## 131     course   father          2         3        2        no    yes
## 132     course   mother          3         1        0        no    yes
## 133     course   father          1         1        0        no    yes
## 134     course   father          1         1        0        no     no
## 135     course   mother          4         2        0        no    yes
## 136     course   mother          1         3        0        no    yes
## 137     course   mother          3         2        0        no     no
## 138     course    other          2         1        2        no    yes
## 139     course   mother          1         2        1        no     no
## 140     course   mother          2         1        0        no     no
## 141     course   father          2         4        0       yes    yes
## 142 reputation   father          2         1        2        no    yes
## 143     course   mother          1         3        0        no    yes
## 144     course   mother          1         1        0        no     no
## 145       home   mother          1         1        3        no    yes
## 146     course   father          1         2        0        no    yes
## 147       home   father          1         2        3        no    yes
## 148     course   mother          1         2        0        no    yes
## 149     course   mother          1         1        0        no    yes
## 150     course   mother          4         1        3        no     no
## 151     course   mother          1         1        3        no     no
## 152     course   mother          1         1        1        no     no
## 153 reputation    other          2         3        2        no    yes
## 154       home   mother          1         1        3        no    yes
## 155     course   mother          1         1        0       yes    yes
## 156     course   mother          1         2        0       yes     no
## 157 reputation   mother          1         1        0        no     no
## 158     course   mother          3         1        3        no    yes
## 159     course   mother          3         1        0        no     no
## 160     course   father          1         2        1        no    yes
## 161     course   mother          2         1        2        no     no
## 162     course   mother          2         2        2       yes    yes
## 163     course   mother          2         1        1        no     no
## 164     course   father          1         1        0        no     no
## 165     course   mother          4         2        3        no     no
## 166     course   mother          2         1        1        no    yes
## 167     course   father          1         2        0        no     no
## 168       home   father          1         2        0        no     no
## 169       home   mother          1         2        0        no    yes
## 170 reputation   mother          1         2        0        no    yes
## 171     course   father          3         1        2        no    yes
## 172 reputation   mother          2         2        0        no    yes
## 173 reputation   mother          1         2        0        no    yes
## 174       home   mother          1         2        3        no     no
## 175 reputation   mother          2         2        0        no    yes
## 176     course   mother          2         2        0        no     no
## 177 reputation   mother          2         2        0        no     no
## 178 reputation   father          1         2        0        no     no
## 179      other   mother          1         1        0        no    yes
## 180     course   mother          1         2        0        no    yes
## 181       home   mother          1         2        0        no    yes
## 182       home   mother          1         2        0        no     no
## 183 reputation   father          1         2        0        no    yes
## 184 reputation   mother          1         2        0        no    yes
## 185 reputation   mother          1         2        0        no    yes
## 186      other   mother          1         2        0        no    yes
## 187      other   mother          1         1        0        no    yes
## 188     course   mother          1         2        0        no     no
## 189 reputation   mother          1         2        0        no    yes
## 190       home   mother          1         2        0        no     no
## 191     course   mother          1         2        0        no     no
## 192     course   mother          1         2        0        no     no
## 193      other    other          2         2        0        no     no
## 194 reputation   mother          1         1        0        no    yes
## 195       home   father          2         1        0        no     no
## 196     course   father          1         2        0        no     no
## 197       home   mother          1         1        0        no     no
## 198       home   father          3         1        0        no    yes
## 199       home   mother          2         1        1        no    yes
## 200 reputation   mother          1         2        0        no    yes
## 201       home   mother          1         2        0        no    yes
## 202 reputation   mother          1         2        0       yes    yes
## 203     course   mother          1         2        0        no    yes
## 204 reputation   mother          1         1        0        no    yes
## 205 reputation   mother          2         4        0        no    yes
## 206       home   mother          1         3        1        no    yes
## 207     course   mother          1         2        3        no    yes
## 208      other   mother          1         2        0        no     no
## 209       home   mother          2         1        0        no    yes
## 210 reputation   mother          2         3        0        no    yes
## 211 reputation    other          1         4        0        no    yes
## 212       home   mother          1         2        0        no    yes
## 213 reputation   mother          1         2        0       yes    yes
## 214       home   mother          1         2        1        no    yes
## 215      other   mother          1         1        0        no    yes
## 216 reputation   mother          2         2        0        no     no
## 217 reputation   mother          1         2        2        no     no
## 218       home   father          1         2        1        no    yes
## 219       home   father          2         1        0        no    yes
## 220     course   mother          1         3        0        no    yes
## 221 reputation   mother          2         2        0        no    yes
## 222 reputation   mother          1         3        1        no    yes
## 223      other   mother          1         2        0       yes     no
## 224       home   mother          2         2        0        no    yes
## 225       home   mother          1         3        0        no    yes
## 226 reputation   mother          1         2        1        no     no
## 227     course   mother          1         2        0        no     no
## 228 reputation   father          1         2        0        no    yes
## 229     course   mother          4         2        0       yes    yes
## 230     course   mother          2         3        0        no     no
## 231 reputation   father          1         2        0        no     no
## 232     course   father          2         2        0        no    yes
## 233 reputation   mother          1         2        0       yes    yes
## 234 reputation   father          1         2        0        no    yes
## 235       home   mother          2         2        0        no    yes
## 236 reputation   mother          2         3        0        no     no
## 237       home   father          1         2        0        no     no
## 238       home   mother          1         1        0        no     no
## 239     course   mother          3         2        0        no     no
## 240 reputation   father          1         2        1        no     no
## 241     course   mother          2         2        0        no     no
## 242     course   mother          2         2        0        no    yes
## 243     course   mother          1         1        0        no     no
## 244     course   mother          1         1        0        no     no
## 245     course    other          2         3        0        no    yes
## 246     course   mother          3         1        0        no     no
## 247     course   father          2         1        0        no     no
## 248      other   mother          1         1        3        no     no
## 249     course   mother          1         2        1        no    yes
## 250      other   mother          1         1        0        no     no
## 251     course   mother          2         1        1        no     no
## 252 reputation    other          3         2        0       yes    yes
## 253      other   mother          1         1        1        no     no
## 254     course   mother          2         1        0        no     no
## 255     course   mother          1         1        0        no     no
## 256     course   mother          2         1        1        no    yes
## 257 reputation   mother          1         4        0        no    yes
## 258 reputation   mother          1         2        0        no    yes
## 259       home   mother          1         2        0        no     no
## 260     course   father          1         4        0        no     no
## 261       home   father          1         2        0        no    yes
## 262     course   mother          1         2        0        no    yes
## 263     course   mother          1         3        0        no     no
## 264       home   mother          1         3        0        no     no
## 265       home   mother          1         3        0        no    yes
## 266 reputation   mother          2         2        0        no    yes
## 267      other   mother          1         2        0        no     no
## 268 reputation   mother          2         2        0        no     no
## 269 reputation   father          1         2        0        no    yes
## 270 reputation   mother          2         2        0        no    yes
## 271       home    other          1         2        2        no    yes
## 272 reputation   father          1         4        0        no    yes
## 273       home   mother          2         2        0        no    yes
## 274       home   mother          1         2        0        no    yes
## 275 reputation   mother          2         2        0        no    yes
## 276     course   mother          2         2        0       yes    yes
## 277       home   mother          2         2        0        no     no
## 278       home   mother          2         1        0        no     no
## 279 reputation   father          1         2        1       yes    yes
## 280     course   mother          2         1        0        no     no
## 281       home   mother          2         1        0        no     no
## 282       home   mother          1         1        1        no     no
## 283 reputation   mother          2         4        0        no    yes
## 284       home   mother          2         2        0       yes     no
## 285     course   mother          1         2        0        no    yes
## 286 reputation   father          1         2        0        no     no
## 287      other   mother          1         3        0        no    yes
## 288 reputation   mother          1         3        0        no    yes
## 289 reputation   mother          1         3        0        no     no
## 290 reputation   mother          1         2        0        no    yes
## 291       home   mother          1         2        0        no    yes
## 292 reputation   mother          1         3        0        no    yes
## 293 reputation   mother          1         2        1        no     no
## 294 reputation   mother          2         4        0        no    yes
## 295 reputation   mother          2         3        0        no    yes
## 296       home   mother          1         1        0        no    yes
## 297 reputation    other          2         2        0        no    yes
## 298       home    other          2         2        0        no    yes
## 299 reputation   father          1         4        0        no    yes
## 300       home   mother          1         1        0        no    yes
## 301       home   mother          1         2        0        no    yes
## 302       home   father          2         1        0        no     no
## 303 reputation   mother          2         3        0        no    yes
## 304 reputation   father          1         4        0        no    yes
## 305       home    other          1         2        1        no    yes
## 306 reputation    other          1         2        1        no    yes
## 307     course    other          1         1        0        no     no
## 308 reputation    other          2         1        1        no    yes
## 309 reputation   father          1         2        1        no     no
## 310 reputation    other          1         2        1       yes    yes
## 311       home    other          1         2        1        no     no
## 312      other    other          3         2        0        no    yes
## 313     course    other          1         2        1        no     no
## 314 reputation    other          2         2        1        no    yes
## 315       home    other          1         3        2        no     no
## 316 reputation    other          1         3        1        no     no
## 317     course   mother          2         2        0        no    yes
## 318     course   mother          1         3        0        no    yes
## 319     course   father          1         3        0        no    yes
## 320     course   mother          1         2        0        no    yes
## 321     course   mother          1         2        0        no    yes
## 322     course   mother          1         2        0        no    yes
## 323     course   mother          1         3        0        no    yes
## 324     course   father          1         3        0        no    yes
## 325       home   father          2         3        0        no     no
## 326     course   mother          1         3        0        no     no
## 327 reputation   mother          1         1        0        no     no
## 328     course   mother          4         1        0        no    yes
## 329     course   mother          1         3        0        no    yes
## 330     course   mother          2         3        0        no    yes
## 331     course   mother          1         4        0        no    yes
## 332     course   father          1         3        0        no    yes
## 333       home   mother          1         2        0        no     no
## 334       home    other          1         2        0        no     no
## 335     course   mother          2         4        0        no     no
## 336     course   mother          1         3        0        no     no
## 337       home    other          1         3        1        no     no
## 338       home   mother          1         2        0        no    yes
## 339       home   mother          1         4        0        no    yes
## 340       home   mother          1         2        0        no    yes
## 341       home    other          1         3        1        no     no
## 342       home   father          1         2        1        no    yes
## 343       home   mother          1         2        0        no     no
## 344       home   father          1         2        1        no    yes
## 345     course   mother          1         3        0        no    yes
## 346      other   mother          1         3        0        no     no
## 347     course   mother          1         3        0        no     no
## 348     course   mother          1         3        0        no    yes
## 349 reputation   mother          1         3        0        no    yes
## 350     course   mother          2         1        1        no    yes
## 351       home    other          3         2        3        no     no
## 352     course   mother          2         2        0        no    yes
## 353     course   mother          1         1        1        no     no
## 354       home    other          3         1        1        no    yes
## 355       home   mother          2         2        0        no    yes
## 356     course   father          1         2        0        no    yes
## 357      other   father          2         2        0        no    yes
## 358 reputation   mother          2         2        0        no     no
## 359       home   father          2         1        0        no     no
## 360     course   father          2         3        0        no     no
## 361     course   mother          3         2        0        no     no
## 362      other   mother          2         2        1        no     no
## 363      other   mother          2         2        0        no    yes
## 364     course   mother          1         2        0        no    yes
## 365     course   father          2         2        0        no     no
## 366     course   mother          2         2        0        no    yes
## 367      other   mother          2         3        0        no     no
## 368 reputation   mother          3         1        1        no    yes
## 369     course   father          2         1        0        no    yes
## 370      other   father          3         2        0        no    yes
## 371       home    other          2         2        2        no     no
## 372      other   father          3         1        0        no    yes
## 373       home   mother          1         3        0        no     no
## 374     course   mother          1         1        0        no     no
## 375 reputation   mother          2         3        0        no     no
## 376       home   mother          4         3        0        no     no
## 377     course    other          2         3        2        no    yes
## 378     course   mother          1         2        0        no     no
## 379       home   mother          1         2        0        no     no
## 380 reputation   mother          1         2        0        no    yes
## 381       home   father          1         2        0        no     no
## 382      other   mother          2         1        0        no     no
## 383       home   father          2         2        0        no     no
## 384      other   mother          2         1        1        no     no
## 385       home   father          2         1        1        no     no
## 386      other   mother          2         3        0        no     no
## 387 reputation   mother          3         1        0        no    yes
## 388     course   mother          1         3        1        no     no
## 389     course   mother          1         2        0        no    yes
## 390     course   mother          2         2        1        no     no
## 391     course    other          1         2        2        no    yes
## 392     course   mother          2         1        0        no     no
## 393     course    other          1         1        3        no     no
## 394     course   mother          3         1        0        no     no
## 395     course   father          1         1        0        no     no
##     paid activities nursery higher internet romantic famrel freetime goout
## 1     no         no     yes    yes       no       no      4        3     4
## 2     no         no      no    yes      yes       no      5        3     3
## 3    yes         no     yes    yes      yes       no      4        3     2
## 4    yes        yes     yes    yes      yes      yes      3        2     2
## 5    yes         no     yes    yes       no       no      4        3     2
## 6    yes        yes     yes    yes      yes       no      5        4     2
## 7     no         no     yes    yes      yes       no      4        4     4
## 8     no         no     yes    yes       no       no      4        1     4
## 9    yes         no     yes    yes      yes       no      4        2     2
## 10   yes        yes     yes    yes      yes       no      5        5     1
## 11   yes         no     yes    yes      yes       no      3        3     3
## 12    no        yes     yes    yes      yes       no      5        2     2
## 13   yes        yes     yes    yes      yes       no      4        3     3
## 14   yes         no     yes    yes      yes       no      5        4     3
## 15    no         no     yes    yes      yes      yes      4        5     2
## 16    no         no     yes    yes      yes       no      4        4     4
## 17   yes        yes     yes    yes      yes       no      3        2     3
## 18    no        yes     yes    yes       no       no      5        3     2
## 19    no        yes     yes    yes      yes       no      5        5     5
## 20   yes        yes     yes    yes      yes       no      3        1     3
## 21    no         no     yes    yes      yes       no      4        4     1
## 22   yes         no     yes    yes      yes       no      5        4     2
## 23    no        yes     yes    yes      yes       no      4        5     1
## 24    no        yes     yes    yes      yes       no      5        4     4
## 25   yes        yes     yes    yes      yes       no      4        3     2
## 26   yes         no      no    yes      yes       no      1        2     2
## 27   yes         no     yes    yes      yes       no      4        2     2
## 28   yes         no     yes    yes      yes       no      2        2     4
## 29    no        yes     yes    yes      yes       no      5        3     3
## 30   yes        yes     yes    yes      yes      yes      4        4     5
## 31   yes         no      no    yes      yes       no      5        4     2
## 32    no        yes     yes    yes      yes       no      4        3     1
## 33    no        yes     yes    yes      yes      yes      4        5     2
## 34    no        yes      no    yes      yes       no      5        3     2
## 35   yes         no      no    yes      yes       no      5        4     3
## 36    no        yes     yes    yes       no       no      3        5     1
## 37    no        yes     yes    yes      yes       no      5        4     3
## 38    no        yes     yes    yes      yes      yes      2        4     3
## 39   yes        yes     yes    yes      yes       no      4        3     2
## 40   yes        yes     yes    yes       no       no      4        3     1
## 41    no        yes      no    yes      yes      yes      3        3     3
## 42    no         no      no    yes      yes      yes      5        4     3
## 43    no        yes     yes    yes      yes       no      4        3     3
## 44    no         no     yes    yes      yes       no      5        4     1
## 45    no        yes     yes    yes      yes       no      4        3     3
## 46   yes        yes     yes    yes      yes      yes      5        2     2
## 47    no         no     yes    yes      yes       no      2        3     5
## 48    no        yes     yes    yes      yes       no      4        2     2
## 49   yes         no     yes    yes       no       no      4        3     3
## 50    no        yes      no    yes      yes       no      4        4     4
## 51   yes         no     yes    yes      yes       no      4        3     3
## 52   yes         no     yes    yes      yes       no      4        3     3
## 53    no         no     yes    yes       no       no      5        5     5
## 54   yes         no     yes    yes      yes       no      3        3     4
## 55   yes         no     yes    yes      yes       no      5        3     4
## 56   yes        yes     yes    yes      yes      yes      5        3     4
## 57   yes        yes     yes    yes      yes       no      4        3     2
## 58    no        yes     yes    yes       no       no      3        2     2
## 59    no        yes     yes    yes      yes       no      4        3     2
## 60    no         no     yes    yes      yes       no      4        2     3
## 61    no        yes     yes    yes       no       no      2        4     4
## 62    no        yes      no    yes      yes      yes      5        5     5
## 63    no        yes     yes    yes      yes       no      4        4     3
## 64   yes        yes     yes    yes      yes       no      3        4     4
## 65    no        yes     yes    yes      yes      yes      4        4     4
## 66    no        yes     yes    yes      yes       no      5        4     3
## 67    no        yes      no    yes      yes      yes      1        3     3
## 68   yes         no     yes    yes      yes       no      4        3     3
## 69   yes         no     yes    yes      yes       no      4        1     3
## 70    no         no      no    yes      yes       no      4        4     2
## 71   yes         no     yes    yes      yes       no      4        3     2
## 72    no         no     yes    yes      yes       no      3        3     3
## 73    no         no      no    yes      yes      yes      3        3     4
## 74    no        yes     yes    yes       no       no      5        3     2
## 75   yes        yes     yes    yes      yes       no      4        3     3
## 76   yes        yes     yes    yes      yes       no      4        3     3
## 77    no        yes     yes    yes      yes       no      3        4     3
## 78   yes         no     yes    yes      yes      yes      5        2     3
## 79    no        yes     yes     no      yes       no      4        5     1
## 80    no         no     yes    yes      yes       no      2        4     3
## 81   yes        yes      no    yes      yes      yes      3        2     2
## 82   yes         no      no    yes      yes       no      5        3     2
## 83   yes         no     yes    yes      yes       no      4        4     4
## 84   yes        yes     yes    yes      yes       no      5        3     3
## 85    no        yes      no    yes      yes       no      4        3     2
## 86   yes         no     yes    yes      yes      yes      4        4     4
## 87    no         no     yes    yes       no       no      4        3     4
## 88    no        yes     yes    yes      yes       no      5        3     3
## 89   yes        yes      no    yes      yes       no      4        4     2
## 90    no         no     yes    yes       no       no      4        1     3
## 91   yes         no     yes    yes      yes      yes      4        3     3
## 92   yes        yes     yes    yes      yes       no      4        5     5
## 93    no         no     yes    yes       no       no      3        3     3
## 94   yes        yes     yes    yes      yes       no      5        3     3
## 95    no        yes     yes    yes      yes       no      4        3     4
## 96   yes        yes     yes    yes      yes       no      3        1     2
## 97    no        yes      no    yes      yes       no      3        3     3
## 98   yes         no     yes    yes       no      yes      4        3     5
## 99    no        yes      no    yes      yes       no      5        3     4
## 100  yes         no     yes    yes      yes       no      5        3     5
## 101  yes        yes     yes    yes      yes       no      4        5     5
## 102   no        yes     yes    yes      yes      yes      4        4     3
## 103   no        yes      no    yes      yes       no      5        3     3
## 104  yes         no     yes    yes      yes       no      4        3     5
## 105  yes        yes     yes    yes      yes       no      5        4     4
## 106   no         no     yes    yes       no       no      4        3     3
## 107  yes         no     yes    yes      yes       no      5        1     2
## 108   no        yes     yes    yes      yes       no      5        3     3
## 109  yes        yes     yes    yes      yes      yes      1        3     5
## 110  yes        yes     yes    yes      yes      yes      5        4     5
## 111   no        yes     yes    yes      yes       no      5        5     3
## 112   no        yes     yes    yes      yes       no      4        1     2
## 113   no        yes     yes    yes      yes       no      3        1     2
## 114   no         no     yes    yes      yes       no      3        5     2
## 115   no        yes     yes    yes      yes      yes      5        4     2
## 116   no        yes     yes    yes      yes       no      5        4     4
## 117   no        yes     yes    yes       no       no      4        4     3
## 118   no        yes     yes    yes      yes       no      5        4     2
## 119   no        yes     yes    yes      yes       no      5        2     4
## 120   no         no     yes    yes      yes       no      3        4     3
## 121   no         no      no    yes      yes       no      3        2     3
## 122  yes        yes     yes    yes      yes       no      5        5     4
## 123  yes        yes     yes    yes      yes      yes      4        2     2
## 124   no        yes     yes    yes      yes       no      3        4     4
## 125  yes         no     yes    yes      yes      yes      5        4     4
## 126   no         no     yes    yes      yes       no      5        5     5
## 127   no        yes     yes    yes      yes      yes      5        3     2
## 128   no         no      no     no       no       no      3        4     2
## 129   no        yes     yes    yes      yes       no      3        3     3
## 130  yes        yes     yes    yes      yes       no      3        5     5
## 131   no         no     yes    yes      yes      yes      4        2     2
## 132   no        yes      no    yes      yes      yes      4        3     3
## 133   no         no     yes    yes      yes      yes      3        4     4
## 134   no         no     yes    yes      yes       no      3        2     1
## 135   no         no     yes    yes       no      yes      5        3     3
## 136   no        yes     yes    yes      yes      yes      4        3     3
## 137   no         no     yes    yes       no       no      5        4     5
## 138   no        yes      no    yes      yes      yes      4        3     2
## 139   no         no     yes    yes       no      yes      4        4     4
## 140   no        yes     yes    yes      yes       no      4        3     2
## 141   no         no     yes    yes      yes       no      2        2     2
## 142   no        yes     yes    yes      yes       no      2        3     3
## 143  yes        yes     yes    yes      yes       no      4        2     2
## 144   no         no     yes    yes      yes       no      3        4     4
## 145   no         no     yes    yes      yes       no      5        4     5
## 146  yes         no     yes    yes      yes       no      4        4     2
## 147   no         no     yes    yes      yes       no      3        3     2
## 148  yes         no      no    yes      yes       no      4        3     2
## 149   no         no     yes     no      yes      yes      3        3     2
## 150   no         no     yes    yes      yes       no      4        5     5
## 151   no         no     yes     no      yes      yes      2        3     5
## 152   no        yes     yes    yes       no      yes      4        4     4
## 153  yes        yes     yes    yes      yes      yes      4        2     1
## 154   no         no     yes     no      yes      yes      4        5     4
## 155   no         no     yes    yes       no      yes      4        2     1
## 156  yes        yes     yes    yes       no       no      4        4     4
## 157   no         no     yes    yes       no       no      2        2     2
## 158   no        yes      no    yes       no       no      5        2     5
## 159   no         no      no    yes       no       no      4        2     2
## 160  yes         no     yes    yes      yes      yes      4        5     5
## 161   no        yes     yes     no      yes      yes      3        3     2
## 162   no         no     yes    yes      yes      yes      4        4     4
## 163   no        yes     yes    yes       no       no      4        4     4
## 164   no         no     yes     no      yes       no      5        3     3
## 165   no        yes     yes     no       no      yes      5        3     5
## 166   no        yes      no     no       no       no      4        5     2
## 167   no         no     yes     no      yes       no      4        3     5
## 168  yes         no     yes    yes      yes      yes      4        2     3
## 169  yes         no      no    yes      yes       no      5        1     5
## 170  yes         no     yes    yes      yes      yes      4        4     2
## 171   no        yes      no    yes      yes       no      3        4     5
## 172  yes        yes     yes    yes      yes      yes      4        3     2
## 173  yes        yes     yes    yes      yes       no      4        4     4
## 174   no        yes      no    yes      yes      yes      4        3     5
## 175  yes        yes     yes    yes      yes       no      4        4     5
## 176  yes        yes     yes    yes      yes       no      4        4     4
## 177  yes        yes      no    yes      yes       no      3        4     4
## 178   no        yes      no    yes      yes       no      4        3     4
## 179   no        yes     yes    yes      yes      yes      4        3     3
## 180   no        yes     yes    yes      yes      yes      5        2     3
## 181  yes        yes     yes    yes      yes       no      3        4     3
## 182  yes        yes     yes    yes      yes      yes      4        2     3
## 183   no        yes     yes    yes       no       no      5        4     2
## 184   no        yes     yes    yes      yes      yes      5        3     3
## 185  yes         no     yes    yes      yes       no      1        2     2
## 186   no        yes     yes    yes      yes      yes      4        3     4
## 187  yes        yes     yes    yes      yes      yes      3        3     3
## 188  yes        yes     yes    yes      yes      yes      4        2     3
## 189   no         no      no    yes      yes      yes      3        3     3
## 190   no         no     yes    yes       no       no      3        1     3
## 191   no         no     yes    yes      yes       no      4        3     3
## 192   no        yes     yes    yes      yes       no      5        3     3
## 193  yes        yes      no    yes      yes       no      4        4     4
## 194   no        yes     yes    yes      yes       no      4        3     2
## 195   no         no     yes    yes      yes       no      5        3     3
## 196   no        yes     yes    yes      yes      yes      4        3     2
## 197   no         no     yes    yes      yes       no      5        2     3
## 198  yes        yes     yes    yes      yes       no      3        3     4
## 199   no         no     yes    yes      yes       no      4        2     4
## 200  yes         no     yes    yes      yes       no      4        5     2
## 201   no        yes     yes    yes      yes       no      4        3     5
## 202  yes        yes     yes    yes       no       no      4        4     3
## 203  yes         no      no    yes       no       no      4        4     4
## 204   no         no     yes    yes      yes       no      5        3     2
## 205  yes        yes      no    yes      yes       no      5        3     5
## 206  yes         no     yes    yes      yes      yes      4        4     3
## 207  yes         no     yes    yes      yes       no      2        3     3
## 208  yes        yes     yes    yes      yes      yes      1        3     2
## 209  yes         no     yes    yes       no       no      4        3     2
## 210  yes        yes     yes    yes      yes      yes      4        4     2
## 211  yes        yes     yes    yes      yes       no      4        3     3
## 212  yes         no     yes    yes      yes      yes      5        3     5
## 213  yes         no     yes    yes      yes       no      3        3     4
## 214  yes        yes     yes    yes      yes       no      4        4     4
## 215  yes         no     yes    yes       no       no      5        2     1
## 216  yes         no     yes    yes      yes       no      4        4     4
## 217  yes         no     yes    yes      yes      yes      3        4     5
## 218  yes         no     yes    yes      yes       no      3        2     4
## 219  yes         no     yes    yes       no       no      3        3     3
## 220  yes        yes     yes    yes      yes       no      4        3     3
## 221   no        yes     yes    yes      yes       no      4        2     5
## 222   no        yes     yes    yes       no      yes      4        3     4
## 223   no         no     yes    yes      yes       no      2        3     1
## 224  yes         no     yes    yes      yes       no      3        3     3
## 225   no        yes      no    yes      yes       no      5        3     2
## 226   no        yes     yes    yes      yes      yes      5        3     3
## 227   no        yes      no    yes      yes       no      5        3     4
## 228  yes         no      no    yes      yes       no      5        3     3
## 229  yes        yes     yes    yes      yes      yes      4        3     2
## 230   no        yes     yes    yes      yes      yes      3        2     3
## 231   no        yes     yes    yes      yes      yes      3        2     3
## 232  yes        yes     yes    yes      yes       no      4        5     2
## 233   no        yes     yes    yes      yes      yes      4        5     5
## 234  yes        yes     yes    yes      yes       no      4        2     4
## 235  yes         no     yes    yes      yes       no      3        4     2
## 236   no        yes     yes    yes      yes      yes      5        3     3
## 237  yes        yes      no    yes      yes      yes      4        4     2
## 238   no         no     yes    yes      yes      yes      4        5     2
## 239   no        yes     yes    yes       no       no      2        1     1
## 240   no         no     yes     no      yes       no      5        5     4
## 241   no        yes     yes    yes      yes      yes      2        5     5
## 242  yes         no     yes    yes      yes       no      3        3     3
## 243   no        yes      no    yes      yes       no      5        4     5
## 244   no        yes     yes    yes      yes       no      5        3     2
## 245  yes         no      no    yes      yes      yes      4        4     4
## 246   no         no     yes    yes      yes       no      4        3     3
## 247   no         no     yes    yes      yes       no      5        2     2
## 248   no         no      no     no      yes      yes      5        4     5
## 249   no         no     yes    yes      yes      yes      4        3     3
## 250  yes         no      no    yes      yes       no      4        3     2
## 251   no         no     yes     no      yes       no      4        4     5
## 252   no         no      no    yes      yes       no      5        3     3
## 253   no         no      no     no      yes       no      3        2     5
## 254   no        yes      no    yes       no       no      3        3     2
## 255   no         no      no    yes      yes       no      4        4     2
## 256   no        yes     yes    yes      yes       no      4        4     4
## 257  yes        yes     yes    yes      yes       no      4        2     3
## 258   no         no     yes    yes      yes       no      4        3     1
## 259   no        yes     yes    yes      yes       no      5        2     4
## 260  yes        yes     yes    yes      yes      yes      3        4     1
## 261  yes         no     yes    yes      yes      yes      3        1     2
## 262  yes         no      no    yes      yes       no      4        3     2
## 263   no        yes      no    yes       no       no      5        3     2
## 264   no        yes      no    yes       no       no      3        2     3
## 265  yes        yes     yes    yes      yes      yes      4        3     3
## 266  yes        yes     yes    yes      yes       no      4        2     5
## 267  yes        yes     yes    yes      yes      yes      5        4     4
## 268  yes        yes     yes    yes      yes       no      4        3     4
## 269  yes        yes     yes    yes      yes      yes      5        4     5
## 270   no         no     yes     no      yes      yes      4        3     5
## 271  yes        yes     yes    yes      yes       no      4        3     5
## 272  yes        yes     yes    yes      yes      yes      4        5     5
## 273  yes         no      no    yes       no       no      4        4     3
## 274  yes        yes      no    yes       no      yes      3        5     2
## 275  yes         no     yes    yes      yes      yes      4        3     3
## 276  yes         no     yes    yes      yes      yes      4        4     4
## 277   no         no      no     no      yes      yes      4        1     1
## 278  yes        yes     yes    yes      yes       no      3        2     4
## 279   no        yes     yes    yes      yes      yes      2        4     4
## 280  yes        yes     yes    yes      yes       no      4        2     3
## 281  yes        yes     yes    yes      yes      yes      4        5     4
## 282   no         no     yes    yes      yes       no      4        4     4
## 283  yes        yes     yes    yes       no       no      5        2     2
## 284   no        yes     yes    yes      yes       no      5        4     4
## 285   no         no      no    yes      yes       no      5        4     5
## 286  yes         no      no    yes      yes       no      4        3     3
## 287  yes         no     yes    yes      yes       no      4        3     3
## 288  yes         no     yes    yes      yes       no      4        3     3
## 289  yes        yes     yes    yes      yes       no      4        2     4
## 290  yes        yes     yes    yes      yes       no      5        4     3
## 291  yes        yes     yes    yes      yes      yes      4        3     2
## 292  yes         no     yes    yes      yes       no      4        2     2
## 293   no         no     yes    yes      yes      yes      5        4     3
## 294  yes         no     yes    yes       no       no      3        1     2
## 295  yes        yes     yes    yes      yes       no      5        4     2
## 296  yes         no     yes    yes      yes       no      4        4     3
## 297  yes        yes     yes    yes      yes       no      2        3     4
## 298  yes         no     yes    yes      yes      yes      4        4     5
## 299  yes         no     yes    yes      yes       no      4        3     3
## 300  yes         no     yes    yes      yes      yes      1        4     2
## 301   no         no     yes    yes      yes      yes      4        2     4
## 302  yes         no     yes    yes      yes       no      4        1     1
## 303  yes         no     yes    yes      yes       no      4        3     3
## 304  yes        yes      no    yes      yes       no      5        2     2
## 305   no        yes     yes    yes      yes      yes      4        4     4
## 306  yes        yes     yes    yes      yes       no      4        4     3
## 307   no        yes     yes    yes       no       no      5        5     3
## 308  yes         no     yes    yes      yes      yes      4        3     4
## 309   no        yes     yes    yes       no      yes      4        5     3
## 310   no        yes      no    yes      yes       no      4        4     3
## 311   no        yes      no    yes       no      yes      4        2     4
## 312   no         no     yes     no      yes      yes      3        4     1
## 313   no         no      no    yes      yes       no      4        5     2
## 314  yes         no      no    yes      yes      yes      4        2     2
## 315   no         no      no    yes      yes      yes      4        1     2
## 316   no         no     yes    yes      yes      yes      4        1     2
## 317  yes        yes     yes    yes      yes       no      5        3     3
## 318  yes        yes     yes    yes      yes      yes      4        3     4
## 319  yes        yes      no    yes      yes       no      4        3     4
## 320  yes         no     yes    yes      yes       no      4        4     4
## 321  yes         no     yes    yes      yes      yes      5        2     2
## 322   no         no     yes    yes       no      yes      4        2     2
## 323  yes        yes     yes    yes      yes       no      3        3     2
## 324   no         no      no    yes      yes       no      3        4     3
## 325   no         no     yes    yes      yes       no      3        3     3
## 326   no        yes     yes    yes      yes       no      4        3     3
## 327   no        yes      no    yes      yes       no      4        3     5
## 328   no         no     yes    yes      yes       no      4        4     5
## 329  yes        yes     yes    yes      yes       no      5        4     4
## 330  yes         no      no    yes      yes      yes      4        3     3
## 331   no        yes     yes    yes      yes       no      4        5     5
## 332   no         no     yes    yes      yes      yes      4        4     3
## 333   no        yes     yes    yes      yes       no      5        3     4
## 334   no        yes      no    yes      yes      yes      4        3     3
## 335   no        yes     yes    yes       no       no      4        4     4
## 336   no         no     yes    yes      yes       no      4        4     5
## 337  yes         no     yes    yes       no       no      5        4     3
## 338  yes         no     yes    yes      yes      yes      4        3     2
## 339   no         no     yes    yes      yes       no      5        3     3
## 340  yes         no     yes    yes      yes       no      4        3     3
## 341  yes        yes     yes    yes      yes      yes      4        3     4
## 342   no        yes     yes    yes      yes       no      4        3     3
## 343   no        yes     yes    yes      yes      yes      4        3     3
## 344   no         no     yes    yes      yes      yes      3        3     1
## 345   no         no     yes    yes      yes       no      4        3     3
## 346   no         no     yes    yes      yes      yes      5        4     3
## 347   no         no     yes    yes      yes      yes      5        3     2
## 348  yes         no     yes    yes      yes      yes      5        4     5
## 349  yes        yes     yes    yes      yes      yes      4        4     3
## 350   no         no      no    yes      yes       no      2        5     5
## 351   no         no     yes    yes      yes       no      5        4     4
## 352  yes         no     yes    yes      yes       no      4        5     4
## 353   no         no     yes     no      yes      yes      4        3     3
## 354   no         no     yes    yes      yes       no      4        4     4
## 355  yes        yes      no    yes      yes      yes      4        5     5
## 356   no         no     yes    yes       no      yes      5        3     4
## 357  yes        yes     yes    yes      yes       no      4        3     3
## 358   no         no     yes    yes       no      yes      1        2     3
## 359   no         no      no    yes      yes      yes      3        3     2
## 360   no         no     yes    yes      yes       no      5        3     2
## 361   no         no     yes    yes       no      yes      4        3     4
## 362   no        yes      no     no       no       no      4        4     3
## 363   no         no     yes    yes      yes      yes      4        3     2
## 364  yes        yes     yes    yes      yes      yes      2        3     4
## 365   no         no      no    yes       no       no      3        2     2
## 366  yes         no     yes    yes       no       no      3        3     4
## 367  yes         no     yes    yes      yes      yes      4        2     2
## 368  yes         no     yes    yes      yes      yes      5        2     1
## 369  yes         no     yes    yes      yes      yes      5        2     3
## 370  yes         no      no    yes      yes      yes      3        2     2
## 371   no        yes     yes    yes       no      yes      3        2     2
## 372  yes        yes     yes     no      yes      yes      4        3     3
## 373   no        yes     yes    yes       no      yes      3        4     3
## 374   no        yes     yes    yes      yes       no      3        5     5
## 375   no         no     yes    yes      yes       no      5        4     4
## 376   no         no     yes    yes      yes       no      4        3     2
## 377  yes         no      no    yes      yes      yes      5        4     3
## 378  yes        yes     yes    yes      yes       no      5        4     3
## 379  yes         no     yes    yes      yes      yes      4        1     3
## 380  yes        yes      no    yes      yes       no      4        5     4
## 381  yes        yes      no    yes      yes       no      3        2     4
## 382   no        yes      no    yes      yes      yes      4        4     3
## 383   no        yes     yes    yes      yes       no      4        4     3
## 384   no         no     yes    yes       no       no      4        3     2
## 385  yes         no     yes    yes       no       no      5        4     3
## 386  yes         no     yes    yes       no       no      5        3     3
## 387  yes        yes     yes    yes      yes      yes      4        4     3
## 388   no        yes      no    yes      yes       no      5        4     2
## 389  yes         no     yes    yes      yes       no      4        3     4
## 390   no        yes     yes    yes       no       no      1        1     1
## 391  yes         no     yes    yes       no       no      5        5     4
## 392   no         no      no    yes      yes       no      2        4     5
## 393   no         no      no    yes       no       no      5        5     3
## 394   no         no      no    yes      yes       no      4        4     1
## 395   no         no     yes    yes      yes       no      3        2     3
##     Dalc Walc health absences G1 G2 G3 average_grade
## 1      1    1      3        6  5  6  6      5.666667
## 2      1    1      3        4  5  5  6      5.333333
## 3      2    3      3       10  7  8 10      8.333333
## 4      1    1      5        2 15 14 15     14.666667
## 5      1    2      5        4  6 10 10      8.666667
## 6      1    2      5       10 15 15 15     15.000000
## 7      1    1      3        0 12 12 11     11.666667
## 8      1    1      1        6  6  5  6      5.666667
## 9      1    1      1        0 16 18 19     17.666667
## 10     1    1      5        0 14 15 15     14.666667
## 11     1    2      2        0 10  8  9      9.000000
## 12     1    1      4        4 10 12 12     11.333333
## 13     1    3      5        2 14 14 14     14.000000
## 14     1    2      3        2 10 10 11     10.333333
## 15     1    1      3        0 14 16 16     15.333333
## 16     1    2      2        4 14 14 14     14.000000
## 17     1    2      2        6 13 14 14     13.666667
## 18     1    1      4        4  8 10 10      9.333333
## 19     2    4      5       16  6  5  5      5.333333
## 20     1    3      5        4  8 10 10      9.333333
## 21     1    1      1        0 13 14 15     14.000000
## 22     1    1      5        0 12 15 15     14.000000
## 23     1    3      5        2 15 15 16     15.333333
## 24     2    4      5        0 13 13 12     12.666667
## 25     1    1      5        2 10  9  8      9.000000
## 26     1    3      5       14  6  9  8      7.666667
## 27     1    2      5        2 12 12 11     11.666667
## 28     2    4      1        4 15 16 15     15.333333
## 29     1    1      5        4 11 11 11     11.000000
## 30     5    5      5       16 10 12 11     11.000000
## 31     3    4      5        0  9 11 12     10.666667
## 32     1    1      5        0 17 16 17     16.666667
## 33     1    1      5        0 17 16 16     16.333333
## 34     1    1      2        0  8 10 12     10.000000
## 35     1    1      5        0 12 14 15     13.666667
## 36     1    1      5        0  8  7  6      7.000000
## 37     1    1      4        2 15 16 18     16.333333
## 38     1    1      5        7 15 16 15     15.333333
## 39     1    1      5        2 12 12 11     11.666667
## 40     1    1      2        8 14 13 13     13.333333
## 41     1    2      3       25  7 10 11      9.333333
## 42     2    4      5        8 12 12 12     12.000000
## 43     1    1      5        2 19 18 18     18.333333
## 44     1    1      1        0  8  8 11      9.000000
## 45     2    2      5       14 10 10  9      9.666667
## 46     1    1      5        8  8  8  6      7.333333
## 47     1    4      3       12 11 12 11     11.333333
## 48     1    1      2        4 19 19 20     19.333333
## 49     2    2      5        2 15 15 14     14.666667
## 50     1    1      3        2  7  7  7      7.000000
## 51     2    3      4        2 12 13 13     12.666667
## 52     1    1      5        2 11 13 13     12.333333
## 53     3    4      5        6 11 11 10     10.666667
## 54     2    3      5        0  8 10 11      9.666667
## 55     4    4      1        6 10 13 13     12.000000
## 56     1    1      2        8  8  9 10      9.000000
## 57     1    1      1        0 14 15 15     14.666667
## 58     1    1      5        4 14 15 15     14.666667
## 59     1    1      5        2  9 10  9      9.333333
## 60     1    1      5        2 15 16 16     15.666667
## 61     2    3      4        6 10 11 11     10.666667
## 62     5    5      5        6 10  8 11      9.666667
## 63     1    1      1        4  8 10  9      9.000000
## 64     2    4      4        2 10  9  9      9.333333
## 65     2    4      2        0 10 10 10     10.000000
## 66     1    2      1        2 16 15 15     15.333333
## 67     5    5      3        4 13 13 12     12.666667
## 68     1    2      5        4  7  7  6      6.666667
## 69     1    3      4        2  8  9  8      8.333333
## 70     2    3      3       12 16 16 16     16.000000
## 71     1    1      5        0 13 15 15     14.333333
## 72     1    1      3        0 10 10 10     10.000000
## 73     2    4      5        2  8  6  5      6.333333
## 74     2    2      5        2 12 12 14     12.666667
## 75     2    4      5       54 11 12 11     11.333333
## 76     2    3      5        6  9  9 10      9.333333
## 77     1    1      1        8 11 11 10     10.666667
## 78     1    3      3        0 11 11 11     11.000000
## 79     1    1      3        2  8  8 10      8.666667
## 80     1    2      3       12  5  5  5      5.000000
## 81     1    3      3        2 10 12 12     11.333333
## 82     1    2      5        4 11 10 11     10.666667
## 83     1    1      5       10  7  6  6      6.333333
## 84     1    3      4        4 15 15 15     15.000000
## 85     2    3      4        2  9 10 10      9.666667
## 86     2    3      5        6  7  9  8      8.000000
## 87     1    2      2        4  8  7  6      7.000000
## 88     1    3      1        4 13 14 14     13.666667
## 89     1    1      3       12 11 10 10     10.333333
## 90     3    5      5       18  8  6  7      7.000000
## 91     1    3      4        0  7  7  8      7.333333
## 92     1    3      1        4 16 17 18     17.000000
## 93     2    3      2        4  7  6  6      6.333333
## 94     1    1      1        0 11 10 10     10.333333
## 95     1    1      4        6 11 13 14     12.666667
## 96     1    1      1        2  7 10 10      9.000000
## 97     1    1      4        2 11 15 15     13.666667
## 98     1    1      5        2  8  9 10      9.000000
## 99     1    2      1        6 11 14 14     13.000000
## 100    1    1      3        0  7  9  8      8.000000
## 101    5    5      4       14  7  7  5      6.333333
## 102    1    1      4        0 16 17 17     16.666667
## 103    1    1      5        4 10 13 14     12.333333
## 104    1    1      2       26  7  6  6      6.333333
## 105    1    1      1        0 16 18 18     17.333333
## 106    1    1      4       10 10 11 11     10.666667
## 107    1    1      3        8  7  8  8      7.666667
## 108    1    1      5        2 16 18 18     17.333333
## 109    3    5      1        6 10 13 13     12.000000
## 110    1    1      4        4 14 15 16     15.000000
## 111    1    1      4        6 18 19 19     18.666667
## 112    1    1      2        0  7 10 10      9.000000
## 113    1    1      5        6 10 13 13     12.000000
## 114    1    1      3       10 18 19 19     18.666667
## 115    1    1      5        8  9  9  9      9.000000
## 116    1    2      5        2 15 15 16     15.333333
## 117    1    1      2        2 11 13 14     12.666667
## 118    1    1      5        0 13 14 13     13.333333
## 119    1    4      5       20  9  7  8      8.000000
## 120    1    2      4        6 14 13 13     13.333333
## 121    1    2      1        2 16 15 15     15.333333
## 122    1    2      5        6 16 14 15     15.000000
## 123    1    2      5        2 13 13 13     13.000000
## 124    1    4      5       18 14 11 13     12.666667
## 125    1    1      5        0  8  7  8      7.666667
## 126    3    2      5        0 13 13 12     12.666667
## 127    1    1      1        0  7 10 11      9.333333
## 128    1    1      5        2  7  8  9      8.000000
## 129    1    2      4        0  7  4  0      3.666667
## 130    2    5      4        8 18 18 18     18.000000
## 131    2    2      5        0 12  0  0      4.000000
## 132    1    2      4        0  8  0  0      2.666667
## 133    1    3      5       12 10 13 12     11.666667
## 134    1    4      5       16 12 11 11     11.333333
## 135    1    1      5        0  9  0  0      3.000000
## 136    1    1      5        0 11  0  0      3.666667
## 137    2    4      5        0 10  0  0      3.333333
## 138    1    1      5        0  4  0  0      1.333333
## 139    1    3      5        0 14 12 12     12.666667
## 140    1    1      5        0 16 16 15     15.666667
## 141    1    1      3        0  7  9  0      5.333333
## 142    2    2      2        8  9  9  9      9.000000
## 143    1    1      5        2  9 11 11     10.333333
## 144    3    3      1        2 14 14 13     13.666667
## 145    1    2      5        0  5  0  0      1.666667
## 146    1    2      5        0  8 11 11     10.000000
## 147    1    1      3        0  6  7  0      4.333333
## 148    1    1      5        2 10 11 11     10.666667
## 149    2    1      5        0  7  6  0      4.333333
## 150    2    5      5        0  8  9 10      9.000000
## 151    2    5      4        0  6  5  0      3.666667
## 152    3    5      5        6 12 13 14     13.000000
## 153    2    3      3        8 10 10 10     10.000000
## 154    1    1      4        0  5  0  0      1.666667
## 155    1    1      4        0 11 11 12     11.333333
## 156    1    1      1        2 11  8  8      9.000000
## 157    3    3      5        8 16 12 13     13.666667
## 158    1    5      4        6  9  8 10      9.000000
## 159    1    2      3        2 17 15 15     15.666667
## 160    4    4      5        4 10 12 12     11.333333
## 161    2    2      5        0  7  6  0      4.333333
## 162    1    4      3        6  5  9  7      7.000000
## 163    2    4      5        0  7  0  0      2.333333
## 164    1    4      2        2 10 10 10     10.000000
## 165    1    5      5        0  5  8  7      6.666667
## 166    1    1      2       16 12 11 12     11.666667
## 167    2    4      4        4 10 10 10     10.000000
## 168    1    1      3        0 14 15 16     15.000000
## 169    1    1      4        0  6  7  0      4.333333
## 170    1    1      3        0 14 14 14     14.000000
## 171    2    4      2        0  6  5  0      3.666667
## 172    1    1      3        2 13 15 16     14.666667
## 173    1    3      5        0 13 11 10     11.333333
## 174    1    1      3        0  8  7  0      5.000000
## 175    1    1      4        4 10 11  9     10.000000
## 176    4    4      4        4 10  9  9      9.333333
## 177    1    4      5        2 13 13 11     12.333333
## 178    1    4      4        4  6  5  6      5.666667
## 179    3    4      3       10 10  8  9      9.000000
## 180    1    1      2        4 10 10 11     10.333333
## 181    2    3      3       10  9  8  8      8.333333
## 182    1    2      3        2 12 13 12     12.333333
## 183    2    3      5        0 16 17 17     16.666667
## 184    2    3      1       56  9  9  8      8.666667
## 185    1    2      1       14 12 13 12     12.333333
## 186    2    3      4       12 12 12 11     11.666667
## 187    1    2      3        2 11 12 11     11.333333
## 188    1    2      5        0 15 15 15     15.000000
## 189    1    3      3        6  8  7  9      8.000000
## 190    1    5      3        4  8  9 10      9.000000
## 191    1    1      2       10 11 12 13     12.000000
## 192    1    1      3        0  8  8  9      8.333333
## 193    4    5      5       12  7  8  8      7.666667
## 194    3    4      5        8  8  9 10      9.000000
## 195    1    1      3        0 13 14 14     13.666667
## 196    1    1      5        0 14 15 15     14.666667
## 197    1    2      5        4 17 15 16     16.000000
## 198    3    5      3        8  9  9 10      9.333333
## 199    2    3      2       24 18 18 18     18.000000
## 200    1    2      3        0  9  9 10      9.333333
## 201    1    5      2        2 16 16 16     16.000000
## 202    1    3      4        6  8 10 10      9.333333
## 203    1    3      1        4  9  9 10      9.333333
## 204    1    2      3       18  7  6  6      6.333333
## 205    1    1      5        6 10 10 11     10.333333
## 206    3    4      5       28 10  9  9      9.333333
## 207    2    2      4        5  7  7  7      7.000000
## 208    1    1      1       10 11 12 13     12.000000
## 209    1    4      5        6  9  9 10      9.333333
## 210    1    1      4        6  7  7  7      7.000000
## 211    1    2      3       10  8  8  8      8.000000
## 212    4    5      3       13 12 12 13     12.333333
## 213    1    1      4        0 12 13 14     13.000000
## 214    2    4      5       15  6  7  8      7.000000
## 215    1    2      3       12  8 10 10      9.333333
## 216    1    3      1        2 14 15 15     14.666667
## 217    2    4      1       22  6  6  4      5.333333
## 218    2    4      4       13  6  6  8      6.666667
## 219    1    4      3        3  7  7  8      7.333333
## 220    1    1      4        4  9 10 10      9.666667
## 221    1    2      5        2  6  6  6      6.000000
## 222    1    1      5        0  6  5  0      3.666667
## 223    1    1      3        2 16 16 17     16.333333
## 224    5    5      4        0 12 13 13     12.666667
## 225    1    1      5        0 13 13 14     13.333333
## 226    1    1      4       16  9  8  7      8.000000
## 227    1    3      3       10 16 15 15     15.333333
## 228    1    3      3        2 12 11 12     11.666667
## 229    4    5      3       14 10  8  9      9.000000
## 230    1    2      3       10 12 10 12     11.333333
## 231    1    2      3       14 13 13 14     13.333333
## 232    1    1      1        4 11 11 11     11.000000
## 233    1    3      2       14 11  9  9      9.666667
## 234    2    4      1        2 14 13 13     13.333333
## 235    1    1      5       18  9  7  6      7.333333
## 236    1    3      2       10 11  9 10     10.000000
## 237    5    5      4        4 14 13 13     13.333333
## 238    1    1      5       20 13 12 12     12.333333
## 239    1    1      3        2 13 11 11     11.666667
## 240    3    5      2        0  7  7  0      4.666667
## 241    1    4      5       14 12 12 12     12.000000
## 242    2    3      4        2 10 11 12     11.000000
## 243    1    1      3        0  6  0  0      2.000000
## 244    1    2      5        0 13 12 12     12.333333
## 245    1    1      3        0  7  0  0      2.333333
## 246    1    1      4        6 18 18 18     18.000000
## 247    1    1      2        4 12 12 13     12.333333
## 248    5    5      1       16  6  8  8      7.333333
## 249    1    3      5        8  3  5  5      4.333333
## 250    2    4      5        0 13 15 15     14.333333
## 251    2    4      5        0  6  8  8      7.333333
## 252    1    3      2        6  7 10 10      9.000000
## 253    2    5      5        4  6  9  8      7.666667
## 254    1    3      3        0  8  9  8      8.333333
## 255    2    4      5        0  8 12 12     10.666667
## 256    1    2      5        2  7  9  8      8.000000
## 257    1    1      4        6 14 12 13     13.000000
## 258    1    1      1       12 11 11 11     11.000000
## 259    1    2      4        8 15 14 14     14.333333
## 260    1    1      2        0 10  9  0      6.333333
## 261    1    3      2       21 17 18 18     17.666667
## 262    1    1      3        2  8  8  8      8.000000
## 263    1    1      3        1 13 12 12     12.333333
## 264    1    1      4        4 10  9  9      9.333333
## 265    1    1      3        0  9 10  0      6.333333
## 266    3    4      1       13 17 17 17     17.000000
## 267    3    4      5        2  9  9 10      9.333333
## 268    2    2      4        8 12 10 11     11.000000
## 269    1    3      5       10 10  9 10      9.666667
## 270    1    2      3        0  6  0  0      2.000000
## 271    3    3      5       15  9  9  9      9.000000
## 272    1    3      2        4 15 14 14     14.333333
## 273    1    1      3        2 11 11 11     11.000000
## 274    2    2      1        2 15 14 14     14.333333
## 275    1    1      1        2 10 10 10     10.000000
## 276    2    3      5        6 12 12 12     12.000000
## 277    1    1      5       75 10  9  9      9.333333
## 278    1    4      3       22  9  9  9      9.000000
## 279    1    1      4       15  9  8  8      8.333333
## 280    1    2      1        8 10 11 10     10.333333
## 281    2    4      5       30  8  8  8      8.000000
## 282    3    4      3       19 11  9 10     10.000000
## 283    1    1      3        1 12 12 12     12.000000
## 284    1    1      4        4  8  9 10      9.000000
## 285    1    2      5        4 10  9 11     10.000000
## 286    1    2      4        2 12 10 11     11.000000
## 287    1    2      2        5 18 18 19     18.333333
## 288    1    1      3        6 13 12 12     12.333333
## 289    1    3      2        6 15 14 14     14.333333
## 290    1    1      2        9 15 13 15     14.333333
## 291    1    4      5       11 12 11 11     11.333333
## 292    1    2      3        0 15 15 15     15.000000
## 293    1    1      5       12 12 12 13     12.333333
## 294    1    1      3        6 18 18 18     18.000000
## 295    1    1      4        8 14 13 14     13.666667
## 296    1    3      5        4 14 12 11     12.333333
## 297    2    3      2        0 10  9  0      6.333333
## 298    1    2      2       10 10  8  8      8.666667
## 299    1    1      3        0 14 13 14     13.666667
## 300    2    2      1        5 16 15 16     15.666667
## 301    1    1      4       14 12 10 11     11.000000
## 302    2    2      5        0 11 11 10     10.666667
## 303    1    1      3        0 15 12 14     13.666667
## 304    1    2      5        0 17 17 18     17.333333
## 305    1    1      3       20 15 14 13     14.000000
## 306    1    1      3        8 14 12 12     12.666667
## 307    1    1      5        0 17 18 18     17.666667
## 308    1    1      4       38  8  9  8      8.333333
## 309    1    2      5        0 15 12 12     13.000000
## 310    1    3      3       18 12 10 10     10.666667
## 311    2    2      3        0  9  9  0      6.000000
## 312    1    1      2       20 14 12 13     13.000000
## 313    2    2      4        3 13 11 11     11.666667
## 314    1    2      1       22 13 10 11     11.333333
## 315    1    1      3       14 15 13 13     13.666667
## 316    1    1      3       40 13 11 11     11.666667
## 317    1    2      1        0  8  8  0      5.333333
## 318    1    1      5        9  9 10  9      9.333333
## 319    2    5      5        0 11 11 10     10.666667
## 320    3    3      5        2 11 11 11     11.000000
## 321    1    2      5       23 13 13 13     13.000000
## 322    1    1      3       12 11  9  9      9.666667
## 323    2    2      3        3 11 11 11     11.000000
## 324    2    3      5        1 12 14 15     13.666667
## 325    2    3      2        0 16 15 15     15.333333
## 326    2    2      3        3  9 12 11     10.666667
## 327    3    5      5        3 14 15 16     15.000000
## 328    5    5      4        8 11 10 10     10.333333
## 329    1    3      4        7 10  9  9      9.333333
## 330    1    2      4        4 14 14 14     14.000000
## 331    2    4      5        2  9  8  8      8.333333
## 332    1    1      5        7 12 14 14     13.333333
## 333    1    1      4        0  7  0  0      2.333333
## 334    1    1      2        0  8  8  0      5.333333
## 335    1    1      4        0 10  9  0      6.333333
## 336    1    3      5       16 16 15 15     15.333333
## 337    1    2      5       12 14 13 13     13.333333
## 338    2    3      2        0  7  8  0      5.000000
## 339    1    1      1        7 16 15 17     16.000000
## 340    2    3      2        4  9 10 10      9.666667
## 341    1    3      3        4 11 12 11     11.333333
## 342    2    2      2        0 10 10  0      6.666667
## 343    1    3      5       11 16 15 15     15.333333
## 344    1    2      4        0  9  8  0      5.666667
## 345    1    2      3        4 11 10 10     10.333333
## 346    2    3      1        7 13 13 14     13.333333
## 347    1    2      4        9 16 15 16     15.666667
## 348    2    3      5        0 10 10  9      9.666667
## 349    1    3      4        0 13 15 15     14.333333
## 350    5    5      5       10 11 13 13     12.333333
## 351    3    3      2        8  8  7  8      7.666667
## 352    2    3      3        2 13 13 13     13.000000
## 353    2    3      3        7  8  7  8      7.666667
## 354    3    3      5        4  8  8  8      8.000000
## 355    1    3      2        4 13 11 11     11.666667
## 356    1    1      5        0 10  9  9      9.333333
## 357    1    2      5        4 12 13 13     12.666667
## 358    1    2      5        2 12 12 11     11.666667
## 359    1    2      3        4 10 10 10     10.000000
## 360    1    1      4        0 18 16 16     16.666667
## 361    1    4      5        0 13 13 13     13.000000
## 362    2    3      5        2 13 12 12     12.333333
## 363    1    3      3        0 11 11 10     10.666667
## 364    1    1      1        0 16 15 15     15.333333
## 365    1    2      3        0 12 11 12     11.666667
## 366    2    4      3        4 10 10 10     10.000000
## 367    2    2      5        0 13 13 13     13.000000
## 368    1    2      1        0  7  6  0      4.333333
## 369    1    2      4        0 11 10 10     10.333333
## 370    4    2      5       10 14 12 11     12.333333
## 371    1    1      3        4  7  7  9      7.666667
## 372    2    3      3        3 14 12 12     12.666667
## 373    1    1      3        8 13 11 11     11.666667
## 374    1    3      1       14  6  5  5      5.333333
## 375    1    1      1        0 19 18 19     18.666667
## 376    1    2      4        2  8  8 10      8.666667
## 377    1    1      3        4 15 14 15     14.666667
## 378    3    4      2        4  8  9 10      9.000000
## 379    1    2      1        0 15 15 15     15.000000
## 380    2    3      1       17 10 10 10     10.000000
## 381    1    4      2        4 15 14 14     14.333333
## 382    1    3      5        5  7  6  7      6.666667
## 383    1    1      3        2 11 11 10     10.666667
## 384    1    3      5        0  6  5  0      3.666667
## 385    4    3      3       14  6  5  5      5.333333
## 386    1    3      4        2 10  9 10      9.666667
## 387    2    2      5        7  6  5  6      5.666667
## 388    1    2      5        0  7  5  0      4.000000
## 389    1    1      1        0  7  9  8      8.000000
## 390    1    1      5        0  6  5  0      3.666667
## 391    4    5      4       11  9  9  9      9.000000
## 392    3    4      2        3 14 16 16     15.333333
## 393    3    3      3        3 10  8  7      8.333333
## 394    3    4      5        0 11 12 10     11.000000
## 395    3    3      5        5  8  9  9      8.666667
```



```r
boxplot(dat2$average_grade~dat2$sex,
        las=1, ylab="Grade", xlab="Gender", main="Difference Grades Between Male and Females")
```

![plot of chunk unnamed-chunk-3](grades_report/unnamed-chunk-3-1.png)


```r
table(dat2$sex)
```

```
## 
##   F   M 
## 208 187
```



```r
(ttest <- t.test(dat2$average_grade~dat2$sex, paired=F, var.eq=T))
```

```
## 
## 	Two Sample t-test
## 
## data:  dat2$average_grade by dat2$sex
## t = -2.015, df = 393, p-value = 0.04459
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -1.4773516 -0.0181749
## sample estimates:
## mean in group F mean in group M 
##        10.32532        11.07308
```

```r
tidy(ttest)
```

```
##   estimate1 estimate2 statistic    p.value parameter  conf.low  conf.high
## 1  10.32532  11.07308 -2.014994 0.04458573       393 -1.477352 -0.0181749
##               method alternative
## 1  Two Sample t-test   two.sided
```

Because the alpha value used in this analysis is 0.05 there is a statistically signifacant difference the perfomance of males vs females in school. Since the null hypothesis was rejected 0.046 which is very close to 0.05 further test are recommended. In future studies one can consider the many other variables that are included in the data set used. Another thing that could be considered is conduct the study over differenct subjects.

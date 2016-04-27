require(irr)
library(reshape2)
library(ggplot2)

# Import CSV
iaa_csv <- read.csv("processed_data.csv")

#Data Sumamry
summary(iaa_csv)

#Kappa Tests
"reviewer a and reviewer b agreement"
kappa2(iaa_csv[,3:4], "unweighted")

"reviewer a and machine agreement"
kappa2(iaa_csv[c(3,5)], "unweighted")

"reviewer b and machine agreement"
kappa2(iaa_csv[,4:5], "unweighted")

"agreement between reviewer a, reviewer b, and machine"
kappam.fleiss(iaa_csv[,3:5])

#Data Analysis
rev_a <- iaa_csv[iaa_csv$reviewer_a]
rev_b <- iaa_csv[iaa_csv$reviewer_b]
machine <- iaa_csv[iaa_csv$processed]
barplot
hist(iaa_csv$reviewer_a, main='Reviewer A', xlab='Classification', ylab='Count', col=c("red", "darkblue", "violet", "purple", "green", "orange", "yellow"), breaks = 1)

# Set the working directory
setwd("D:/IMPUMS_LaborData")
mydata<-read.csv("ipums.csv")
uid_uniq <- unique(mydata$uid)
set.seed(123)
keep <- sample(unique(mydata$uid), 2000, replace=FALSE)
subset(mydata, uid %in% keep)
length(unique(mydata_sub$uid)) 

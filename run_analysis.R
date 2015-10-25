# Read all Data Tables
subt <- read.table("./Dataset/test/subject_test.txt")
Xt <- read.table("./Dataset/test/X_test.txt")
Yt <- read.table("./Dataset/test/Y_test.txt")
subtr <- read.table("./Dataset/train/subject_train.txt")
Xtr <- read.table("./Dataset/train/X_train.txt")
Ytr <- read.table("./Dataset/train/Y_train.txt")

# Merge Training and Test Sets
subAll <- rbind(subt, subtr)
XAll <- rbind(Xt, Xtr)
YAll <- rbind(Yt, Ytr)

# Combine into one table
dataTable <- cbind(subAll, YAll, XAll)

# Naming Columns

featNames <- read.table("./Dataset/features.txt")
featNamesVec <- as.vector(t(featNames)[2, ])
col2 <- c("Subject", "Activity")
AllNames <- c(col2, featNamesVec)
colnames(dataTable) <- AllNames

# Filtering for mean and std columns(plus first two columns)
vec1 <- c(1, 2)
vec2 <- c(2) + grep("mean+", featNamesVec)
vec3 <- c(2) + grep("std+", featNamesVec)
vec4 <- c(vec1, vec2, vec3)
filteredData <- dataTable[, vec4]

# Creating a second data set with means for each activity for each subject
library(plyr)
meanData <- ddply(filteredData, c("Subject", "Activity"), numcolwise(mean))

# Writing tidy data set to file
write.table(meanData, file = "Mean-Data.txt", row.name=FALSE)


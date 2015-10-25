subt <- read.table("./Dataset/test/subject_test.txt")

Xt <- read.table("./Dataset/test/X_test.txt")

Yt <- read.table("./Dataset/test/Y_test.txt")

subtr <- read.table("./Dataset/train/subject_train.txt")

Xtr <- read.table("./Dataset/train/X_train.txt")

Ytr <- read.table("./Dataset/train/Y_train.txt")


subAll <- rbind(subt, subtr)
XAll <- rbind(Xt, Xtr)
YAll <- rbind(Yt, Ytr)

dataTable <- cbind(subAll, YAll, XAll)

featNames <- read.table("./Dataset/features.txt")

featNamesVec <- as.vector(t(featNames)[2, ])

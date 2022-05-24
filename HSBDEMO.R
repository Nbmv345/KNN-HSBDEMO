hsb = read.csv("hsbdemo.csv")
hsb$prog = as.factor(hsb$prog)
hsb$read = as.factor(hsb$read)
hsb$write = as.factor(hsb$write)
hsb$math = as.factor(hsb$math)
hsb$science = as.factor(hsb$science)
hsb$socst = as.factor(hsb$socst)
set.seed (1234)
ind <- sample (2, nrow (hsb), replace = TRUE, prob = c(0.60, 0.40))
hsb.training <- hsb [ind == 1, 6: 9]
hsb.test <- hsb [ind == 2, 6: 9]
hsb.trainLabels <- hsb[ind==1,5]
hsb.testLabels <- hsb[ind==2,5]
library(class)
hsb_pred <- knn(train = hsb.training, test = hsb.test, cl = hsb.trainLabels)
summary(hsb_pred)
library(gmodels)
CrossTable(x=hsb_pred, y=hsb.testLabels, prop.chisq = FALSE)

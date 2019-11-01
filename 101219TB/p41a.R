library(e1071)

bank_train = read.csv('BankTrain.csv')

y = bank_train$y
x1 = bank_train$x1
x3 = bank_train$x3

dat = data.frame(x1, x3, y = as.factor(y))

svmfit = svm(y~., data = dat, kernel = 'linear', cost = 1e5)
summary(svmfit)

plot(svmfit, dat, main = 'SVM classification with cost = 1e5')
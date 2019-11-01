library(e1071)

bank_train = read.csv('BankTrain.csv')

y = bank_train$y
x1 = bank_train$x1
x3 = bank_train$x3

dat = data.frame(x1, x3, y = as.factor(y))

set.seed(001)
tune.out = tune(svm, y~., data = dat, kernel = 'radial',
                ranges = list(cost = c(0.1, 1, 10, 100, 1000),
                              gamma=c(0.5, 1, 2, 3, 4)))
summary(tune.out)

svmfit = svm(y~., data = dat, kernel = 'radial',
             cost = 10, gamma = 4)
summary(svmfit)
plot(svmfit, dat, main = 'SVM classification
     with the radial kernel, cost = 10 and gamma = 4')

bank_test = read.csv('BankTest.csv')

y = bank_test$y
x1 = bank_test$x1
x3 = bank_test$x3

dat = data.frame(x1, x3, y = as.factor(y))

table(true = dat[, 'y'],
      pred = predict(tune.out$best.mode, newdata = dat))
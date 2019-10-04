bank_train = read.csv('BankTrain.csv')
bank_test = read.csv('BankTest.csv')

library(MASS)

qda.fit = qda(y ~ x1 + x2, data = bank_train, 
              family = 'binomial')

qda.pred = predict(qda.fit, bank_test)
qda.class = qda.pred$class

table(qda.class, bank_test$y)
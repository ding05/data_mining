bank_train = read.csv('BankTrain.csv')
bank_test = read.csv('BankTest.csv')

library(MASS)

lda.fit = lda(y ~ x1 + x2, data = bank_train, 
              family = 'binomial')

lda.pred = predict(lda.fit, bank_test)
lda.class = lda.pred$class

table(lda.class, bank_test$y)
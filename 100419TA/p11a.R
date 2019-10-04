bank_train = read.csv('BankTrain.csv')

y = bank_train$y
x1 = bank_train$x1
x2 = bank_train$x2

glm.fit = glm(y ~ x1 + x2, data = bank_train, family = 'binomial')
summary(glm.fit)
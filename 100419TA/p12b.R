bank_train = read.csv('BankTrain.csv')
bank_test = read.csv('BankTest.csv')

glm.fit = glm(y ~ x1 + x2, data = bank_train, 
              family = 'binomial')

glm.probs = predict(glm.fit, bank_test, type = 'response')

bank_test$y_pred[glm.probs > 0.5] = 1
bank_test$y_pred[glm.probs <= 0.5] = 0

bank_test$y_pred = as.integer(bank_test$y_pred)

y = bank_test$y
y_pred = bank_test$y_pred

table(y_pred, y)
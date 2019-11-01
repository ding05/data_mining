library(randomForest)

carseats_train = read.csv('carseatsTrain.csv')
carseats_test = read.csv('carseatsTest.csv')

set.seed(001)
rf.carseats = randomForest(Sales~., ,data = carseats_train,
                           mtry = 6, importance = TRUE)
rf.carseats

yhat.rf_train = predict(rf.carseats, carseats_train)
carseats_train.test = carseats_train$Sales
mean((yhat.rf_train - carseats_train.test) ^2)

yhat.rf_test = predict(rf.carseats, carseats_test)
carseats_test.test = carseats_test$Sales
mean((yhat.rf_test - carseats_train.test) ^2)

importance(rf.carseats)
varImpPlot(rf.carseats,
           main = 'Importance of the variables
           in the car seat data')
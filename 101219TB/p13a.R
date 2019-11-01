library(randomForest)

carseats_train = read.csv('carseatsTrain.csv')
carseats_test = read.csv('carseatsTest.csv')

bag.carseats = randomForest(Sales~., ,data = carseats_train,
                            mtry = 9, importance = TRUE)
bag.carseats

yhat.bag_train = predict(bag.carseats, carseats_train)
carseats_train.test = carseats_train$Sales
mean((yhat.bag_train - carseats_train.test) ^2)

yhat.bag_test = predict(bag.carseats, carseats_test)
carseats_test.test = carseats_test$Sales
mean((yhat.bag_test - carseats_test.test) ^2)
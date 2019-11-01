library(gbm)

carseats_train = read.csv('carseatsTrain.csv')
carseats_test = read.csv('carseatsTest.csv')

set.seed(002)
boost.carseats = gbm(Sales~., ,data = carseats_train,
                     distribution = 'gaussian',
                     n.trees = 320,
                     shrinkage = 0.1,
                     interaction.depth = 1)
summary(boost.carseats, main = 'Influence of the variables
        in the car seat data (incomplete display)')

yhat.boost_train = predict(boost.carseats, carseats_train,
                           n.trees = 320)
carseats_train.test = carseats_train$Sales
mean((yhat.boost_train - carseats_train.test) ^2)

yhat.boost_test = predict(boost.carseats, carseats_test,
                           n.trees = 320)
carseats_train.test = carseats_test$Sales
mean((yhat.boost_test - carseats_train.test) ^2)
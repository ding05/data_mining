library(tree)

carseats_train = read.csv('carseatsTrain.csv')
carseats_test = read.csv('carseatsTest.csv')

tree.carseats = tree(carseats_train)

set.seed(001)
cv.carseats = cv.tree(tree.carseats, FUN = prune.tree,
                      K = 5)
plot(cv.carseats, main =
       'The cross validation for the car seat data')
cv.carseats

prune.carseats = prune.tree(tree.carseats, best = 11)
plot(prune.carseats)
text(prune.carseats, pretty = 1)

yhat_train = predict(prune.carseats,
                     newdata = carseats_train)
mean((yhat_train - carseats_train$Sales)^2)

yhat_test = predict(prune.carseats,
                    newdata = carseats_test)
mean((yhat_test - carseats_test$Sales)^2)
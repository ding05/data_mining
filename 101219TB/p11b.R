yhat_train = predict(tree.carseats, newdata = carseats_train)
mean((yhat_train - carseats_train$Sales)^2)

yhat_test = predict(tree.carseats, newdata = carseats_test)
mean((yhat_test - carseats_test$Sales)^2)
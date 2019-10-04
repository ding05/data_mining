kNN <- function(k, x.train, y.train, x.pred) {
n.pred <- length(x.pred); y.pred <- numeric(n.pred)
for (i in 1:n.pred){
  d <- abs(x.train - x.pred[i])
  dstar = d[order(d)[k]]
  y.pred[i] <- mean(y.train[d <= dstar])		
}
  invisible(y.pred)
}

library(Metrics)

auto_train = read.csv('AutoTrain.csv')
x = auto_train$weight
y = auto_train$mpg
# k = c(2, 5, 10, 20, 30, 50, 100)
auto_test = read.csv('AutoTest.csv')
x_p = auto_test$weight
y_p = auto_test$mpg

result_2 = kNN(2, x, y, x_p)
result_5 = kNN(5, x, y, x_p)
result_10 = kNN(10, x, y, x_p)
result_30 = kNN(30, x, y, x_p)
result_50 = kNN(50, x, y, x_p)
result_100 = kNN(100, x, y, x_p)

mse(result_2, y_p)
mse(result_5, y_p)
mse(result_10, y_p)
mse(result_30, y_p)
mse(result_50, y_p)
mse(result_100, y_p)
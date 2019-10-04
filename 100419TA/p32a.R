# Training data
x = seq(-100, 100, by = 0.1)
y_1 = 0.5 * pnorm(x, 0, 2)
y_2 = 0.5 * pnorm(x, 1, 2 ^ 0.5)
y = seq(-100, 100, by = 0.1)

for (i in 1: 2001) {if(y_1[i] > y_2[i]) {
  y[i] = 0} 
  else {y[i] = 1}
}

# Testing data
x_t = seq(-20, 20, by = 0.02)
y_t_1 = 0.5 * pnorm(x, 0, 2)
y_t_2 = 0.5 * pnorm(x, 1, 2 ^ 0.5)
x_t = seq(-20, 20, by = 0.02)

for (i in 1: 2001) {if(y_t_1[i] > y_t_2[i]) {
  y_t[i] = 0} 
  else {y_t[i] = 1}
}

data_train = data.frame(x, y)
data_test = data.frame(x_t, y_t)

library(MASS)

lda.fit = lda(y ~ x, data = data_train, family = 'binomial')

lda.pred = predict(lda.fit, data_test)
lda.class = lda.pred$class

table(lda.class, y)
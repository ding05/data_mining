X = matrix(c(1, 1, 1, 2, 2, 2), ncol = 1)
Y = matrix(c(5, 9, 13), ncol = 1)
beta_hat = solve(t(X) %*% X) %*% t(X) %*% Y
beta_hat
lm.fit = lm(Y~X)
lm.fit
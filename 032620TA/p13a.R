X = matrix(c(1, 1, 1, 3, 4, 5), ncol = 2)
Y = matrix(c(5, 9, 13), ncol = 1)
beta_hat = solve(t(X) %*% X) %*% t(X) %*% Y
beta_hat
residuals_hat = Y - X %*% beta_hat
residuals_hat
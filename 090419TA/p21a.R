x = seq(-5, 5, by = 0.2)
x_1 = 0.69 * dnorm(x, 0, 1)
x_2 = 0.31 * dnorm(x, 1, 0.5 ^ 0.5)
matplot(x, x_1, type = 'l', xlab = 'x', ylab = 
        expression(paste(pi, 'f(x)')))
lines(x, x_2, lwd = 2)
legend(x = 'topright', legend = c('Class 0', 'Class 1'), 
       lwd = c(1, 2))
plot(0:50, type = 'n', ylab = 'Values')
points(result_30, col = 'red', pch = 1)
points(y_p, col = 'blue', pch = 3)
legend(x = 'topleft', legend = c('kNN Response Values', 
       'Testing Response Values'), 
       pch = c(1, 3))
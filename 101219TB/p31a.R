a3 = read.csv('A3data2.csv')

x1 = a3$x1
x2 = a3$x2
x = data.frame(x1, x2)
y = a3$Cluster

km.out = kmeans(x, 3, nstart = 20)
km.out$cluster
plot(x, col = (km.out$cluster + 1),
     main = 'K-means clustering results with K = 3',
     xlab = '',
     ylab = '',
     pch = 20, cex = 1)

table(km.out$cluster, y)
(1 + 409 + 198) / nrow(x)
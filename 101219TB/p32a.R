a3 = read.csv('A3data2.csv')

x1 = a3$x1
x2 = a3$x2
x = data.frame(x1, x2)
y = a3$Cluster

dist(x, 'euclidean', diag = TRUE, upper = TRUE)

hc.complete = hclust(dist(x, 'euclidean',
                          diag = TRUE, upper = TRUE),
                     method = 'complete')
hc.single = hclust(dist(x, 'euclidean',
                        diag = TRUE, upper = TRUE),
                   method= 'single')

plot(hc.complete, main = 'Hierarchical clustering
     with Euclidean distance and complete linkage',
     xlab = '', sub = '', cex = 0.9)
plot(hc.single, main = 'Hierarchical clustering
     with Euclidean distance and single linkage',
     xlab = '', sub = '', cex = 0.9)

cutree(hc.complete, 3)
plot(x, col = cutree(hc.complete, 3), pch = 20,
     main = 'Hierarchical clustering
     with Euclidean distance and complete linkage')
cutree(hc.single, 3)
plot(x, col = cutree(hc.single, 3), pch = 20,
     main = 'Hierarchical clustering
     with Euclidean distance and single linkage')

table(cutree(hc.complete, 3), y)
(132 + 825 + 198) / nrow(x)

table(cutree(hc.single, 3), y)
(200 + 1 + 0) / nrow(x)
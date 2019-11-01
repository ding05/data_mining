a3 = read.csv('A3data2.csv')

x1 = a3$x1
x2 = a3$x2
x = data.frame(x1, x2)
y = a3$Cluster

x = scale(x, center = TRUE, scale = TRUE)

# K Mean Clustering

km.out = kmeans(x, 3, nstart = 20)
km.out$cluster
plot(x, col = (km.out$cluster + 1),
     main = 'K-means clustering results with K = 3
     (after rescaling)',
     xlab = '',
     ylab = '',
     pch = 20, cex = 1)

# Hierarchical Clustering

dist(x, 'euclidean', diag = TRUE, upper = TRUE)

hc.complete = hclust(dist(x, 'euclidean',
                          diag = TRUE, upper = TRUE),
                     method = 'complete')
hc.single = hclust(dist(x, 'euclidean',
                        diag = TRUE, upper = TRUE),
                   method= 'single')

plot(hc.complete, main = 'Hierarchical clustering
     with Euclidean distance and complete linkage
     (after rescaling)',
     xlab = '', sub = '', cex = 0.9)
plot(hc.single, main = 'Hierarchical clustering
     with Euclidean distance and single linkage
     (after rescaling)',
     xlab = '', sub = '', cex = 0.9)

cutree(hc.complete, 3)
plot(x, col = cutree(hc.complete, 3), pch = 20,
     main = 'Hierarchical clustering
     with Euclidean distance and complete linkage
     (after rescaling)')
cutree(hc.single, 3)
plot(x, col = cutree(hc.single, 3), pch = 20,
     main = 'Hierarchical clustering
     with Euclidean distance and single linkage
     (after rescaling)')

table(km.out$cluster, y)
(0 + 1598 + 2) / nrow(x)

table(cutree(hc.complete, 3), y)
(200 + 1464 + 197) / nrow(x)

table(cutree(hc.single, 3), y)
(200 + 1 + 0) / nrow(x)
library(tree)

carseats_train = read.csv('carseatsTrain.csv')
carseats_test = read.csv('carseatsTest.csv')

tree.carseats = tree(carseats_train)
summary(tree.carseats)
plot(tree.carseats, main =
       'The regression tree for the car seat data')
text(tree.carseats, pretty = 1)
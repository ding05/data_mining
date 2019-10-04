bank_train = read.csv('BankTrain.csv')

y = bank_train$y
x1 = bank_train$x1
x2 = bank_train$x2

glm.fit = glm(y ~ x1 + x2, data = bank_train, 
              family = 'binomial')
glm.probs = predict(glm.fit, data = bank_train, type = 'response')

glm.pred[glm.probs > 0.5] = 'forged banknote'
glm.pred[glm.probs <= 0.5] = 'genuine banknote'

df = cbind.data.frame(glm.probs, x1, x2)
slope = coef(glm.fit)[2] / (- coef(glm.fit)[3])
intercept = coef(glm.fit)[1] / (- coef(glm.fit)[3]) 

library(lattice)
xyplot(x2 ~ x1, data = df, groups = y,
        panel = function(...){
          panel.xyplot(...)
          panel.abline(intercept , slope)
        },
       xlab = 'Variable x1',
       ylab = 'Variable x2', 
       main = 'Training Banknote Data and Its Decision Boundary When
       the Prior Probability of Being a Forged Note Is 0.5',
       pch = c(3, 1),
       col = c('red', 'blue'),
       key = list(columns = 2, 
                text = list(lab = c('Forged Banknote', 
                                    'Genuine Banknote')),
                points = list(pch = c(1, 3), 
                              col= c('blue', 'red'))))

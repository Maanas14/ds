install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggfortify")

library("dplyr")
library("ggplot2")
library("ggfortify")

data(iris)
head(iris)

data <- select(iris, c(1 : 4))

wss.vector <- vector(mode="character", length=10)

for (i in 1:10) {
  cluster <- kmeans(data, center=i, nstart=20)
  wss.vector[i] <- cluster$tot.withinss
}

plot (1:10, wss.vector, type="b")
classifier_RF <- kmeans(data, 2)
print(classifier_RF)
print(classifier_RF$centers)

autoplot(classifier_RF, data, frame = "TRUE")


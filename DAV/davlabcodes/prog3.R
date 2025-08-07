# program 3
install.packages(c("ggplot2", "GGally"))

# Load libraries
library(ggplot2)
library(GGally)

# Load data
data <- iris

# Summary
summary(data); str(data)

par(mfrow = c(2, 2))
hist(data$Sepal.Length, main = "Sepal Length", col = "skyblue")
hist(data$Sepal.Width,  main = "Sepal Width",  col = "orange")
hist(data$Petal.Length, main = "Petal Length", col = "lightgreen")
hist(data$Petal.Width,  main = "Petal Width",  col = "pink")
par(mfrow = c(1, 1))

# Scatter matrix
ggpairs(data[, 1:4])

# PCA + plot
pca <- prcomp(data[, 1:4], scale. = TRUE)
pca_df <- cbind(as.data.frame(pca$x), Species = data$Species)
ggplot(pca_df, aes(PC1, PC2, color = Species)) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(title = "PCA - Iris", x = "PC1", y = "PC2")

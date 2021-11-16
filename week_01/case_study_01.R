## Case study 1: Your first script

# Load packages
library(ggplot2)

# Load and view data
data(iris)
str(iris)

# Calculate mean of Petal.Length
petal_length_mean <- mean(iris$Petal.Length)

# Make a histogram plot using hist()
hist(iris$Petal.Length, main="Histogram for Petal Length", xlab="Petal Length", col='black')

# Make a histogram plot using qplot()
qplot(iris$Petal.Length, binwidth=.5, main="Histogram for Petal Length", xlab="Petal Length", fill=I("black"), col=I("white"), alpha=I(.5))

# Make a histogram plot using ggplot()
ggplot(data = iris, aes(x=Petal.Length))+geom_histogram(breaks=seq(1, 7, by=.5), col="white", fill='black', alpha=.8)+labs(title="Histogram for Petal Length", x="Petal Length")

#PRACTICAL 2 - The Graphical Package ggplot2 and Probability Distributions

"
BINOMIAL DISTRIBUTION >

This applies when we have a number of INDEPENDENT 'trials' each of which can result
in one of two types of outcome (Yes/No, True/False, Success/Fail etc.)
The quantity defined as the total numebr of outcomes of one type (i.e. successes) is said
to have a Binomial distribution. 

If we have n trials where the probability of 'success' is p each time then X = number of successes
observed has a Binomial distribution with index n and (probability) parameter p.

In shorthand notation we wouild write    X~Bin(n,p)

The distribution has mean np and variance np(1-p)
"

dbinom(0,2,0.5) #Probability of observing 0 successes in 2 trials where the prob. of success in each trial is 0.5

dbinom(2, 10, 1/6) #Probability of rolling two sixes whena  fair die is rolled ten times

pbinom(4, 20, 0.5) #Chance of getting 4 or fewer heads in 20 tosses of a fair coin, P(X???4)
#pbinom(4, 20, lower.tail=TRUE)

"
dbinom > A probability mass function of binomial distribution.
         Tells you what is Pr(X=x) (probability of observing value equal to x)

pbinom > A cumulative distrubition function of this distribution
        Tells you what is Pr(X???x) (probability of observing value smaller or equal than x)
"


##


"
POISSON DISTRIBUTION >
The Poisson distribution is used to model the occurence of rare events, or events that occur according to a random process.

If you example events occur at random at a rate ?? per unit of time then we should be able to deduce how many events
we should expect to happen in a given time t. If we let this number be µ we have that X, the actual number of events that occur 
in such a time period has a Poisson distribution of mean µ.

The mean of the distribution is µ, this is also the variance.

Shorthand Poisson notation is written as X~Po(µ)
"

dpois (4,7) #Gives P(X=4) if X~Po(7)

ppois(4,7) #Gives P(X???4) if X~Po(7)

ppois(15, 50, lower.tail=FALSE) #Gives P(X>15) if X~Po(50)

##

x <- seq(0, 25, 1)
x

plot(dbinom(x, 25, 0.5), type="h") #h=Histogram
plot(ppois(x, 40), type="s") #s=Line graph

######### ggplot2 #########
attach(iris)

plot1 <- ggplot(iris, aes(x=Petal.Width, y=Petal.Length)) #aes=aesthetics
plot1 <- plot1 + geom_point()
plot1 <- plot1 + ggtitle("Petal Dimensions for 3 Species of Iris") + labs(x="Petal Width", y ="Petal Length")
plot2 <- plot1 + geom_point(aes(colour=Species)) #Adds colour
plot3 <- plot2 + facet_grid(~Species) #Separates them
plot4 <- plot3
plot4 <- plot1 + geom_point(aes(colour=Species, size=Sepal.Length)) #thicker plots
plot4

plot5 <- ggplot(iris, aes(x=Species, y=Petal.Width))
plot5 <- plot5+geom_point()
plot5 <- plot5 + ggtitle("Petal Width for 3 Species of Iris") + labs(x="Species", y="Petal Width")
plot5 <- plot5 + geom_point(aes(colour=Petal.Length))
plot5

##########
 
#Plotting the same thing but without using ggplot 

par(mfrow=c(1,1))
with(iris, {
  plot(Petal.Width, Petal.Length, col=Species)
  legend(x="bottomright", legend=unique(Species), col=1:3, pch=1)
})

par(mfrow=c(1,1))
with(iris, plot(Petal.Width, Petal.Length, col=Species, cex=Sepal.Length/min(Sepal.Length), pch=19)
     ) ##Thicker plots but graphs together


##Three graphs of each species petal width on length

xlim <- range(iris$Petal.Width)
ylim <- range(iris$Petal.Length)

par(mfrow=c(1,3))
with(subset(iris, Species=="setosa"),
     {
       plot(Petal.Width, Petal.Length, xlim=xlim, ylim=ylim, col=1, main="setosa")
     })
with(subset(iris, Species=="versicolor"),
     {
       plot(Petal.Width, Petal.Length, xlim=xlim, ylim=ylim, col=2, main="versicolor")
      })
with(subset(iris, Species=="virginica"),
     {
       plot(Petal.Width, Petal.Length, xlim=xlim, ylim=ylim, col=3, main="virginica")
     })


detach(iris)

######### Histograms in ggplot2 #########

"The dataframe malaria contains the number of malaria parasites in 1ml of blood taken
from 31 children infected with malaria"


data(malaria) #Loading the malaria dataframe
attach(malaria)

malariaHist <- ggplot(malaria, aes(parasites)) + geom_histogram()
malariaHist <- malariaHist + labs(x="Number of Parasites", y="Frequency")
malariaHist

with(malaria,
     {
       hist(parasites, breaks=10, xlab="Num of Parasites", ylab="Frequency") #Change breaks number
     })


data(tartar) #Data on the results of an experiment on treatments for tartar on the teeth of dogs
data(chickwts)

tarplot <- ggplot(tartar, aes(x=treat, y=index))+geom_boxplot() #BOXPLOT
chickplot <- ggplot(chickwts, aes(x=feed, y=weight))+geom_point(shape=2, size=3, colour="red") #DOTPLOT

tarplot
chickplot


########## EXERCISES #########
##############################

######### Exercise 1
"dogwhelks > data gathered in an investigation into the populations of the dog whelk (a shellfish) at Aberystwyth and Borth"

attach(dogwhelks)

plot1 <- ggplot(dogwhelks, aes(x=Width, y=Length)) + geom_point()
plot1

plot2 <- ggplot(dogwhelks, aes(x=Width, y=Weight)) + geom_point()
plot2

plot3 <- ggplot(dogwhelks, aes(x=Location, y=Length)) + geom_point()
plot3

plot4 <- ggplot(dogwhelks, aes(x=Colour, y=Weight)) + geom_point()
plot4

plot5 <- ggplot(dogwhelks, aes(x=Width, y=Length)) + geom_point(aes(col=Location))+ggtitle("Length Against Width by Location for 80 Dogwhelk Shells")+ labs(x="Width (mm)", y="Length (mm)")
plot5

plot6 <- ggplot(dogwhelks, aes(x=Weight, y=Length)) + geom_point(aes(col=Location)) + ggtitle("Length Against Weight by Location for 80 Dogwhelk Shells") + labs(x="Weight (g)", y="Length (mm)")
plot6

plot7 <- ggplot(dogwhelks, aes(Length)) + geom_histogram(binwidth=2) + facet_grid(~Teeth) + ggtitle("Distribution of Lengths by Teeth (Absent/Present) for 80 Dogwhelk Shells") + labs(x="Length (mm)")
plot7


######## Exercise 2
"Produce a plot that shoes the Bin(100,0.1) and the Po(10) distributions on the same diagram, for x between 0 and 100"

N <- 100
p <- 0.1
mu <- 10
x <- 0:100

bin.dist <- dbinom(x, N, p)
pois.dist <- dpois(x, mu)

exercise2plot <- plot(x, bin.dist, xlab="X", ylab="Probability")
points(x, pois.dist, col="red")

exercise2plot

title("Bin(100, 0.1) (black) and Pois(10) (red) Distributions")

#b ....

######### Exercise 3

#a
heads <- 0:8
obs <- c(3, 5, 11, 11, 6, 3, 1, 0, 0) #Observed Frequencies

data <- rep(heads, obs) #rep?

ggplot(data.frame(data), aes(data)) + geom_histogram() + xlim(range(heads)) + labs(x="Number of Heads", y="Frequency") + ggtitle("Histogram of Numbers of Heads Obtained on 8 Coins (40 Experiments)")

##Not finished


######### Exercise 4

"
Let X be a random variable corresponding to the number of heads on 10
tosses of a coin with independent probabilities of a head equal to 0.4, i.e.
X~Binom(10,0.4). Let A and B represent the following two events:

A = 'More than 5 heads i.e. X=6,7,8,9 or 10'
B = 'Even number of heads (including 0)'

Calculate P(A), P(B) and P(AnB)
"
##a

#P(A)=P(X???5)
probA <- pbinom(4, 10, 0.4, lower.tail=FALSE)
probA

#P(B)=P(X=0,2,4,6,8 or 10) (even number of heads)
probB <- sum(dbinom(c(0,2,4,6,8), 10, 0.4))
probB

#P(AnB)=P(X=6,8 or 10)
probAandB <- sum(dbinom(c(6,8,10), 10, 0.4))
probAandB

##b

#P(A|B) (conditional probability of A given B)
#P(A|B)=P(AnB)/P(B)
probAgivenB <- probAandB/probB
probAgivenB

#Are A and B independent?
#Since P(A|B) is not equal to P(A), A and B are NOT independent



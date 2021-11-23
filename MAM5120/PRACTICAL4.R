#PRACTICAL 4 MAM5120 - BAYESIAN INFERENCE

seq(0, 8, by=2) #(0,2,4,6,8)
seq(0, 1, length=101) #(0, 0.01, 0.02, ..., 0.99, 1)

#Plotting the probability of obtaining different numbers of heads in 10 coin tosses
k.vector <- seq(0, 10, by=1) #Possible outcomes
y.binom <- dbinom(k.vector, 10, prob=0.5) #(Fair coin)
plot(k.vector, y.binom, type='h') #'h' for bars

"
BAYESIAN STATISTICS
In frequentist statistics, parameters of interest are considered unkown, but fixed numebers
that we are interested in estimating. For example, if we were doing an experiment to try to 
estimate the mean height of men in the UK, in a frequentist setting the population would
be a fixed number.

When we use Bayesian statistics, the parameters are thought of as RANDOM VARIABLES with 
particular probability distributions. 

Before we carry out an experiment we have a distribution in mind for the parameter(s) of interest.
This is the PRIOR DISTRIBUTION. We then gather data and update the prior distribution to obtain a
POSTERIOR DISTRIBUTION.

If we choose the prior distribution from a particular family (e.g. gamme, Normal, beta) where the family 
required depends on the distribution of the data, then the posterior distribution is another distribution
from the same family as the prior distribution.

For example, if we have data from a Normal distribution with known variance, then if we assume a Normal prior,
then the posterior will also follow a Normal distribution. This property, where the posterior and prior
have the same form is called CONJUGACY

The fundamental principle of Bayesian statistics:
POSTERIOR IS PROPORTIONAL TO LIKELIHOOD x PRIOR
p(theta | x) &< L(theta | x) * p(theta)
"


######### QUESTION 1 #########
#Binomial likelihood, Beta prior

#a - vector length of 1000 on [0,1]
b.vector <- seq(0, 1, length=1000)

#Producing plots of the Beta distribution (dbeta())
#i - alpha=1, beta=1
y.binom <- dbeta(b.vector, 1, 1, ncp=0)
plot(b.vector, y.binom, type='l')

#ii - alpha=4, beta=2
y.binom <- dbeta(b.vector, 4, 2, ncp=0)
plot(b.vector, y.binom, type='l')

#iii - alpha=3, beta=0.5
y.binom <- dbeta(b.vector, 3, 0.5, ncp=0)
plot(b.vector, y.binom, type='l')

#b - Beta(1,1) coin toss 25 times, 6 heads
#  - Plot prior and posterior distribution on same graph
b.vector <- seq(0, 1, length=1000)
y.bin <- dbeta(b.vector, 6, 25, ncp=0)
y.bin2 <- dbeta(b.vector, 7, 20, ncp=0)
plot(b.vector, y.bin, type='l')
points(b.vector, y.bin2, type='l', col='red')

#c - Beta(2,2) as the prior
b.vector <- seq(0, 1, length=1000)
y.bin <- dbeta(b.vector, 6, 25)
y.bin2 <- dbeta(b.vector, 8, 21)
plot(b.vector, y.bin, type='l')
points(b.vector, y.bin2, type='l', col='red')


########## QUESTION 2 ##########
"
For a Poisson likelihood, the Gamma prior is the conjugate prior.
The gamma distribution has two parameters, alpha (the shape parameter) and beta (the rate patameter)
"

#a - Plot gamma distributions (dgamma())
#  - Poisson : Gamma
g.vector <- seq(0, 10, length=1000)

#i alpha=1, beta=1 (alpha=shape, beta=rate)
y.poisson <- dgamma(g.vector, 1, rate=1)
plot(g.vector, y.poisson, type='l')


#ii alpha=3, beta=1
y.poisson <- dgamma(g.vector, 3, rate=1)
plot(g.vector, y.poisson, type='l')

#iii alpha=10, beta=5
y.poisson <- dgamma(g.vector, 10, rate=5)
plot(g.vector, y.poisson, type='l')


#b gamma(3,1) - plot prior and posterior distribution curves on the same plot
x <- c(1, 4, 2, 5, 3, 2, 4, 0, 1)
sum(x)
g.vector <- seq(0, 10, length=1000)
y.pois <- dgamma(g.vector, 3, rate=1)
y.pois2 <- dgamma(g.vector, 25, rate=11)
ylim <- range(y.pois, y.pois2)
plot(g.vector, y.pois, type='l', ylim=ylim)
points(g.vector, y.pois2, type='l', col='red')

#c Calculate the posterior probability that the population mean is less than 3 in (b)
mean(x)
mean(g.vector)
y.pois <- pgamma(g.vector, 3, rate=1)
y.pois2 <- pgamma(g.vector, 25, rate=5)
ylim <- range(y.pois, y.pois2)
plot(g.vector, y.pois, type='l', ylim=ylim)
points(g.vector, y.pois2, type='l', col='red')
var <- pgamma(3, 25, rate=5)

########### QUESTION 3 ##########
# Normal (variance known)
# Population variance sigma^2 == 9
# N(20, 10), mu=20, (sigma^2)0 == 10
x <- c(16.4, 10.8, 16.1, 17.3, 13.8, 22.5, 15.9, 14.8, 19.2, 22.7)
sum(x)
mean(x)

#a Calculate the posterior mean and the posterior variance
post.mean <- ((sum(x)/9) + (20/10)) / ((10/9) + (1/10))
variance <- ((10/9) + (1/10))^-1

#b
"MAM5120 PRACTICAL 3 - PEARSON'S CHI-SQUARED AND LIKELIHOOD PLOTS"

x <- c(0,1,2,3) #the observed values
freqs <-c(5,4,2,6) #the observed frequencies
N <- sum(freqs) #counting the total number of data points

mean.x <- sum(x*freqs)/N
print(mean.x)
var.x <- var(rep(x, freqs))
print(var.x)

"Here we consider two example when we might wish to test the goodness of fit
of data to a particular model. The first example is to assess whether data in a
frequency table are uniformly distributed across the cells in a table"

"EXAMPLE - TRAFFIC ACCIDENTS"
Obs <- c(23, 18, 17, 19, 23)
N <- sum(Obs) #Total number of observations (100)

Expected <- rep(N/5,5) #Vector of 5 20s, rep=repeat
X2 <- sum((Obs-Expected)^2/Expected)
p <- pchisq(X2, 4, lower.tail=FALSE)
print(p)


########## QUESTION 1 ##########
"
H0: The rats are equally likely to take each route (NULL HYPOTHESIS)
HA: The rats are not equally likely to take each route (ALTERNATIVE HYPOTHESIS

If the null hypothesis were true, we would expect to see 30 rats going via each route.

This gives us the following table:

|Route | Observed (O)  | Expected (E)  | (O-E)^2/E |
|------|---------------|---------------|-----------|
|   1  |    22         |      30       |    2.13   |
|      |               |               |           |
|   2  |    36         |      30       |    1.20   |
|      |               |               |           |
|   3  |    32         |      30       |    0.13   |
----------------------------------------------------

Which gives a chi-squared statistic of:
X^2 = 2.13 + 1.20 + 0.13 = 3.46

Comparing this with a chi-squared distribution on 2 degrees of freedom gives - "

p <- pchisq(3.46, 2, lower.tail=FALSE)
print(p)

"The p value is 0.18 and there is insufficient evidence to reject the null hypothesis,
we conclude that the rats are equally likely to take each of the three routes"


######### QUESTION 2 ##########
#a - Sample mean xbar
Eggs <- 0:4
Freqs <- c(4, 8, 12, 8, 5)
x.bar <- sum(Eggs*Freqs)/sum(Freqs)
print(x.bar)

#b miu=xbar, calculate P(X=k) for k=0,1,2,3,4 and P(X???5)
  #Note the inclusion of the k=0 case for a Poisson model
Expected.probs <- dpois(x, 2.05)
print(Expected.probs)
Prob.5plus <- ppois(4,2.05, lower.tail=FALSE)
print(Prob.5plus)

#c Calculate the expected frequencies

#d Calculate the Pearson chi-squared statistic

#e How many degrees of freedom are there for the relevant X^2 distribution

#f Calculate the p-value in this case, using pchisq() with lower.tail=FALSE

#g What is the conclusion?


########## QUESTION 3 #########
"Researchers are investigating the habitat preferences of a species of beetle.
Suppose in a certain woodland there are five species of tree (and we assume that all of the trees
are of similar size). The following data was collected about the numbers of beetles living
on each of the types of tree, along with a count of the number of trees of each species.


            | Oak   | Ash   | Beech   | Elm   | Hazel   |
# of Trees  |   4   |  7    | 6       |   3   | 8       |
            |       |       |         |       |         |
Total number| 46    | 65    |  31     |  37   |  55     |
of beetles  |       |       |         |       |         |

The (biological) null hypothesis is that the beetles forage equally on all five tree species
"

#a Restate the null hypothesis as a statistical hypothesis
"The null hypothesis of interest if that the beetles are equally likely to be found on any tree (irrespective of type),
so the number found on a particular tree only depends of the relative frequency of that type of tree in the woodland."

#b Calculate the expected proportions of beetles found on each type of tree, their expected frequencies and X^2
Numbers.of.trees <- c(4, 7, 6, 3, 8)
Numbers.of.beetles <- c(46, 65, 31, 37, 55)
Expected.props <- Numbers.of.trees/sum(Numbers.of.trees)
Expected.freqs <- Expected.props*sum(Numbers.of.beetles)

"
Tree Type | Observed | Expected   | Expected (E) | (O-E)^2/E |
          |    (O)   | Proportion |              |           |
--------------------------------------------------------------
Oak       |  46      |   0.14     |  33.43       |  4.73     |
Ash       |  65      |   0.25     |  58.50       |  0.72     |
Beech     |  31      |   0.21     |  50.14       |  7.31     |
Elm       |  37      |   0.11     |  25.07       |  5.68     |
Hazel     |  55      |   0.29     |  66.86       |  2.10     |

*NOTE - expected is calculated through (total number of beetles (234) * expected proportion)"

#X^2 = 4.73 + 0.72 + 7.31 + 5.68 + 2.10 = 20.54

#e Compare X^2 with the relevant X^2 distribution fo calculate a p-value, what is the conclusion in this case?
"Comparing X^2 with a X4^2 distribution gives a p-value of 0.00039.
Since this is a lot smaller than 0.01, there is strong evidence (at the 1% level) that beetles are not equally
likely to be found on each type of tree."


########## QUESTION 4 ###########
"The sex ratio of crocodile eggs depends on the temperature of incubation, with more males produced at lower temperatures.
Initially, we consider a fixed incubation tempterature.

Let X='Number of Crocodile eggs that are Male'

Assuming a constant probability that a given egg is male, we have, for a sample size n, X~Bin(n,p)

Suppose that out of n=30 eggs we observe k=10 male eggs."

#a Use the curve() function, along with the dbinom() function to plot a likelihood plot for the probability p over the range [0,1]
n = 30 #eggs
k = 10 #male
curve(dbinom(k,n,x), from=0, to=1, ylab='Likelihood', xlab='x', main='A likelihood plot for p:10 males from 30 crocodile eggs')

#b Calculate an approximate 95% confidence interval for p (formula on worksheet)
p = k/n
sqroot = sqrt((p*(1-p))/n)
twosqrt = 2*sqroot
pa = p + twosqrt
ps = p - twosqrt
  #(0.16, 0.50)

#c 
"Suppose we observe 22 males out of 42 eggs at a low incubation temperature, and 10 males out of 25 eggs at a high incubation temperature.
Produce likelihood plots for p(low) and p(high) on the same plot."
par(mfrow=c(1,2))
hight <- curve(dbinom(10, 25, x), from=0, to=1, main="10M, 25 eggs, High Temp", xlab="p", ylab="Likelihood", col="red")
lowt <- curve(dbinom(22, 42, x), from=0, to=1, main="22M, 42 eggs, Low Temp", xlab="p", ylab="Likelihood", col="green")
par(mfrow=c(1,1))
plot(hight, type="l", col="red", main="gender of crocodile depends on egg temperature", xlab="p", ylab="Likelihood")
lines(lowt, col="green")


######### QUESTION 5 #########

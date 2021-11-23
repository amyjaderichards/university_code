(5-12)*3
sqrt(2)
sin(2*pi)

#Defining new variables
x <- 2
y <- 3*x -1
x <- c(1:25) #Concatenate
rm(x, y, z) #Removing variables

x <- c(1, 3, 5, 9, 15)
y <- seq(3, 27, by=3)
abs(length(x)-length(y))
boxplot(x, y)


######### Whales #########

whales <- c(74, 122, 235, 111, 292, 111, 211, 133, 156, 79)

whales[4] #Accessing the 4th data point
whales[3:7]

length(whales)
sum(whales)

length(whales)/sum(whales) #mean(whales)

mean(whales)
median(whales)

sd(whales) #Standard Deviation

plot(whales) #Simple Plot

w_len <- c(69, 141, 231, 99, 301, 115, 209, 134, 153, 81)
w_ages <- c(1, 30, 55, 29, 61, 33, 22, 25, 26, 3)
plot(w_ages, w_len)

boxplot(whales, w_len, w_ages, main="num, length, and ages", ylab="count", col.main="darkblue", col.lab="darkred")

hist(w_len)
hist(w_ages)

######### Importing Trees Dataset #########
summary(Trees$Volume)
boxplot(Trees$Volume)

attach(Trees) #To avoid using Trees$

summary(Volume)
#summary(log(Trees$Volume)) #If no attachment

boxplot(Volume, Diameter, Height)
plot(Diameter, Volume)

boxplot(Height) #No labels
boxplot(Height, main="Height of Cherry Trees") #Adds a title
boxplot(Height, main="Height of Cherry Trees", ylab="Height (ft)") #Adds a vertical axis label
boxplot(Height, main="Height of Cherry Trees", ylab="Height (ft)", col.main="blue") #Changes colour of main title
boxplot(Height, main="Height of Cherry Trees", ylab="Height (ft)", col.main="blue", col.lab ="red") #Changes colour of y axis label

plot(Diameter, Volume) #NOTE: plot(x, y) gives y versus x

##

treeFormula <- pi*((Diameter/24)^2)*Height #Volume if tree was perfect cylinder
plot(Volume, treeFormula, main="Calculated Volume vs. Actual Volume of Trees", ylab="Calculated Volume of Trees (cubic feet)", xlab="Actual Volume of Trees (cubic feet)", col.main="darkgreen", col.lab="navy")
detach(Trees) #Detach once finishing using

########## Iris Exercise ##########
attach(iris) #Attach the iris dataframe
summary(Sepal.Length)

boxplot(Sepal.Width)
boxplot(Sepal.Width~Species)

boxplot(Sepal.Width~Species, notch=TRUE)
#If notch is TRUE a notch is dawn on side of boxes, if the notches of two plots don't overlap it's 'strong evidence' that two medians differ

plot(Sepal.Width, Sepal.Length, pch=14, cex=1.5)
#pch makes solid, cex makes bigger

detach(iris)


######### Cuckoos Dataset #########
head(cuckoos)
attach(cuckoos)

boxplot(length~species, data=cuckoos, ylab="length of egg (mm)", main="Lengths of Egg by Species", xlab="Species")

boxplot(breadth~species, data=cuckoos, ylab="Breadth of Egg (mm)", main="Breadths of Egg by Species", xlab="Species")

########## Functions in R ##########
function1<-function(arg1, arg2) {
  out <- arg1 * arg2 #What output you want from the function
  return(out) #Tell the function to return the object out
}

arg1 <- 3 #Define arg1
arg2 <- 7.5 #Define arg2
temp <- function1(arg1, arg2) #Call the function function1 by specifying the arguments
temp #Print the ouptput

##

power.func <- function(a, b) {
  out <- a^b
  return(out)
}

a <- 3
b <- 8
output <- power.func(a,b)
output

## A more complicated function

multiplot <- function(data.vector) {
  par(mfrow=c(2,2)) #Create a 2x2 plotting grid
  N <- length(data.vector) #Count the number of elements of data.vector
  plot(1:N, data.vector) #Plot the vector (1, 2, 3, ..., N) against the data in the top left panel
  hist(data.vector) #Plot a histogram in the top right panel
  boxplot(data.vector) #Plot a boxplot in the bottom left panel
  plot(sort(data.vector)) #Plot the data in increasing order
}

X <- rnorm(100) #A random sample of size 100 from a standard Normal distrubution
multiplot(X)


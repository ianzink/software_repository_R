

# welcome to practice

# asking for help
?sqrt
sqrt(9)

# some functions have defaults
round(2.543)  # nearest whole number is default
round(2.543, digits=2) # rounded to 2 decimal place
args(round) #shortcut to getting arguments of a function


#searching for help
help.search("anova") #analogous to searching in the help window

#### creating objects  ###########
5+5 #simple math
weight_kg<-55 #assign a value to an object, creat the object
2.2*weight_kg
weight_kg<-57.5 #assigning a new value to that object, once executed changes stored value
weight_lb <- 2.2*weight_kg
weight_kg <- 100 # reassigning value

### vectors 
weights <- c(50,60,65,82) # creates a vector
weights  # recall this object
animals <-c("mouse","rat", "dog") # creating vector of characters
length(weights) #find vector length
length(animals)
class(weights) # type of data in the target
class(animals) 
str(weights) #structure of the target object
weights<-c(weights, 90)  # add value to end of vector
weights<-c(30, weights) # add value to front of vector

rm(list=ls()) # remove everyting in the environment


########  download data   ############
download.file("http://k8hertweck.github.io/2015-11-19-umiami-R/data/gapminder-FiveYearData.csv","data/gapminder.csv")      #this downloads a file directly from web into a directory of your choosing
download.file("http://k8hertweck.github.io/2015-11-19-umiami-R/data/gapminder-FiveYearData.csv","C:/Users/Ian//Desktop/gapminder.csv") # playing with saving file elswhere
read.csv("data/gapminder.csv") # reads data, but only displays in console, doesn't save it in environment
gapminder<- read.csv("data/gapminder.csv") 
str(gapminder)
class(gapminder)
head(gapminder)

# manipulating data
#extract first row, first column - a single cell
gapminder[1,1]
length(gapminder[,1])
gapminder[5,3]
gapminder[2:6,1:2]
gapminder[c(2,7,10),c(1,3)]
gapminder[5,]
gapminder[,5]
lifeExp<-gapminder[,5] #save a column to object
mean(lifeExp) #calculate mean of the vector
mean(gapminder[,5]) # mean colling the acutal column itself
mean(gapminder$lifeExp) # mean using column header in data.frame
averageColumns<-apply(gapminder, 2,mean) # apply a function across dataframe with apply
# but get error above because not all are numeric
averageColumns<-apply(gapminder[,c(3,5,6)],2,mean)  # apply function across selected columns


###creating functions #####
g2kg <- function(x) x/1000  # simple function constrcution
g2kg(1900) # testing our function
weights <-c(23,123,235,2,5)
g2kg(weights)

se<-function(x) sd(x)/sqrt(length(x)) # standard error calculator
se(c(5,3,4,7,8,4))
se2<-function(x) sqrt(var(x)/length(x))

## create a fucntion to convert from decimal to percentage
dec_to_percent<-function(x) x*100
dec_to_percent(0.9)


### building plot and saving directly 
pdf("figures/figure1.pdf")
plot(gapminder$year, gapminder$lifeExp)
dev.off() # stop the saving process

## running ANOVA
fit<-aov(lifeExp~country, data=gapminder)
fit
summary(fit)


## t test
data(sleep)  ## load a practice dataset that is already part of R 
head(sleep)
sleep
?sleep  # more info on the data

# unpaired t test
t.test(extra~group, data=sleep)

# paired t test
with(sleep, t.test(extra[group==1], extra[group==2], paired=T))
animals<-c(3,2,6,3,NA)
min(animals)

install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

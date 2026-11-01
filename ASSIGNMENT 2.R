summary(cars)
data(cars)
plot(cars$speed,cars$dist)
#Example 1
x <- c(0.5, 0.6) 
age<-c(20,35,32,29)
summary(age)
#Example 2
age<-c(35,24,18,24)
mean(age)

#Logical
x <- c(TRUE,FALSE)
x <- c(T, F) 

#Character
x <- c("a", "b", "c" )
class<-c("M","F","F","M")

#Integer
x <- 9:29 

#Complex
x <- c(1+0i, 2+4i)

#Matrix and operation within matrices
(x<- matrix(1:6, nrow = 2, ncol = 3))
x
(y<-matrix(1:6, nrow = 3, ncol = 2))

#List
(x <- list(1, "a", TRUE, 1 + 4i))
x
#Factor
x <- factor(c("yes", "yes", "no", "yes", "no"))

#Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3) 
#Return a logical vector indicating which elements are NA
is.na(x)

x <- c(1, 2, 4, "NA", 5)  
bad <- is.na(x)  
print(bad) 


x[!bad]

#What if there are multiple R objects and you want to take the subset with no missing values in any of those objects?
  
  x <- c(1, 2, NA, 4, NA, 5) 
y <- c("a", "b", NA, "d", NA, "f")  
good <- complete.cases(x, y)  
good


#Coercion
#If character is present, in a vector, R convert everything in the vector to character strings.

#If a vector only contains logical and numbers, R will convert the logical to numbers, Every true becomes a 1, and every FALSE becomes 0

sum(c(TRUE,TRUE,FALSE,FALSE,FALSE))

#Create data
#Create data Using data frame Data frame is more general than matrix How??? Because data frame can contain different modes of data (Numeric, character and so on) Similar to what you can see in SPSS, SAS,…
#Let’s create a data frame

studentID<-c(1,2,3,4,5)
math_score<-c(12,17,10,9,NA)
gender<-c("M","F","M","M","F")
it_score<-c(13,18,11,10,19)
scoredata<-data.frame(studentID,gender,math_score,it_score)
scoredata

View(scoredata)
#Create data from keyboard
#Steps 1. Create data frame (or matrix) with variable names 2. Invoke the text editor in the data objected created at first step

data_class2<-data.frame(height=numeric(0),weight=numeric(0),bmi=numeric(0))
data_class2<-edit(data_class2)

#Data Importation
#R has some features that can allow you to import data from different sources (It can be text file, spreadsheet, or database)

#Data from excel
#Data statistical packages (SAS, SPSS, Stata)
#Data from Text files (ASCII, XML, Webscraping)
#Data from database management systems (SQL,MySQL, Oracle, Access)
#HW1: Import data from Statistical package and from Database management systems
data_class<-read.table("C:\\Users\\100060\\Sample.txt")
variable.names(data_class)
head(data_class)

tail(data_class)

data_class[10:20,]

summary(data_class$WEIGHT)

length(data_class$WEIGHT)

data_class[,-1]

data_class$WEIGHT

#In case you want to use data set built in R

data()
data("airquality")
variable.names(airquality)
str(airquality)

#Exploration data analysis
#Examine numerical variable using common summary
data_class

summary(data_class)

str(data_class)

#Summary Statistics
summary(data_class)

apply(data_class,1,mean)

apply(data_class,2,sd)

c(mean(data_class$HEIGHT),sd(data_class$HEIGHT))

c(mean(data_class$WEIGHT),sd(data_class$WEIGHT))

c(Mean=mean(data_class$HEIGHT),SD=sd(data_class$HEIGHT))

c(Mean=mean(data_class$WEIGHT),SD=sd(data_class$WEIGHT))

#Variation and covariation using both numerical and graphs
#Relationship between a categorical and a continuous variable
data("iris")
head(iris)

mean(iris$Petal.Length)

mean(iris$Petal.Length[iris$Species=="setosa"])

mean(iris$Petal.Length[iris$Species=="versicolor"])

mean(iris$Petal.Length[iris$Species=="virginica"])

## shortcut 
by(iris$Petal.Length,iris$Species,mean)

by(iris$Petal.Length,iris$Species,sd)

by(iris$Petal.Length,iris$Species,summary)

#Visualize the differences in continuous variables between categories using Box-and-whisker plot
boxplot(iris$Sepal.Length~iris$Species,data=iris, main="Comparison of categorical vs quantitative")


#Relationship between two categorical variables
ucba<-data.frame(UCBAdmissions)
head(ucba)

cross<-xtabs(Freq~Gender+Admit,data=ucba)
(cross<-xtabs(Freq~Gender+Admit,data=ucba))

prop.table(cross,1)
#Simpson’s paradox
#Phenomenon, where a trend that appears in combined groups of data disappears or reverses when broken down into groups.

cross2<-xtabs(Freq~Gender+Admit,data=ucba[ucba$Dept=="F",])
prop.table(cross2,1)

#Bar Chart
dat <- read.table(text ="ProdA ProdB ProdC ProdD
1 110 50 60 70 
2 120 50 80 65", header= TRUE)

barplot(as.matrix(dat),beside=TRUE,col=c("Red","blue"))


dat <- read.table(text = "A   B   C   D   E   F    G
1 10 80 30 90 70 60  90
2 20 50 70 50 40 10  40
3 60 80 80 60  60 30 160
4 20 40 70 80 20 10  70", header = TRUE)

barplot(as.matrix(dat))


#Scatter Plot
plot(WEIGHT~HEIGHT,data=data_class)


plot(data_class$HEIGHT,data_class$WEIGHT)


plot(data_class[,1],data_class[,2],main = "Graph")


cor(data_class$HEIGHT,data_class$WEIGHT)

#Linear Models
plot(WEIGHT~HEIGHT,data=data_class)
abline(lm(WEIGHT~HEIGHT,data=data_class)$coefficient)


data_lm<-lm(HEIGHT~WEIGHT,data=data_class)
summary(data_lm)

plot(data_lm)


hist(data_class$HEIGHT)


hist(data_class$WEIGHT,col = "blue")


#Linear with other line
plot(WEIGHT~HEIGHT,data=data_class)
abline(lm(WEIGHT~HEIGHT,data=data_class)$coefficient)
lines(lowess(data_class$HEIGHT,data_class$WEIGHT),col="blue")


cor(data_class$HEIGHT,data_class$WEIGHT)

lm(WEIGHT~HEIGHT,data=data_class)

##Data management
##Create another Variable

attach(data_class)
(BMI<-WEIGHT/(HEIGHT/100)^2)

(BMI<-round(WEIGHT/(HEIGHT/100)^2,digit=2))

head(cbind(data_class,BMI),n=5)
new_data_class<-cbind(data_class,BMI)
tail(cbind(data_class,BMI),n=10)

#Summary of BMI
summary(BMI)

stem(BMI,scale=2)

#Date
today <- Sys.Date()
format(today, format="%B %d %Y")

format(today, format="%A")

today <- Sys.Date()
dob <- as.Date("1999-12-15")

difftime(today, dob, units="days")


#Subsetting
#Use of $, []. or [[]]
#Creation of leadership data Interest: How men and women differ in the way they lead their organizations. 5 questions were asked in this study. Example of the question: Do men and women in management position differ in the degree to which they defer to superiors? 1: strongly disagree, 2: disagree, 3:neither agree nor disagree,4: agree, 5: strongly agree

manager <- c(1,2,3,4,5)
country<- c("US","US","UK","UK","UK")
gender<-c("M","F","F","M","F")
age<-c(32,45,25,39,99)
q1<-c(5,3,3,3,2)
q2<-c(4,5,5,3,2)
q3<-c(5,2,5,4,1)
q4<-c(5,5,5,NA,2)
q5<-c(5,5,2,NA,1)
leadership<-data.frame(manager,country, gender, age, q1,q2,q3,q4,q5, stringsAsFactors = TRUE)
leadership<-data.frame(manager,country, gender, age, q1,q2,q3,q4,q5)
str(leadership)

names(leadership)

#What you can do - combine the score of the five questions -handle the missing values - create a dataset of what you want -create age group or age categories - 99 indicate the value is missing

##Missing value
leadership$age[leadership$age==99]<-NA
View(leadership)
leadership$agecat[leadership$age >75]<-"Elder"
leadership$agecat[leadership$age>=35 & leadership$age<=75]<-"Middle Aged"
leadership$agecat[leadership$age <35]<- "Young"
#One way to handle missing value
#Deleting all observations with missing data ( Listwise deletion) is one of the several methods of handling incomplete datasets. Note: You can also replacing the missing value by the average of the remaining data.

is.na(leadership[,5:9])

newdata<-na.omit(leadership)
newdata

#Sorting data
order(leadership$age)

newdata2<-leadership[order(leadership$age),]

##Merging data sets
#To merge two data frame horizontally, you use merge() function. In most cases, two data frames are joined by one or more common key variables. -example 1: merge(dataframeA, dataframeB,by=“ID”) -example 2: merge(dataframeA,dataframeB, by=c(“ID”,“country”))

#the second merge the two dataframes by ID and country

#To join two data frame( datasets) vertically, use rbind() function: Note that the two data set must have the same variables

#Subset (selecting variables,dropping variables,selecting observation )

newdata3<-leadership[,c(5:9)]
myvars<-c("q1","q2","q3","q4","q5")
(newdata3<-leadership[myvars])

newdata4<-leadership[,c(-1,-2)]
(newdata4<-leadership[,-(1:5)])

newdata5<-leadership[,c(-1,-7)]
leadership[[4]]

leadership$age

newdata6<-leadership[c(-1,-3),]
newdata6<-leadership[c(2,4,5),]
newdata7<-subset(leadership,age>=35|age<24,select=c(q1,q2,q3,q4,q5))
attach(leadership)

(newdata7<-leadership[gender=="M" & age>30,])

detach(leadership)









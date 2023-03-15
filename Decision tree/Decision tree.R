##Import the data
newpizza<-read.csv('/Users/georgeli/Desktop/stat3011/Project 2/pizza__GDP.csv')
library(tree)
library(ISLR)
head(newpizza)
###Find the mean of average_price to set the expensive rule for the price
mean(newpizza$average_price)
#define the price as normal if less or equal to mean, otherwise expensive.
Price=factor(ifelse(newpizza$average_price<=11.96,"Normal","Expensive"))
###Find the mean of GDP to define the high GDP
mean(newpizza$GDP)
High_GDP=factor(ifelse(newpizza$GDP>=96356.96,1,0))
##Merge new columns(Price & High_GDP) to the data set
newpizza1=data.frame(newpizza,Price,High_GDP)
head(newpizza1)

##Use the decision tree
tree.pizza=tree(Price ~ .-average_price,newpizza1)
summary(tree.pizza)
plot(tree.pizza)
text(tree.pizza,cex=0.5,pretty=0)

###test the decision tree accuracy
train=sample(1:nrow(newpizza1),3000)###Use 3000 samples for traning 
pizza.test=newpizza1[-train,] ### For the test data, use remaining data for test
price.test=newpizza1$Price[-train]### the test data to check the accuracy
tree.pizza2=tree(Price~.-average_price,newpizza1,subset=train)#build the decision tree
summary(tree.pizza2)
plot(tree.pizza2)
text(tree.pizza2,cex=0.5,pretty=0)
tree.pred=predict(tree.pizza2,pizza.test,type="class")

#Show the confusion table
table(tree.pred, price.test)
#Compute the classification accuracy
sum(diag(table(tree.pred, price.test)))/sum(table(tree.pred, price.test))

###Crossvalidation for finding the best node numbers for the decision tree
set.seed(1)
cv.pizza=cv.tree(tree.pizza2,FUN=prune.misclass)
names(cv.pizza)##find out the factors in cv.pizza
##plot the CV plot the check which node number is the best.
par(mfrow=c(1,2))
plot(cv.pizza$size,cv.pizza$dev,type="b")
plot(cv.pizza$k,cv.pizza$dev,type="b")

###Use node numbers equal to 3 to do the decision tree.
prune.pizza=prune.misclass(tree.pizza2,best=3)
plot(prune.pizza)
text(prune.pizza,pretty=0,cex=0.8)
tree.pred2=predict(prune.pizza,pizza.test,type="class")
#Show the confusion table
table(tree.pred2,price.test)
#Compute the classification accuracy
sum(diag(table(tree.pred2, price.test)))/sum(table(tree.pred2, price.test))

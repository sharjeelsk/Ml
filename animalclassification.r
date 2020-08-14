df=read.csv('zoo.csv')
dim(df)
#x=df[2:17]
#x
#y=as.factor(df$class_type)
train=df[1:90,]
test=df[96:101,]
library(C50)

#new=data.frame(hair=1,feathers=0,eggs=0,milk=1,airborne=0,aquatic=0,predator=1,toothed=1,
 #              backbone=1,breathes=1,venomous=0,fins=0,legs=4,tail=0,domestic=0,catsize=1
  #             )
#predict(classifier,new)

head(df)
train[2:18]
classifier=C5.0(train[2:18],as.factor(train$class_type))
pred=predict(classifier,test[2:18])
pred
a<-c(pred)
for (pred in a) {
if(pred==1)
  print('Mammal')else if(pred==2)
  print('Bird')else if(pred==3)
  print('Reptile')else if(pred==4)
  print('Fish')else if(pred==5)
  print('Amphibian')else if(pred==6)
  print('Bug')else if(pred==7)
  print('Invertibrate')else
  print('sorry')
  
}
tail(df)
plot(pred)
table(test$class_type)
library(gmodels)        #confusionmatrix
CrossTable(test$class_type,pred,prop.chisq = FALSE,
           prop.r = FALSE,
           prop.c = FALSE,
           dnn=c('Actual','Predicted'))


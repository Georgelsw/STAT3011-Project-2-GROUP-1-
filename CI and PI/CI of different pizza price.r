library(ggplot2)

###CI for five pizzas
data<- round(data.frame(x=1:5,y=c(9.75,12.69,12.37,8.78,13.36),lower=c(9.62,12.58,12.27,8.66,13.22),upper=c(9.87,12.81,12.48,8.90,13.51)),5)

ggplot(data,aes(x,y))+geom_point()+geom_errorbar((aes(ymin=lower,ymax=upper)))
+labs(x="Cheese Pizza        White Pizza         Margherita Pizza        Pizza        Hawaiian Pizza",y="Price")
+annotate("text",x=1.3,y=10.3,label="M=9.75")+annotate("text",x=2.3,y=13.2,label="M=12.69")
+annotate("text",x=3.3,y=13.1,label="M=12.37")+annotate("text",x=4.3,y=9.2,label="M=8.78")
+annotate("text",x=4.7,y=13.8,label="M=13.36")
+geom_bar(stat="identity",width=0.5,fill="#999999",color="black")


###CI for normal CI and decision tree CI
data<-round(data.frame(x=1:2,y=c(11.35,11.35),lower=c(8.53,8.53),upper=c(14.18,13.39)),4)
ggplot(data,aes(x,y))+geom_point()+geom_bar(stat="identity",width=0.5,fill="#999999",color="black")
+geom_errorbar((aes(ymin=lower,ymax=upper)))
+labs(x="CI                                                  Decision tree CI",y="Pizza price")
+annotate("text",x=1,y=11.8,label="M=11.35")
+annotate("text",x=2,y=11.8,label="M=11.35")
+annotate("text",x=1,y=14.4,label="14.18")
+annotate("text",x=2,y=13.7,label="13.39")
+annotate("text",x=2,y=8.3,label="8.53")
+annotate("text",x=1,y=8.3,label="8.53")



###CI for normal CI
data<-round(data.frame(x=1,y=c(11.35),lower=c(8.53),upper=c(14.18)),4)
ggplot(data,aes(x,y))+geom_bar(stat="identity",width=0.5,fill="#999999",color="black")
+geom_point()+geom_errorbar((aes(ymin=lower,ymax=upper)))
+annotate("text",x=1,y=8.3,label="8.53")
+annotate("text",x=1,y=14.4,label="14.18")
+annotate("text",x=1,y=12.3,label="M=11.35")+labs(x="CI",y="Pizza price")


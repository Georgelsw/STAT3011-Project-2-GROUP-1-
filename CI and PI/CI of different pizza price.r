data<- round(data.frame(x=1:5,y=c(9.75,12.69,12.37,8.78,13.36),
                        lower=c(9.62,12.58,12.27,8.66,13.22),
                        upper=c(9.87,12.81,12.48,8.90,13.51)),5)
ggplot(data,aes(x,y))
+geom_point()
+geom_errorbar((aes(ymin=lower,ymax=upper)))
+labs(x="Cheese Pizza  White Pizza   Margherita Pizza  Pizza  Hawaiian Pizza",y="Price")
+annotate("text",x=1.3,y=9.8,label="M=9.75")
+annotate("text",x=2.3,y=12.7,label="M=12.69")
+annotate("text",x=3.3,y=12.4,label="M=12.37")
+annotate("text",x=4.3,y=8.8,label="M=8.78")
+annotate("text",x=5.3,y=13.4,label="M=13.36")
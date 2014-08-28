library(ggplot2)
pivottrackerdata = read.csv("applico_fall_intern_project.csv",header = TRUE, stringsAsFactors = TRUE)
projectbudgetdata = read.csv("Fall_Intern_Project_Budget.csv",header = TRUE, stringsAsFactors = F)


pivottrackerdata$Estimate
sum(pivottrackerdata$Estimate)
pointsremaining = numeric(6)
for(i in 1:5){
  pointsremaining[1] = 20
  pointsremaining[i+1] = pointsremaining[i]-pivottrackerdata$Estimate[i]
  
}


projectbudgetdata$Budget_Used = gsub("\\$","", projectbudgetdata$Budget_Used)
projectbudgetdata$Budget_Used = as.numeric(gsub(",", "", projectbudgetdata$Budget_Used)) # Converting the currency to numeric
projectbudgetdata$Budget_Used


budgetused = numeric(6)
for(i in 1:5){
  
  budgetused[1] = 0
  budgetused[i+1] = budgetused[i]+projectbudgetdata$Budget_Used[i]
}
budgetused

weeks = c(1,2,3,4,5,6)
pointsremaining

burnchartdataframe = data.frame(Week_Number = weeks,Budget_Consumed = budgetused,Complexity_Points_Remaining = pointsremaining)
burnchartdataframe

cc = ggplot(burnchartdataframe, aes(Budget_Consumed, Complexity Points Remaining =  Complexity_Points_Remaining))
cc +  geom_point(size = 5, colour = "darkblue", shape = 18) + xlab("Budget Consumed ($)") + 
  ylab("Complexity Points Remaining") + ggtitle("Intern Project Burndown Chart") +
  theme(plot.title = element_text(size=20, face="bold")) + coord_cartesian(xlim=c(-500, 10000)) +
  theme(axis.title.x = element_text(face="bold", colour="#990000", size=15))+
  theme(axis.title.y = element_text(face="bold", colour="black", size=15))
  



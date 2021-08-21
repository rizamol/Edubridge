library(ggplot2)
library(dplyr)
library(choroplethr)
library(choroplethrMaps)
library(openintro)
library(tidyverse)
library(scales)
print(getwd())
d=read.csv("C:/Users/LENOVO/Desktop/SampleSuperstore.csv")
print(d)
print(head(d))
print(tail(d))
print(summary(d))
print(str(d))
print(glimpse(d))
# Visualization
Statewise_sales = d %>% group_by(State) %>% summarise(Total_sales = sum(Sales)) %>% arrange(desc(Total_sales))
view(Statewise_sales)

Statewise_sale = d %>% group_by(State) %>% summarise(Total_sales = sum(Sales))
view(Statewise_sale)

# Plotting statewise
Sales_A = ggplot(d,aes(x = State, y= Sales, fill = State)) + geom_col() + ggtitle("Statewise analysis") + coord_flip() + theme(legend.position = "None",axis.text.y = element_text(size=6))

print(Sales_A)
  

# Region wise sales analysis
Regionwise_sales = d %>% group_by(Region) %>% summarise(Total_Sales = sum (Sales)) %>% arrange((desc(Total_Sales)))
view(Regionwise_sales)

# geographical plot of statewise sales analysis
gsplot = d %>% group_by(State) %>% summarise(Total_Sales = sum(Sales)) %>% arrange(desc(Total_Sales))
view(gsplot)
# Converting into a geographic plot
colnames(gsplot) = c('region','value')
print(colnames(gsplot))
view(gsplot)
gsplot$region = tolower(gsplot$region)
Sales_D = state_choropleth(gsplot, title = 'Geographic analysis of Sales', legend = 'sales in USD')


# Statewise profit
s_p = d %>% group_by(State) %>% summarise(Total_Profit = sum(Profit)) %>% arrange(desc(Total_Profit))
view(s_p)

Profit_A = ggplot(d,aes(x=State,y=Profit,fill = State)) +geom_col() +ggtitle("Statewise Profit analysis") +coord_flip()+theme(legend.position = "None",axis.text.y = element_text(size=6))
print(Profit_A)

Regionwise_Profit = d %>% group_by(Region) %>% summarise(TotalP = sum(Profit)) %>% arrange(desc(TotalP))
View(Regionwise_Profit)


# Plotting Regionwise sale analysis
Region_C = ggplot(d,aes(x = Region,y =Profit,fill= Region))+ geom_col() + ggtitle('Regionwise analysis of Sales')+coord_flip()
print(Region_C)

gpplot = d %>% group_by(State) %>% summarise(Total_Profit = sum(Profit)) %>% arrange(desc(Total_Profit))

# Converting into a geographic plot
colnames(gpplot) = c('region','value')
gpplot$region = tolower(gpplot$region)
profit_D = state_choropleth(gsplot, title ='Geographic analysis of profit', legend = 'Profit in USD')
print(profit_D)


bar = d %>% group_by(State) %>% summarise(PR = sum(Profit)/sum(Sales))%>% arrange(desc(PR))
view(bar)

PS = ggplot(bar, aes(x=PR,y=State,fill =State)) +ggtitle('Statewise Profit Sales Ratio analysis')+theme(legend.position = 'None',axis.text.y = element_text(size = 5))+geom_col()
print(PS)

## Office Supplies
# Profitable office supplies in california
ca = d %>% group_by(Sub.Category) %>% filter(Category== 'Office Supplies' & State == 'California') %>% summarise(Total_Profit = sum(Profit))
view(ca)
ca_plot = ggplot(ca, aes(x= Total_Profit, y= Sub.Category,fill = Sub.Category))+ ggtitle("Proftable Office in california State")+geom_col()
print(ca_plot)

# Price per product in different sub_categories
price_prod = ggplot(d,aes(x= Sub.Category,y= sum(Sales)/sum(Quantity),fill = Sub.Category))+ ggtitle("Profit per product") +theme(axis.text.x = element_text(angle=60,size =5 ))+geom_col()
print(price_prod)

# Shipping Model
spro = d %>% ggplot(aes(x=Ship.Mode,y=Profit, fill=Ship.Mode))+ geom_col() + theme(axis.text = element_text(angle = 60,size = 5))+facet_wrap(~Category)
print(spro)

scat = d %>% ggplot(aes(x=Ship.Mode, y=Quantity,fill = Ship.Mode))+geom_col()+theme(axis.text = element_text(angle = 60,size = 5))+ facet_wrap(~Category)

print(scat)


# Sales and Profit with and without discount

d1=d
d1$DiscountedPrice = d$Sales-(d1$Sales*d1$Discount)
d1$Sales_Quantity = d$Sales/d1$Discount
d1$DP_Quantity = d1$DiscountedPrice/d1$Quantity
view(d1)

no_dis = d %>% filter(Discount == 0.00) %>% summarise(Total_Quantity = sum(Quantity))
print(no_dis)

dis = d %>% filter(Discount != 0.00) %>% summarise(Total_Quantity = sum(Quantity))
print(dis)


final =dis-no_dis
print(final)
















library(ggplot2)
library(dplyr)
library(choroplethr)
library(choroplethrMaps)
library(openintro)
library(tidyverse)
library(scales)
print(getwd())
d=read.csv("C:/Users/LENOVO/Desktop/covid19india.csv")
#print(d)
print(head(d))
print(tail(d))
print(summary(d))
print(str(d))
print(glimpse(d))
# Visualization
cases = d %>% group_by(State.UnionTerritory) %>% summarise(Confirmed = sum(Confirmed))
print(cases)
# Plotting State
cases_confirmed = ggplot(d, aes(x=State.UnionTerritory,y=Confirmed,fill = State.UnionTerritory))+geom_col()+ggtitle("Confirmed cases")
print(cases_confirmed)
print(head(d))
# Death anayis
cases_date = ggplot(d,aes(x=State.UnionTerritory,y= Deaths,fill = State.UnionTerritory))+ geom_col() + ggtitle("Death")
print(cases_date)
# goeographic plot
gsplot = d %>% group_by(State.UnionTerritory) %>% summarise(Confirmed = sum(Confirmed))
view(gsplot)
# converting into a geographic plot
colnames(gsplot) = c('State.UnionTerritory','Confirmed')
print(colnames(gsplot))
gsplot$Deaths = tolower(gsplot$Deaths)


















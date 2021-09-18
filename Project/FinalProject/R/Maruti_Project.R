
          # Maruti Stock Market Analysis 2003-2021
 

  # Import libraries

library(ggplot2)
library(dplyr)
library(choroplethr)
library(choroplethrMaps)
library(openintro)
library(tidyverse)
library(scales)
library(lubridate)        # For extracting year
library(devtools)         # For plotting bar graphs easy way
library(vioplot)          # Violin Plot

print(getwd())

  # Read Data file of Maruti

d=read.csv("C:/Users/LENOVO/Desktop/Maruti.csv")
print(d)


  # Print head rows and tail rows

print(head(d))

print(tail(d))

  # Print summary of data set

print(summary(d))

  # Print dimension of data set

print(dim(d))

  # Print column names

print(names(d))

  # Print Turnover details

print(d$Turnover)

  # To check length of data set

print(length(d))

  # To check statistical values

print(mean(d$High))       # High value mean

print(mean(d$Low))        #Low value mean

print(median(d$High))     #Median-High

print(median(d$Low))      #Median-Low

print(mode(d$High))       #Mode-High

print(mode(d$Low))        #Mode-Low

print(mean(d$Turnover))   # Mean Turnover

print(range(d$Turnover))  # Print range of Turnover

print(range(d$High))      #Range-high

print(range(d$Low))       #Range-low

print(scale(d$Volume))    #Print scale values of volume

print(dnorm(d$Volume))   # Print normal density of volume

print(pnorm(d$Volume))    #Normal distribution

print(quantile(d$Open))   #Group values

print(sd(d$Open))         #Standard deviation

print(unique(d$Open))     #Unique values    

  # to check high share value and low share value

print(max(d$High))

print(min(d$Low))

print(prod(d$Deliverable.Volume))

  # Sort basis of Turnover

print(sort(d$Turnover))

# print no. of rows and columns

print(nrow(d))

print(ncol(d))

  # To check string values

print(str(d))

print(glimpse(d))

  # Creating a new column for YEAR

d$Year<-year(d$Date)

print(d$year)

print(head(d))

  # Again check number of columns

print(ncol(d))

  # Extract data of year 2021

d_2021<- data.frame(d[d$Year == 2021, ])
d_2021

  # Extract Month

d_2021$Month<-month(d_2021$Date)
d_2021


  # Adding month in data set

d$Month<-month(d$Date)
d



  # Visualization


  # Plot high share value range
 
plot(d$High, col = 'red', xlab = "X-axis", ylab = 'Y-axis',main ='High share value')

  # Plot low share value range

plot(d$Low, col = 'red', xlab = "X-axis", ylab = 'Y-axis',main ='Low share value')

  # Turn over plot

plot(d$Turnover, col = 'red', xlab = "X-axis", ylab = 'Y-axis',main ='Turn Over')

  # High share value in 2021

plot(x=d_2021$Turnover,y=d_2021$High, main="High share values basis of turnover",
     xlab="Turn Over", ylab="High",col='red')

  # Plot low share values in 2021

ggplot(data=d_2021, aes(fill=Month, y=Low, x=Date)) + 
  geom_bar(position="dodge", stat="identity")

  # Plot high share values in 2021

ggplot(data=d_2021, aes(fill=Month, y=High, x=Date)) + 
  geom_bar(position="dodge", stat="identity")

  # Plot for data set basis of high values

ggplot(data=d, aes(fill=Month, y=High, x=Year)) + 
        geom_bar(position="dodge", stat="identity")

  # Turn over plot

ggplot(data=d, aes(fill=Month, y=Turnover, x=Year)) + 
  geom_bar(position="dodge", stat="identity")

  # sIMPLE LINE PLOT OF closing value

plot(d$Close,type="l")

  #To plot a graph for showing VWAP

ggplot(data = d) + 
  stat_count(mapping = aes(x =VWAP),color='green')

        
        
  # Plot a relationship of High share value basis Year

ggplot(d, aes(x=Year, y=High)) +
  geom_line(colour="darkgreen", size=1.5)


  # Plot a relationship of Turnover with Year

ggplot(d, aes(x=Year, y=Turnover)) +
  geom_line(colour="darkgreen", size=1.5)

# Graph with a semitransparent shaded area
 
  # High value with year

ggplot(d, aes(x=Year, y=High)) +
  geom_area(colour="red", alpha=.2)

  # Low value with Year

ggplot(d, aes(x=Year, y=Low)) +
  geom_area(colour="red", alpha=.2)


  # Plot a high share value in Year 2021

ggplot(d_2021, aes(x=Month, y=High)) +
  geom_area(colour="red", alpha=.2)


  # Plot a low share value in Year 2021

ggplot(d_2021, aes(x=Month, y=Low)) +
  geom_area(colour="red", alpha=.2)




  # Violin Plot

vioplot(d$High, horizontal=TRUE, col="red")           #High value

vioplot(d$Low,horizontal = TRUE,col="pink")           #Low value

vioplot(d$VWAP,horizontal = TRUE,col="blue")          #VWAP

vioplot(d$Deliverable,horizontal = TRUE,col="yellow") #Deliverable

vioplot(d$Volume,horizontal = TRUE,col="green")       #Volume

vioplot(d$VWAP,horizontal = TRUE,col="gold")         #VWAP




#Conclusion



    #     High value of share was present between Year 2018-2019

   
    #     Low value of share was present under the year of 2005


    #     At the maximum peak value of share present the middle of  2018-2019
  
      
    #     Share value is decreasing in 2021

    
    #     High share value was ten thousand
  
    
    #     High violation had in the share value between of Rs 1000 to 2000


    #   At the April 2021, share value is down from the January 2021




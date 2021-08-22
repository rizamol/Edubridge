c<-as.integer(readline("Select a number: "))

a<-as.integer(readline("Enter first number: "))
b<-as.integer(readline("Enter second number: "))

if(c==1)
{
  r=a+b
}else if (c==2)
{
  r=a-b
}else  if (c==3)
{
  r=a*b
}else if (c==4)
{
  r=a/b
}else if (c==5)
{
  r=a%%b
}else
{
  print("Wrong selection")
}
print(r)
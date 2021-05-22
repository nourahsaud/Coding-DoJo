# Rolling dices  

#The dice10 is the rolled dice of 10 sides, rolled 6 times 
dice10 <- sample(1:10, size = 6, replace = TRUE)
#The sum function calculate the sum of the rolled values 
sum(dice10)
#The sum function calculate how many dice rolled more than 6
sum(dice10>6)

#20 sided dice is the rolled dice of 20 sides, rolled 10 times 
dice20 <- sample(1:20, size = 10, replace = TRUE)
#The sum function calculate how many dice rolled more than 6
sum(dice20>16)



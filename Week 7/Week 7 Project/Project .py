#!/usr/bin/env python
# coding: utf-8

# In[55]:


import pandas as pd
import numpy as np
import random


random.seed(10)
# print(random.random())


# In[56]:


# movies 
movie = ['Frozen 2', 'Tom and Jerry: The Movie', 'The Crime Boss', 'Promising Yong Woman', 'The Mauritanian']

# movie rate arr of dict
movie_rate = [
    { 'movie_name' : 'Frozen 2', 'movie_rate' : 'PG' },
    { 'movie_name' : 'Tom and Jerry: The Movie', 'movie_rate' : 'PG' },
    { 'movie_name' : 'The Crime Boss', 'movie_rate' : 'R15' },
    { 'movie_name' : 'Promising Yong Woman', 'movie_rate' : 'R18' },
    { 'movie_name' : 'The Mauritanian', 'movie_rate' : 'R15' }
]

# screens and prices arr of dict
#screens = [
#    {'Screen': 'VIP', 'Seats': 30, 'Price_adult': 30, 'Price_senior': 28, 'Price_children': 25},
#    {'Screen': 'Gold', 'Seats': 40, 'Price_adult': 25, 'Price_senior': 23, 'Price_children': 21},
#    {'Screen': 'Standard', 'Seats': 80, 'Price_adult': 18, 'Price_senior': 15, 'Price_children': 12},
#    {'Screen': 'Standard', 'Seats': 80, 'Price_adult': 18, 'Price_senior': 15, 'Price_children': 12},
#    {'Screen': 'Kids', 'Seats': 50, 'Price_children': 20}
#]

# arr of total revenue for each day 
revenue = [0] * 7
#print(revenue)


# In[57]:


# theater_revenue calcs the net profit for the week  
def theater_revenue():
    # iterate through the week
    for i in range(0,7): 
        # keep tracking the net profit
        net_profit = 0
        ticket_revenue = 0
        snack_revenue = 0
        
        # number of visitors 
        adult_visitors = 0 
        senior_visitors = 0
        children_visitors = 0
        
        # ticket_price
        adult_ticket = 20 
        senior_ticket = 18
        children_ticket = 15
        
        # snacks amount
        food_amount = 10000
        beverage_amount = 10000
        
        # Assign number of screens 
        # Weekend (i = 6 & i = 7)
        if(i == 6 or i == 7):
            number_of_screens = 50
        else:
            number_of_screens = random.randint(5,50)  
        # today_movies is an array of the movies that are going to be displayed today
        today_movies = [0] * number_of_screens
        count = 0 
        for x in range(number_of_screens):
            if count > 4:
                count = 0
                today_movies[x] = movie[count]
                count += 1
            else:
                today_movies[x] = movie[count]
                count += 1
        # counter is going to be used later   
        counter = 0 
        
            # iterate through the amount of screens on a particular day
        for j in range(number_of_screens): 
            # Ticket revenue 
            # Check if the movie is allowed for children or not 
            if counter > 4:
                counter = 0
            else:
                if movie_rate[counter]['movie_rate'] == 'PG':
                    # define numbers of children, adults, seniors visitors
                    adult_visitors = random.randint(1,80)
                    seniors = 80 - adult_visitors
                    if seniors > 1:
                        senior_visitors = random.randint(1,seniors)
                        children = seniors - senior_visitors
                        if children > 1:
                            children_visitors = random.randint(1,children)
                else:
                    # define numbers of adults, seniors visitors
                    adult_visitors = random.randint(1,80)
                    seniors = 80 - adult_visitors
                    if seniors > 1:
                        senior_visitors = random.randint(1,seniors) 
                counter += 1
            
            # claculate the ticket_revenue
            # check if it's friday
            if (i == 4):
                senior_ticket *= 0.90    
            ticket_revenue = adult_visitors*adult_ticket + senior_visitors*senior_ticket + children_visitors*children_ticket
            
            # Snack revenue 
            visitors = adult_visitors + senior_visitors + children_visitors
            number_of_visitors = random.randint(1,visitors) 
            # check snack availability and calculate snack revenue
            if (number_of_visitors <= food_amount):
                food_revenue = snacks('Food', number_of_visitors)
                food_amount -= number_of_visitors
            number_of_visitors = random.randint(1,visitors)
            if (number_of_visitors <= beverage_amount):
                beverage_revenue = snacks('Beverage', number_of_visitors)
                beverage_amount -= number_of_visitors
            snack_revenue += food_revenue + beverage_revenue 
            
            # Cost
            total_cost = cost()
            
            # net profit 
            net_profit += ticket_revenue + snack_revenue - total_cost
        # Save total to the corresponding day
        revenue[i] = net_profit 
    return revenue


# In[58]:


# Cost function 
def cost():
    # cost per day
    property_rent = 2500
    managers = 2
    managers_salary = 300
    employee = 15
    employee_salary = 50
    utility_bills = 500
    cost = property_rent + managers * managers_salary + employee * employee_salary + utility_bills
    return cost


# In[59]:


# Snack function 
import numpy
def snacks(snack, number_of_visitors):
    snacks_revenue = 0 
    
    # List of Food snacks 
    food = ['Hotdog','Burger','Frise', 'Popcorn','Nachos']
    food_cost = 10
    # List of beverage snacks
    beverage = ['Soft drinks', 'Water', 'Ice tea']
    beverage_cost = 2
    
    if snack == 'Food':
        # Assign who buys which snack for each movie 
        visitors_food_orders = numpy.random.choice(food, size = number_of_visitors, replace = True)
        # Calculate the snack revenue for each movie for food 
        snacks_revenue = number_of_visitors * food_cost
    
    if snack == 'Beverage':
        # Assign who buys which snack for each movie
        visitors_beverage_orders = numpy.random.choice(beverage, size = number_of_visitors, replace = True)
        # Calculate the snack revenue for each movie for beverage
        snacks_revenue = number_of_visitors * beverage_cost 

    return snacks_revenue


# In[60]:


print(revenue)
print(theater_revenue())

# dict is a dictionary that will store the sum value of the revenue for each day later 
dict = [
    {'Mon': 0},
    {'Tue': 0},
    {'Wed': 0},
    {'Thu': 0},
    {'Fri': 0},
    {'Sat': 0},
    {'Sun': 0}
]

# this loop is going to retrive revenue 1000 time and store'em in the dict 
for i in range (1000):
    rev = theater_revenue()
    #print(rev)
    num = rev[0]
    place = 0
    for j in range (len(rev)):
        if(rev[j] > num):
            num = rev[j]
            place = j
    for y in range(len(dict)):
        if (y == place):
            dict[y][list(dict[y].keys())[0]] += 1
        

print(dict)

llist = {}
# this loops going to find the highest revenue and print it
for i in range(len(dict)): 
    llist[list(dict[i].keys())[0]] = dict[i][list(dict[i].keys())[0]]
largest = max(llist.values())

for x in llist: 
    if llist[x] == largest :
        print(x,":",largest)
        break
        


# In[ ]:





# In[ ]:




